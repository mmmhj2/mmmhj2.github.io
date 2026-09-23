---
title: "C++26 反射导论"
categories: "计算机科学"
---

C++26 为 C++ 这门语言引入了备受期待的静态反射支持。
通过这一特性，程序员可以在编译期更加直接地操作程序中的类型。
本文将以几个例子为线索简单介绍 C++26 带来的反射功能。

目前几大主流编译器的正式版中只有 GCC 16 实现了反射功能。
为了编译这些程序，需要使用`-std=c++26 -freflection`编译选项。

## 反射语法基础

C++26 的反射系统主要包括以下三个组件：
- `std::meta::info`类型，以及表示错误的`std::meta::exception`类型；
- 反射（reflection）算子`^^...`和拼接（splice）算子`[:...:]`；
- 新的标准库函数，用于操作`std::meta::info`类型。

我们首先介绍这些组件的基本原理及其互动。

### 基本原理

所谓反射，就是为程序提供检查自身运行情况的手段，而程序自身的运行情况这一数据必须被保存在程序中，因此应当有一个类型来表示这些数据，这就是`std::meta::info`类型。
这个类型保存了通过反射得到的所有 C++ 结构的信息。
这些结构可以是命名空间、类型、标量变量、对象的实例、引用变量、函数、模板类、概念等等，甚至可以是位域。

为了有效地这些信息，我们需要知道如何获取、检查、修改和使用这些信息。

为了得到这些信息，我们一般使用反射操作符：
```cpp
int some_variable;
static_assert(std::is_same_v<decltype(^^int), std::meta::info>);
static_assert(std::is_same_v<decltype(^^::), std::meta::info>);
static_assert(std::is_same_v<decltype(^^some_variable;
), std::meta::info>);
```
注意`^^`运算符只能用在编译期完全确定的结构上，并且如果这个结构是一个表达式，那么这个表达式不会被求值（unevaluated operand）。
对于非类型的模板参数，尽管该参数能够在编译时确定，对其使用反射运算符会导致编译错误，这是因为这样可能引入额外的表达式求值。
为解决这个问题，可以使用`meta`库中提供的几个额外的反射函数：
```cpp
// namespace std::meta
consteval info reflect_constant(T)
consteval info reflect_object(T & expr)
consteval info reflect_function(T & expr)
```
这几个函数均被标记为`consteval`，因此它们必须在编译时得出结果。
`reflect_function`除了在模板中使用外，还可以用来指定选择哪个函数重载。
```cpp
int f(char);
int f(long);

// 错误：无法决定选择哪个重载。
// constexpr auto rf = ^^f;
constexpr auto rf = reflect_function<int(char)>(f);

template <int C>
void some_func() {
    // 错误：无法对非类型模板参数应用反射运算符。
    // constexpr auto rf = ^^C;
    constexpr auto rf = reflect_constant(C);
}
```
作为一种最特别的情况，`std::meta::info`可以被默认构造。
这种情况下，其中不保存任何反射信息，称为空反射（null reflection）。

由于标准中并未规定`std::meta::info`的具体内容，我们无法直接操作这个类型的对象。
因此，为检查和修改这些信息，一般使用`<meta>`头文件中规定的各种函数接口。
该头文件中提供了大量的接口用于检查其中的各种信息，然而，目前 C++ 标准中修改`meta::info`的手段比较有限，基本只限于数组大小修改和增减引用的`const`、`volatile`等简单操作。
像修改成员的标识符之类的操作基本是无法实现的。
这些操作均是`consteval`函数，因此必须在编译器计算完毕。
若发生错误，则一般抛出`std::meta::exception`类的异常，而若编译器存在任何未被处理的异常，则发生编译错误。

