---
title: "湍流"
categories: ["流体力学"]
---

本章中，我们将主要研究湍流问题。

## 湍流的统计学表述

我们很难给湍流下一个严格的定义，尽管湍流有许多重要的特点。
这些特点中，最重要也是最明显的一点就是其随机性。
当我们需要从大量的随机性中寻找规律时，统计学就派上了用场，因此，大多数关于湍流的理论都是统计学理论，我们将研究这些理论中的一小部分。

### 统计学概述

我们使用频率学派的朴素概率论来为湍流进行建模，在这种体系下，可给出任意物理量的平均值（或称期望）的定义：

物理量$\varphi$的平均值定义为：
$$\overline \varphi(\vec x, t) = \lim_{N \to \infty} \frac{1}{N} \sum_{n=1}^N \varphi_n(\vec x, t)$$
其中$N$表示试验次数，$\varphi_n$表示第$n$次试验时测量的值。
{: .definition}

我们将所有物理量表述成中心化随机变量的形式，以速度（矢量场）和压强（标量场）为例：
$$\vec U(\vec x, t) = \overline{\vec U} (\vec x, t) + \vec u(\vec x,t), \; P(\vec x, t) = \overline{P}(\vec x, t) + p(\vec x, t)$$
注意此时我们使用大写字母$P$表示压强。

出于方便考虑，我们可以将求均值这一操作定义为一个算子：
$$\overline{\cdot}: \; x \mapsto \overline{x}$$
该算子是*线性*的，且与求导运算具有*交换性*：
$$
\def\pd#1#2{\frac{\partial #1}{\partial #2}}
\overline{\pd{\vec U}{t}} = \pd{\overline{\vec U}}{t}, \quad
\overline{\nabla \cdot \vec U} = \nabla \cdot \overline{\vec U}
$$

