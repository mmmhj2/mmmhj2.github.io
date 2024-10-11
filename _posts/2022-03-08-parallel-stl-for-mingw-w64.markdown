---
title: "在Mingw-w64中启用PSTL"
date: 2022-03-08 22:11:00 +0800
categories: ["闲笔"]
--- 

TL;DR: 下载对应版本的Intel TBB库，并在链接时加上对应的选项`-ltbb`即可。

----

C++17标准向STL库中引入了[执行策略](https://zh.cppreference.com/w/cpp/algorithm/execution_policy_tag_t)（Execution policy）的概念，这一概念允许通过向某些标准库算法指定执行策略标签而提示编译器进行并行化或是向量化优化。

具体来说，如果程序员能够保证其代码可以并行或是乱序执行，则可以调用以下函数：
```cpp
std::reduce(std::execution::seq, ...);
std::reduce(std::execution::par, ...);
std::reduce(std::execution::par_unseq, ...);
```
来指示编译器分别以有序、并行和并行且无序（向量化）的方式执行指定的算法。

这些并行规范此前曾是并行技术规范，在C++17标准中正式进入标准模板库。
GCC编译器早在[版本9](https://zh.cppreference.com/w/cpp/compiler_support/17)时就已经实现了对这项标准的支持。
理论上讲，MSYS2中的mingw-w64版本已经到了11.2.0，因此也能支持并行STL。
然而事实证明，仅仅使用MSYS2默认的编译器配置，并不能简单地享受到并行的优势。

简单的测试表明，除了并行无序的执行策略略优之外，三者的执行时间没有太大的差距。
考虑到测试用计算机有足足8个物理核心，这说明并行策略并没有起作用。

实际上，在G++编译途中，如果发现程序里引入了`execution`这一头文件，便会从`pstl`(Parallel STL)文件夹中自动引入并行实现。
PSTL提供的并行实现有两种，分别由预处理宏`_PSTL_PAR_BACKEND_SERIAL`和`_PSTL_PAR_BACKEND_TBB`指定。
若定义了前一个预处理宏，则PSTL库会回退到顺序执行。如果定义了后一个则利用TBB库实现指令级并行。
如果两者都没有定义，则提供诊断信息。

这两个宏由`bits/c++config.h`指明。如果发现包含了`tbb/tbb.h`，则定义后一个宏，否则是前一个。
因此，如果编译器没有TBB库，PSTL将退化至顺序执行，并且**不输出任何诊断信息**，这直接导致虽然指明了并行执行，但是性能没有提升。

加入以下一段代码即可在PSTL库使用顺序执行时发出警告。
```cpp
#ifdef _PSTL_PAR_BACKEND_SERIAL
#warning Using serial backend of PSTL
#endif
```

这样一来问题就容易解决了。在MSYS2终端中输入`pacman -S mingw-w64-x86_64_tbb`安装TBB库即可。
链接时记得加上对应的库。
编译完成后的程序执行速度明显快了不少。

需要注意的是执行策略只是提示编译器可以执行并行化、向量化优化，这并不代表编译器一定会执行优化。
如果编译器认为顺序执行的效率更高，那么它完全可以不执行这样的优化。
