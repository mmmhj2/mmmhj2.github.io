---
title: "利用 SSH 进行内网穿透"
categories: ["计算机网络", "闲笔"]
---

本文介绍利用 SSH 远端端口转发进行内网穿透的相关步骤。

## 前期准备

为了使用 SSH 进行内网转发，首先准备三台计算机：

1. 客户端：任意选定的客户端，安装有 SSH 客户端，用于测试，用户名为`client`；
2. 外网服务器：具有公网 IP `123.45.67.89` 的服务器，SSH 服务运行在 22 端口上，用户名为`remote`；
3. 内网服务器：能访问公网，但不能被公网访问的内网服务器，本地 IP 为 `192.168.64.1`，用户名为`protected`。

保证能够从客户端和内网服务器发起至外网服务器的连接。

为实现内网穿透，我们希望发起至外网服务器`1234`端口的连接均被转发到内网服务器`5678`端口上。
我们可以在内网服务器`5678`端口上运行简单的 HTTP 服务作为示例。

### 配置 SSH 服务器

我们需要在公网服务上启用端口转发，这可通过设置`sshd_config`实现：
```sh
GatewayPorts yes
```

接下来配置一下密钥。
我们希望从内网服务器和客户端访问外网服务器，因此需要两个密钥对：
第一对的私钥保存在内网服务器上，公钥被外网服务器信任；
第二对的私钥保存在客户端上，公钥被外网服务器信任。

1. 创建密钥对 `ssh-keygen`；
2. 信任公钥 `echo ssh-rsa .... >> ~/.ssh/authorized_keys`

## 启用端口转发

利用 SSH 启用端口转发其实相当简单，仅需在内网服务器上运行以下命令即可：
```sh
protected$ ssh -p 22 -qngfNTR "*:1234:192.168.0.1:5678" remote@123.45.67.89
```

逐个解释使用的选项：
1. `-p` 指定连接到的远端端口，即公网服务器上的 SSH 端口，默认为`22`；
2. `-q` 进入安静模式，不产生大部分输出；
3. `-n` 表示将标准输入重定向至`null`，即不读取任何输入；
4. `-f` 表示后台执行；
5. `-N` 表示不在远端运行任何命令；
6. `-T` 表示不进行 TTY 分配。

其中还有两个重要的选项：
`-g` 表示允许远端连接至本地的转发端口。
`-R` 表示进行远程端口转发，其后的格式一般为
```
-R [remote]:remoteport:host:hostport
```
`remote`表示远程服务器绑定的 IP 地址，留空表示只绑定至本地环回借口，这里可以填入接入公网的接口 IP 地址（此处为`123.45.67.89`），也可填入`*`或`[::]`。
`remoteport`表示远程服务器监听的端口。
`host`表示本地绑定的 IP 地址，通常选择可与公网服务器联通的接口的 IP 地址。
`hostport`表示转发至的本地端口。

完成设置后，可先尝试在公网服务器上进行测试，可运行
```sh
remote$ wget "localhost:1234"
```
检查是否收到结果，可验证公网服务器到内网服务器的连接是否顺畅。

### 连接保活

通常 SSH 连接会在一段时间无活动后断开，且防火墙可能提前关闭无活动的连接，因此使用端口转发打开的隧道的连接并不稳定。
通常有几种方法解决此问题：
1. 修改 SSH 设置`ServerAliveInterval`和`ServerAliveCountMax`。前者指定保活数据包的发送间隔，后者则指定最大发送次数。
2. 使用`watch`、`crontab`等内置工具编写脚本，或借助`systemd`创建服务进行保活。
3. 借助第三方工具，如`autossh`等。

### SOCKS 代理

一旦公网服务器和内网服务器之间的隧道打通，则可利用该隧道假设其他代理。
例如，利用动态端口转发可设置穿透至内网服务器所在内网的 SOCKS 代理：
```sh
client$ ssh -p 22 -qngfNTD localhost:7890 protected@123.45.67.80
```
其中`-D`选项指定动态端口转发。
然后在客户端设置代理为`localhost:7890`即可完成 SOCKS 代理的假设。
为与动态端口转发配合，可选择将发起转发一端的 SSH 选项 `ExitOnForwardFailure` 设为 `yes`。
