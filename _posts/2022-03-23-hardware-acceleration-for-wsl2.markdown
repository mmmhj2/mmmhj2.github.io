---
title: "在WSL2中启用显卡硬件加速"
date: 2022-03-24 00:20:00 +0800
categories: ["闲笔"]
--- 

近日需要在 Ubuntu 下运行 Gazebo 模拟，但是主力机上装的是 Windows 系统，考虑到各种因素，最终选择了WSL2作为虚拟机平台。
在 WSL2 Ubuntu 上安装ROS、Gazebo和PX4都非常简单，运行上也没有什么大问题，但是性能上比较捉襟见肘。
具体来说，虽然 Gazebo 的平均帧率能够达到60FPS，但是散热风扇转得非常大声，发热非常严重，并且不久之后就会降频，帧率骤降。
运行`glxinfo`可以发现，渲染设备是`llvmpipe`，这意味着虚拟机并未调用显卡，而是使用 CPU 进行渲染，因此效率低下。
然而，微软发布的[新闻](https://www.phoronix.com/scan.php?page=news_item&px=Linux-GUI-Apps-GPU-WSL2)表明，WSL2 虚拟机实际上支持显卡虚拟化，并且可以利用显卡硬件加速。
这表示处于某些原因，虚拟机并不能调用显卡。
为了提升性能，减少CPU风扇的噪音，我决定找出问题所在。

### 关于 LIBGL_ALWAYS_INDIRECT

首先想到的就是曲线救国的手段：
如果不能利用虚拟机的显卡，可以将渲染任务“托付”给实体机进行。
实际上，X Server 支持这一选项。
通过在服务器上启用“原生 OpenGL”(Native OpenGL, wgl)，可以让客户端不执行渲染，而是使用服务端显卡。
如果需要启动这一功能，客户端上需要指定`LIBGL_ALWAYS_INDIRECT`环境变量。

通过这种方式，`glxinfo`输出的渲染设备不再是`llvmpipe`，变为了实体机上的 Intel 核显。

然而，这种方法有诸多局限性。
首先，如果服务端有双显卡，这样难以指定渲染使用的显卡。
其次，由于技术原因，间接渲染支持的OpenGL版本只到了1.6，因此相当多的程序无法正常运行。
不幸的是，Gazebo 正是其中之一。
因此，这一条路走不通。

### 关于 CUDA 

[这篇文章](https://docs.microsoft.com/en-us/windows/ai/directml/gpu-cuda-in-wsl)中给出了在WSL2上启用CUDA加速的详细步骤。
我的系统达到了对应的版本要求，驱动也是最新的，因此可以启用CUDA。
按照指定的步骤操作之后，在虚拟机中成功启动了CUDA加速。
具体而言，`nvidia-smi`指令成功输出了当前显卡状态。

然而，`glxinfo`输出的渲染设备仍然是`llvmpipe`。
这说明虚拟机依然没有调用独立显卡进行渲染。
我推测这可能和 Ubuntu 没有正确的识别渲染设备有关。
然而我十分缺少这方面的经验，因此陷入一筹莫展之中。

### 最终解决方案

查看`/dev`目录，可以发现其中确实有`dxg`这一设备。
如[这篇文章](https://devblogs.microsoft.com/directx/directx-heart-linux/)所述，这说明虚拟机成功识别了`DirectX`渲染设备，只是没有调用。

我认为这可能和驱动更新有关，但是仍然找不到合适的解决方案。
偶然间我在 Github 上看到了[这篇 Discussion](https://github.com/microsoft/wslg/discussions/78)，其中详细指明了如何检查十分启用了硬件加速。

实际上，这和`Mesa`驱动有关。
这个驱动直到相当近的版本才提供对 Direct3D 12 的稳定支持。
因此，需要更新`Mesa`驱动，才能识别`/dev/dxg`设备。

执行以下 Shell 脚本以更新驱动：
```shell
# Mesa 不提供官方的二进制文件，需要添加第三方源
sudo add-apt-repository ppa:kisak/kisak-mesa
sudo apt-get update
sudo apt install libegl-mesa0
```

之后再执行`glxinfo`，可以发现`llvmpipe`已经被替换成实机显卡了。
现在再运行 Gazebo，风扇几乎不转了。
