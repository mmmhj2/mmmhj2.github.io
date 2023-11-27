---
title: "能量方法"
categories: "结构力学"
tags: ["连续介质力学", "固体力学"]
---

本文主要介绍从能量的角度求解固体力学的各种方法。

## 寻找可行解

我们首先关注如何构造一组满足约束的解。

### 正规问题

一个偏微分方程的初值问题是正规的，当其具有唯一的解。
回忆我们之前提到的张量和方程，不难发现我们已经为15个变量找到了15个方程：

$$
\DeclareMathOperator{\Tr}{\mathrm{Tr}}
\begin{aligned}
\partial_j \sigma_{ij} + \rho f_i &= 0 \\
\frac{1}{2}(\partial_j u_i + \partial_i u_j) &= \varepsilon_{ij} \\
\lambda \Tr(\varepsilon) \mathbf I + 2 \mu \varepsilon &= \sigma
\end{aligned}
$$

接下来，对于偏微分方程的边界条件，我们将固体的边界分为两个可能相交的集合：
- 将边界上具有受力约束的区域称为$S\_F$；
- 将边界上具有位移约束的区域称为$S\_U$。

从而边界条件可以写为：
$$
\def\bu{\mathbf{u}}
\begin{aligned}
\sigma \cdot \vec n = \mathbf T^d \quad & P \in S_F \\
\bu = \mathbf u^d \quad & P \in S_U
\end{aligned}
$$

一般情况下，两个集合是不相交的，因为如果已经完全固定了一个表面，在其上施加应力是没有作用的。
对于某些约束，如放置在光滑表面上的物体所受的约束，其可能既具有受力约束（切向受力为零），又具有位移约束（法向位移为零），这种约束称为混合约束。

### 验证解的可行性

为了验证解的可行性，我们首先提出运动学和静力学许可的概念。

对于某个正规问题，若一个位移场$\bu$能够满足位移约束，则称该场为*运动学许可的*（Kinematically admissible），运动学许可的场记为$\tilde \bu$：
$$\tilde \bu = \bu^D, \quad \forall P \in S_U$$
若一个应力场能够满足受力约束，同时满足局部平衡方程，则称该场为*静力学许可的*（Statically admissible），记为$\hat \sigma$：
$$
\def\bT{\mathbf{T}}
\begin{aligned}
\hat \sigma \cdot \vec n = \bT^D&, \quad \forall P \in S_F \\
\nabla \cdot \hat \sigma + \rho \mathbf f = 0 &
\end{aligned}
$$
{: .definition}

#### 位移场的可行性

若给出了一个位移场$\bu$，我们使用以下几步验证其可行性。

1. 检查其是否是运动学许可的：
$$\bu = \bu^D, \quad \forall P \in S_U$$
2. 计算位移场和应力场：
$$\varepsilon_{ij} = \frac{1}{2} (\partial_j \bu_i + \partial_i \bu_j),\ \sigma = \lambda \Tr(\varepsilon) \mathbf I + 2 \mu \varepsilon$$
3. 验证应力场是否是静力学许可的：
$$
\begin{aligned}
\hat \sigma \cdot \vec n = \bT^D&, \quad \forall P \in S_F \\
\nabla \cdot \hat \sigma + \rho \mathbf f = 0 &
\end{aligned}
$$

#### 应力场的可行性

若给出了一个应力场$\sigma$，则可以使用以下几步验证其可行性。

1. 检查其是否是静力学许可的。
2. 计算形变张量：
$$\varepsilon = \frac{1+\nu}{E} \sigma - \frac{\nu}{E} \Tr(\sigma) \mathbf I$$
3. 检查形变张量是否满足相容性方程。
4. 对形变张量积分，得到位移场。
5. 验证位移场是否是运动学许可的。

## 变分方法

我们可以尝试使用类似理论力学中变分法的方法求解。

### 基本引理

首先介绍联系运动学许可的位移场和静力学许可的应力场之间的能量的一条引理。

设$\tilde \bu$为一运动学许可的位移场，$\hat \sigma$为一静力学许可的应力场，则其满足：
$$\int_V \hat \sigma : \tilde \bu = \int_V \rho \mathbf f \cdot \tilde \bu + \int_{S_F} \bT^D \cdot \tilde \bu + \int_{S_U} (\hat \sigma \vec n) \cdot \tilde\bu^D$$
{: .proposition}

