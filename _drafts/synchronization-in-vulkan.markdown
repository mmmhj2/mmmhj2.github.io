---
title: "初探 Vulkan 同步问题"
categories: ["计算机图形学"]
---

我去年以来一直在给某小作坊游戏引擎的渲染部分贡献代码，并主导了其中 Vulkan API 相关的部分设计。
在 Vulkan 之中——也是任何分布式系统之中，最令人困惑的部分或许就是不同系统之间的同步问题。
Vulkan API 提供了大量的工具用来解决宿主（Host，一般就是指 CPU 和主存）和设备（Device，一般指 GPU）之间的同步问题。
一年以来，个人对此略有心得，而网络上许多中文内容已稍显过时，尤其是在 Vulkan 1.4 力推动态渲染（Dynamic Rendering）这一大前提下。
本人遂撰此文以有抛砖引玉之用。

## 几个基本概念

首先说明几个 Vulkan 标准中提到的基本概念作为引子，亦可助于对标准的理解。

### 先发生于

最开始一定要说明的就是*先发生于*（Happens-before）这个概念。
自 Leslie Lamport （2013年图灵奖得主，$\LaTeX$的开发者）的标志性论文《分布式系统中的时间、时钟和事件顺序（Time, Clocks, and the Ordering of Events in a Distributed System）》发表以来，这个概念就成为了分布式系统研究中的核心。

在那篇论文中，Lamport 借助狭义相对论的相对时空观定义了以下偏序关系：

<div class="definition">
我们认为，一个系统由进程（Process）组成，而进程是一系列有序的事件（Event），而在进程之间发送或接受消息是一种事件。
那么，定义*先发生于*（Happens-before）是满足以下条件的最小偏序关系：
<ol>
<li>若事件$a,b$在同一进程中，且事件$a$排在$b$之前，那么称$a$先发生于$b$;
</li>
<li>
若事件$a$是某一进程中的发送消息事件，而$b$在另一进程中接收该消息的事件，那么也称$a$先发生于$b$;
</li>
<li>
若$a$先发生于$b$，且$b$先发生于$c$，那么$a$也先发生于$c$，即该偏序关系具有传递性。
</li>
</ol>
若$a$不先发生于$b$，且$b$也不先发生于$a$，那么称这两个事件是<em>同时发生</em>（Concurrent，也叫并发）的。
若$a$先发生于$b$，那么也称$b$后发生于（Happens-after）$a$。
</div>

在这种定义之下，不需要给出所有进程上的时钟读数，就可以确定这个偏序关系。
更重要的是，这个偏序关系不依赖于固定的全局时钟，而仅需要每个进程自己的事件顺序——反之，这篇论文也揭示了分布式系统中不能简单通过现实的时钟来构造事件之间的全序关系。
此外，这个偏序关系还暗含了事件之间的因果性（Causality），即只有先发生的事件才能影响后发生的事件。
基于以上这些特点，分布式系统（以及 Vulkan 标准）中大量使用了这个专有名词。

Vulkan 标准中指出，所有命令执行的同步操作其实都是规定了事件之间的先发生于关系，其中最基本的执行依赖（Execution dependency）定义为：

> An execution dependency is a guarantee that for two sets of operations, the first set must *happen-before* the second set.

如何理解这一点？将定义反过来思考，这意味着命令之间的执行依赖强制第二组命令开始执行前必须收到第一组命令执行完成的消息，也就是说：

> If an operation happens-before another operation, then the first operation must complete before the second operation is initiated. 

即第二组命令开始之前，第一组命令必须完全结束执行。

### 可用性和可见性

对于发生内存写入的命令来说，仅仅使用执行依赖并不足以实现完全的同步，这是因为*缓存*的存在。
执行内存写入时，被修改的内存可能会先写入缓存，然后在时机恰当时才被写入内存；相对的，其他缓存中可能也存有该内存的副本，因此在访存时也必须重新读取。

