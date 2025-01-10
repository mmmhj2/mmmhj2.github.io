---
title: "微分几何初步——微分形式"
categories: "分析"
---

本文主要介绍微分几何中的微分形式，这一概念在物理学与力学中得到了大量的应用，且是现代物理学的基础理论。
本文首先从“经典”的微分形式定义出发，介绍其在欧氏空间中的性质，然后给出以现代的代数语言表述的更一般微分形式。
对于经典物理学中的大多数问题，以经典的微分形式定义来处理基本足够。

## 微分形式的基本性质

本节我们考虑微分形式在有限维欧氏空间中的经典定义，并介绍一些基本性质。

### 微分形式的定义

欧几里得空间$\mathbb R^n$（或其一个开集合）上的$k$阶微分形式（differential form），或称$k$-形式，定义为
$$\newcommand{\dif}{\mathop{}\!\mathrm d}
\alpha = \sum_I f_I \dif x_I,$$
其中$I$表示索引下标
$$(i_1, i_2, \dots i_k)$$
的一个排列，$f\_i$是$\mathbb R^n$（或对应开集合）上的一个光滑的函数，称为系数（coefficients）。
{: .definition}

此处，我们暂时将$\alpha$视为一个向量场，而$\dif x\_i$视为无穷小微元向量，其严谨的数学定义将在后文给出。
函数本身不含有无穷小微元，因此可视为0-形式。

我们将微元$\dif x\_i$之间的乘积视为有向的面积或体积，那么有以下性质。

微元的乘积具有*反交换性*（anti-commutativity），即
$$\dif x_i \dif x_j = - \dif x_j \dif x_i.$$
更一般地，有
$$\dif x_I = \mathrm{sgn}(\sigma) \dif x_{\sigma(I)},$$
其中$\sigma$是一置换。
{: .proposition}

立刻有以下推论：
$$\dif x_i \dif x_i = 0.$$

微分形式之间的乘积实际上是张量积，有些作者会使用楔积记号来表示：
$$\dif x_i \wedge \dif x_j = - \dif x_j \wedge \dif x_i.$$
若不至于产生歧义，则本文一般将楔积符号略去。

例如，$\mathbb R^n$上所有的1形式均可写为
$$\alpha = f_1 \dif x_1 + f_2 \dif x_2 + \cdots + f_n \dif x_n.$$
而$n$形式均可写为
$$\beta = f \dif x_1 \cdots \dif x_n.$$
特别地，微分形式
$$\dif x_1 \cdots \dif x_n$$
称为该空间的体积形式（volume form）。
像这种所有系数函数$f$均为常数（此例中$f=1$）的微分形式，称为常微分形式。

由于微分形式的反交换性，我们可以任意交换微分形式的顺序，只用附加额外的符号即可。
出于此原因，我们约定微分形式一定按脚标从小到大的顺序出现，这样，$n$维空间中的$k$-形式最多可能含有
$$\binom{n}{k} = \frac{n!}{k! (n-k)!}$$
项，而两个微分形式相等，当且仅当在这种排列下其系数函数逐个相等。
我们可以将系数视为标量，将这样来看，开集合$U$上所有的$k$形式构成一个线性空间，记为$\Omega^k(U)$，而所有简单的微分形式
$$\alpha_I = \bigwedge_I \dif x_i,$$
其中$I$是递增的下标索引，构成了其一组基底。
例如，$\mathbb R^3$上的$2$-形式的基底为
$$\dif x_1 \dif x_2, \, \dif x_1 \dif x_3, \, \dif x_2 \dif x_3.$$

在定义给出了微分形式的基本定义后，我们可以给出其上定义的计算。
在线性空间$\Omega^k$中的加法与内积的定义是显然的，我们现在考虑其外积。

同一开集合上定义的$k$-形式$\alpha$与$l$-形式$\beta$的外积定义为
$$\alpha \wedge \beta = \sum_{I,J} f_I g_J \dif x_I \dif x_J,$$
其结果是一个$k+l$-形式。由于微分形式的内积不常用，楔积符号常常省略。
{: .definition}

