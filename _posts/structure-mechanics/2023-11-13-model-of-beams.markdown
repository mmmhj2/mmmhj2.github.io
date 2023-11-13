---
title: "梁的模型"
categories: "结构力学"
tags: ["连续介质力学", "材料力学"]
---

本文中我们将解决梁的应力和形变的问题。

## 梁的内应力

本节中我们将借助圣维南原理计算梁的内力。
首先，按照定义，我们选择一个横截面$\Sigma(s\_0)$。
根据约定，梁的上半部分向下半部分的作用力是内应力，因此我们只研究下半部分的平衡。
从而，我们知道该平面的法向量（朝向外）正好与该点处切向量的方向相反：
$$\vec n = - \vec x_1$$
其应力矢量为：
$$\vec T(P, \vec n) = -\vec T(P, \vec x_1) = \begin{pmatrix}
-\sigma_{11} \\ -\sigma_{12} \\ -\sigma_{13} \\
\end{pmatrix}$$

因此该平面上受到的力主矢和主矩都可以使用积分计算出来
$$
\def\d{\mathrm d}
\vec R(s_0) = \int_\Sigma \vec T(P, \vec n) \d P, \quad
\vec M(s_0) = \int_\Sigma \vec{GP} \times \vec T(P, \vec n) \d P
$$
进行分解后可得主矢在各个方向上的分量为
$$N = - \int_\Sigma \sigma_{11} \d P,\ T_2 = - \int_\Sigma \sigma_{12} \d P,\ T_3 = - \int_\Sigma \sigma_{13} \d P$$
主矩为
$$
\begin{aligned}
M_t &= \int_\Sigma x_3 \sigma_{12} - x_2 \sigma_{13} \d P \\
M_{f2} &= - \int_\Sigma x_3 \sigma_{11} \d P \\
M_{f3} &= \int_\Sigma x_2 \sigma_{11} \d P
\end{aligned}
$$

利用圣维南定律进行计算时，需要使用到这些边界条件。

### 圣维南定律

圣维南定律，或圣维南假设，是一条关于梁的内应力的假设。

在非奇点处，梁所受的应力只与内力旋量（或称内力的主矢和主矩）有关。
{: .proposition}

此处奇点是指梁的性质不连续的点，如受到集中力（包括约束力）的点或横截面积突变的点。

#### 圣维南问题

利用圣维南定律，我们可以解决圣维南问题：

> 设一根由均为各向同性的线性弹性材料组成的、横截面维持不变的梁只在两端承受负载$[F]$和$[F\_0]$，且$[F] + [F\_0] = [0]$，试寻找一静力学许可的应力场$\sigma$，满足贝尔特拉米相容性方程。

由于梁只在一个方向上受应变（从而受应力），其应力张量的右下角为零，我们只需求解三个未知数即可：
$$
\sigma = \begin{pmatrix} \sigma_{11} & \sigma_{12} & \sigma_{13} \\
\sigma_{12} & 0 & 0 \\
\sigma_{13} & 0 & 0 
\end{pmatrix}
$$

梁的法向应力和切向应力（剪力）都可以利用该矩阵表示出来。
$$\sigma_n = \sigma_{11},\ \vec \tau = \sigma_{12} \vec x_2 + \sigma_{13} \vec x_3$$

圣维南问题的方程可写为：
$$
\begin{aligned}
\partial_j \sigma_{ij} &= 0 & \text{（局部平衡方程）} \\
\partial_{ll} \sigma_{ij} + \frac{1}{1+\nu} \partial_{kk} \sigma_{ij} &= 0 & \text{（相容性方程）} \\
\end{aligned}
$$

而边界条件包括上面提到的在两个底面处的外力边界条件，还有一条侧面的边界条件：
$$\sigma_{ij} n_{j} = 0 \quad \forall P \in \Sigma_\text{侧}$$

### 圣维南问题的解

我们不加证明地给出圣维南问题的解。

