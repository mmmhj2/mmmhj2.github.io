---
title: "C++ 中分配器与多态内存资源"
categories: "计算机科学"
---

C++ 能够以非常细的粒度控制计算机上的内存，这是该语言的一大特点。
对于 C++ 标准库中的所有容器，都可以通过指定分配器来控制其内存分配的细节。
C++17 则通过引入多态内存资源（Polymorphic Memory Resource）进一步强化了这个能力。
本文中我们将讨论 C++ 标准库中多种分配器的细节。

## 传统分配器

传统上，C++ STL 容器的分配器是通过模板类型指定的。
以`std::vector`为例，其模板声明为：
```cpp
template<
    class T,
    class Allocator = std::allocator<T>
> class vector;
```
这里的`Allocator`模板参数就是指定的分配器，这种容器在构造时，通常可以通过构造函数指定分配器对象。
默认情况下使用标准库的默认分配器`std::allocator`，这是全局默认的无状态分配器，直接使用`::operator new(...)`进行全局分配。
一般情况下，这意味着被分配的内存会位于堆上。

这里的`Allocator`参数必须满足标准中的`Allocator`具名要求。
标准中有许多可选的需求，但是总的来说，自定义的分配器只需要具有以下成员：
```cpp
template<class T>
class Allocator {
    // 待分配的变量类型
    using value_type = T;
    // 分配 cnt 个 T 变量所需的内存，即 T[cnt] 数组所需的内存。
    // 不需要进行构造。
    T* allocate(size_t cnt);
    // 解分配指针指向的内存。
    // 保证 p 是通过 allocate 分配的，且没有被解分配过。
    // 保证 cnt 与 allocate 调用时的值相等。
    void deallocate(T* p, size_t cnt) noexcept;
};
```
还有一些别的需求，譬如：
- 可复制和移动构造，且构造不能抛出异常；
- 两个分配器相等，当且仅当通过一个分配器分配的内存能够被另一个分配器解分配；
- 若通过复制甲构造分配器乙，那么甲乙必须相等；等等。