由于反对称性，结果中的许多项可以消去。
特别地，微分形式的足够高的幂次一定为零，即
$$\alpha^{n+1} = 0.$$

两个微分形式之外积，也会继承其基底的反交换性。

微分形式的外积具有反交换性。
对$k$-形式$\alpha$与$l$-形式$\beta$，有
$$\beta \alpha = (-1)^{kl} \alpha \beta.$$
{: .proposition}

立刻有以下推论：
$$\alpha^2 = 0,$$
若$\alpha$的阶数为奇数。

#### 函数的外微分

接下来我们将微分形式与函数的微分联系在一起。

设$f$为一$\mathbb R^n$（或其开子集）上的0-形式，即光滑函数，则其外微分（exterior derivative）是一个1-形式，定义为
$$\dif f = \sum_{i=1}^n\frac{\partial f}{\partial x_i} \dif x_i.$$
递归地定义：k-形式$\alpha$的外微分为一个$k+1$-形式，即
$$\dif \alpha = \sum_I \dif f_I \dif x_I.$$
{: .definition}

显然，$n$-形式的外微分为零。

对函数$f$，显然外微分不过是全微分的一种推广；而对更一般的微分形式，外微分满足以下几点性质。

设$a,b$为两常数，$\alpha,\beta$为$k$-形式。
外微分具有线性：
$$\dif (a\alpha+b\beta) = a \dif \alpha + b \dif \beta.$$
且满足乘法求导规则：
$$\dif (\alpha \beta) = (\dif \alpha) \beta + (-1)^k \alpha \dif \beta,$$
乘法求导规则不要求$\alpha,\beta$阶数相等。
{: .proposition}

微分形式的二阶外微分为零，即
$$\dif (\dif a) = 0.$$
{: .proposition}

首先计算微分形式的一阶外微分，有
$$\dif \alpha = \sum_I \sum_{i=1}^n \frac{\partial f_I}{\partial x_i} \dif x_i \dif x_I.$$
然后计算二阶外微分，
$$\dif \dif \alpha = \dif \sum_I \sum_{i=1}^n \frac{\partial f_I}{\partial x_i} \dif x_i \dif x_I = \sum_I \sum_{i=1}^n \dif \left( \frac{\partial f_I}{\partial x_i}\right) \dif x_i \dif x_I.$$
现在考虑内层求和，有
$$\sum_{i=1}^n \dif \left( \frac{\partial f_I}{\partial x_i}\right) \dif x_i = \sum_{i=1}^n \sum_{j=1}^n \frac{\partial^2 f_I}{\partial x_i \partial x_j} \dif x_j \dif x_i.$$
利用反交换性，得到
$$\text{原式}=\sum_{1 \le i \le j \le n} (\frac{\partial^2 f_I}{\partial x_i \partial x_j} - \frac{\partial^2 f_I}{\partial x_j \partial x_i}) \dif x_i \dif x_j = 0.$$
{: .proof}

从外微分的定义中不难看出，函数的某一阶全微分一定是一个微分形式。
然而，一个微分形式不一定能与函数的某阶全微分联系起来。

对$k$-形式$\alpha$，若存在$k-1$-形式$\beta$，使
$$\dif \beta = \alpha,$$
那么称$\alpha$是恰当的（exact，也叫正合的）。
若$\dif \alpha = 0$，则称该形式是闭合的（closed）。
{: .definition}

恰当形式的外微分为零，即恰当形式一定为闭合形式。
{: .proposition}

闭合形式是否一定是恰当形式呢？这一问题的答案取决于微分形式所在的空间的拓扑性质（称为“形状”）。
作为一个特例，欧几里得空间中的1-闭合形式一定是恰当的。
这实际上重述了物理学中的一个命题——向量场的旋度为零，当且仅当其是保守场。

#### 霍奇星算子

之前我们提到过，线性空间$\Omega^k$的基向量共有$\binom{n}{k}$个，因此维数为$\binom{n}{k}.$
根据二项式系数的性质，这意味着线性空间$\Omega^{n-k}$的维数与其维数相等。
这提醒我们寻找这两个线性空间之间的同构，而这个霍奇星算子正是这样一个同构。