圣维南问题的解为：
$$
\begin{aligned}
\sigma_{11}(x_1, x_2, x_3) &= - \frac{N(x_1)}{S} + \frac{M_{f3}(x_1)}{J_2} x_2 - \frac{M_{f2}(x_1)}{J_3} x_3 \\
\sigma_{12}(x_1, x_2, x_3) &= - \frac{M_t}{I} \frac{\partial \Phi}{\partial x_3} \\
\sigma_{13}(x_1, x_2, x_3) &= \frac{M_t}{I} \frac{\partial \Phi}{\partial x_2}
\end{aligned}
$$
其中：
$$
J_i = \int_\Sigma x_i^2 \d S, \quad I = 2 \int_\Sigma \Phi \d S
$$
$\Phi$是一个满足以下条件的标量函数：
$$
\begin{aligned}
\nabla^2 \Phi(x_2, x_3) + 2 &= 0 & \forall P \in \Sigma \\
\Phi(x_2, x_3) &= 0 &\forall P \in \partial \Sigma
\end{aligned}
$$
$\partial \Sigma$表示$\Sigma$的边界。
{: .proposition}

不出意料地，尽管圣维南问题的约束条件众多，得出的结论能够很好地应用于许多并不满足该要求的梁上。

#### 圆柱形梁的例子

以半径为$R$的圆柱形梁为例，一个满足条件的$\Phi$函数为：
$$\Phi(r, \theta) = \frac{1}{2} (R^2 - r^2)$$
而应力为
$$\sigma_{1r} = 0,\quad \sigma_{1\theta} = -\frac{M_t}{I}r$$
其中
$$I = \frac{\pi R^4}{2}$$

又其剪力可写为
$$\vec \tau = \sigma_{1r} \vec e_r + \sigma_{1\theta} \vec e_\theta$$
从而圆上最大的剪力为
$$|\vec \tau| = |M_t| \times \frac{2}{\pi R^2}$$

### 剪力与特解

上文中给出的解需要求出一个$\Phi$函数才能给出，对一些特别的情况，我们可以更方便地给出解。

通过将一个横截面分为连续的两块，并其边界上应用局部平衡方程，可以得到以下关于剪力和应力的命题。

设梁受到沿$\vec x\_2$方向的剪力$\vec T\_2$，则可用一沿$\vec x\_3$轴平行的直线$\Gamma$将横截面分为两个部分$x\_2 \le a$和$x\_2 > 0$。在该平面上，由剪力$\vec T\_2$引起的应力为：
$$\sigma_{12}^{T_2} = \frac{T_2}{J_2} \frac{\mu_2(x_2)}{b(x_2)},\ \sigma_{13}^{T_2} = 0$$
其中$\mu\_2(x\_2)$表示$x\_2 \le 2$部分的面积，而$b(x\_2)$表示该横截面的宽度。
{: .proposition}

## 梁的本构方程

### 梁的形变旋量

通常来讲，构件的形变并不能满足旋量的要求，即
$$\vec u_B = \vec u_A + \vec \omega \times \vec{AB}$$

然而在梁的微小变形（微小位移）和微小旋转的假设前提下，我们的确可以使用旋量来表示梁的一个截面的位移：
$$[U_\Sigma] = \begin{pmatrix} \vec \omega \\ \vec u_G \end{pmatrix}_{G(\Sigma)}$$

因此，我们也可使用旋量来表示梁的形变：
$$
\def\d{\mathrm{d}}
[D_\Sigma] = \frac{\d [U_\Sigma]}{\d s} = \begin{pmatrix}
\vec \chi(s) = \dfrac{\d \vec \omega}{\d s}\\
\vec \varepsilon(s) = \dfrac{\d \vec u}{\d s} + \vec x_1 \times \vec \omega
\end{pmatrix}
$$

该旋量的几个分量分别表示梁的扭转、弯曲、伸长和剪切滑移：
$$
\begin{aligned}
\chi_1 &= \vec x_1 \cdot \vec \chi & \text{扭转} \\
\chi_{2,3} &= \vec x_{2,3} \cdot \vec \chi &\text{弯曲} \\
\varepsilon_1 &= \vec x_1 \cdot \vec \varepsilon & \text{伸长} \\
\varepsilon_{2,3} &= \vec x_{2,3} \cdot \vec \varepsilon &\text{滑移} \\
\end{aligned}
$$

根据梁的欧拉-伯努利假设，其滑移量应无穷小。

### 本构方程

