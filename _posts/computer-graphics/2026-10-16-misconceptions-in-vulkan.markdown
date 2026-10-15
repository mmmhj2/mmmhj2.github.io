---
title: "Vulkan 的常见误解"
categories: ["计算机图形学"]
---

## 多帧并行相关

参考 https://erfan-ahmadi.github.io/blog/Nabla/fif

### 多帧资源同步

根据当前同步情况下，同时独占资源的并发数来决定重复数。

以下资源一般是需要重复分配的：
- 需更新的常量缓冲区（UBO）；
- 需回读的随机访问缓冲区（SSBO）；
- 需动态更新的贴图。

如果你愿意使用其他手段保证资源仅有一个独占访问，那么也可以不重复分配资源。
以 SSBO 回读为例，考虑以下两种情况。
若是不使用除了帧边界（FB）之外的同步，那么读（RD）写（WR）看起来可能是这样的，因此需要重复资源。
```
              FB
SSBO 1 WR ─┬───║───> SSBO 2 WR
           └───║───> SSBO 1 RD
```
另一方面，通过手动插入屏障，也可以实现这样的同步：
```
                      FB
SSBO WR ─┬─> SSBO RD ──║
         └── Barrier ──║─> SSBO WR
```
这样就以降低并行度为代价完全确保了同时仅有一个独占访问。
但是桌面端 GPU 通常有专门的硬件负责内存传送（Transfer Queue / Copy Engine），像这样降低并行度可能会严重影响性能。

以下资源则一般不需要重复分配：
- 渲染目标（深度和颜色附件）；
- 仅上传一次的贴图；

## 交换链相关

### 交换链索引

`vkAcquireNextImageKHR` 的返回值与帧序号的区别。

### 信号量重用

https://docs.vulkan.org/guide/latest/swapchain_semaphore_reuse.html

### 颜色空间

WSI 对颜色空间的解释仅取决于 `VkSurfaceFormatKHR::colorSpace`，而和图像的格式无关，这意味着 UNorm 格式的交换链图像几乎一定会缺少 Gamma 校正，导致图像发黑。