设$\alpha = \sum\_I f\_I \dif x\_I$为一$k$-形式，则其霍奇星算子的结果为一$n-k$-形式，定义为
$$\star\alpha = \sum_{I} f_{I} (\star \dif x_{I}), \; \star\dif x_I = \mathrm{sgn}(\sigma) \dif x_{I^c},$$
其中$I^c$是$I$中不含的下标组成的递增序列，$\sigma$是产生序列$[I, I^c]$所需的置换。
{: .definition}

根据以上定义，霍奇星算子总是满足
$$\dif x_I \wedge \star \dif x_{I} = \dif x_1 \cdots \dif x_n.$$
该算子具有线性和对偶性，应用两次霍奇星算子只会导致符号发生变换。

例如，考虑$\mathbb R^3$中的霍奇星算子$\star \dif y$，由于系数均为$1$，且$I = [y]$，从而$I^c = [x,z]$。
而从$[x,y,z]$产生序列$[y,x,z]$所需的置换为奇置换，因此
$$\star \dif y = - \dif x \dif z.$$
更一般地，有
$$\star \dif x_i = (-1)^{i+1} \dif x_1 \cdots \widehat{\dif x_i} \cdots \dif x_n = \bigwedge_{j \neq i} \dif x_j,$$
其中$\widehat{\circ}$表示仅省略该项。

若我们从微分形式是线性空间、且是算子空间的子空间这一视点出发，那么从几何上看，霍奇星算子类似于取原微分形式定义的子空间的正交子空间。
这一视点须在以张量定义的现代微分形式中才能得到说明，但是蕴涵了一个重要的问题，即霍奇星算子的定义与线性空间的结构密切相关——更具体地说，与线性空间的内积的定义密切相关。

利用微分形式和霍奇星算子，矢量分析中的所有微分算符均可重新定义并推广到更高的维度。

考虑$\mathbb R^n$上的向量场函数
$$\mathbf F = \sum_{i=1}^n F_i \mathbf e_i = \begin{pmatrix} F_1 \\ \vdots \\ F_n \end{pmatrix}.$$
首先，约定
$$\dif \mathbf x = \begin{pmatrix} \dif x_1 \\ \vdots \\ \dif x_n \end{pmatrix},$$
那么我们可以确定一个微分形式
$$\alpha = \mathbf F \cdot \dif \mathbf x,$$
这相当于将$\mathbb R^n$的基向量逐一替换为对应的微分形式，显然，这个1-微分形式与原向量场是一一对应的，而该微分形式的霍奇星为
$$\star \alpha = \mathbf F \cdot \star \dif \mathbf x = \mathbf F \cdot \begin{pmatrix} \dif x_2 \dif x_3 \cdots \dif x_n \\ - \dif x_1 \dif x_3 \cdots \dif x_n \\ \vdots \\ (-1)^{n+1} \dif x_1 \cdots \dif x_{n+1}\end{pmatrix}.$$

这些向量场、微分形式和霍奇星都是具有物理意义的。
若$\mathbf F$为一力场，那么$\alpha$就是其产生的元功的场，对该场在路径上积分即可得到功。
若$\mathbf F$为流场，即流体流速的场，那么$\star \alpha$就是通量的场，即通过$\star \dif \mathbf x$这一与$\mathbf x$正交的超平面通量的场。

通过将向量场与微分形式对应起来，我们可以证明一些关于梯度、散度和旋度与微分形式的关系。

设$f: \mathbb R^n \to \mathbb R$为一标量场，则其梯度满足
$$
\dif f = \nabla f \cdot \dif \mathbf x.
$$
{: .proposition}

证明从略。
根据该命题，标量场的梯度也可写为
$$\nabla f = \frac{\partial f}{\partial \mathbf x}.$$

设$F: \mathbb R^n \to \mathbb R^n$为一矢量场，则其散度为
$$\nabla \cdot F = \star (\dif \star \alpha).$$
{: .proposition}

