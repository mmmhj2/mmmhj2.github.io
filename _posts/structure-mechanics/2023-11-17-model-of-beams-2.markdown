---
title: "求解梁问题"
categories: "结构力学"
tags: ["连续介质力学", "材料力学"]
---

本文将提出求解梁的模型的两种方法。

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

对二维系统，只有
$$\chi_3,\quad \varepsilon_1 = \varepsilon_N, \quad \varepsilon_2 = \varepsilon_T$$
三个量具有物理意义。

### 本构方程

设梁在$s$处截面所受的内力为$T(s)$，形变为$D(s)$，定义为：
$$D = \begin{bmatrix} \varepsilon_1 \\ \chi_2 \\ \chi_3 \\ \chi_1 \\ \varepsilon_2 \\ \varepsilon_3 \end{bmatrix}, \quad
T = \begin{bmatrix} N \\ M_{f2} \\ M_{f2} \\ M_t \\ T_2 \\ T_3 \end{bmatrix}$$
则其本构方程为：
$$
\begin{multline}
D = -L T \\ \iff
\begin{bmatrix} \varepsilon_1 \\ \chi_2 \\ \chi_3 \\ \chi_1 \\ \varepsilon_2 \\ \varepsilon_3 \end{bmatrix} = - \begin{bmatrix}
 \frac{1}{ES} & 0 & 0 & 0 & 0 & 0 \\
 0 & \frac{1}{EJ_3} & 0 & 0 & 0 & 0 \\
 0 & 0 & \frac{1}{EJ_2} & 0 & 0 & 0 \\
 0 & 0 & 0 & \frac{1}{GI} & 0 & 0 \\
 0 & 0 & 0 & 0 & \frac{1}{GS_2} & 0 \\
 0 & 0 & 0 & 0 & 0 & \frac{1}{GS_3} \\
\end{bmatrix} \cdot \begin{bmatrix} N \\ M_{f2} \\ M_{f2} \\ M_t \\ T_2 \\ T_3 \end{bmatrix}
\end{multline}
$$
其中$J\_i$定义为沿$i$轴的转动惯量（惯性矩）[^mmi]：
$$J_i = \int x_i^2 \d S$$
而$S\_i$定义为在该轴上对剪力的等效面积：
$$\frac{1}{S_j} = \frac{1}{J_j^2} \int \frac{\mu_j(x_j)^2}{b(x_j)^2} \d S$$
{: .proposition}

[^mmi]: 正式的名称是*面积二次轴矩*（second axial moment of area），是横截面抵抗弯曲变形的能力的度量，略不同于刚体的转动惯量。

首先根据梁模型的假设，我们认为应力和应变之间存在一线性关系，因此一个$6 \times 6$的矩阵$L$存在。我们以四个$3 \times 3$的分块矩阵研究它：
$$L = \begin{pmatrix} A & B \\ D & C \end{pmatrix}$$
同时使用张量积和积分计算应变能的线密度，然后让两者对应。
用张量积求得的应变能线密度为：
$$w = - \frac{1}{2} [T(s)] \otimes [D(s)] = \frac{1}{2} T^\top LT$$
而由积分求得的线密度为：
$$w = \frac{1}{2} \int \sigma_{ij} \varepsilon_{ij} \d x_2 \d x_3 = \frac{1}{2E} \int \sigma^2_{11} \d S + \frac{1}{2G} \int (\sigma_{12}^2 + \sigma_{13}^2) \d S$$
然后可将应力按引起应力的原因不同拆分：
$$
\begin{aligned}
\sigma_{11} &= \sigma_{11}^N + \sigma_{11}^{M_{f3}} + \sigma_{11}^{M_{f2}} \\ 
\sigma_{1j} &= \sigma_{1j}^{M_t} + \sigma_{1j}^{T_2} + \sigma_{1j}^{T_3}
\end{aligned}
$$
显然应力和引起应力的内力具有线性关系。
又注意到$\sigma\_{11}^2$所含的项和$\sigma\_{12}^2 + \sigma\_{13}^2$所含的项相互独立，因此“柔度矩阵”$L$在非对角线上的矩阵块必为零，从而
$$L = \begin{pmatrix} A & \mathbf 0 \\ \mathbf 0 & C \end{pmatrix}$$
按照类似的方法将几个系数分别对应，即可求出$A,C$，此处不再赘述。
{: .proof}

#### 应变能密度

利用上文的公式，我们给出应变能的表达式。

应变能线密度利用内力的表达式为：
$$w = \frac{1}{2} \left( \frac{N^2}{ES} + \textcolor{blue}{ \frac{M_{f3}^2}{EJ_2} + \frac{M_{f2}^2}{EJ_3} + \frac{M_t^2}{GI}} + \textcolor{red}{\frac{T_2^2}{GS_2} + \frac{T_3^2}{GS_3}} \right)$$
利用形变的表达式为：
$$w = \frac{1}{2} \left( ES \varepsilon_1^2 + \textcolor{blue}{EJ_2 \chi_3^2 + EJ_3 \chi_2^2+ GI \chi_1^2} + \textcolor{red}{GS_2 \varepsilon_2^2 + GS_3 \varepsilon_3^2}\right)$$
其中$E$为杨氏模量；
$$G = \frac{E}{2(1+\nu)}$$
为剪切模量；$S$是横截面积；
$$J_i = \int_\Sigma x_i^2 \d S$$
为绕$i$轴的惯性主矩；
$$I = 2 \int_\Sigma \Phi \d x_2 \d x_3$$
为扭转惯性矩；
$$\frac{1}{S_j} = \frac{1}{J_j^2} \int \frac{\mu_j(x_j)^2}{b(x_j)^2} \d S$$
为等效面积。
{: .proposition}

