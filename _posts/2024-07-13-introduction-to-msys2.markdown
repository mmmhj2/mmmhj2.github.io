---
title: "MSYS2 使用指北"
---

本文主要介绍 Windows 上使用 GCC 编译器的 state-of-the-art 方案，即 MSYS2 方案。

## MSYS2 介绍

MSYS2 是一套利用类 Linux （POSIX）环境在 Windows 上编译*原生*应用程序的解决方案，并提供了在 Windows 上使用 GCC、Clang 等编译器的环境。

GNU Compiler Collection （GCC）是 GNU/Linux 上基本的编译器套件，几乎为所有 Linux 发行版预安装，用于编译绝大多数 Linux 系统下的二进制程序，并且是 Linux 和跨平台编译器与 ABI 的事实标准。

然而，正是由于 GCC 与 Linux 系统深度绑定，其对其他系统，尤其是 Windows 系统的支持不良。
数十年来，无数开发者为其在 Windows 上的支持做出了巨大的贡献，其中与 MSYS2 密切相关的有：

- MinGW（Minimalist GNU for Windows）与 MinGW-w64 计划提供了在 Windows 上使用 GCC 编译器的最小环境，用于编译原生 Windows 程序。经过一系列发展，MinGW 已成为在 Linux 下为 Windows 交叉编译的基础。
- Cygwin 利用 Unix 兼容层，通过模拟 POSIX 环境并调用 GCC 编译器，来为 Unix 程序源代码生成可在 Windows 上运行的程序。

MSYS2 可以说是以上两者的结合体。
一方面，其利用 Cygwin 实现了丰富的 POSIX 环境，可以执行一系列编译脚本；另一方面，其利用 MinGW-w64 实现了 Windows 原生程序的编译，可以使用 Windows、DirectX 等 API 进行程序编写。

应当注意，Cygwin 是借助兼容层运行的 Unix 程序，并非直接编译的原生 Windows 程序，因此对 Windows 原生的 API 支持较为复杂。
区分 Cygwin 环境与原生环境对使用并理解 MSYS2 的各个子系统有很大帮助。

## MSYS2 安装

