---
title: "C++20 的协程支持"
categories: "计算机科学"
---

这篇文章中我们将介绍 C++20 中的协程支持。

协程（Coroutine）是实现异步编程的轻量级组件。
一般来说，协程指可以随时执行，在执行过程中中断并将控制权返回调用者，然后在调用者的请求下继续执行的一种结构。
协程相较于函数可以多次中断并返回值，并且多次恢复执行。
在这种层面上，可以看作是子例程或者函数的推广。
Python 中的生成器就是一种简单的协程：通过`yield`关键字，生成器可以随时中断自己的执行，并在下次调用时从此处返回。

本文我们将主要介绍 C++20 提供的协程支持。

## 协程的基本结构

在 C++20 中，协程主要由三个部分构成：
1. 可等待对象（Awaitable）：这个对象控制协程的中断；
2. 承诺（Promise）：这个对象通过成员函数控制协程的启动和终止，也决定了协程句柄的类型；
3. 协程函数体：协程函数实际执行的代码。

除此之外, 协程还具有一个用来进行操作的句柄, 通常具有`std::coroutine_handle<T>`类型, 其中`T`一般是承诺的类型. 
实现上讲，编译器会自动动态分配并构造协程的*状态*（State），其中持有协程的承诺对象、句柄以及暂停执行的情况，其中包括暂停点的位置和当前函数中的临时变量等内容。

协程函数体中必须至少包括`co_await`、`co_yield`和`co_return`三个关键字之一。
任何具有这些关键字的函数会被编译器自动标识为协程，并通过解析其返回类型完成协程的构造。
我们将依次介绍这几大组件。

### 可等待对象

可等待对象是具有以下三个成员函数的对象：
```cpp
struct awaitable {
    // 通过返回值决定是否需要等待。
    bool await_ready();
    // 发生等待时调用此函数, 以决定是否暂停协程执行。
    // 返回值一般为 void, bool 或协程句柄之一.
    T1 await_suspend(coroutine_handle);
    // 等待结束时调用此函数。
    T2 await_resume();
};
```

每当`co_await`或者`co_yield`被调用时，会根据一定的规则构造一个`awaitable`，然后按顺序调用三个成员函数以依次确定是否要给出控制权并等待、要等待什么以及`co_await`表达式的值是什么。
我们之后再介绍`co_await`是如何构造这个可等待对象的，这里我们先介绍可构造对象的成员函数是如何被调用的。

当`co_await`表达式被求值, 且可等待对象被构造后, 依次发生以下函数调用:
1. 调用`await_ready()`, 若返回`false`, 则暂停 (suspend) 该协程, 否则直接调用`await_resume()`.
2. 确认协程被暂停后, 所有局部变量被保存在协程状态中, 然后调用`await_suspend()`, 参数为本协程的句柄.
句柄的类型是通过承诺对象确定的, 一般是`std::coroutine_handle<T>`类型.
这个句柄可用来访问协程状态中的任何内容.
该协程接下来的行为取决于`await_suspend()`的返回值:
    - 若返回类型为`void`, 或者返回的是`bool`且值为`false`, 那么该协程继续执行.
    - 若返回类型为`bool`且值为`true`, 那么该协程暂停执行, 控制流返回至调用者.
    - 若返回另一个协程的句柄, 那么恢复返回的协程的执行并转移控制流, 如同在句柄上调用`resume()`. 注意, 通过连锁恢复其他协程的执行, 该协程可能会被恢复执行.
    - 若抛出异常, 那么协程继续执行, 然后立刻重新抛出该异常.
3. 若该协程没有被暂停, 或者该协程被`await_suspend()`暂停后恢复了执行, 那么调用`await_resume()`, 并将其返回值视为`co_await`的返回值.

协程先被暂停, 其局部变量被保存至状态中, 然后才会调用`await_suspend()`.
该函数最终必须要么恢复该协程的执行 (通过返回值, 通过返回至调用者的控制流, 或者通过在另一个线程中恢复该协程等) , 要么直接摧毁该协程.
由于该协程在调用`await_suspend()`之前就已经暂停了执行, 该协程句柄以及其状态可被自由地分享至其他线程中.
这可能导致`await_suspend()`结束执行之前, 该协程就已经其他线程之中被恢复执行了.
这种情况下, 这个`awaitable`对象可能会被解构, 因此`this`指针可能无法被安全使用.

#### 默认可等待对象

