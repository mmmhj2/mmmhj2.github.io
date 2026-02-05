---
title: "量子力学的形式化表述"
categories: ["量子力学"]
---

本文主要介绍量子力学中的各种形式化表述。

## 量子力学公理

首先介绍量子力学的一些基本原理。

### 物理量与算子

为描述物理系统的状态，在量子力学中通常使用狄拉克记号来表示希尔伯特空间中的各种元素。

希尔伯特空间中的列向量表示物理系统的量子态，称为*右矢*（ket），记为$\vert \psi \rangle$；
其共轭转置称为*左矢*（bra），记为$\langle \psi \vert$。
表示量子态的矢量简称为*态矢*。
这个希尔伯特空间通常是在一至三维欧几里得空间（取决于问题所研究空间的维数）上定义的勒贝格$ L^2(\mathbb R^n)$空间。
{: .definition}

利用左矢与右矢，可以非常方便地表示一些常见的运算，如内积：
$$ (\psi, \phi) = \psi^\dagger \cdot \phi = \langle \psi \vert \phi \rangle $$
其中$\cdot^\dagger$表示矩阵的共轭转置。
应当注意，量子态所处的空间一般是波函数的空间，即平方可积的函数构成的希尔伯特空间，也就是上文中提到的勒贝格空间，因此其中的内积实际上是：
$$
\langle \psi \vert \phi \rangle = \int_{\mathbb R^n} \psi^*(\vec x) \phi(\vec x) \, \mathrm d \vec x, \quad (n = 1, 2, 3).
$$
勒贝格空间通常是无穷维的，而为了给出其中波函数坐标表示，也就是态矢，必须首先确定其基向量。
在量子力学中，所研究问题的基向量和欲研究的物理量有密切的联系。

量子力学中，所有可观测的物理量都由一个*可观测量*（Observable）表述。
可观测量是一个自伴线性算子，也称厄米算子。
与物理量有关的可观测量算子用$\hat \cdot$符号标记。
{: .proposition}

常见的可观测量有动量和哈密顿量，即：
$$\hat p = \frac{\hbar}{i} \nabla , \quad \hat H = - \frac{\hbar^2}{2m} \Delta + V$$
哈密顿量出现在薛定谔方程中：
$$i \hbar \frac{\partial}{\partial t} \psi (\vec r, t) = \hat H \psi (\vec r, t) = - \frac{\hbar^2}{2m}\nabla_r \psi (\vec r, t) + V \psi(\vec r, t)$$

在代数中，我们已经知道，厄米矩阵总是可以对角化，且其特征值均为实数。
这些特征值——也称本征值——在量子力学中具有重要的物理意义。

对任何物理量的测量结果只能是其对应的可观测量算子的特征值之一。
{: .proposition}

以哈密顿量为例，其特征值就是系统的能量的可能的取值。

厄米矩阵既然可以对角化，则其特征向量组成希尔伯特空间的一组基底，因此具有重要的意义——这就是问题所研究的空间的基底向量。
若不加特殊说明，我们接下来用$\varphi\_n$来表示这些向量。

这些基底向量可以用来将问题中研究的波函数转化为态矢表示。
通常这些向量会被按能量从低到高的顺序进行编号，从而仅使用单个自然数就可以代表态矢，这种自然数被叫做量子数（quantum number）。

对于一些特殊的系统（通常是具有高度对称性的系统，例如之后要研究的类氢原子），其波函数可拆分成多个一维波函数的乘积。
这种情况下，每一维波函数都可以具有自己的态矢，从而具有自己的量子数，因此有时需要多个量子数才能确定态矢对应的波函数。
我们将在说明对易可观测量完备集合时进一步说明这个问题。

### 概率与坍缩

首先定义简并的概念。

若可观测量的特征值的重数不均为一，则称该可观测量的特征值是*退化*的或*简并*的（Degenerate），重数称为该特征值的简并度（Degeneracy）。
{: .definition}