注意到
$$
\begin{aligned}
\dif \star \alpha &= \dif (\mathbf F \cdot \star \dif \mathbf x) = \dif \left( \sum_i F_i \star \dif x_i \right) \\
&= \dif \left( \sum_i F_i (-1)^{i+1} \bigwedge_{j\neq i} \dif x_j \right) \\
&= \sum_i \frac{\partial F_i}{\partial x_i} (-1)^{i+1} \dif x_i  \bigwedge_{j\neq i} \dif x_j \\
&= \sum_i \frac{\partial F_i}{\partial x_i} \bigwedge_j \dif x_j.
\end{aligned}
$$
从而
$$\star \dif \star \alpha = \sum_i \frac{\partial F_i}{\partial x_i} = \nabla \cdot \mathbf F.$$
{: .proof}

设$f: \mathbb R^n \to \mathbb R$为一标量场，则其拉普拉斯算子为
$$\Delta f = \nabla \cdot \nabla f = \star \dif \star \dif f.$$
{: .proposition}

证明从略。

设$F: \mathbb R^3 \to \mathbb R^3$为一矢量场，则其旋度满足
$$(\nabla \times F) \cdot \dif \mathbf x = \star \dif \alpha.$$
{: .proposition}

首先计算
$$
\begin{aligned}
\dif \alpha &= \sum_{i,j=1}^n \frac{\partial F_i}{\partial x_j} \dif x_j \dif x_i \\
&= \sum_{1 \le i < j \le n} \left( \frac{\partial F_j}{\partial x_i} - \frac{\partial F_i}{\partial x_j} \right) \dif x_i \dif x_j.
\end{aligned}
$$
然后加上霍奇星算子，得到
$$
\begin{aligned}
\star \dif \alpha &= \sum_{1 \le i < j \le n} (-1)^{i+j+1} \left( \frac{\partial F_j}{\partial x_i} - \frac{\partial F_i}{\partial x_j} \right) \dif x_1 \cdots \widehat{\dif x_i} \cdots \widehat{\dif x_j} \cdots \dif x_n.
\end{aligned}
$$
对于三维的情况，可以验证
$$
\star \dif \alpha = \left(\frac{\partial F_3}{\partial x_2} - \frac{\partial F_2}{\partial x_3}\right) \dif x_1 + \left(\frac{\partial F_3}{\partial x_1} - \frac{\partial F_1}{\partial x_3}\right) \dif x_2 + \left(\frac{\partial F_2}{\partial x_1} - \frac{\partial F_1}{\partial x_2}\right) \dif x_3.
$$
而
$$\nabla \times \mathbf F = \left(\frac{\partial F_3}{\partial x_2} - \frac{\partial F_2}{\partial x_3}\right) \mathbf e_1 + \left(\frac{\partial F_3}{\partial x_1} - \frac{\partial F_1}{\partial x_3}\right) \mathbf e_2 + \left(\frac{\partial F_2}{\partial x_1} - \frac{\partial F_1}{\partial x_2}\right) \mathbf e_3.$$
从而证毕。
{: .proof}

#### 例子：麦克斯韦方程

本节中我们考虑闵可夫斯基时空中的麦克斯韦方程。

闵可夫斯基时空是一个特殊的$n+1$维线性空间，前$n$维是空间维度，最后一维是时间维度。
闵可夫斯基空间中的内积定义为
$$
\langle a, b \rangle = - a_{n+1} b_{n+1} + \sum_{i = 1}^n a_i b_i.
$$
这个内积自然地导出一个范数。
在该定义下，若一个向量的范数大于零，那么这个向量是“类空”的（spacelike）；若范数小于零，那么这个向量是“类时”的（timelike）；若范数等于零，那么这个向量是“类光”的（lightlike）。

这个定义来自洛伦兹变换中的不变量：
$$
x^2 + y^2 + z^2 + (ict)^2 = C,
$$
其中$i$是虚数单位，$c$是光速，令$x\_4 = ct$即可得到这个范数。

