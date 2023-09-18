---
title: "牛顿流体"
categories: ["流体力学"]
---

## 黏性流体

上一章中，我们已经知道，流体的应力张量可写为：
$$
\def\d{\mathrm{d}}
\def\D{\mathrm{D}}
\def\pDt#1{\frac{\D #1}{\D t}}
\def\pd#1#2{\frac{\partial #1}{\partial #2}}
\sigma = - p \mathbf I + \tau
$$
将该结果代入动量方程：
$$\rho \pDt{\vec U} = \nabla \cdot \sigma + \rho \vec f = - \nabla p + \nabla \cdot \tau + \rho \vec f$$

$\tau$一项与流体的黏性有关，本节我们将主要研究它的性质。

### 牛顿流体

牛顿流体是指满足**牛顿定律**的流体，即其应力张量的黏性部分$\tau$满足：
$$\tau = (\lambda \nabla \cdot \vec U) \mathbf I+ 2 \mu D$$
其中$\lambda,\mu$是两个常数，称为*第二黏度*和*动力学黏度*，只与流体有关。
$D$是一个对称的三阶矩阵，定义为：
$$D_{ij} = \frac{1}{2} \left( \partial_j U_i + \partial_i U_j \right)$$
称为*变形率张量*，和流体的剪切密切相关。
{: .definition}

常见的流体如空气和水都是牛顿流体。

若流体是不可压缩的，则黏性张量是变形率张量的线性函数，此时，若流体不受变形，则其应力张量变成一个简单的数量矩阵。

在后文中，若非特别提及，则默认流体为牛顿流体。

### 流体运动的分解

接下来我们考虑一下变形率张量的物理学意义。

将速度进行多项式展开，可得：
$$U_i(\vec x) = U_i(\vec x_p) + \sum_{j=1}^3 \pd{U_i(\vec x_p)}{x_j} (x_j - x_{j,p}) + o(\Vert \vec x - \vec x_p \Vert)$$

考虑矩阵$J\_{ij} = \pd{U\_i}{x\_j}$，
任何矩阵总可以写为一个对称矩阵和反对称矩阵之和：
$$
\begin{aligned}
J_{ij} &= D_{ij} + \omega_{ij} \\ \iff
\pd{U_i}{x_j} &= \frac{1}{2} (\pd{U_i}{x_j} + \pd{U_j}{x_i}) + \frac{1}{2} (\pd{U_i}{x_j} - \pd{U_j}{x_i})
\end{aligned}
$$
从而，在忽略高阶无穷小的情况下，流体的速度可写为：
$$\vec U(\vec x) = \vec U (\vec x_p) + D(\vec x_p) \cdot (\vec x - \vec x_p) + \omega (\vec x_p) \cdot (\vec x - \vec x_p)$$

现在，我们令$\vec \Omega = \frac{1}{2} \nabla \times \vec U$
不难发现：
$$
\Omega_1 = \frac{1}{2} (\pd{U_3}{x_2} - \pd{U_2}{x_3}) = \omega_{32} = - \omega_{23}
$$
其他几个分量同理，因此$\omega$可写为：
$$
\omega = \begin{pmatrix}
0 & -\Omega_3 & \Omega_2 \\
\Omega_3 & 0 & - \Omega_1 \\ -
\Omega_2 & \Omega_1 & 0 \\
\end{pmatrix}
$$
从而可将矩阵乘法转化为叉乘，可得：
$$\vec U(\vec x) = \underbrace{\vec U (\vec x_p)}_\text{平移} + \underbrace{D(\vec x_p) \cdot (\vec x - \vec x_p)}_\text{变形} + \underbrace{\Omega (\vec x_p) \times (\vec x - \vec x_p)}_\text{转动}$$

因此，流体的平移和转动均不产生变形。

### 总结

