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

从宿主侧向设备侧的内存同步是通过`vkFlushMappedMemoryRanges`和`vkInvalidateMappedMemoryRanges`进行的，前者执行可用性操作，后者执行可见性操作，因此写入被映射到虚拟内存的设备内存时需调用前者，而读取内存时需调用后者，除非内存在创建时就是宿主一致（Host coherent）的。
特别地，标准提到：
> `vkQueueSubmit` performs a memory domain operation from host to device, and a visibility operation with source scope of the device domain and destination scope of all agents and references on the device.

这意味着在向队列提交命令时，所有宿主端的内存写入会自动同步到设备端。

而其他的内存同步则是通过内存依赖（Memory dependency）进行的。

### 内存依赖

## 流水线屏障

以上这些概念如何应用到 Vulkan 同步中呢？
我们知道，为同步 Vulkan 主要提供了几种原语：
1. 围栏（Fences），用于在宿主侧等待设备侧操作完成；
2. 信号量（Semaphores），用于多个队列之间的同步；
3. 事件（Events），用于单个命令缓冲和队列中的“双向”同步；
4. 屏障（Barriers），用于单个命令缓冲和队列中的“单向”同步；
5. 和渲染通道对象（Render pass objects），主要用于渲染中附件和帧缓冲的同步。由于动态渲染的引入，这一项现在已被弃用了。

这一节中我们主要介绍屏障和上述概念之间的对应关系。

### 内存屏障

### 图像布局转变

### 队列族所有权