这里介绍两个 STL 标准库中的可等待对象: `std::suspend_always`和`std::suspend_never`.
这两个可等待对象的定义如下:
```cpp
// std namespace
struct suspend_always {
    constexpr bool await_ready() const noexcept { return false; }
    constexpr void await_suspend( std::coroutine_handle<> ) const noexcept {}
    constexpr void await_resume() const noexcept {}
};

struct suspend_never {
    constexpr bool await_ready() const noexcept { return true; }
    constexpr void await_suspend( std::coroutine_handle<> ) const noexcept {}
    constexpr void await_resume() const noexcept {}
};
```

这两个对象的`await_suspend`和`await_resume`都不做任何事 (no-op).
只有`await_ready()`函数, 一个总是返回`false`, 因此在`co_await`时总是将控制流返回调用者; 另一个总是返回`true`, 因此总是不进行暂停而继续执行.

### 承诺对象

承诺对象 (Promise) 用于自定义协程启动与终止的行为, 这个对象与`std::promise`完全无关.
一般而言, 承诺对象应该具有以下成员函数:
```cpp
struct promise {
    // 获取协程函数的首次返回值.
    // 一般用来返回协程的句柄.
    coroutine_handle get_return_object();
    // 通过返回一个 awaitable 控制该协程启动时的行为.
    // 一般返回 std::suspend_always 或 std::suspend_never 之一.
    awaitable initial_suspend();
    // 通过返回一个 awaitable 控制该协程终止时的行为.
    // 一般返回 std::suspend_always 或 std::suspend_never 之一.
    awaitable final_suspend();
    // 控制 co_yield 的行为.
    // 一般返回 std::suspend_always.
    awaitable yield_result(T_yield);
    // 控制 co_await 的行为.
    awaitable await_transform(T_await);
    // 控制协程有返回值时的行为.
    // 不能与 return_void() 共存.
    void return_value(T_return);
    // 控制协程无返回值时的行为.
    // 不能与 return_value() 共存.
    void return_void();
    // 控制协程抛出异常时的行为.
    // 一般使用 std::current_exception() 保存当前异常.
    // 即使不抛出异常也是必须的.
    void unhandled_exception();
    // 控制状态块的分配.
    void* operator new(std::size_t n);
};
```

若一个函数体中因含有`co_await`等关键字而被识别为协程, 那么编译器会寻找该函数返回类型中的`promise_type`类型定义, 并将该类型作为该协程的承诺对象.
当该协程被调用时, 依次发生以下函数调用:
1. 调用`operator new`分配该协程的状态对象. 这个`operator new`可以被`promise`类重载.
2. 将所有该函数的实际参数复制到协程状态对象中. 按值传递的实参进行复制或移动, 按引用传递的实参只保存引用. 这可能导致悬垂引用.
3. 调用`promise`的构造函数. 若构造函数具有接收所有协程函数实参的重载, 那么以协程状态对象中的实参调用这个重载; 否则调用默认构造函数.
4. 调用`get_return_object()`成员函数, 该函数的返回值被保存在局部变量中. 在协程第一次被暂停时, 这个返回值会返回给调用者.
    - 这个成员函数的返回值必须和协程函数体的返回值相同. 由于首次返回一般用来返回协程的句柄, 因此一般来说返回值中要含有协程的句柄作为成员变量.
5. 执行`co_await promise.initial_suspend();`. 恢复执行后, 开始执行协程函数体.
    - 一般来说, 会返回`std::suspend_always`或`std::suspend_never`之一. 前者也叫懒启动 (lazily-started), 后者则是急启动 (eagerly-started) .

当协程因控制流到达末端或到达`co_return`语句而结束执行时, 发生以下函数调用:
1. 调用返回值处理函数:
    - 若`co_return`语句中没有表达式或者该表达式具有`void`类型, 那么调用`return_void()`;
    - 若`co_return`语句的表达式具有非`void`类型, 则以其值调用`return_value()`;
    - 若到达控制流末端而`return_void()`未定义, 则发生未定义行为.
2. 逆序摧毁所有自动存储期的局部变量.
3. 执行`co_await promise.final_suspend();`.

若协程函数体中抛出异常, 则依次调用`unhandled_exception()`和`co_await promise.final_suspend();`.

若协程因上述两点结束, 或通过句柄直接摧毁, 那么:
1. 摧毁`promise`对象, 然后摧毁所有状态对象中的实际参数;
2. 调用`operator delete`解分配状态对象;
3. 将控制流返回调用者.

`promise`中的成员函数并不全部需要定义.
譬如, 若不使用`co_yield`, 就不需要定义`yield_result`;
若不需要自定义分配器, 也不需要重载`operator new`.

#### 确定承诺对象类型