在宿主侧，缓存问题还不太明显，因为 CPU 本身已经能比较好的处理缓存一致性问题。
而在设备侧，这一问题就变得非常严重：每个线程有自己的本地内存（Local memory），线程之间有组共享内存（Group shared memory），而所有处理器和显存之间可能还有共享的高速缓存。

因此 Vulkan 里有一套非常复杂（读作：“我还不能理解”）的内存模型来处理内存一致性问题。
其中首先定义了内存操作者（Agent），引用（Reference）和域（Domain），这些都是内存访问所在的物理位置的抽象。
在其之上，提供了三种操作：可用性操作（Availability operation）、内存域操作（Memory domain operation）和可见性操作（Visibility operation），并且规定：

> Availability operations, visibility operations, and memory domain operations alter the state of the write operations that happen-before them, and which are included in their source scope to be available or visible to their destination scope.

这就是说，使用这些操作会强制在其之前的一类内存写操作（即 source scope）先发生于另一类内存访问（即 destination scope），并对其有效或可见。
这三种操作的区别在于其作用的对象（即 scope）不同。
标准规定：

> 1. For an availability operation, the source scope is a set of (agent,reference,memory location) tuples, and the destination scope is a set of memory domains. ...... An availability operation AV that happens-after W and that includes (A,R,L) in its source scope makes (W,L)*[Write, Location]* available to the memory domains in its destination scope. 
> 2. For a memory domain operation, the source scope is a memory domain and the destination scope is a memory domain. ...... A memory domain operation DOM that happens-after AV and for which (W,L) is available in the source scope makes (W,L) available in the destination memory domain.
> 3. For a visibility operation, the source scope is a set of memory domains and the destination scope is a set of (agent,reference,memory location) tuples. ...... A visibility operation VIS that happens-after AV (or DOM) and for which (W,L) is available in any domain in the source scope makes (W,L) visible to all (agent,reference,L) tuples included in its destination scope.

这基本上是说，可用性操作用在写内存时，使得对某个内存的写入被通知到其他域；
而可见性操作用在读内存时，使得对某个内存的读取能够看见在某个域上的写入；
而内存域操作则可使两个不同域对之间共享的内存写入可用。
通常来讲，可用性操作是通过缓存一致性协议通知其他其他缓存需要进行修改，而可见性操作是通过将缓存标记为无效（invalid）来要求缓存控制器重新读取缓存。

从宿主侧向设备侧的内存同步是通过`vkFlushMappedMemoryRanges`和`vkInvalidateMappedMemoryRanges`进行的，前者执行可用性操作，后者执行可见性操作，因此写入被映射到虚拟内存的设备内存时需调用前者，而读取内存时需调用后者，除非内存在创建时就是宿主一致（Host coherent）的。
特别地，标准提到：
> `vkQueueSubmit` performs a memory domain operation from host to device, and a visibility operation with source scope of the device domain and destination scope of all agents and references on the device.

这意味着在向队列提交命令时，所有宿主端的内存写入会自动同步到设备端。

而其他的内存同步则是通过内存依赖（Memory dependency）进行的。

### 执行与内存依赖

作为基本概念的收尾，我们讲解一下 Vulkan 标准中的执行与内存依赖。
这些内容中的大部分概念能直接映射到 API 的接口上，因此具有特别重大的意义。

首先说明一下执行依赖（Execution Dependency）。
之前提到过执行依赖就是在两类操作间建立“先发生于”关系，而其具体执行方式如下：
> - Let _Ops1_ and _Ops2_ be separate sets of operations.
> - Let _Sync_ be a synchronization command.
> - Let _Scope1st_ and _Scope2nd_ be the synchronization scopes of _Sync_.
> - Let _ScopedOps1_ be the intersection of sets _Ops1_ and _Scope1st_.
> - Let _ScopedOps2_ be the intersection of sets _Ops2_ and _Scope2nd_.
> - Submitting _Ops1_, _Sync_ and _Ops2_ for execution, in that order, will result in execution dependency _ExeDep_ between _ScopedOps1_ and _ScopedOps2_.
> - Execution dependency _ExeDep_ guarantees that _ScopedOps1_ happen-before _ScopedOps2_.