如果特征值的重数大于一，就说明一个特征值具有多个线性独立的特征向量，因此即使确定了该物理量，仍然不能确定该系统具体处于什么状态。
这样的状态就是简并的。

物理量在测量后为某一特征值的概率为：
$$p_n = \sum_d \vert \langle \varphi_{n,d} \vert \psi \rangle \vert^2 = \sum_d \langle \varphi_{n,d} \vert \psi \rangle \langle \psi \vert \varphi_{n,d} \rangle$$
其中$d$为简并度，$\varphi\_{n,d}$为特征向量。
若该特征值不是简并的，则可简写为
$$p_n = \langle \varphi_{n} \vert \psi \rangle \langle \psi \vert \varphi_{n} \rangle$$
{: .proposition}

注意到特征向量组成希尔伯特空间的一组基底，任何状态向量可写为特征向量的线性组合：
$$\vert\psi\rangle = \sum c_{n,d} \vert \varphi_{n,d} \rangle$$
因此取得特征值的概率为
$$p_n = \sum \vert c_{n,d} \vert^2$$
非简并态的概率化简为
$$p_n = \vert c_n \vert^2$$

对物理量进行测量后，对应的波函数立刻被投影至测量出的特征值的特征空间中，这一现象称为*坍缩*（Collapse, Reduction）。
新的波函数为
$$\vert \psi' \rangle = \frac{\sum_d c_{n,d} \vert \varphi_{n,d} \rangle }{\sqrt{\sum_d \vert c_{n,d} \vert^2}}$$
其中$c_{n,d}$即位于该状态的概率。
非简并态下，新的波函数为
$$\vert \psi' \rangle = \vert \varphi_n \rangle$$
{: .proposition}

### 薛定谔方程

哈密顿算符为$\hat H$的系统的量子态随时间的变化由薛定谔方程完全描述：
$$\hat H(t) \vert \psi(t) \rangle = i \hbar \frac{d}{d t} \vert \psi(t) \rangle$$
{: .proposition}

薛定谔方程还给出了概率流的表述。

## 狄拉克记号的计算
本节主要关注狄拉克记号下的各种计算。

### 投影算符

向向量$\vert \varphi_n \rangle$投影产生投影向量的算子为
$$\vert \varphi_n \rangle \langle \varphi_n \vert$$
且
$$\sum_n \vert \varphi_n \rangle \langle \varphi_n \vert = \hat{\mathbb{1}}$$
{: .proposition}

考虑任意向量$\vert \psi \rangle$，向$\vert \varphi_n\rangle$投影并产生投影向量可表示为
$$\vert \varphi_n \rangle \langle \varphi_n \vert \psi \rangle$$
利用矩阵乘法的结合律即可得到投影向量算子。
注意到厄米算子的特征值构成了空间的一组基底，该算子的和就是全同映射。
{: .proof}

### 对易算符

通常情况下，两个算符的运算顺序是不能交换的，正如矩阵乘法一样。
如果两个算符对易，则代数中的结论告诉我们其必然含有至少一个相同的特征向量。
对于任何两个算符，我们都可以构造一个量来确定其对易性。

设$\hat A, \hat B$为两个算符，其*对易子*（commutator，也称交换子）定义为
$$[\hat A, \hat B] = \hat A \hat B - \hat B \hat A$$
显然，对易子为零的两个算符可对易，因此互相保持特征空间不变，并至少共享一组相同的特征基。
对易子为零的两个可观测量称为*相容的*（Compatible）可观测量。
{: .definition}

位移和动量的对易子为：
$$
\begin{aligned}
\forall \psi, \quad [\hat x, \hat p] \psi &= (\hat x \hat p - \hat p \hat x) \psi \\
&= x (\frac{\hbar}{i} \frac{\partial}{\partial x} \psi) - \frac{\hbar}{i} \frac{\partial}{\partial x} (x \psi) \\
&= i \hbar \psi
\end{aligned}
$$
从而
$$[\hat x, \hat p] = i \hbar \hat{\mathbb{1}}$$
{: .exampl}

