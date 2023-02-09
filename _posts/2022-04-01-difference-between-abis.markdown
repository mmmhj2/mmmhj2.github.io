---
title: "不同ABI调用约定下函数参数的位置"
date: 2022-04-01 18:40:00 +0800
categories:
--- 

最近查看一份MINGW生成的汇编代码的时候发现其中的函数参数所在的寄存器和CSAPP上所描述的有所不同。
查阅资料之后发现，现今流行的x86_64指令集上其实有两套不同的二进制接口，进而有两套传参的顺序。
两套系统分别是 Microsoft ABI 和 System V ABI，前者用在 Windows 系统上，后者主要用在 GNU/Linux 系统上。
正是 ABI 不同导致了传参顺序的差异。
此篇文章主要用来总结这些差异。
许多编译器可以通过为函数指明调用方式来手动修改调用约定，这不在本文的考虑范围之内。

### 参数传递的寄存器使用顺序

| | Microsoft ABI | System V ABI |
|-|---------------|--------------|
| 浮点数 | xmm0-3, 栈 | xmm0-7, 栈 |
| 整数和指针 | rcx, rdx, r8, r9, 栈 | rdi, rsi, rdx, rcx, r8, r9, 栈 |

对于聚合数据类型的处理比较复杂。
在 Microsoft ABI 下，如果其大小为8，16，32或64位，则按整数处理；否则，按指针处理。
在 System V ABI 下，如果其大小大于32字节，则总是在栈上；
否则，如果其是具有非平凡构造或析构函数的C++类型，则按指针传递；
否则，如果其大小大于1字节，则每个元素单独考虑（详见手册）。

Microsoft ABI 不使用 x87 寄存器，而 System V ABI 可能使用 x87 寄存器，主要用于复数计算。

### 易变寄存器

易变寄存器是被调用的函数可以修改的寄存器，而非易变寄存器则是函数调用前后保持不变的寄存器。
被调用的函数可以修改非易变寄存器，但必须保证返回后寄存器维持原样。
这通常是通过将寄存器的值压入栈中实现的。

| | 易变寄存器 | 非易变寄存器 |
|-| - | - |
| Microsoft ABI | rax, rcx, rdx, r8-11, xmm0-5 | rbx, rbp, rdi, rsi, rsp, r12-15, xmm6-15 |
| System V ABI | *其余所有* | rbx, rsp, rbp, r12-15, x87控制字 |

### 返回值

| | Microsoft ABI | System V ABI |
|-|---------------|--------------|
| 浮点数 | xmm0 | xmm0, xmm1 |
| 整数和指针 | rax | rax, rdx |

聚合类型的判定较为复杂，详情参见各自的手册。


### 附注及参考文件

- 使用 GCC 编译时，可以通过指定选项`-mabi=name`改变ABI。
- [x64 calling convention](https://docs.microsoft.com/en-us/cpp/build/x64-calling-convention)
- [System V ABI - AMD64 Architecture Processor Supplement](https://www.uclibc.org/docs/psABI-x86_64.pdf)
