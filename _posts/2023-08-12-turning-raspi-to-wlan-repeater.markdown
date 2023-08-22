---
title: "WiFi路由器，但是树莓派4 Pi"
categories: ["计算机网络"]
---

今日决定将手上闲置的树莓派用来搭建一个透明代理。
在此之前，需要把它设置成一个WiFi热点，因此有了这篇文章。

## 准备工作

首先，明确一下我们的需求。
我们希望将树莓派用作一个WiFi中继器，即其上的无线网卡首先要连接到一个既存的网络，然后再作为一个无线接入点提供WiFi服务。
为此，我们需要在树莓派上运行几个服务：NAT、DHCP和DNS。
Linux系统提供对NAT的支持，现在我们只需要寻找一个DHCP和DNS服务器即可，我决定使用`dnsmasq`。
为了简单地启动接入点，我决定使用`hostapd`。

我们设树莓派板载的无线网卡的接口名为`wlan0`。

### 接入既存网络

我们使用`netplan`接管对网络的配置：

```shell
$ sudo touch /etc/netplan/1-wlan-access.yaml
$ sudo vim /etc/netplan/1-wlan-access.yaml
```

```yaml
network:
    version: 2
    renderer: networkd
    wifis:
        wlan0:
            optional: true
            access-points:
                'SSID HERE':
                    password: 'PASSWORD HERE'
            dhcp4: true
            dhcp6: true
```

如果配置中不使用`optional`，则Ubuntu会在开机时等待网络接入，这会严重拖慢开机速度。

```shell
$ sudo netplan try
```

现在可以使用`iwconfig`检查是否成功接入了网络。

### 检查支持情况

现在我们来检查一下树莓派上的无线网卡是否支持同时接入WLAN并提供无线接入。

```shell
$ iw phy
    ...
    valid interface combinations:
        ...
        * #{ managed } <= 1, #{ AP } <= 1, #{ P2P-client } <= 1, #{ P2P-device } <= 1,
        total <= 4, #channels <= 1
    ...
```

其中要求被管理的接口（即我们使用`netplan`或`networkd`管理的接口）小于等于一个，且访问点小于等于一个，此时信道数小于等于一个。
所以我们的硬件支持我们的想法。

## 启动无线接入点

首先，我们需要为我们的局域网选择一个网段。
我们使用`192.168.200.0/24`作为例子，树莓派上的无线接入点及其服务运行在`192.168.200.1`上。

现在我们使用`hostapd`启动无线接入点。
首先编辑`hostapd.conf`。

```shell
sudo vim /etc/hostapd/hostapd.conf
```

```
ssid=YOURSSID
driver=nl80211
hw_mode=g
channel=1

# Authentication
auth_algs=1                     # 认证算法：开放认证
wpa=2
wpa_passphrase=YOURPASSWORD
wpa_key_mgmt=WPA-PSK            # 密钥管理：预共享密钥
wpa_pairwise=TKIP
rsn_pairwise=CCMP

# DHCP
dhcp_server=192.168.200.1
```

然后利用`iw`新建一个接口并启动`hostapd`：
```shell
$ sudo iw dev wlan0 interface add ap@wlan0 type __ap
$ sudo hostapd -i ap@wlan0 /etc/hostapd/hostapd.conf
```

现在可以尝试用手机接入该无线接入点了。
如果不出意外，设备能够连接到该接入点，但是不能获取IP地址，也上不了网。

## 运行DHCP和DNS服务

要运行服务，我们首先需要为接入点分配一个IP：
```shell
$ sudo ifconfig ap@wlan0 192.168.200.1 netmask 255.255.255.0
```

然后尝试启动一下`dnsmasq`：
```shell
$ dnsmasq
dnsmasq: failed to create listening socket for port 53: Permission denied
```

显然，端口`53`被系统服务`systemd-resolved`占用了。
我们需要停用这个服务，或者阻止它占用该端口，或者使用另一个端口用来运行DNS服务器。

这个服务使用该端口来接管运行在系统上的所有应用程序的DNS解析，然后将这些请求转发给配置好的服务器。
这个功能被称为“桩解析器”（Stub resolver），因为其提供解析服务，但实际上不进行DNS解析。