### 对易可观测量完全集

设$(\hat A, \hat B, \cdots)$为一组两两可对易的算符，则其至少含有一组相同的特征基。
如果对任何一个量子态，可以通过给出这些相同特征向量的系数来完全地确定该量子态，即这些相同的特征向量构成量子态空间的一组基底，那么称这一组算符为*对易可观测量完全集*（Complete Set of Commuting Observables, CSCO）。
{: .definition}

对易的矩阵保持特征空间不变是一个线性代数中学习过的一个非常简单的定理，此处不再赘述。
要点在于，对易可观测量完全集有何物理意义？

如果一个可观测量$A$是非简并的，那么其所有特征值只对应一个特征向量，因此只需要特征值就可以确定特征向量，从而确定整个波函数。
然而，若其是简并的，那么对同一个特征值，可能存在多个特征向量，从而无法确定波函数。
通过引入相容的可观测量$B$，由于具有相同的特征基，可观测量$A$的特征空间不发生变化，因此能由$A$表示的波函数依然能由$A$表示。
但是，对这些特征向量而言，尽管它们对于$A$有相同的特征值，对于$B$仍然可以具有不同的特征值，因此通过额外指定对$B$的特征值来将这些简并的状态区分开。

这种添加相容可观测量的过程可一直持续，直到找到可将所有简并状态都区分开的一组可观测量，这个时候就称找到了对易可观测量完全集。

### 均值与不确定度

某物理量的均值——即其期望，可用狄拉克记号表示为
$$\langle A \rangle_\psi = \langle \psi \vert \hat A \vert \psi \rangle$$
其不确定度——即标准差，可用狄拉克记号表示为
$$\Delta_\psi (A) = \sqrt{ \langle (\hat A - \langle A \rangle_\psi)^2 \rangle_\psi } = \sqrt{\langle A^2 \rangle_\psi- \langle A \rangle_\psi^2}$$
不确定度的算子$\Delta (\cdot)$也是厄米算子。
{: .proposition}

首先证明期望的公式。
$$
\begin{aligned}
\langle A \rangle_\psi &= \sum_n p_n a_n = \sum_n \vert \langle \varphi_n \vert \psi \rangle \vert^2 a_n \\
&= \sum_n \langle \psi \vert \varphi_n \rangle \langle \varphi_n \vert \psi \rangle a_n \\
&= \sum_n \langle \psi \vert \hat A (\vert \varphi_n \rangle \langle \varphi_n \vert) \psi \rangle \\
&= \langle \psi \vert \hat A \vert \psi \rangle 
\end{aligned}
$$
对于标准差，我们直接应用概率学中的结果（即二阶矩的定义）：
$$\sigma^2_X = \mathrm{E}\left( (X - \mathrm{E}(X) )^2 \right),$$
从而
$$
\begin{aligned}
\Delta_\psi(A)^2 &= \langle (\hat A - \langle A \rangle)^2 \rangle \\
 &= \langle \hat A \hat A - 2 \hat A \langle A \rangle + \langle A \rangle^2 \rangle \\
 &= \langle A^2 \rangle - \langle A \rangle^2.
\end{aligned}
$$
由于方差和标准差均非负，两边取平方根，原命题即得证。
{: .proof}

设$\hat A, \hat B$为两算符，$i \hbar \hat C = [\hat A, \hat B]$，则对任意波函数$\psi$，
$$\Delta_\psi (A) \Delta_\psi (B) \ge \frac{\hbar}{2} \langle C \rangle_\psi $$
这一关系称为广义海森堡不确定性关系，也称海森堡-罗伯逊（Heisenberg-Robertson）不确定性关系。
{: .proposition}

