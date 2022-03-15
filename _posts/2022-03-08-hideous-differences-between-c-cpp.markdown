---
layout: post
title: "C 与 C++ 的微妙不同"
date: 2022-03-08 21:21:00 +0800
categories:
--- 

以下测试环境为MSYS2 MINGW-W64 GCC 11.2.0

### 字符字面量

在 C 语言中，字符字面量的类型为`int`, 而 C++ 中字符字面量的类型为`char`。

```cpp
/*
 * gcc -xc	输出4
 * gcc -xc++	输出1
 */
printf("%d", sizeof('1'));
```

### 赋值操作为左值

在 C 语言中，赋值运算符的返回值为右值，而 C++ 中其返回值为左值。

```cpp
/*
 * gcc -xc	编译不通过
 * gcc -xc++	编译通过，输出“3 2 3”
 */
int a, b, c;
a = 1, b = 2, c = 3;
(a = b) = c;
printf("%d %d %d\n", a, b, c);
```

### 构造函数赋值

在 C 语言中没有构造函数，因此不能进行带构造函数的拷贝赋值。

```cpp
/*
 * gcc -xc 	编译不通过
 * gcc -xc++ 	编译通过
 */
int a;
a = int(10);	
// 实际上是先构造了临时变量，在进行拷贝赋值（C++11后是移动赋值）
```

但是以下代码均可编译通过。
```cpp
int a;
a = (int)(10);
// (int) 是强制类型转换运算
```

### K&R 函数声明

在 C 语言中允许不带参数列表的 K&R 旧式函数声明。
若函数没有形参列表，则任何将来的函数调用表达式都将进行默认参数提升，而且若实参数量不匹配形参数量则引起未定义行为。 
这使得 C 语言中 `void func(void)` 和 `void func()` 不等价。

```cpp
void func(void);	/* C 语言中声明一个没有形参的函数 */
void func();	/* C 语言中的 K&R 声明 */
// 在 C++ 中等价
```

注：C23标准中已经弃用K&R声明。

### const 类型限定符

在 C 语言中，虽然从 C++ 里引入了`const`类型限定符，但是被其限定的变量并不是常量。
具体地说，被其限定的变量不能用作`case`的标号，且其声明的数组是变长度数组。
```cpp
/*
 * gcc -xc 编译不通过
 * gcc -xc++ 编译通过
 */
const int const_x = 5;
int x[const_x];     // C 语言中为变长数组

switch(x[0])
{
case const_x:
  puts("Successful");  
}
```