为了使用反射出的`std::meta::info`，一般使用拼接运算符：`[:m:]`，其中`m`是类型为`std::meta::info`的*编译期常量表达式*（constant expression）。
取决于`m`的所代表的结构是什么，拼接运算符可以生成表达式、类型、模板和命名空间等结构。
除了使用拼接运算符之外，若该反射表达式表示的是一个对象或者模板，还可以使用`std::meta::extract`来获取对象的值，或者使用`std::meta::substitute`来进行模板代换。

在前面的介绍中我们提到的绝大部分操作都要求是编译时完成，因此，像 C++26 引入的这种反射也叫做静态反射（static reflection）。
通过反射运算符，仅能提取编译期常量或静态期变量的信息。

### 生成类型

之前，我们提到过通过反射对程序进行操作的手段比较有限。
通过反射生成新的类型是反射系统的比较常见的用法，而在 C++ 的反射中，为达成这一目标，一般使用两种方法。
其一是和传统的模板元编程结合，通过反射进行模板代换，从而生成新的内容；
其二则是使用`std::meta::define_aggregate()`定义聚合体类型。

这两种方法各有不同。
通过反射进行模板代换比较简单但是灵活度较低；而通过定义新的聚合体类型则可以通过更复杂的接口进行更复杂的操作。
需要注意，即使使用第二种方法，我们依然只能生成聚合体，因此其中不能使用继承、成员函数、虚函数等面向对象范式。
当然，我们可以使用复杂的代码来绕过这些限制，比如使用函数成员变量代替成员函数、手动生成虚表实现继承，但是这一功能整体依然是比较受限的。

我们会在后面的例子中介绍第二种方法。

### 存储期提升

之前我们介绍的所有静态反射的内容都是编译期的，但是我们有时需要在运行时使用这些编译期变量。
比如，我们希望以字符串名打印枚举变量的值，而非打印一个整数，这时就需要将枚举类型的定义（编译期变量）变为一个字符串（运行期变量）。
在反射出现之前，唯一能完成这一操作的语言机制是预定义宏，而利用反射则可以通过提升（promotion）操作完成。

为将编译期常量提升至静态存储期，可使用以下五个函数之一：
```cpp
// namespace std::meta
consteval info reflect_constant_string(R && r);
consteval info reflect_constant_array(R && r);
consteval const RT* define_constant_string(R && r);
consteval span<const RT> define_constant_array(R && r);
consteval T* define_constant_object(T && t);
```
这里，`R`是一个区间（`ranges::input_range`）、`RT`是区间的元素类型、`T`是任意对象类型。
带有`reflect`的函数返回对应静态变量的`meta`信息，可通过`extract`提取其值；而带有`define`的函数直接返回静态变量本身的指针。

考虑下面这个例子：
```cpp
constexpr std::vector<double> precompute_angles(std::size_t size) {
    std::vector<double> angles(size);
    for (int i{}; double& angle : angles)
        angle = 360.0 / size * i++;
    
    return angles;
}

consteval std::span<const double> precompute_angles_arr(std::size_t size) {
    std::vector<double> angles = precompute_angles(size);
    return std::define_static_array(angles);
}

int main() {
    // auto angles = precompute_angles(7);
    auto angles = precompute_angles_arr(7);
    for (double angle : angles)
        std::print("{:.1f} ", angle);
    std::println();
}
```
这里，我们不能调用`precompute_angles(7)`。
因为这个函数是`constexpr`函数，若其出现在编译期常量表达式中，那么这个函数会在编译期计算。
而若在编译期求值，那么所有动态分配的内存必须在编译期计算结束前解分配。
显然，由于返回编译期计算的`vector`，这个函数不能解分配被分配的内存，因此无法在编译期调用。
解决方法则是使用`define_static_array()`将编译期数组提升到运行期。
在此之前，为了将模板元编程计算出的数组或查找表提升至运行期，一般需要借助`std::integer_sequence`之类的元编程方法。

## 例子

这一节中我们将以几个例子展示反射特性的用途。

### 枚举体和字符串