为将两个算符联系起来，考虑使用柯西-施瓦茨不等式。
注意到
$$\Delta(A)^2 = \langle (\hat A - \langle A \rangle)^2 \rangle = \langle \psi \vert (\hat A - \langle A \rangle)^2 \vert \psi \rangle,$$
其中略去了下标以使得表达式更简单。
不妨令
$$\vert \alpha \rangle = \vert \hat A - \langle A \rangle \vert \psi \rangle,$$
从而有
$$\Delta(A)^2 = \langle \alpha \vert \alpha \rangle.$$
同理，令
$$\Delta(B)^2 = \langle \beta \vert \beta \rangle.$$
根据柯西-施瓦茨不等式，有
$$\Delta(A)^2 \Delta(B)^2 = \langle \alpha \vert \alpha \rangle \langle \beta \vert \beta \rangle \ge \vert \langle \alpha \vert \beta \rangle \vert^2.$$
由于
$$\hat C = \frac{[\hat A, \hat B]}{i\hbar},$$
现在我们希望证明
$$\vert \langle \alpha \vert \beta \rangle \vert^2 \ge \frac{1}{4} \left\vert\langle [\hat A, \hat B] \rangle \right\vert^2.$$
直接进行计算，有
$$
\begin{aligned}
\mathrm{Re}(\langle \alpha \vert \beta \rangle) &= \frac{1}{2} (\langle \alpha \vert \beta \rangle + \langle \beta \vert \alpha \rangle) \\
&= \frac{1}{2} \langle \psi \vert \hat A \hat B + \hat B \hat A \vert \psi \rangle - \langle A \rangle \langle B \rangle, \\
\mathrm{Im}(\langle \alpha \vert \beta \rangle) &= \frac{1}{2i} (\langle \alpha \vert \beta \rangle - \langle \beta \vert \alpha \rangle) \\
&= \frac{1}{2i} \langle \psi \vert \hat A \hat B - \hat B \hat A \vert \psi \rangle,
\end{aligned}
$$
计算时注意：
$$\langle \psi \vert \hat A \langle B \rangle \vert \psi \rangle = \langle \psi \vert \langle A \rangle \hat B \vert \psi \rangle = \langle A \rangle \langle B \rangle.$$
从而
$$
\begin{aligned}
\vert \langle \alpha \vert \beta \rangle \vert^2 
& = \mathrm{Re}(\langle \alpha \vert \beta \rangle)^2 + \mathrm{Im}(\langle \alpha \vert \beta \rangle)^2 \\
& = \mathrm{Re}(\langle \alpha \vert \beta \rangle)^2 + \frac{1}{4} \langle  [\hat A, \hat B] \rangle^2\\
&\ge \frac{1}{4} \langle [\hat A, \hat B] \rangle^2.
\end{aligned}
$$
从而完成了证明。
{: .proof}

在这个证明中，我们实际上证明了一个更紧的不等式：
$$
\Delta^2 (A) \Delta^2 (B) \ge  \left\vert \frac{1}{2} \langle \psi \vert \hat A \hat B + \hat B \hat A \vert \psi \rangle - \langle A \rangle \langle B \rangle \right\vert^2 + \left\vert \frac{1}{2} \langle [\hat A, \hat B] \rangle \right\vert^2,
$$
这一关系有时叫做薛定谔（Schrödinger）不确定性关系。

带入位移与向量的对易子，即可得
$$\Delta (x) \Delta (p) \ge \frac{\hbar}{2} = \frac{h}{4\pi},$$
这是最经典的海森堡不确定性关系。

### 埃伦费斯特定理

我们已经提供了量子力学中对物理量和观测的定义，现在的问题是，量子力学中的物理量能否和经典力学中的物理量对应？
我们可借助埃伦费斯特定理回答这个问题。