在该内积空间中，霍奇星算子的定义为
$$\star\alpha = \sum_{I} f_{I} (\star \dif x_{I}), \; \star\dif x_I = \begin{cases}\mathrm{sgn}(\sigma) \dif x_{I^c} &, n+1 \not\in I \\ - \mathrm{sgn}(\sigma) \dif x_{I^c} &, n+1 \in I\end{cases}.$$
这和正常的欧几里得空间几乎一致，仅在微分形式中含有时间维时不同。

考虑高斯单位制下麦克斯韦方程组的经典形式：
$$
\begin{aligned}
\nabla \times \mathbf E &= - \frac{1}{c} \frac{\partial \mathbf B}{\partial t}, \\
\nabla \times \mathbf H &= - \frac{4\pi}{c}\mathbf J + \frac{1}{c} \frac{\partial \mathbf D}{\partial t}, \\
\nabla \cdot \mathbf D &= 4 \pi \rho, \\
\nabla \cdot \mathbf B &= \mathbf 0.
\end{aligned}
$$
在真空中，有$\mathbf E = \mathbf D, \mathbf B = \mathbf H$。

设
$$
F = (E_1 \dif x_1 + E_2 \dif x_2 + E_3 \dif x_3) \dif x_4 + B_1 \dif x_2 \dif x_3 + B_2 \dif x_3 \dif x_1 + B_3 \dif x_1 \dif x_2.
$$
有
$$
\begin{aligned}
\dif F &= [(\partial_2 E_1 \dif x_2 + \partial_3 E_1 \dif x_3) \dif x_1 \\
& + (\partial_1 E_2 \dif x_1 + \partial_3 E_2 \dif x_3) \dif x_2 \\
& + (\partial_1 E_3 \dif x_1 + \partial_2 E_3 \dif x_2) \dif x_3] \dif x_4 \\
& + (\partial_1 B_1 \dif x_1 + \partial_4 B_1 \dif x_4) \dif x_2 \dif x_3 \\
& + (\partial_2 B_2 \dif x_2 + \partial_4 B_2 \dif x_4) \dif x_3 \dif x_1 \\
& + (\partial_3 B_3 \dif x_3 + \partial_4 B_3 \dif x_4) \dif x_1 \dif x_2
\end{aligned}
$$
重组，得到
$$
\begin{aligned}
\dif F &= (\partial_1 B_1 + \partial_2 B_2 + \partial_3 B_3) \dif x_1 \dif x_2 \dif x_3 \\
& + (\partial_1 E_2 - \partial_2 E_1 + \partial_4 B_3) \dif x_1 \dif x_2 \dif x_4 \\
& + (\partial_2 E_3 - \partial_3 E_2 + \partial_4 B_1) \dif x_2 \dif x_3 \dif x_4 \\
& + (\partial_3 E_1 - \partial_1 E_3 + \partial_4 B_2) \dif x_3 \dif x_1 \dif x_4 \\
\end{aligned}
$$
该式为零，当且仅当各个分量均为零，即可得到
$$\nabla \cdot \mathbf B = 0,\; \nabla \times \mathbf E = - \frac{\partial \mathbf B}{\partial x_4} = -\frac{1}{c} \frac{\partial \mathbf B}{\partial t}.$$

现在，令
$$J = - \frac{4\pi}{c} (J_1 \dif x_2 \dif x_3 + J_2 \dif x_3 \dif x_1 + J_3 \dif x_1 \dif x_2 ) \dif x_4 + 4\pi \rho \dif x_1 \dif x_2 \dif x_3.$$
计算$F$的闵可夫斯基霍奇星算子，经过相似的计算，可以证明
$$\dif \star F = J \iff \nabla \times \mathbf B = - \frac{4\pi}{c}\mathbf J + \frac{1}{c} \frac{\partial \mathbf D}{\partial t},\nabla \cdot \mathbf E = 4 \pi \rho.$$

麦克斯韦方程的微分形式为
$$\dif F = 0, \dif \star F = J,$$
其中$F$为电磁场张量，$J$为电流张量。
{: .theorem}


## 微分形式与积分

### 1形式的积分

### 广义斯托克斯公式

## 流形与微分形式