根据本节的内容，我们很容易给出流体的三个方程：
$$
\left\{
    \begin{aligned}
        & \frac{\D \rho}{\D t} + \rho \nabla \cdot \vec U = 0 \\
        & \rho \frac{\D \vec U}{\D t} = - \nabla p + \nabla \cdot \tau + \rho \vec f \\
        & \tau = \lambda (\nabla \cdot \vec U) \mathbf I + 2 \mu D
    \end{aligned}
\right.
$$
拆成分量的形式，该方程中的未知量依然比线性无关的方程多，因此是欠定的。
我们要么添加新的方程，要么添加假设并删去一些变量。
前者需要涉及复杂的能量方程，因此我们先考虑后者。

## 能量守恒

## 不可压缩均匀流体的纳维尔-斯托克斯方程

我们假设该流体是不可压缩且均匀的，因此有：
$$\nabla \cdot \vec U = 0, \rho = \text{常数}, \mu = \text{常数}$$

根据以上假设，我们马上可得出下列结论：
- 质量方程左侧等于零，直接消去；
- $\tau = 2 \mu D$，这使得我们可以计算其散度：
$$(\nabla \cdot \tau)_i = \partial_j \tau_{ij} = \mu \partial_{jj} U_i \iff \nabla \cdot \tau = \Delta \vec U$$

从而得到以下定理：

不可压缩均匀流体满足以下方程组：
$$
\left\{
    \begin{aligned}
    &\pDt{\vec U} = - \frac{1}{\rho} \nabla \rho + \frac{\mu}{\rho} \Delta \vec U + \vec f \\
    &\nabla \cdot \vec U = 0
    \end{aligned}
\right.
$$
这个方程组称为不可压缩均匀流体的纳维尔-斯托克斯方程，简称**纳维尔-斯托克斯方程**或N-S方程。
通常使用$\nu$表示$\frac{\mu}{\rho}$，称为*运动学黏性*。
{: .theorem}

N-S方程的项分别具有以下名称：
- $\pDt{\vec U}$：加速度项或惯性项。
    - $\pd{\vec U}{t}$：非定常项；
    - $\vec U \cdot \nabla \vec U$：非线性项；
- $- \frac{1}{\rho} \nabla p$：压力梯度项。
- $\nu \Delta \vec U$：黏性项。
- $\vec f$：外力项。

### 有势力

当外力$\vec f$是有势力时，其可以写成势场的负梯度：
$$\vec f = - \nabla \Psi$$
此时，令$p_\* = p + \rho \Psi$，即可用压力梯度项完全替代外力项。

### 边界条件

对于有黏性的流体，流体和固体的边界以及流体之间的边界必须满足一定的边界条件，否则速度的偏导趋于无穷，将导致黏性张量趋于无穷。

这要求在流固边界上，$\vec U$和边界速度相等。
这一条件称为*无滑移条件*。

在流体边界上，满足三个条件：
1. $$\vec U_A = \vec U_B$$
2. $$\sigma_A \cdot \vec n = \sigma_B \cdot \vec n$$
3. $$\vec W \cdot \vec n = \vec U \cdot \vec n$$

## 无黏性流动

当流体的黏性可忽略时，其应力张量可写为：
$$\sigma = - p \mathbf I$$
从而有以下命题：

在无黏性、不可压缩、均匀的前提下，N-S方程可改写为：
$$
\left\{
    \begin{aligned}
    &\pDt{\vec U} = - \frac{1}{\rho} \nabla \rho + \vec f \\
    &\nabla \cdot \vec U = 0
    \end{aligned}
\right.
$$
该方程组称为*欧拉方程*。
{: .proposition}

对于无黏性流动的情况，由于黏性张量的约束不再存在，边界条件也发生了变化。

在流固界面上，现在只要求流体的速度法向投影与固体速度法向投影相同，称为有滑移条件。
在流体界面上，也只要求两者在法向上的投影相同。

### 伯努利定律

现在，在无黏性、不可压缩的前提上加上定常和主动力保守的假设，我们有：

- 无黏性：$$\sigma = - p \mathbf I$$
- 定常：$$\pd{}{t} = 0$$
- 不可压缩：$$\nabla \cdot \vec U = 0$$
- 主动力保守：$$\vec f = - \nabla \Psi$$

在最初的动量等式上两边同时乘$\vec U$，从而得到动能的方程：
$$
\begin{aligned}
\rho \vec U \pDt{\vec U} &= \vec U \cdot (\nabla \cdot \sigma + \rho \vec f) \\
\implies  0 &= \vec U \cdot \nabla \left( p + \frac{1}{2} \rho U^2 + \rho \Psi \right)
\end{aligned}
$$
从而我们得到以下定理：

场$\mathcal H$：
$$\mathcal{H} = p + \frac{1}{2} \rho U^2 + \rho \Psi $$
的梯度正交于流线，即该场在一条流线上始终保持不变。
{: .theorem}