在 C++11 之前，标准对有状态的分配器不做具体的规定，使用有状态分配器的容器的行为是实现定义的。
C++11 标准则对有状态分配器做出了具体规定，即通过`allocator_traits`进行类型萃取。
此外还引入了`Allocator::is_always_equal`可用于判断该分配器是否是有状态的。
即使如此，由于上文所述的复制构造的要求，编写符合标准的有状态分配器实际上[还是比较困难的](https://stackoverflow.com/questions/24278803)。

一般来说，`std::vector`中的成员是分配在堆上的，但是通过分配器，我们可以要求将变量分配在栈上：
```cpp
template <class T, size_t MaxBufferSize = 512>
class StackStatefulAllocator {
    std::byte buffer[MaxBufferSize];
    size_t allocated_bytes{0};

public:
    using value_type = T;

    T* allocate(size_t n) {
        auto sz = sizeof(T) * n;

        if (allocated_bytes + sz > MaxBufferSize) {
            throw std::bad_alloc{};
        }

        auto ptr = reinterpret_cast<T *>(buffer + allocated_bytes);
        allocated_bytes += sz;
        return ptr;
    }

    // Do nothing
    void deallocate(T *, size_t) noexcept {
    }
};

void fn() {
    StackStatefulAllocator alloc;
    std::vector <int, StackStatefulAllocator<int>>(alloc);
    /* ...... */
}
```
显然，这份代码在功能上具有相当多的问题，并且还不满足复制和相等的需求，但是作为展示代码来说足够了。
实践上，如果需要实现有状态的分配器，一般将保存状态的控制块放置在指针中，从而满足复制构造的要求。

显然，传统的分配器实现比较复杂和困难，需要考虑的因素较多。
此外，由于分配器的信息是容器类型的一部分，使用不同分配器的容器属于不同的类型，尽管它们的行为几无差别。
由于这些因素，C++17 引入了多态内存资源在简化分配器管理问题。

## 多态分配器

正如其名，多态内存资源（PMR）使用运行时多态，即继承和虚函数，取代了原来的编译器多态。
上文提到了模板类型系统的问题，解决这一问题的方法之一就是将模板中的`Allocator`指向一个抽象类，然后再编写各种实现，PMR 也采用了类似的思路。
PMR 的关键在于两个类：`std::pmr::memory_resource`和`std::pmr::polymorphic_allocator`。

正如其名，`std::pmr::memory_resource`是 PMR 的核心，代表了内存上抽象的内存资源。
这是一个抽象接口类，具体的内存资源取决于其实现。
这个类比较复杂，我们将在之后仔细介绍。
`std::pmr::polymorphic_allocator`则是依托于内存资源的分配器实现。
这个类本身不是多态的，但是其中持有了一个指向`std::pmr::memory_resource`的指针，借助该指针实现运行时多态的分配器。

多态分配器本身比较简单，基本上只是将分配请求转发到内存资源上，因此这里不再赘述，只是简单介绍一下`std::pmr`命名空间中的容器。
`std::pmr`命名空间中提供许多容器的类型别名，这些类型别名只是将默认的分配器从`std::allocator`替换为了`std::polymorphic_allocater`而已，例如：
```cpp
namespace pmr {
    template<class T>
    using vector = std::vector<T, std::pmr::polymorphic_allocator<T>>;
}
```
这里我们可以看到 C++ 中的运行时多态和编译期多态是如何协同运作的：
通过类型萃取获得编译期多态，然后在同一类型中持有抽象接口类的指针，从而完成运行时多态。

### 内存资源

所谓的内存资源是一个接口类：
```cpp
// std::pmr namespace
class memory_resource {
    virtual void* do_allocate(std::size_t bytes, std::size_t alignment) = 0;
    virtual void do_deallocate(void* p, std::size_t bytes, std::size_t alignment) = 0;
    virtual bool do_is_equal(const std::pmr::memory_resource& other) const noexcept = 0;

public:
    void* allocate(
        std::size_t bytes,
        std::size_t alignment = alignof(std::max_align_t)
    );
    void deallocate(
        void* p,
        std::size_t bytes,
        std::size_t alignment = alignof(std::max_align_t)
    );
    bool is_equal(const memory_resource& other) const noexcept;
};
```
不难注意到这里的公开接口和原有的`Allocator`具名需求里的要求基本一致，它们的语义也大致相同，只是新增了对齐的需求。
不同的是判定相等的条件：现在两个内存资源相等，当且仅当两个类代表了同一个内存资源。
这里的公开接口都不是虚函数，只是负责调用私有的纯虚函数，这叫做非虚函数接口（Non-Virtual Interface），是 C++ 中[常见的习语](https://isocpp.org/wiki/faq/strange-inheritance#private-virtuals)。

为理解这个资源，我们可以考虑默认的内存资源。
这个资源的指针可通过调用`std::pmr::new_delete_resource()`获得。
它的实现非常简单，对`do_allocate`，该资源调用`::operator new()`进行分配；
而对于`do_deallocate`，该资源调用`::operator delete()`进行解分配。
整个程序有且仅有一个这个对象，该对象具有静态存储期。

除了这个“默认的默认”资源之外，可以通过`std::pmr::set_default_resource()`和`std::pmr::get_default_resource()`控制默认资源。
这两个函数均是线程安全的，而且`std::pmr::new_delete_resource()`获得的资源也是线程安全的，因为 C++ 标准保证默认的全局`new`和`delete`（以及`std::malloc()`和`std::free()`）都是线程安全的。

除了这个资源之外，还有一个简单的资源，即`std::pmr::null_memory_resource()`返回的资源。
这个资源对所有分配请求抛出`std::bad_alloc`异常，主要用于和其他资源一起阻止进一步分配。

### 单调缓冲区资源

除了默认的两种简单的资源之外，C++17 标准还提供两种常见的内存资源管理模式，即单调缓冲区和资源池。
我们先介绍最简单的单调缓冲区资源。

单调缓冲区资源`std::pmr::monotonic_buffer_resource`和上文我们提出的`StackStatefulAllocator`思路相差不大但更加灵活。
该资源中维持一个缓冲区的列表和一个上游资源，在构造时可以指定一个初始的缓冲区和上游资源。
当申请内存时，只需要前进缓冲区中的指针即可；
若缓冲区已经耗尽，则从上游资源中分配新的缓冲区 。
这类资源不会进行解分配，而只在析构时将所有资源一并释放。
这种资源也叫线性分配器（Linear allocator），适用于需要大量高效分配的场景。
需要注意，这个资源不是线程安全的。
这个类也不是可复制的，尽管基类`memory_resource`是可复制的。

上面的栈上`vector`可以这样重写：
```cpp
void fn() {
    std::array <std::byte, 512> buffer;
    auto mbr = std::pmr::monotonic_buffer_resource(
        buffer.data(),
        buffer.size(),
        // 阻止堆上的新分配。
        std::pmr::null_memory_resource()
    );  // 纯右值强制复制消去，不调用复制构造函数。
    std::pmr::vector <int> vec(&mbr);
}
```

### 资源池

PMR 还提供基于资源池的内存资源管理方法，即`std::pmr::synchronized_pool_resource`和`std::pmr::unsynchronized_pool_resource`两个类。
这两个类基本完全一样，只是前者自动提供线程安全的同步，而后者则不提供同步。

内存池的工作原理在互联网上有许多资料，这里只做简单的介绍。
简单而言，内存池按可分配的内存大小对自己持有的资源和分配请求分类成“池”。
当分配请求发生时，只从指定大小的池中的内存块（Chunk）中申请新的内存。
当某大小的池被耗尽时，则从上游资源中申请新的一块内存，这一块内存的大小通常大于池的大小，而且每次被耗尽时新申请的内存块的大小会指数增长，从而实现摊还常数的申请复杂度。
进行解分配时，资源被返回到池中，而不一定会被返回到上游资源中。

这个资源池可由使用者自由配置，C++ 标准库提供了两个参数：
```cpp
struct pool_options {
    size_t max_blocks_per_chunk;
    size_t largest_required_pool_block;
};
```
前者指定了每个内存块的最大大小，即最大能够容纳几次指定大小的分配（block）。
后者指定了最大的单词分配的大小，若请求的内存大小大于该值，则直接从上游资源中进行分配，而不会进行池化。


