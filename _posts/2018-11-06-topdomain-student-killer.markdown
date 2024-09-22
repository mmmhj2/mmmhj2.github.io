---
title: "如何彻底解决某电子教室学生端"
categories: ["闲笔"]
---

> 本文是二零一八年发表的一篇文章的备份。

## 结束进程

对于未经保护的学生端进程，使用任务管理器或者`taskkill`命令即可结束。
然而，大多数时候学生端都启用了防杀保护。
这个时候使用上述方法结束进程会提示“无法访问”的错误。

解决方法：使用更高权限的方式结束进程。
最好的方法便是使用调试器：ntsd（WinXP下使用）、GDB 或者 Visual Studio Debugger 皆可。以下使用 ntsd 为例，说明命令行：
```batch
ntsd -c q -pn StudentMain.exe
```
如果系统不是 Windows XP ，那么鉴于大部分学生机上都安装了 GCC 编译套件，这种情况之下使用 GDB 更好。


然而即使结束了学生端主进程，*文件限制和网络限制*都无法解除。以下说明解决方法。

## 文件限制

学生端的文件限制是通过Windows下一个叫做 _文件系统微型过滤驱动 (File System Minifilter Drivers)_ 的机制实现的。
这种机制，如其名所示，是一种文件驱动。
驱动需要依托于Windows下的“服务”实现，因此我们只需要结束服务即可。

在学生端文件夹寻找一番，可以发现两个INF文件：`TDFileFilter.inf`和`TDNetFilter.inf`。
这两个文件分别是掌管文件和网络限制的。
点开第一个文件，可以发现这样一行：
```ini
DisplayName = %ServiceName%
```
加以查找，又可以发现
```ini
ServiceName = "TDFileFilter"
```
一行。
那么，这个服务的名字就是`TDFileFilter`了。
我们只需要结束其即可。

打开服务管理，却发现没有这个服务……
显然驱动程序的服务不在此列。
那么*以管理员权限*打开CMD，输入
```batch
sc stop TDFileFilter
```
即可结束这个服务。

![](/assets/td-file-filter.png)
{: .center-image}

## 网络限制

同理，学生端的网络限制也是通过驱动实现的，但是使用的技术是内核驱动而非文件驱动。
按照上面的步骤，可以发现其服务名为`TDNetFilter`。
重复以上步骤，输入`sc stop TDNetFilter`，却发现状态栏上写着的是`3 (STOP_PENDING)`。
这说明这个服务没有完全结束。我们尝试访问网页，可以发现其仍然显示被屏蔽字样。

这说明这个命令还不够猛。

我决定使用*Anti-RootKit*工具。打开*PCHunter*[^pchunter]，转到“驱动模块”选项卡，按照服务名排序，即可找到“TDNetFilter”。右击，卸载驱动，确定。再次访问网页……成功了！

[^pchunter]: PCHunter 早已停止更新，现可使用火绒剑、[OpenArk](https://github.com/BlackINT3/OpenArk) 或 [Sysinternals Suite](https://learn.microsoft.com/zh-cn/sysinternals/downloads/) 等工具作为代替。

![](/assets/pc-hunter.png)
{: .center-image}

然而擅自修改内核驱动会造成十分严重的后果：<span style="color: blue;">蓝屏</span>。
虽然这个过滤驱动并非是关键的驱动，不会造成立刻蓝屏，但是后果还是有可能非常严重。
实际上，如果先使用`sc stop`命令使得服务处于`STOP_PENDING`状态，在系统关机并卸载内核驱动时，就会因为*卸载驱动时仍有未取消的待定操作* (`DRIVER_UNLOADED_WITHOUT_CANCELLING_PENDING_OPERATION`)而蓝屏。
虽然对于一般的学校计算机，由于保护卡的原因，蓝屏一般情况下并不会造成严重后果，但是如果真的出了什么问题……

这样，学生端对于学生机的控制力几乎降为零。然而黑屏肃静和远程控制的情况仍不能脱离。
查找内核服务的时候还发现了`TDKeybd`这个服务，或许有些关系。
不过我们自己开发了一个利用热键的程序，可以在以上情况下结束学生端进程。
然而这个程序因为嵌入了NTSD可执行文件会被误报成病毒，十分尴尬。

实际上，对于安装了保护卡的计算机，如果还原后的计算机并没有启用文件或网络限制，那么最好的方法就是“趁学生端没有反应过来就把它干掉”。
方法有许多，比较好用的有以下两种：

1. 在学生端与教师端通讯之前结束学生端进程或者启用防火墙；
2. 在开机时拔掉网线，结束进程之后再插上。