这大段内容说的是：执行依赖由两组操作决定，这两组操作又是由操作类型（即 `Ops` ，比如“读”或者“写”）和操作所处的阶段（即`Scope`，比如“顶点着色器”或者“颜色输出”）的交（即`ScopedOps`，比如“顶点着色器阶段的写入”）决定的，其中一组操作一定会先发生于另一组操作。
使操作甲先于操作乙发生，相当于建立了从操作乙到操作甲之间的依赖，执行依赖也因此得名。

注意在执行依赖中提到“Submitting Ops1, Sync and Ops2 for execution, in that order...”，这意味着执行依赖必须被提交到队列中，且必须在两次操作之间提交，才能发挥作用。
这说明执行依赖（以及内存依赖）对应着后面提到的屏障这一概念，即仅用于队列中设备端操作的同步。

内存依赖（Memory dependency）则在执行依赖上附加了内存可见性和可用性操作：
> - The first set of operations happens-before the availability operation.
> - The availability operation happens-before the visibility operation.
> - The visibility operation happens-before the second set of operations.

内存依赖不仅在需要排序的操作之间建立了严格的序关系，还使得先发生的操作产生的内存变换能够被后发生的操作感知到。
和执行依赖一样，内存依赖通过控制序关系，相当于建立了两个操作之间对内存数据的依赖关系，因此得名。
在很多时候，比起思考哪个操作必须先于另一些操作发生，不如考虑哪些操作依赖于另一些操作的输出，这种视角的转变可以使很多操作变得更加易于理解。

同样，宿主侧对内存的写入也会通过内存依赖自动在命令提交时进行同步：
> When batches of command buffers are submitted to a queue via a queue submission command, it defines a memory dependency with prior host operations, and execution of command buffers submitted to the queue.
> The first synchronization scope includes execution of vkQueueSubmit on the host and anything that happened-before it, as defined by the host memory model.


#### 数据冒险
Vulkan 中大部分同步操作都是通过设置内存依赖完成的，这种依赖能够解决数据冒险（Data hazard）问题。
在流水线上，我们会考虑三种数据冒险：
1. 写后读（Read-after-write）：试图读取仍在被写入的数据。这种冒险可通过内存依赖解决。
2. 读后写（Write-after-read）：试图写入正在被读取的数据。这种冒险不需要内存依赖关系，因此只需要执行依赖即可。
3. 写后写（Write-after-write）：不同程序尝试写入同一块数据。这种冒险需要内存依赖才能解决。

写后写看似只需要执行依赖即可解决，但是考虑到缓存的存在，一方的写入必须要通知到另一方，因此这种数据冒险实际上需要内存可见性和可用性操作才能解决。

未处理的数据冒险在 Vulkan 中视为*未定义行为*，产生的结果是未定义的。
在足够强大或足够脆弱的硬件上，被写入队列的队首操作可能会在下一个操作开始之前就已经结束了，因此看上去所有操作就像串行发生一样，因此甚至可能不会产生任何后果。
但是数据冒险的隐患是永远存在的。

## 流水线屏障

以上这些概念如何应用到 Vulkan 同步中呢？
我们知道，为同步 Vulkan 主要提供了几种原语：
1. 围栏（Fences），用于从队列到宿主端的依赖，通常用在宿主侧等待设备侧操作完成时；
2. 信号量（Semaphores），用于多个队列之间的依赖，或者队列和宿主端的依赖；
3. 事件（Events），用于单个命令缓冲和队列中的“双向”同步；
4. 屏障（Barriers），用于单个命令缓冲和队列中的“单向”同步；
5. 和渲染通道对象（Render pass objects），主要用于渲染中附件和帧缓冲的同步。由于动态渲染的引入，这一项现在已被弃用了。