我们使用最直接的办法：关掉它。
修改配置文件：
```shell
$ sudo vim /etc/systemd/resolved.conf
```

添加一行：
```
DNSStubListener=no
```

然后重启`systemd-resolved`并启动`dnsmasq`即可。
注意，如果只重启了`systemd-resolved`而没有启动`dnsmasq`，则系统会缺少DNS解析器，从而导致一些命令无法正常使用。

### 修改dnsmasq的配置文件

现在为`dnsmasq`修改配置文件。
```shell
$ sudo touch /etc/dnsmasq.d/ap.conf
$ sudo vim /etc/dnsmasq.d/ap.conf
```

```
interface=ap@wlan0
dhcp-range=192.168.200.2,192.168.200.240,12h
dhcp-option=6,192.168.200.1     # DNS 服务器
dhcp-option=3,192.168.200.1     # 网关
```

我们不需要为`dnsmasq`指定其使用的上级DNS服务器，因为`wlan0`上连接的WLAN启用了DHCP，会自动获取DNS服务器。

然后重启该服务：
```shell
$ sudo systemctl restart dnsmasq
```

现在用手机连接该网络，应该能够获取到IP地址了。
可以尝试在另一台电脑上运行`nslookup`或`dig`，观察域名解析是否正常。
由于我们还没有配置NAT，因此目前还上不了网。

## 配置转发与地址转换

接下来我们需要配置NAT相关内容。
首先，我们需要在树莓派上启用报文转发。

```shell
$ sudo touch /etc/sysctl.d/local.conf
$ sudo vim /etc/sysctl.d/local.conf
```

```
net.ipv4.ip_forward=1
net.ipv6.ip_forward=1
```

然后配置防火墙：
```
$ sudo iptables -t nat -A POSTROUTING -o wlan0 -j MASQUERADE 
```

出于安全考虑，我们可以配置一些额外的防火墙规则：
``` shell
$ sudo iptables -A INPUT -i wlan0 -m conntrack --ctstate RELATED,ESTABLISHED -j ACCEPT
$ sudo iptables -A INPUT -i wlan0 -p icmp -j ACCEPT
$ sudo iptables -A INPUT -i wlan0 -m limit --limit 1/sec -j LOG --log-prefix "DROPPED:"
$ sudo iptables -A INPUT -i wlan0 -j DROP
```

然后固定现有的规则：
```shell
$ sudo apt install iptables-persistent netfilter-persistent
$ sudo netfilter-persistent save
```

然后重启。
但是，在重启之后，所有新建的接口都会消失，因此我们必须每次手动新建接口并进行托管。
为了避免这种麻烦，我们可以新建一个服务。

### 配置服务

我们利用`systemctl`新建服务：
```shell
$ sudo systemctl edit --full --force accesspoint.service
```

配置文件如下：
```ini
[Unit]
Description=Access point
Wants=wpa_supplicant@wlan0.service

[Service]
ExecStartPre=/sbin/iw dev wlan0 interface add ap@wlan0 type __ap
ExecStart=/usr/sbin/hostapd -i ap@wlan0 /etc/hostapd/hostapd.conf
ExecStartPost=/usr/sbin/ifconfig ap@wlan0 192.168.200.1 netmask 255.255.255.0
ExecStopPost=-/sbin/iw dev ap@wlan0 del

[Install]
WantedBy=sys-subsystem-net-devices-wlan0.device
```

保存后启用服务和`wlan0`上的无线电：
```shell
$ sudo systemctl enable accesspoint.service
$ sudo rfkill unblock wlan0
```

现在重启系统，接入点应该正常提供网络服务了。

## 调整与除错

如果你使用了上文的配置，那么现在应该能够发现，这个接入点的速度并不非常理想。
这是因为我提供的默认的配置文件中没有修改信道之类的配置，这些配置可以在[这里](https://w1.fi/cgit/hostap/plain/hostapd/hostapd.conf)找到。

如果配置过程中出现了问题，可以使用`systemctl status`查看各个服务是否正常工作。
如果怀疑是防火墙丢弃了报文，可以使用`dmesg`命令查看内核的日志。