其中标<span style="color: blue;">蓝色</span>的项的数量级往往大于其他项。

二维情况下，方程简化为
$$w = \frac{1}{2} \left( \frac{N^2}{ES} +  \frac{M_{f3}^2}{EJ_2} + \textcolor{red}{\frac{T_2^2}{GS_2}} \right)$$
和
$$w = \frac{1}{2} \left( ES \varepsilon_1^2 + EJ_2 \chi_3^2 + \textcolor{red}{GS_2 \varepsilon_2^2}\right)$$
在满足欧拉-伯努利假设的情况下，标<span style="color: red;">红色</span>的项为零，因为滑移量无穷小。

### 求解系统

我们接下来就可以利用本构方程求解梁的形变了。
在此之前，我们首先需要利用约束力和方程的个数确定系统的静定性，我们只能求解静定和超静定的系统。

#### 求解静定系统

1. 利用平衡方程计算约束力；
2. 计算内力旋量；
3. 积分求解本构方程：
$$\frac{\d [U]}{\d s} = - L [T]$$
4. 确定积分常数：使用约束处的运动学边界条件和连续性方程，根据约束的不同，连续性方程可能是以下三个的任意组合
$$v(s^-) = v(s^+),\ u(s^-) = u(s^+),\ \omega(s^-) = \omega(s^+)$$

在求解内力和位移旋量时，我们并不需要使用内应力张量。

#### 求解超静定系统

对于超静定系统，我们需要首先求解其超静定度$h$。

1. 从约束力中选择$h$个作为未知量，将其他约束力用它们表示出来；
2. 计算内力旋量；
3. 积分求解本构方程；
4. 确定积分常数：松弛选择为未知量的$h$个约束，将约束处的位移场视为未知量，使用连续性方程和其余约束处的运动学边界条件；

## 能量方法

使用本构方程足以求解梁的形变与受力，然而我们可以利用应变能给出更加简单的求解方法。

### 解的可行性

和连续介质力学一样，我们也能给出梁问题的“可行解”的定义。

若位移场$[U]$在本构关系下对应的内力能够满足内力边界条件，则称该位移场是运动学许可的，记为$[\tilde U]$；
若内力场$[T]$在本构关系下对应的位移能够满足约束处的位移边界条件，则称该内力场是静力学许可的，记为$[\hat T]$。
{: .definition}

和在连续介质力学中一样，我们考虑两个重要的功：

在运动学许可的位移$[\tilde U]$下，除约束力外的外力（即载荷）做的功记为：
$$W_f^d([\tilde U]) = \int ([f] \otimes [\tilde U])\d S + \sum [F_i] \otimes [\tilde U(s_i)]$$
其中$[f]$表示均匀分布的载荷，$[F]$表示点载荷。
<br/>
在静力学许可的内力场$[\hat T]$下，约束力做的功记为：
$$W_u^d([\hat T]) = \sum [\hat R_A] \otimes [U(A)]$$
$[\hat R\_A]$是约束处的反作用力，即约束力。
{: .definition}

考虑到约束大多要求位移为零，约束力做的功通常为零。

### 势能和余能定理

和在连续介质力学中一样，我们也可以应用最小势能原理和最大余能原理。

梁的势能定义为
$$\mathcal U([\tilde U]) = \underbrace{\frac{1}{2} \int (L^{-1}[\tilde D])\otimes [\tilde U] \d s}_{W([\tilde U])} - W_f^d([\tilde U])$$
余能定义为
$$\mathcal H([\hat T]) = W_u^d([\hat T]) - \underbrace{\frac{1}{2} \int [\hat T] \otimes (L [\hat T]) \d S}_{W[\hat T]}$$
其中$W$表示总应变能。
所有运动学许可的位移场中，解对应的场势能最小；
所有静力学许可的内力场中，解对应的场余能最大。
{: .theorem}

### 几个额外的定理

#### 梅纳布雷亚定理

梅纳布雷亚给出了计算超静定系统的解的方法。

<small>(梅纳布雷亚定理，Menabrea's theorem)</small>
在超静定度为$h$的系统中，利用静力学平衡方程可将内力场$[\hat T]$表示为$h$个未知外力的函数。
这些外力的值总是使得总应变能$W([\hat T])$最小。
{: .proposition}

静定系统有且仅有一个静力学许可的内力场，而超静定度为$h$的超静定问题的静力学许可的内力场的集合是$h$个线性独立的场张成的$h$维仿射空间。
这与连续介质力学中不同，其中所有场的集合都是无穷维的空间。
因此在连续介质力学中，能量方法通常只能用来计算近似解，而在梁问题中，其总是可以计算精确的解。

#### 互易性定理

互易性定理允许我们用一个人为构造的简单的问题的解来求解更加复杂的问题。

<small>(麦克斯韦-贝蒂互易定理，Maxwell-Betti reciprocity theorem)</small>
设两个完全相同的系统上施加了不同的负载，从而得到两个不同的位移场解$[U\_1], [U\_2]$，则第一个系统的负载在第二个位移场上做的功等于第二个系统的负载在第一个位移场上做的功。
{: .proposition}

#### 卡氏定律

卡斯提也努定理允许我们容易地计算位移。

<small>(卡斯提也努定理，Castigliano's theorem)</small>
应变能对一力（或力偶）的偏导，等于该处在力方向上的位移（或力偶方向上的转动）。
{: .proposition}