这一节中我们主要介绍屏障和上述概念之间的对应关系。

### 内存屏障

为在流水线的操作之间建立屏障，需向命令缓冲中写入屏障指令。
较老的教程一般使用`vkCmdPipelineBarrier`函数，而 Vulkan 1.3 （或者`VK_KHR_synchronization2`扩展）引入了新的函数：
```c
void vkCmdPipelineBarrier2(
    VkCommandBuffer         commandBuffer,
    const VkDependencyInfo* pDependencyInfo);
typedef struct VkDependencyInfo {
    VkStructureType                  sType;
    const void*                      pNext;
    VkDependencyFlags                dependencyFlags;
    uint32_t                         memoryBarrierCount;
    const VkMemoryBarrier2*          pMemoryBarriers;
    uint32_t                         bufferMemoryBarrierCount;
    const VkBufferMemoryBarrier2*    pBufferMemoryBarriers;
    uint32_t                         imageMemoryBarrierCount;
    const VkImageMemoryBarrier2*     pImageMemoryBarriers;
} VkDependencyInfo;
typedef struct VkMemoryBarrier2 {
    VkStructureType          sType;
    const void*              pNext;
    VkPipelineStageFlags2    srcStageMask;
    VkAccessFlags2           srcAccessMask;
    VkPipelineStageFlags2    dstStageMask;
    VkAccessFlags2           dstAccessMask;
} VkMemoryBarrier2;
```
利用这个函数，即可建立内存或执行依赖。
`stcStageMask`和`srcAccessMask`标记了依赖的源，即被依赖的操作，也就是首先发生的操作；而`dstStageMask`和`dstAccessMask`则标记了依赖的目的，即后发生的操作。
这个函数必须在源操作记录到命令缓冲之后、目的操作记录到命令缓冲操作之前写入命令缓冲中。

`VkPipelineStageFlags2`表示了内存操作所在的阶段，即上文提到的`Scope`，而`VkAccessFlags2`则表示了具体的内存操作。
内存操作与阶段的组合并非全部有效，例如写入颜色附件的操作（`VK_ACCESS_2_COLOR_ATTACHMENT_WRITE_BIT`）就只能在图形管线末端颜色输出阶段（`VK_PIPELINE_STAGE_2_COLOR_ATTACHMENT_OUTPUT_BIT`）发生。
操作的具体含义和每个阶段的有效的操作均可在文档上查阅得知。

有几个特别的管线阶段值得注意：
- `VK_PIPELINE_STAGE_2_ALL_COMMANDS_BIT`覆盖所有管线阶段。
- `VK_PIPELINE_STAGE_2_NONE`则表示没有任何管线阶段，这一项一般是搭配其他操作，如图像布局转变使用的。
- `VK_PIPELINE_STAGE_2_TOP_OF_PIPE_BIT`指的是管线顶端，当位于依赖目的时，说明整个管线依赖于依赖源，从而表示所有管线阶段，而当位于依赖源时则表示无管线阶段。
- `VK_PIPELINE_STAGE_2_BOTTOM_OF_PIPE_BIT`则与前者刚好相反，当位于依赖源时，说明整个管线都是依赖源，从而表示所有管线阶段，而当位于依赖目的时则表示无管线阶段。

后两者已不再推荐使用。

内存操作方面，也有几个值得注意：
- `VK_ACCESS_2_NONE`表示无内存访问，若依赖源和目的都是此内存操作，则此时定义的是执行依赖而非内存依赖。
- `VK_ACCESS_2_MEMORY_READ_BIT`表示所有内存读取；
- `VK_ACCESS_2_MEMORY_WRITE_BIT`表示所有内存写入。

