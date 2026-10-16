---
title: "Vulkan 的常见误解"
categories: ["计算机图形学"]
---

## 多帧并行相关

有关 Vulkan 交换链和呈现引擎最常见的误解恐怕就集中在多帧并行（Frames-In-Flight，FIF）上了。
这些误解不是毫无原因的，早期 Vulkan 教程对 FIF 概念的讲解含糊不清，尤其是关于到底并行到什么程度更是众说纷纭。
这里，我们先澄清一些 FIF 有关的概念，再讲解其他问题。

首先，到底什么是多帧并行？
简单来来说，多帧并行是允许 CPU 提前向 GPU 提交工作的实现方法。

传统图形 API（尤其是 OpenGL 的立即模式）按以下方式执行工作：
CPU 发出指令，GPU 立即执行，同时 CPU 等待 GPU 完成执行，然后发出下一条指令。
显然，这种方法效率很低，主要来自两大问题：
1. 大量工作必须来回切换并重新准备，导致效率下降，更新的 API 引入了 Display List (OpenGL) / Command List (Direct3D) / Command Buffer (Vulkan) 来解决这个问题；
2. CPU 和 GPU 完全无法并行，即使使用了 Command Buffer，由于 CPU 无法写入 GPU 正在读取的 Command Buffer，两者之中任何时刻只有一个能工作，另一个的算力完全浪费，这就是 FIF 机制希望解决的问题。

FIF 通过提前向 GPU 提交工作来完成这一点：CPU 提前完成几帧的处理并提交工作，GPU 完成其中一帧并开始处理下一帧之后，不再需要已完成的 Command Buffer。
现在 CPU 可以回收 Command Buffer 并开始准备接下来的工作，同时 GPU 正在进行下一帧的渲染，从而实现两者的异步和并行。

现在的问题在于，GPU 要如何处理提前提交的工作？
早期的 Vulkan 教程中，这里特别令人困惑。
教程中认为，如果向 GPU 提交了三帧的工作，那么这三帧可以完全并发：第一帧的渲染结束之前，第三帧就可以开始。
这样的实现方式理论上可以最大限度地提高 GPU 的利用率，但是会带来很多问题[^fif]：
1. 处理对大量资源的高并发访问无疑是非常困难的，尤其是在 GPU 这种无法通过 CPU 直接控制的设备上；
2. 处理这种并发的常见手段是复制资源（我们下面会讨论这个问题），而复制高分辨率、高色深的帧缓冲会给内存带来极大的压力；
3. GPU 利用率的提高不一定会提高执行效率，如果后发生的帧和先发生的帧抢占资源，那么帧时延反而会上升。

[^fif]: 参考 https://erfan-ahmadi.github.io/blog/Nabla/fif

基于以上考虑，现有的 FIF 实现一般还会采取帧边界同步，通过在帧边界上插入信号量保证前一帧的计算在后一帧开始之前就完全完成。
通过这种方式实现的多帧并行和传统 API 的双缓冲比较类似，因此又导致了一些混淆。
以三帧 FIF 为例，现在的时序看起来应该是这样的：
```
CPU | F1 | F2 | F3 |  | F1 |     | F2 |     | F3 |     ...
GPU |    |     F1     |    F2    |    F3    |    F1    | ...
```

特别注意，和传统的双缓冲机制不同，这里的并行帧数和呈现引擎的帧缓冲数量没有必然关系，即使对于没有帧缓冲的无头渲染器，FIF 机制依然能使用。
当然如果需要将内容发送到呈现引擎，那么这些资源需要额外的同步，从而，交换链的帧缓冲数量会影响 FIF 的效率，因此也会影响 FIF 数量，我们下面会讨论这个问题。

通过上文的说明，可以发现，提高多帧并行数能够留出更多的缓冲空间，使帧时间更加平滑，代价是 CPU 必须提前处理渲染的画面。
由于大部分程序的处理逻辑实际上在 CPU 上进行，这意味着渲染的画面会比 CPU 处理延迟，这对于联网的多人游戏特别重要。

### 多帧资源同步

了解了多帧并行的机制，下面要考虑的就是资源的同步问题。
除了 Vulkan 本身提供的同步原语之外，还有一种方法可以解决共享资源的同步问题，即将资源复制多份。
哪些资源需要复制、哪些资源仅需要维护一份，是比较令人困惑的。
一般使用下面这条经验规则进行推断：
> 重复数 = 同时独占资源的并发数。

需要注意，重复分配资源是*资源同步的一部分*，因此到底需要怎么分配资源和当前的渲染同步方案有关。
当然，一般来说有以下几种常见的情形：

以下资源一般是需要重复分配的：
- 需经常更新的常量缓冲区（UBO）；
- 需回读的随机访问缓冲区（SSBO）；
- 需动态更新的贴图。