协程的承诺对象的实际类型是借助`std::coroutine_traits`完成的, 这个类型萃取选择其第一个模板参数中的`promise_type`类型定义, 并将其选择为承诺类型.
和 C++ 标准库中的其他大多数类型萃取不同, 应用程序可以自由地为该模板提供特化.

若一个函数因含有`co_await`, `co_yield`或`co_return`之一, 那么这个函数就会被标记为协程, 而承诺对象的类型则是根据该函数的返回类型`R`, 参数类型`Args`和类类型 (若其为成员函数) 决定的.
```cpp
// 选择 std::coroutine_traits<task<void>, int>::promise_type
// 默认为 task<void>::promise_type
task<void> coroutine(int);
// 选择 std::coroutine_traits<
//     task<void>, const class_type &, int
// >::promise_type
// 默认为 task<void>::promise_type
task<void> class_type::coroutine(int) const;
// 选择 std::coroutine_traits<
//     task<void>, class_type &&, int
// >::promise_type
// 默认为 task<void>::promise_type
task<void> class_type::coroutine(int) &&;
```

### co_await 表达式

`co_return`终止协程的执行, 而`co_await`和`co_yield`是暂停协程执行的主要方式, 当这两个关键字出现时, 按以下方式将表达式转变为一个可等待对象:

1. 若为`co_yield expr`, 那么等同于调用`co_await promise.yield_result(expr)`.
    - 典型情况下, `promise.yield_result()` 会保存结果并返回`std::suspend_always`, 从而将控制流返回调用者.
    - 协程中的所有局部变量会在暂停时保存至状态块中. 因此, 只要协程在暂停时不被摧毁, 引用一般就不会失效.
2. 将通过`co_await expr`表达式决定可等待对象的类型:
    - 若该`co_await`是因为协程启动, 终止或`co_yield`产生的, 或者承诺对象不具有`await_transform`成员函数, 那么`expr`就是可等待对象的类型;
    - 否则, 调用`promise.await_transform(expr)`作为可等待对象的类型.
3. 构造可等待对象:
    - 若该类型的`operator co_await()`具有重载, 那么进行重载决议并选择唯一的重载函数进行调用. 若重载决议未能决出唯一的重载, 则程序非良构.
    - 若不具有重载, 那么直接使用`expr`作为可等待对象.
4. 调用可等待对象的`await_ready()`函数......

---

最后进行以下总结.
为了使用 C++20 提供的协程, 我们需要进行以下操作:

定义一个具有`co_await`等的函数:
```cpp
Generator<uint64_t>
Fibbonaci(unsigned n) noexcept {
    if (n <= 0 || n > 94) co_return 0;

    if (n == 1) co_return 1;
    if (n == 2) co_return 1;

    uint64_t a{0}, b{1};
    co_yield 1;
    for(unsigned i = 1; i < n - 1; i++) {
        auto s = a + b;
        co_yield s;
        a = b, b = s;
    }
    co_return a + b;
}
```
为其返回值编写承诺类型和可等待类型, 这里我们只使用`suspend_always`:
```cpp
template <class T>
struct Generator {
    struct promise_type;
    using handle_type = std::coroutine_handle<promise_type>;

    struct promise_type {
        T value_;
        auto get_return_object() {
            return Generator{handle_type::from_promise(*this)};
        }
        std::suspend_always initial_suspend() {
            std::cout << "Initial suspension.\n";
            return {};
        }
        std::suspend_always final_suspend() noexcept {
            std::cout << "Final suspension.\n";
            return {};
        }

        std::suspend_always yield_value(T from) {
            std::cout << "Yielding " << from << ".\n";
            value_ = from;
            return {};
        }
        void return_value(T from) {
            std::cout << "Final result: " << from << ".\n";
            value_ = from;
        }
        // 即使不抛出异常也是必须的.
        void unhandled_exception() {}
    };

    handle_type h;
    Generator(handle_type h) : h(h) {}
    ~Generator() {h.destroy();}
};
```
最后使用这个协程:
```cpp
int main() {
    auto generator = Fibbonaci(10);
    int i = 1;
    do {
        generator.h.resume();
        auto fib = generator.h.promise().value_;
        std::cout << "fib(" << i << ")=" << fib << '\n';
        i++;
    } while(!generator.h.done());
    return 0;
}
```
这里有一些需要注意的点:
像这样混合使用`co_yield`和`co_return`会比较容易发生差一错误;
相对地, 若统一使用`co_yield`, 那么就无法使用`h.done()`来区分到底是不是最后一次暂停执行了, 因为会多一次不修改`value_`了暂停.