<small>(Ehrenfest, 1927)</small>对任何物理量$A$及其对应的算符$\hat A$，其期望与哈密顿量算符$\hat H$满足：
$$\frac{\mathrm d}{\mathrm d t} \langle A \rangle = \frac{1}{i\hbar} \left\langle [\hat A, \hat H] \right\rangle + \left\langle \frac{\partial A}{\partial t} \right\rangle,$$
特别地，对位置$x$、动量$p$和有势外力$F = - \partial_x V(x)$，有
$$m \frac{\mathrm d \langle x \rangle}{\mathrm d t} = \langle p \rangle, \frac{\mathrm d \langle p \rangle}{\mathrm d t} = - \langle \partial_x V(x) \rangle.$$
{: .theorem}

直接进行计算：
$$
\begin{aligned}
\frac{\mathrm d \langle A \rangle}{\mathrm d t} 
&= \frac{\mathrm d}{\mathrm d t}\langle \psi \vert \hat A \vert \psi \rangle \\
&= \left(\frac{\partial }{\partial t} \langle \psi \vert \right) \hat A \vert \psi \rangle + \langle \psi \vert \left(\frac{\partial}{\partial t} \hat A\right) \vert \psi \rangle +  \langle \psi \vert \hat A \left(\frac{\partial}{\partial t} \vert \psi \rangle\right) \\
&= \left(\frac{\partial }{\partial t} \langle \psi \vert \right) \hat A \vert \psi \rangle + \langle \psi \vert \hat A \left(\frac{\partial}{\partial t} \vert \psi \rangle\right) + \left\langle\frac{\partial}{\partial t} \hat A\right\rangle.
\end{aligned}
$$
根据薛定谔方程，有
$$\frac{\partial \psi}{\partial t} = \frac{1}{i\hbar} \hat H \psi \iff
\frac{\partial \psi^*}{\partial t} = - \frac{1}{i\hbar} \psi^* \hat H,$$
注意哈密顿算符是厄米的，因此对共轭转置不变。
原方程可进一步写为
$$
\begin{aligned}
\frac{\mathrm d \langle A \rangle}{\mathrm d t} 
&= \left(\frac{\partial }{\partial t} \langle \psi \vert \right) \hat A \vert \psi \rangle + \langle \psi \vert \hat A \left(\frac{\partial}{\partial t} \vert \psi \rangle\right) + \left\langle\frac{\partial}{\partial t} \hat A\right\rangle \\
&= \frac{1}{i \hbar} \langle \psi \vert \hat A \hat H - \hat H \hat A \vert \psi \rangle + \left\langle\frac{\partial}{\partial t} \hat A\right\rangle \\
&= \frac{1}{i \hbar} \langle [\hat A, \hat H] \rangle +  \left\langle\frac{\partial}{\partial t} \hat A\right\rangle.
\end{aligned}
$$
对位置和动量的特殊情况，代入即可得证。
{: .proof}

特别注意，尽管这一定理是量子力学和经典物理物理量对应的基础，它并不说明这两者是完全对应的。
在原命题中，我们说：
对位置$x$、动量$p$和有势外力$F = - \partial_x V(x)$，有

$$m \frac{\mathrm d \langle x \rangle}{\mathrm d t} = \langle p \rangle, \frac{\mathrm d \langle p \rangle}{\mathrm d t} = - \textcolor{blue}{\langle \partial_x V(x) \rangle}.$$

然而，在经典力学中，正确的表达应该是：

$$m \frac{\mathrm d \langle x \rangle}{\mathrm d t} = \langle p \rangle, \frac{\mathrm d \langle p \rangle}{\mathrm d t} = - \textcolor{red}{\partial_x \langle V(x) \rangle}.$$

为完全将两者对应，还需额外添加波函数的“定域性”条件：
假设波函数集中于空间中的某一点$x\_0$，即满足
$$\partial_x V(\langle x \rangle) \approx \langle \partial_x V(x) \rangle \approx \partial_x V(x_0),$$
那么量子力学预测的位置和动量会和经典力学预测的一致。
