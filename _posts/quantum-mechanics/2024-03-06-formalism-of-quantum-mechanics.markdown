---
title: "量子力学的形式化表述"
categories: ["量子力学"]
---

本文主要介绍量子力学中的各种形式化表述。

## 量子力学公理

首先介绍量子力学的一些基本原理。

### 物理量与算子

为描述物理系统的状态，在量子力学中通常使用狄拉克记号来表示希尔伯特空间中的各种元素。

希尔伯特空间中的列向量表示物理系统的量子态，称为*右矢*（ket），记为$| \psi \rangle$；
其共轭转置称为*左矢*（bra），记为$\langle \psi |$。
{: .definition}

利用左矢与右矢，可以非常方便地表示一些常见的运算，如内积：
$$ (\psi, \phi) = \psi^\dagger \cdot \phi = \langle \psi | \phi \rangle $$
其中$\cdot^\dagger$表示矩阵的共轭转置。

对量子态的更准确的描述是：量子态是射线(Ray)定义的等价类的代表元。

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

厄米矩阵既然可以对角化，则其特征向量组成希尔伯特空间的一组基底，因此具有重要的意义。
若不加特殊说明，我们用$\varphi\_n$来表示这些向量。

### 概率与坍缩

首先定义退化的概念。

若可观测量的特征值的重数不均为一，则称该可观测量的特征值是*退化*的或*简并*的（Degenerate），重数称为该特征值的简并度（Degeneracy）。
{: .definition}

如果特征值的重数大于一，就说明一个特征值具有多个线性独立的特征向量，因此即使确定了该物理量，仍然不能确定该系统具体处于什么状态。
这样的状态就是简并的。

物理量在测量后为某一特征值的概率为：
$$p_n = \sum_d | \langle \varphi_{n,d} | \psi \rangle |^2 = \sum_d \langle \varphi_{n,d} | \psi \rangle \langle \psi | \varphi_{n,d} \rangle$$
其中$d$为简并度，$\varphi\_{n,d}$为特征向量。
若该特征值不是简并的，则可简写为
$$p_n = \langle \varphi_{n} | \psi \rangle \langle \psi | \varphi_{n} \rangle$$
{: .proposition}

注意到特征向量组成希尔伯特空间的一组基底，任何状态向量可写为特征向量的线性组合：
$$|\psi\rangle = \sum c_{n,d} | \varphi_{n,d} \rangle$$
因此取得特征值的概率为
$$p_n = \sum | c_{n,d} |^2$$
非简并态的概率化简为
$$p_n = |c_n|^2$$

对物理量进行测量后，对应的波函数立刻被投影至测量出的特征值的特征空间中，这一现象称为*坍缩*（Collapse, Reduction）。
新的波函数为
$$| \psi' \rangle = \frac{\sum_d c_{n,d} | \varphi_{n,d} \rangle }{\sqrt{\sum_d |c_{n,d}|^2}}$$
其中$c_{n,d}$即位于该状态的概率。
非简并态下，新的波函数为
$$| \psi' \rangle = | \varphi_n \rangle$$
{: .proposition}

### 薛定谔方程

哈密顿算符为$\hat H$的系统的量子态随时间的变化由薛定谔方程完全描述：
$$\hat H(t) | \psi(t) \rangle = i \hbar \frac{d}{d t} | \psi(t) \rangle$$
{: .proposition}

薛定谔方程还给出了概率流的表述。

## 狄拉克记号的计算
本节主要关注狄拉克记号下的各种计算。

### 投影算符

向向量$| \varphi_n \rangle$投影产生投影向量的算子为
$$| \varphi_n \rangle \langle \varphi_n |$$
且
$$\sum_n | \varphi_n \rangle \langle \varphi_n| = \hat{\mathbb{1}}$$
{: .proposition}

考虑任意向量$| \psi \rangle$，向$|\varphi_n\rangle$投影并产生投影向量可表示为
$$| \varphi_n \rangle \langle \varphi_n | \psi \rangle$$
利用矩阵乘法的结合律即可得到投影向量算子。
注意到厄米算子的特征值构成了空间的一组基底，该算子的和就是全同映射。
{: .proof}

### 对易算符

通常情况下，两个算符的运算顺序是不能交换的，正如矩阵乘法一样。
如果两个算符对易，则代数中的结论告诉我们其必然含有至少一个相同的特征向量。
对于任何两个算符，我们都可以构造一个量来确定其对易性。

设$\hat A, \hat B$为两个算符，其*对易子*（commutator，也称交换子）定义为
$$[\hat A, \hat B] = \hat A \hat B - \hat B \hat A$$
显然，对易子为零的两个算符可对易，因此至少由一个相同的特征向量。
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

设$(\hat A, \hat B, \cdots)$为一组两两可对易的算符，则其至少含有一个相同的特征向量。
如果对任何一个量子态，可以通过给出这些相同特征向量的系数来完全地确定该量子态，即这些相同的特征向量构成量子态空间的一组基底，那么称这一组算符为*对易可观测量完全集*（Complete Set of Commuting Observables, CSCO）。
{: .definition}

### 均值与不确定度

某物理量的均值——即其期望，可用狄拉克记号表示为
$$\langle A \rangle_\psi = \langle \psi | \hat A | \psi \rangle$$
其不确定度——即标准差，可用狄拉克记号表示为
$$\Delta_\psi (A) = \sqrt{ \langle (\hat A - \langle A \rangle_\psi)^2 \rangle_\psi } = \sqrt{\langle A^2 \rangle_\psi- \langle A \rangle_\psi^2}$$
不确定度的算子$\Delta (\cdot)$也是厄米算子。
{: .proposition}

标准差的公式在概率论中已经得到证明，我们只证明期望的公式。
$$
\begin{aligned}
\langle A \rangle_\psi &= \sum_n p_n a_n = \sum_n |\langle \varphi_n | \psi \rangle|^2 a_n \\
&= \sum_n \langle \psi | \varphi_n \rangle \langle \varphi_n | \psi \rangle a_n \\
&= \sum_n \langle \psi | \hat A (| \varphi_n \rangle \langle \varphi_n |) \psi \rangle \\
&= \langle \psi | \hat A | \psi \rangle 
\end{aligned}
$$
{: .proof}

设$\hat A, \hat B$为两算符，$i \hbar \hat C = [\hat A, \hat B]$，则对任意波函数$\psi$，
$$\Delta_\psi (A) \Delta_\psi (B) \ge \frac{\hbar}{2} \langle C \rangle_\psi $$
这一关系称为广义海森堡不确定性关系。
{: .proposition}

参考柯西-施瓦茨不等式的证明方法，构造二次多项式后用判别式证明。
{: .proof}

带入位移与向量的对易子，即可得
$$\Delta (x) \Delta (p) \ge \frac{\hbar}{2} = \frac{h}{4\pi}$$