由于国内网络环境复杂，推荐使用镜像源进行安装。
此处以[清华大学源](https://mirrors.tuna.tsinghua.edu.cn/help/msys2/)为例。

首先下载安装程序。
打开[https://mirrors.tuna.tsinghua.edu.cn/msys2/distrib/](https://mirrors.tuna.tsinghua.edu.cn/msys2/distrib/)，选择符合架构的安装器，一般选择 `msys2-x86_64-latest.exe` 即可。
双击安装程序即可进行安装。

然而，由于国内复杂的电磁环境，安装一般会卡住，并显示以下日志：
```
==> Importing owner trust values...

==> Disabling revoked keys in keyring...

  -> Disabled 4 keys.
==> Updating trust database...
```
这是安装程序运行`gpg --batch --check-trustdb`时无法连接到信任数据库以完成更新导致的。
安装程序似乎不能识别 Windows 系统的代理，因此即使使用代理依然会卡住。
一般有两个方案解决此问题：
1. 断网安装。使用安装程序时切断互联网以阻止数据库更新即可。
2. 使用自解压程序。选择`msys2-x86_64-latest.sfx.exe`或直接下载`msys2-x86_64-latest.tar.xz`压缩包并解压即可。

完成安装后需进行镜像配置，否则下载速度较慢。
打开`MSYS2 MSYS`终端并运行
```
sed -i "s#https\?://mirror.msys2.org/#https://mirrors.tuna.tsinghua.edu.cn/msys2/#g" /etc/pacman.d/mirrorlist*
```
即可

## MSYS2 使用

接下来介绍 MSYS2 的维护与使用。

### 区分 MSYS2 子系统

MSYS2 安装完成后，不难发现许多个终端入口，包括`MSYS2 MSYS`、`MSYS2 UCRT`等等。
这些终端入口对应 MSYS2 的不同子系统，各自使用不同的二进制程序，接下来介绍这些子系统的不同之处。
首先介绍区分子系统使用的基本概念。

1. POSIX环境：如介绍所述，MSYS2 集成了两种编译环境——类 POSIX 的 Cygwin 环境和 Windows 原生的 MinGW 环境。前者中能容易地使用 Unix 编译工具（Make等工具），但是编译出的程序必须链接至 Cygwin Unix 兼容层；后者则直接编译原生的 Windows 程序。
2. C语言运行环境：在 Windows 上运行的程序必须链接至微软的C语言运行环境。早期微软使用的运行环境称为 MSVCRT，该环境具有较多缺点，但是对 Windows 系统的兼容性较好；微软之后[推出了UCRT](https://support.microsoft.com/zh-cn/topic/windows-%E4%B8%AD%E7%9A%84%E9%80%9A%E7%94%A8-c-%E8%BF%90%E8%A1%8C%E6%97%B6%E6%9B%B4%E6%96%B0-c0514201-7fe6-95a3-b0a5-287930f3560c)，该运行环境对旧 Windows 系统的兼容不好。
3. 编译器与C++标准库实现：MSYS2支持 GCC 和 Clang 两种编译器，开源的 C++ 标准库也分为两种，即随 GCC 分发的`libstdc++`和随 Clang/LLVM 分发的`libc++`。

---

根据以上概念，可以比较容易地为 x86_64 下 MSYS2 的几个主要的子系统分类：

| | MSYS | Clang64 | MinGW64 | UCRT |
|:---:|:---|:---|:---|:---|
| 编译环境 | Cygwin | 原生 | 原生 | 原生 |
| C语言环境 | Cygwin | MSVCRT | MSVRCT | UCRT |
| 编译器 | * | Clang | GCC/Clang | GCC/Clang |

*：MSYS 环境下也可安装编译器，但是生成的程序均基于 Cygwin 兼容层且会覆盖其他子系统的编译器。一般不推荐使用其下的编译器。

除此之外，如需要为 x86 或 ARM64 指令集生成程序，则需要使用对应的子系统。

---

在实现上，这几个子系统的软件包具有不同的前缀，并分别安装至不同的路径中。
MSYS 子系统下的软件包没有前缀，直接安装至 `/usr` 或根目录下。
其他子系统的包具有`mingw-w64-<环境>-`的前缀，且安装在对应的子目录下，如 URCT 子系统的包前缀为`mingw-w64-ucrt-x86_64-`，安装至 `/ucrt64` 目录下。

由于在MSYS2 终端中的`PATH`环境变量中优先，MSYS 子系统下的可执行文件会**覆盖**各自子系统下的对应可执行文件；其他子系统下的软件包则不会互相干涉。
唯一的例外是`make`程序——在子系统下安装的`make`程序名为`mingw32-make.exe`，因此不会与 MSYS 子系统的`make`冲突。

为在 MSYS2 终端外调用程序，可将对应子系统的目录（如`\ucrt64\bin`）添加至 Windows 的 `PATH` 环境变量中。

### 选择子系统/安装软件包

在选择子系统时，根据上文列举的不同，可参考按照以下标准进行选择：
1. 如果不知道如何选：选择`UCRT`子系统。
2. 不需要与操作系统进行直接交互的软件（如`grep`等脚本）：选择 `MSYS` 子系统。
3. 目标指令集：ARM64指令集选择`Clangarm64`子系统，x86_32 (i686) 指令集选择`mingw32`子系统。
4. 操作系统兼容性：若需要兼容旧 Windows 系统，选择`Clang64`或`mingw64`子系统，否则选择`UCRT`子系统。若需编译的源代码只能在 Linux 上运行，考虑选择`MSYS`子系统。
5. 编译器偏好：根据编译器选择子系统。

由于复杂的子系统设计，在安装某个软件包前，可在[包存储库](https://packages.msys2.org/package/)上先行查阅。
例如，在其上查阅 GCC，可得以下结果。

![](/assets/msys2-base-packages-gcc.png)
{: .center-image}

第一个结果是 MSYS 子系统下的，第二个结果则是其他子系统下的。
注意搜索栏左侧的 “Base Packages” 下拉菜单，该下拉菜单指定是否为每个子系统进行搜索。
若选中 “Packages”，则会为每个子系统显示一个条目。
打开该条目，可见以下页面：

![](/assets/msys2-base-packages-gcc-details.png)
{: .center-image}

下拉即可在“Binary Packages”一栏按照自己的子系统选择对应的软件包。
注意“Base Group(s)”一栏。
像 GCC 一样的软件一般不会单独下载，而是在某个分组中一起下载，这里可以看到包含此软件包的所有分组。
选择 UCRT64 子系统下的 GCC 软件，其详情页如下

![](/assets/msys2-base-packages-gcc-ucrt-details.png)
{: .center-image}

选中“Installation”一栏后的复制符号并粘贴至终端中即可完成安装。
注意此处也有“Group(s)”一栏。
一般来说，GCC 编译器应当在`toolchain`分组中一并下载。