设梁在$s$处截面所受的内力为$T(s)$，形变为$D(s)$，定义为：
$$D = \begin{bmatrix} \varepsilon_1 \\ \chi_2 \\ \chi_3 \\ \chi_1 \\ \varepsilon_2 \\ \varepsilon_3 \end{bmatrix}, \quad
T = \begin{bmatrix} N \\ M_2 \\ M_3 \\ M_t \\ T_2 \\ T_3 \end{bmatrix}$$
则其本构方程为：
$$D = -L T \iff \begin{bmatrix} \varepsilon_1 \\ \chi_2 \\ \chi_3 \\ \chi_1 \\ \varepsilon_2 \\ \varepsilon_3 \end{bmatrix} = \begin{bmatrix}
 \frac{1}{ES} & 0 & 0 & 0 & 0 & 0 \\
 0 & \frac{1}{EJ_3} & 0 & 0 & 0 & 0 \\
 0 & 0 & \frac{1}{EJ_2} & 0 & 0 & 0 \\
 0 & 0 & 0 & \frac{1}{GI} & 0 & 0 \\
 0 & 0 & 0 & 0 & \frac{1}{GS_2} & 0 \\
 0 & 0 & 0 & 0 & 0 & \frac{1}{GS_3} \\
\end{bmatrix} \cdot \begin{bmatrix} N \\ M_2 \\ M_3 \\ M_t \\ T_2 \\ T_3 \end{bmatrix}$$
其中$J\_i$定义为沿$i$轴的转动惯量：
$$J_i = \int x_i \d S$$
而$S\_i$定义为在该轴上对剪力的等效面积：
$$\frac{1}{S_j} = \frac{1}{J_j^2} \int \frac{\mu_j(x_j)^2}{b(x_j)^2} \d S$$
{: .proposition}

首先根据梁模型的假设，我们认为应力和应变之间存在一线性关系，因此一个$6 \times 6$的矩阵$L$存在。我们以四个$3 \times 3$的分块矩阵研究它：
$$L = \begin{pmatrix} A & B \\ D & C \end{pmatrix}$$
同时使用张量积和积分计算形变能的线密度，然后让两者对应。
用张量积求得的形变能线密度为：
$$w = - \frac{1}{2} [T(s)] \otimes [D(s)] = \frac{1}{2} T^\top LT$$
而由积分求得的线密度为：
$$w = \frac{1}{2} \int \sigma_{ij} \varepsilon_{ij} \d x_2 \d x_3 = \frac{1}{2E} \int \sigma^2_{11} \d S + \frac{1}{2G} \int (\sigma_{12}^2 + \sigma_{13}^2) \d S$$
然后可将应力按引起应力的原因不同拆分：
$$
\begin{aligned}
\sigma_{11} &= \sigma_{11}^N + \sigma_{11}^{M_3} + \sigma_{11}^{M_2} \\ 
\sigma_{1j} &= \sigma_{1j}^{M_t} + \sigma_{1j}^{T_2} + \sigma_{1j}^{T_3}
\end{aligned}
$$
显然应力和引起应力的内力具有线性关系。
又注意到$\sigma\_{11}^2$所含的项和$\sigma\_{12}^2 + \sigma\_{13}^2$所含的项相互独立，因此“柔度矩阵”$L$在非对角线上的矩阵块必为零，从而
$$L = \begin{pmatrix} A & \mathbf 0 \\ \mathbf 0 & C \end{pmatrix}$$
按照类似的方法将几个系数分别对应，即可求出$A,C$，此处不再赘述。
{: .proof}

### 求解系统

我们接下来就可以利用本构方程求解梁的形变了。
在此之前，我们首先需要利用约束力和方程的个数确定系统的静定性，我们只能求解静定和超静定的系统。

#### 求解静定系统

1. 利用平衡方程计算约束力；
2. 计算内力旋量；
3. 积分求解本构方程：
$$\frac{\d [U]}{\d s} = - L [T]$$
4. 确定积分常数：使用约束处的运动学边界条件和连续性方程
$$v(s^-) = v(s^+),\ u(s^-) = u(s^+),\ \omega(s^-) = \omega(s^+)$$

在求解内力和位移旋量时，我们并不需要使用内应力张量。

#### 求解超静定系统

对于超静定系统，我们需要首先求解其超静定度$h$。

1. 从约束力中选择$h$个作为未知量，将其他约束力用它们表示出来；
2. 计算内力旋量；
3. 积分求解本构方程；
4. 确定积分常数：松弛选择为未知量的$h$个约束，将约束处的位移场视为未知量，使用连续性方程和其余约束处的运动学边界条件；