利用局部平衡方程，我们有：
$$
\def\bf{\mathbf{f}}
0 = \int_V \tilde \bu \cdot (\nabla \cdot \hat \sigma + \rho \bf ) = \int_V \tilde \bu \cdot (\nabla \cdot \hat \sigma) + \int_V \tilde \bu \cdot (\rho \bf)
$$
对于含有散度的积分，我们有：
$$
\begin{aligned}
\int_V \tilde \bu \cdot (\nabla \cdot \hat \sigma) &= \int_V \nabla \cdot (\tilde \bu \cdot \hat \sigma) - \int_V \hat \sigma : (\nabla \tilde \bu) \\
&= \int_S \tilde \bu (\hat \sigma \cdot \vec n) - \int_V \hat \sigma : \tilde \varepsilon \\
&= \int_{S_F} \bT^D \cdot \tilde \bu + \int_{S_U} (\hat \sigma \cdot \vec n) \cdot \bu^D - \int_V \hat \sigma : \tilde \varepsilon
\end{aligned}
$$
第一个等式利用了梯度和散度积分的关系，可见[此页](../fluid-dynamics/2023-09-19-newtonian-viscous-fluid.markdown#流体的动能定理)；第二步利用了散度定理和$\hat \sigma$的对称性：
$$\hat \sigma : \nabla \tilde \bu = \frac{1}{2} (\hat \sigma : \mathbf H + \hat \sigma^\top : \mathbf H^\top) = \hat\sigma : \left[\frac{1}{2}(\mathbf H + \mathbf H^\top)\right] = \hat \sigma : \tilde \varepsilon$$
代入即可完成证明。
{: .proof}

这个引理的方程由三个部分组成：
$$\textcolor{red}{\int_V \hat \sigma : \tilde \bu} = \underbrace{\textcolor{blue}{\int_V \rho \mathbf f \cdot \tilde \bu + \int_{S_F} \bT^D \cdot \tilde \bu}}_{W^D_f (\bu)} + \underbrace{\textcolor{green}{\int_{S_U} (\hat \sigma \vec n) \cdot \tilde\bu^D}}_{W^D_u(\sigma)}$$
红色的部分是应变能的两倍，在边界条件给定的情况下，蓝色的部分只与位移场有关，而绿色的部分只与应力场有关。

### 最小势能原理

若能够将系统的可行位移场以解析的形式表示出来，则可使用最小势能原理进行求解。

正规问题中一个运动学可行的位移场$\tilde \bu$对应的总势能为应变能与外力做功之差：
$$
\begin{aligned}
\mathcal U(\tilde \bu) 
&= W(\tilde \bu) - W_f^D (\tilde \bu) \\ 
&= \frac{1}{2} \int_V \tilde \sigma : \tilde \varepsilon - (\int_V \rho \mathbf f \cdot \tilde \bu + \int_{S_F} \bT^D \cdot \tilde \bu)
\end{aligned}
$$
其中$\tilde \varepsilon$和$\tilde \sigma$是从位移$\tilde \bu$计算的应变和应力。
{: .definition}

在所有运动学可行的位移场中，解所对应的位移场的总势能最小：
$$\mathcal U(\bu) \le \mathcal U(\tilde \bu)$$
{: .theorem}

这里给出证明的思路。
对解$\bu, \sigma$，构造虚位移$\delta \bu$，满足：
$$\tilde \bu = \bu + \delta \bu$$
且满足约束，从而
$$\delta \bu = 0, \quad \forall P \in S_U$$
然后对$\sigma$和$\delta \bu$应用能量基本引理，化简可得：
$$\mathcal U(\tilde \bu) = \mathcal U(\bu) + \frac{1}{2} \int_V \delta \sigma : \delta \bu$$
注意到最后一项是应变能，因此必然大于等于零，从而证明该命题。
{: .proof}

如果我们可以将可行的位移场以解析的形式近似（通常是以多项式函数的形式近似），那么就可以直接使用微分的方法求解最小值，从而得出和解析解最接近的估计，这就是有限元分析的原理。

### 最大余能原理

若能够将系统的应力表示出来，则可使用最大余能原理。

正规问题中一个静力学可行的应力场$\hat \sigma$对应的总余能为外力做功与应变能之差：
$$
\begin{aligned}
\mathcal H(\hat \sigma) &= W_u^D(\hat \sigma) - W(\hat \sigma) \\
&= \int_{S_U} \hat \sigma \vec n \cdot \bu^D - \frac{1}{2} \int_V \hat \sigma : \hat \varepsilon
\end{aligned}
$$
其中$\hat \varepsilon$是从应力计算的应变。
{: .definition}

在所有静力学可行的应力中，解所对应的应力场的总余能最大：
$$\mathcal H(\sigma) \ge \mathcal H(\hat \sigma)$$
{: .theorem}

### 解的性质

对于正规问题的解$\bu, \sigma$，代入能量基本引理，可得：
$$\mathcal U(\bu) - \mathcal H(\sigma) = 0 \iff \mathcal U(\bu) = \mathcal H(\sigma)$$

从而我们有以下几个命题。

对正规问题的解，其应变能一定满足：
$$W = \frac{1}{2} \left(W_u^D (\sigma) + W_F^D(\bu) \right)$$
{: .proposition}

正规问题的任何可行位移场和应力场的总势能和总余能满足：
$$\mathcal H (\tilde \sigma) \le \mathcal H(\sigma) = \mathcal U(\bu) \le \mathcal U(\tilde \bu)$$
{: .proposition}

### 有限元方法简述