一个常见的需求是实现枚举体（`enum`）和字符串之间的互相转换，这可借助反射实现。
```cpp
template <typename E> requires std::is_enum_v<E>
constexpr std::string_view enum_to_string(E e) {
    static constexpr auto enumerators = std::define_static_array(std::meta::enumerators_of(^^E));
    template for (constexpr auto m : enumerators) {
        if (e == [:m:]) 
            return std::meta::identifier_of(m);
    }
    return "<unknown>";
}

template <typename E> requires std::is_enum_v<E>
constexpr std::optional<E> string_to_enum(std::string_view s) {
    static constexpr auto enumerators = std::define_static_array(std::meta::enumerators_of(^^E));
    template for (constexpr auto m : enumerators) {
        if (s == std::meta::identifier_of(m)) 
            return [:m:];
    }
    return {};
}
```
这一段代码中，`m`是枚举类型中每一项对应的`meta::info`，因此通过拼接运算符生成的就是像`Color::Red`这种枚举类型变量。

代码中出现了 C++26 新增的`template for`语句，这种语句用来遍历编译期常量。
相较于普通的`for`循环，`template for`更像是生成代码的语法糖，比如下面这段代码：
```cpp
template for (constexpr auto i : {1, 2}) {
    std::print("{}", i);
}
```
会被编译器替换为类似下面的代码
```cpp
{
    constexpr auto RANGE = {1, 2};
    {
        constexpr auto I = RANGE[0];
        std::print("{}", I);
    }
    {
        constexpr auto I = RANGE[1];
        std::print("{}", I);
    }
}
```

在这个例子里面，我们还是需要使用`define_static_array()`将编译期变量提升至静态期。
这是因为`enumerators_of()`返回一个编译期的`vector`，而我们前面介绍过，编译期常量表达式在被求值时，所有进行的内存分配必须在求值结束前解分配，因此我们无法直接从其中利用`template for`取值。

### 枚举体与字符串续

上一节中我们介绍了枚举体和字符串转换的例子，但是该例子中，从字符串到枚举体的转换的时间复杂度较高。
利用哈希表，我们可以把这个时间复杂度降低到$\mathcal O{1}$。
```cpp
template <class E> requires std::is_enum_v<E>
constexpr auto get_enumerators() {
    std::array <
        std::pair<std::string_view, std::underlying_type_t<E>>,
        std::meta::enumerators_of(^^E).size()
    > enumerators;
    std::ranges::copy(
        std::meta::enumerators_of(^^E) | std::views::transform([] (auto I) constexpr {
            return std::make_pair(
                std::meta::identifier_of(I),
                std::meta::extract<E>(I)
            );
        }),
        enumerators.begin()
    );
    return enumerators;
}

template <class E> requires std::is_enum_v<E>
auto get_enumerator_hash_map() {
    std::unordered_map <std::string_view, std::underlying_type_t<E>> ret;
    ret.insert_range(get_enumerators<E>());
    return ret;
}

template <class E> requires std::is_enum_v<E>
std::optional<E> string_to_enum(std::string_view sv) {
    static const auto enums = get_enumerator_hash_map<E>();
    auto itr = enums.find(sv);
    if (itr != enums.end()) return static_cast<E>(itr->second);
    return {};
}
```

我们无法在编译时生成`unordered_map`，因为目前标准规定`define_static_object()`只能接受结构类型（Structual type），不接受复杂的容器类型。
此外，G++ 目前的标准库实现中，关系容器里只有`std::flat_X`系列容器支持`constexpr`操作。
为此，我们只能使用`static const`变量来在第一次运行时初始化这个哈希表。
我们使用`std::array`进行静态内存分配，从而绕开了动态内存分配导致无法在编译期进行计算的问题。
如果持久`constexpr`分配（non-transient constexpr allocation）被纳入标准，那么这些方法能简单很多。

在不启动优化的情况下，对于有 50 项的枚举体，这个算法比上一个算法快五倍左右。