这些标记都可以或在一起，因此依赖：
```c
VkMemoryBarrier2 b = {
    .sType = /*...*/,
    .srcStageMask = VK_PIPELINE_STAGE_2_ALL_COMMANDS_BIT,
    .srcAccessMask = VK_ACCESS_2_MEMORY_READ_BIT | VK_ACCESS_2_MEMORY_WRITE_BIT,
    .dstStageMask = VK_PIPELINE_STAGE_2_ALL_COMMANDS_BIT,
    .dstAccessMask = VK_ACCESS_2_MEMORY_READ_BIT | VK_ACCESS_2_MEMORY_WRITE_BIT
}
```
表示所有内存访问到所有内存访问的依赖，这种依赖可使所有之前的命令完成执行并将内存完全同步。

### 图像布局转变

Vulkan 中所有图像都具有图像布局，以方便 GPU 对图像访问的优化。
这主要是由于 GPU （尤其是移动端 GPU）上对图像，尤其是帧缓冲，的压缩。
计算着色器或者光栅化着色器中的采样器可能无法读取被压缩的帧缓冲数据，因此图像的布局必须进行转变，才能在各个子系统之间共享。

几个重要的布局摘录如下：
- `VK_IMAGE_LAYOUT_UNDEFINED`: 未定义布局，图像的内容未被初始化，其中的数据不具有任何含义。
- `VK_IMAGE_LAYOUT_GENERAL`：通用布局，该布局可用于几乎所有访问。
- `VK_IMAGE_LAYOUT_PRESENT_SRC_KHR`：呈现用布局，该图像可被呈现至操作系统。特别地，通用布局*不能*被呈现至操作系统。
- `VK_IMAGE_LAYOUT_ATTACHMENT_OPTIMAL`：附件用布局。Vulkan 1.3 引入的颜色、深度和模板附件的通用布局。
- `VK_IMAGE_LAYOUT_READ_ONLY_OPTIMAL`：读取用布局。Vulkan 1.3 引入的只读布局，一般用于图像采样上。该布局不能用于传送读操作。
- `VK_IMAGE_LAYOUT_TRANSFER_SRC|DST_OPTIMAL`：传送用布局。分别用于传送源的读取和传送目标的写入。

通用布局具有很多特别的用处。
首先，这个布局是唯一能够用于图像随机访问（即作为 stroage image 访问，对应 DirectX 12 的 UAV）的布局，因此对计算着色器特别有用。
其次，若图像是线性分块的，即创建时指定了`VK_IMAGE_TILING_LINEAR`，那么这个布局一定是线性的，这就是说能够直接从宿主端访问图像中的数据。
若图像不是线性分块的，则必须先复制到线性资源（一般是缓冲区）中，才能从宿主端访问。