以下资源则一般不需要重复分配：
- 渲染目标（深度和颜色附件；除交换链图像之外）；
- 仅上传一次的贴图；

交换链的帧缓冲图像数量则是另一个问题，我们会在下面的交换链专题进行讨论。

重复一遍：这些资源到底是否需要重复分配依然是和同步方案相关的。
以 UBO 为例，通常情况下这种经常更新的 UBO 会使用宿主可见且一致（`HOST_VISIBLE_BIT` 和 `HOST_COHERENT_BIT`）的内存，这种情况下除了 `vkQueueSubmit`的[隐式同步保证](https://docs.vulkan.org/spec/latest/chapters/synchronization.html#synchronization-submission-host-writes)之外不再进行任何同步，因此如果不进行复制，很可能写入正在被 GPU 独占读取的内容。
反之，对于仅上传一次的贴图，一般则使用暂存缓冲区和缓冲区复制进行上传，通过内存屏障保证完成上传之前不会进行读取，因此不需要进行复制。

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
SSBO WR ─┬─> SSBO RD   ║
         └── Barrier ──║─> SSBO WR
```
这样就以降低并行度为代价完全确保了同时仅有一个独占访问。
但是桌面端 GPU 通常有专门的硬件负责内存传送（Transfer Queue / Copy Engine），像这样降低并行度可能会严重影响性能。

## 交换链相关

接下来我们讨论交换链（Swap chain）相关的内容。
交换链是 Vulkan 中对窗口系统集成（Window System Integration，WSI）的抽象。
将渲染出的图像数据呈现在显示器上需要 GPU、显示器、硬件驱动、操作系统和应用程序的通力合作。

通常来说，操作系统的窗口系统（Windows 上叫做桌面窗口管理器[DWM]；Linux 上则是 X11 或者 Wayland 合成器）会在显存或者内存上预留一块区域，应用程序首先从操作系统取得该区域（`vkAcquireNextImageKHR`），然后将需要渲染的内容写入这块区域，最后通知窗口系统和呈现引擎进行呈现（`vkQueuePresentKHR`）。
这块预留的区域通常含有多个图像对象，这些图像对象统称交换链。

### 交换链索引

上文中我们提到了应用程序要通过 `vkAcquireNextImageKHR` 从 Vulkan 得到当前帧可用的交换链图像序号，这个序号作为交换链图像的索引指定了该帧的帧缓冲。
这个索引非常容易和多帧并行的帧序号混淆：FIF 的帧序号通常确定性地每帧加一然后取模；而 `AcquireNextImage` 获得的图像序号是呈现引擎随意返回的，任何在当前帧*可能*未被占用的交换链图像都可能被返回。
这里说可能，是因为交换链图像实际可用的时机是通过该函数的信号量和栅栏确定的，该函数返回时呈现引擎可能依然在读取该图像。

FIF 的帧序号和这个图像序号因此是完全无关的，图像序号只在操作交换链时使用。
然而，交换链的总图像数会影响 FIF 的最大并行帧数，这是因为交换链中的图像，从被 `AcquireNextImage` 获取开始，直到呈现完全完成（也就是下一次 `AcquireNextImage` 返回同一索引并通过同步原语指示已完成呈现）为止都被独占使用。
因此，如果交换链中的帧缓冲数量小于 FIF 的最大并行帧数，那么本应在 CPU 上并行的帧会被阻塞在 `AcquireNextImage` 上。
因此，一般来说要求交换链中的图像数量不小于 FIF 的数量。
对一般的应用程序，通常选择这两个数量都是 2 或者 3。
有些程序将这两种情况称为双缓冲和三缓冲，但这实际上和 OpenGL 的双缓冲（`glutSwapBuffers` 等）实现完全不同。

### 信号量重用

交换链索引除了影响实际帧缓冲之外，还会影响呈现系统的[信号量重用](https://docs.vulkan.org/guide/latest/swapchain_semaphore_reuse.html)。
通常以下情况是非常常见的：
```cpp
constexpr auto kFramesInFlight = 2;
std::array<VkSemaphore, kFramesInFlight> imageAvailable, renderFinished;

while (!quit) {
    WaitForFences(currentFrame);
    vkAcquireNextImageKHR(
        signal imageAvailable[currentFrame],
        &swapChainImageIndex
    );
    
    /* ...... */

    vkQueueSubmit(
        wait imageAvailable[currentFrame],
        signal renderFinished[currentFrame]
    );
    /* VUID-vkQueueSubmit-pSignalSemaphores-00067 */
    vkQueuePresentKHR(wait renderFinished[currentFrame]);
    currentFrame = (currentFrame + 1) % kFramesInFlight;
}
```

这个代码会触发未定义行为，因为 `vkQueueSubmit` 触发的信号量 `renderFinished[currentFrame]` 会被错误地重用。
在每一帧的最后，我们都会写入交换链图像 `swapChainImageIndex`，而这个图像和 `currentFrame` 无关，因此 `renderFinished` 这个信号量不能正确地覆盖交换链图像的独占访问，尤其是 `swapChainImageIndex` 和 `currentFrame` 不同步的时候。
对很多呈现引擎来说，只要交换链图像数量和 FIF 帧数一致，这两个数字就是同步的，因此这个问题很难发现。
为了修复这个问题，可以这样修改：
```cpp
constexpr auto kFramesInFlight = 2;
std::array<VkSemaphore, kFramesInFlight> imageAvailable;
// 交换链数量只能运行时查询
std::vector<VkSemaphore> renderFinished;

while (!quit) {
    WaitForFences(currentFrame);
    vkAcquireNextImageKHR(
        signal imageAvailable[currentFrame],
        &swapChainImageIndex
    );
    
    /* ...... */

    vkQueueSubmit(
        wait imageAvailable[currentFrame],
        signal renderFinished[swapChainImageIndex]
    );
    vkQueuePresentKHR(wait renderFinished[swapChainImageIndex]);
    currentFrame = (currentFrame + 1) % kFramesInFlight;
}
```

这样，`renderFinished` 信号量的重用就不会和实际的交换链索引失去同步了。

### 垂直同步

如果尝试对简单的 Vulkan 程序进行性能剖析，很大可能会发现大量的时间花费在 `vkAcquireNextImageKHR` 和 `vkQueuePresentKHR` 两个函数上。
这个现象非常有可能是垂直同步导致的。
然而，乍一看 Vulkan 中并没有任何选项可以*直接*控制垂直同步。
Vulkan 的 WSI 对垂直同步的控制实际上是通过 `VkPresentModeKHR` 枚举体控制的。
枚举体的主要选项如下：

- `VK_PRESENT_MODE_IMMEDIATE_KHR`：立即将任何提交呈现的图像发送到屏幕。相当于禁用垂直同步。低延迟但会产生撕裂。
- `VK_PRESENT_MODE_MAILBOX_KHR`：交换链视为仅有一个元素的队列，每次发生垂直同步（Vertical blanking）时取出队列中的图像并呈现。新元素进队时，如果队列中已有其他图像，则将先前的图像抛弃并回收。不产生撕裂、延迟较低，但需要驱动支持。
- `VK_PRESENT_MODE_FIFO_KHR`：交换链视为队列，每次发生垂直同步（Vertical blanking）时取出最先进队的图像并呈现。相当于启用垂直同步。不产生撕裂，但延迟较高。
- `VK_PRESENT_MODE_FIFO_RELAXED_KHR`：和 `VK_PRESENT_MODE_FIFO_KHR` 相同，但如果提交过晚错过了垂直同步时机，则立刻呈现。

Vulkan 标准保证 `VK_PRESENT_MODE_FIFO_KHR` 一定受支持，绝大部分桌面端显卡驱动也支持 `VK_PRESENT_MODE_IMMEDIATE_KHR`，移动端显卡则通常支持 `VK_PRESENT_MODE_MAILBOX_KHR`。

还有一种可能会导致 `vkAcquireNextImageKHR` 和 `vkQueuePresentKHR` 两个函数花费过量时间：
有独显的笔记本的呈现通常是由核显负责的，如果不启用独显直通，则所有呈现图像要重新写入主存，这也会导致大量延迟。

### 颜色空间

交换链图像在创建时能指定图像的格式。
如果这个格式的位宽只有八位，那么可以选择是 sRGB 格式还是 Unorm 格式。
这个格式非常容易导致混淆。

尽管创建图像时可以选择 Unorm 格式，WSI 对颜色空间的解释仅取决于 `VkSurfaceFormatKHR::colorSpace`，而和图像的格式无关。
默认情况下 Vulkan 只支持 `VK_COLOR_SPACE_SRGB_NONLINEAR_KHR` 颜色空间，即已经经过 Gamma 校正的 sRGB 空间。
这就是说无论图像的格式是什么，图像中的纹素总是会被解释为在非线性 sRGB 颜色空间中。

这意味着如果申请了 Unorm 格式的交换链图像，那么 GPU 不会在写入时自动执行从线性空间（着色器基本总是运行在线性空间）到 sRGB Gamma 空间的 Gamma 校正。
这种情况下几乎一定会缺少 Gamma 校正，导致图像发黑。

另一个常见的情况是启用 `VK_EXT_swapchain_colorspace` 扩展之后的 `VK_COLOR_SPACE_PASS_THROUGH_EXT`。
这个选项意味着 Vulkan 驱动不会试图进行颜色空间管理，并和窗口管理器协调采用哪个颜色空间，而是会直接将数据发送到呈现引擎上。
这种情况下应用程序要自己和 WSI 沟通以确定颜色空间选择。