当然，桌面 GPU 上，大部分图像布局基本相同。
举例而言，尤其在英伟达显卡上，即使进行了错误的布局转换，很多渲染器依然可以正常工作，因为实际上英伟达的 Vulkan 驱动会将所有布局解释为通用布局（`VK_IMAGE_LAYOUT_GENERAL`）；Vulkan 社区中甚至有进行布局转变反而导致性能下降的[例子](https://www.reddit.com/r/vulkan/comments/1b72me6/vk_image_layout_general_driver_shenanigans/)。
而随着硬件技术的进一步发展，区分布局不再重要，因此 Khronos 集团已提出了[新的扩展](https://www.khronos.org/blog/so-long-image-layouts-simplifying-vulkan-synchronisation)，来将所有布局统一为通用布局。

为了在不同的管线阶段之间共享同一资源，必须进行布局转变，这是通过以下结构体完成的：
```c
typedef struct VkImageMemoryBarrier2 {
    VkStructureType            sType;
    const void*                pNext;
    VkPipelineStageFlags2      srcStageMask;
    VkAccessFlags2             srcAccessMask;
    VkPipelineStageFlags2      dstStageMask;
    VkAccessFlags2             dstAccessMask;
    VkImageLayout              oldLayout;
    VkImageLayout              newLayout;
    uint32_t                   srcQueueFamilyIndex;
    uint32_t                   dstQueueFamilyIndex;
    VkImage                    image;
    VkImageSubresourceRange    subresourceRange;
} VkImageMemoryBarrier2;
```
`oldLayout`和`newLayout`分别指定了布局转换的起点和目标。

图像布局转变的时机也值得一提，Vulkan 标准中指明
> When a layout transition is specified in a memory dependency, it happens-after the availability operations in the memory dependency, and happens-before the visibility operations.

因此，在进行图像布局转变的屏障指令中，指令发生的顺序如下：
1. 依赖源操作；
2. 内存可用性操作；
3. 图像布局转变；
4. 内存可见性操作；
5. 依赖目的操作。

特别注意，图像布局转变也构成对图像资源的读写，因此也必须被恰当地同步，否则也会发生数据冒险。

### 其他内容

这一节大致列举一些没有被上文提到的流水线屏障中的注意点。
1. *队列族所有权转移*（Queue family ownership transfer）：
    如果缓冲区或者图像资源被设定为被某写队列族独占（`VK_SHARING_MODE_EXCLUSIVE`），那么同时只能有一个队列族拥有该资源，其上的命令才能对该资源进行访问。
    为在不同队列族之间转移所有权，需使用`(src|dst)QueueFamilyIndex`成员。
    在桌面端 GPU 上，一般直接使用共享所有权绕过此问题。
2. *子资源*（Subresource）：可以只对图像或缓冲区的一部分进行同步。
   图像的子资源是按数组层数（array layer）和 Mipmap 层数指定的，这在运行时生成 Mipmap 时特别有用。
3. *缓冲区同步*：内存缓冲区的同步和图像的大同小异，因此不再特别介绍。
4. *例子*：Vulkan 社区维护了很多渲染中常见的同步的例子，可在[这里](https://docs.vulkan.org/guide/latest/synchronization_examples.html)找到。
5. *其他同步原语*：其他同步原语也使用了依赖、流水线阶段和操作的概念，只是同步的范围不同。

## 附录：C++ 内存模型

随着技术的进一步发展，宿主端，即 CPU 上执行的代码也开始具有非常高的并发性。
为了进行类似的同步操作，宿主端代码主要使用的同步原语是“原子变量”（atomic）。
这些变量上进行的部分操作总是原子的，也就是说不会存在其他的操作打断这些原子操作。
然而，仅仅规定操作的原子性不足以实现线程之间乃至单个线程内的同步，这是许多原因造成的。
除了上文所述的缓存一致性问题之外，编译器乃至 CPU 自己也可能重排代码，打乱执行顺序。
为此，C++ 标准规定了原子操作的内存序（memory order）来解决这个问题。
内存序主要分为以下几种：
1. `relaxed`（松弛）。这种原子操作只保证原子性，不保证任何内存访问顺序。
2. `acquire`（获取）和`release`（释放）。这两种原子操作除了保证原子性之外，还提供类似“互斥锁”的同步保证。
3. `seq_cst`（顺序一致，sequentially consistent）。这种原子操作除了提供获取和释放的同步保证之外，还保证所有执行的代码所见的原子操作的顺序是完全一致的。
4. `consume`（消费），这种内存序已被弃用，现在相当于`acquire`。

我们接下来分别介绍上面提到的两种概念：获取和释放与顺序一致性。

### 获取与释放

获取与释放内存序最大的作用在于同步非原子操作的顺序。
C++ 标准保证，对任何内存的写入，不会被重排到被释放的原子写入之后；对任何内存的读取，不会被重排到获取的原子读取之前。
这种重排不仅是实际上的，也是概念上的，因此相对应的写入和读取会被通知到每个 CPU 核心上，缓存也会被刷新。
因此，按这种内存序进行的原子操作可以用来进行内存同步，比如用来实现互斥锁。
这种操作比较类似于 Vulkan 中的内存依赖，即所有在释放之前的写入均会对获取之后的读取可用且可见，而释放相当于可用性操作，获取相当于可见性操作。

考虑下面的代码：
```cpp
std::atomic<bool> flag{false};
int data{0};

void thread_a() {
    data = 1;
    flag.store(true, std::memory_order::release);
}

void thread_b() {
    while(!flag.load(std::memory_order::acquire));
    assert(data == 1);
}
```

如果不使用获取与释放内存序，那么`thread_b()`中的断言可能会被触发，这是因为：
1. 代码重排。编译器可能将对`data`的读写越过原子操作进行重排；或者 CPU 进行乱序执行，可能将读写越过原子操作重排。这一条甚至可能在单核 CPU 上发生。
2. 缓存一致性。假设这两个函数运行在不同的物理核心上，并且这两个物理核心具有单独的缓存，那么对写指令`data = 1`，CPU 可能只更新自己缓存里的副本，而不将修改通知到其他核心上。

对获取释放语义，有一条特别的内存序`acq_rel`。
这条内存序表明，该原子操作若读取，那么具有获取语义；若写入，那么具有释放语义。
这个内存序一般用于读取-修改-写入操作，比如比较并交换（CAS）操作，这种操作在读取时具有获取语义，而在写入时具有释放语义，从而能够建立完整的内存同步。

### 顺序一致性

顺序一致性比获取和释放语义更加严格，这种原子操作不仅要求内存访问不能被重排，还要求所有原子访问必须具有统一的顺序。
这就是说，对所有 CPU 核心上的所有代码，按“先发生于”将原子操作排序，这个“先发生于”产生的序关系是全序。
这个全序叫做“单一全修改序”（single total modification order），在运行时才能确定。
乍一看起来，这条内存序似乎有些多余：这样的顺序有什么用呢？尤其是这个顺序甚至不是编译时才能确定的。

现在考虑以下代码：
```cpp
std::atomic<bool> a{false}, b{false};
void thread_1() {
    a.store(true, std::memory_order::release);
}
void thread_2() {
    b.store(true, std::memory_order::release);
}
void thread_3() {
    assert(a.load(std::memory_order::acquire) && !b.load(std::memory_order::acquire));
}
void thread_4() {
    assert(!a.load(std::memory_order::acquire) && b.load(std::memory_order::acquire));
}
```

这个代码可能不会触发断言错误，因为对线程 3 和 4 而言，执行顺序可能是这样的：
```
thread_3: a.store -> a.load, b.load -> b.store
thread_4: b.store -> a.load, b.load -> a.store
```
获取释放内存序只保证单个线程中不发生重排序，而不保证线程之间的排序问题。
这可能是因为缓存传播的延迟或者单纯因为物理上核心 1 距离 3 更近，而 2 距离 4 更近。
这种情况不是很容易发生，但是确实是可能的，这两个线程可能不具有单一的修改顺序。

顺序一致的内存序最“符合常理”，因此也是 C++ 标准库默认的内存序。
但是这个内存序可能会导致编译器放置内存同步屏障（比如`MFENCE`），进而导致性能下降。
对典型的桌面端 x86 CPU 而言，非顺序一致的原子操作几乎是免费的，因为这个架构采用的是强内存模型（strong memory model），能够保证在大部分情况下不会发生上文所述的 CPU 重排和缓存问题，因此释放获取语义只相当于通知编译器不要进行重排，而不会产生任何指令[^store-load-reorder]。
相对的，若要求顺序一致，那么额外的内存屏障就有可能导致性能损失。

[^store-load-reorder]: x86 ISA 保证任何读取都具有获取语义而任何写入都具有释放语义，但是在该前提下，仍可能将同一线程中的对两个*不同内存地址*的加载操作重新排序到读取操作之前，因为这实际上不违反读取释放语义。
