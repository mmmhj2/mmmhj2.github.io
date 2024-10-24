---
title: "晶体结构"
categories: ["固体物理"]
---

本文主要研究晶体的结构问题。

## 晶体的空间结构

### 平移对称性

首先介绍晶胞的概念。
单胞（Unit cell）可分为两种：原胞（Primitive cell）和晶胞（Conventional cell）。
前者是单胞的最小单元，而后者是反应格点对称性的最小单元。
以晶体硅为例，其原胞是一个平行六面体，而晶胞是正方体。

晶胞总是具有平移对称性，而这种对称性由布拉伐点阵表述。

#### 布拉伐点阵

无限大晶体上所有等价的点构成的点阵称为*布拉伐点阵*(Bravais lattices)。
点阵可由一组基底表示，在三维情况下，有：
$$\mathbf r = n_1 \mathbf b_1 + n_2 \mathbf b_2 + n_3 \mathbf b_3, \quad n_1, n_2, n_3 \in \textcolor{red}{\mathbb Z}.$$
{: .definition}

代数上讲，格(lattice)是$\mathbb R^n$的离散子群，即任意两点之间存在最小距离的子群。

布拉伐点阵蕴涵了*对平移的不变性*，即对点阵中任何沿基底的平移，点阵在平移前后等价。

点阵中任何平行六面体（或四边形），均可构成一个晶胞。
而一组基底形成的平行六面体中不能存在其他等价点，因此该平行六面体就是晶体的一个*原胞*。
相对的，任何原胞都对应布拉伐格点中的一组基，而这些原胞的体积（面积）均相同。

平面上正六边形堆积形成的格点**不是**布拉伐点阵：
相邻两点不等价，且格点不具有平移不变性。
{: .exampl}

### 旋转对称性

部分晶体不仅具有平移对称性，还具有*旋转对称性*，即绕平面上某一点旋转前后，晶体的结构维持不变的性质。
这种性质在数学中由*点群*抽象。

#### 晶系

首先考虑平移与旋转对称性的兼容问题。

若布拉伐点阵还具有绕一轴转动$\varphi$角度的旋转不变性，则两相邻格点在转动后的距离一定是原距离的整数倍，且该倍数只有五种取值：
$$p = 1 - 2 \cos \varphi \implies p = -1, 0, 1, 2, 3$$
因此兼容的角度也只有五种取值。
{: .proposition}

由于两种不变性的兼容只有有限种可能，我们可以将所有晶体的结构分为7种*晶系*(Crystal system)，其中共有14中布拉伐格点。

整个晶体的结构，除了晶胞中的结构外，还包含晶胞之外的平移等变换产生的结构。
这种变换由*基元*(Motif)表示。
由于相同的兼容性考虑，所有可能的晶体结构只有230种，每一种均由一个空间群表示。

### 倒易空间

上述内容均为在位置空间中的考量。
在量子物理中，我们常常还需要在动量空间中进行研究，这一空间相对于位置空间称为*倒易空间*(Reciprocal space)。
晶格在倒空间中的表示称为*第一布里渊区*(Brillouin zone)。

正空间与倒空间中的基底满足正交关系：
$$\mathbf a_i^* \cdot \mathbf a_j = 2 \pi \delta_{i,j}$$
而同一点在倒空间的坐标$\mathbf G$与正空间坐标$\mathbf R$之间的关系为
$$\mathbf G \cdot \mathbf R = 2 n \pi, \quad n \in \mathbb Z$$
{: .proposition}

这些关系都是根据傅里叶变换构造出的。
$\mathbf a\_i^*$实际上在$\mathbb R^n$的对偶空间之中。

### 密勒指数

*密勒指数*(Miller index)是确定晶格中一个平面（称为晶面）的一组有序数组。

密勒指数$hkl$对应倒易空间中与矢量
$$\mathbf g_{hkl} = h\mathbf a_1^* + k\mathbf a_2^* + l\mathbf a_3^*, \, h,k,l \in \mathbb Z$$
垂直的一个平面。
一般约定$h,k,l$三个数应当互质，且不能同时为零。
{: .definition}

在正空间中，这相当于通过
$$
(\frac{1}{h}, 0, 0), \,
(0, \frac{1}{k}, 0), \,
(\frac{1}{l}, 0, 0),
$$
三个点的平面；
若某一的轴的指数为零，则说明指定的晶面平行于该轴。

## 电子衍射

现在考虑材料中电子在外电场入射情况下的衍射。

根据波动物理的理论，入射的电磁波可写为
$$
\mathbf E_i = \mathbf E_0 \cos (\mathbf k_i \cdot \mathbf r - \omega t) = \Re \mathbf E_0 \exp\big[-i(\mathbf k_i \cdot \mathbf r - \omega t)\big].
$$
从而，在入射电场中的电子的运动方程为
$$
m \frac{\mathrm d^2 \mathbf r}{\mathrm d t^2} = - q \mathbf E_0 \exp\big[-i(\mathbf k_i \cdot \mathbf r_0 - \omega t)\big],
$$
其中$\mathbf r\_0$是电子所在的位置，这里假设电子的运动较小，因此电场强度只与原位置有关。
因此，电流密度为
$$
\mathbf j = \rho \mathbf v = \rho \frac{\mathrm d \mathbf r}{\mathrm d t} = - \frac{\rho q}{im\omega} \mathbf E_0 \exp\big[-i(\mathbf k_i \cdot \mathbf r_0 - \omega t)\big].
$$

周期变化的电流亦会产生电磁辐射，我们可计算其磁矢势$\mathbf A$。
在距电流源较远的$\mathbf R$点，其值需考虑电磁波的传播速度，称为*推迟势*，定义为
$$
\mathbf A(\mathbf R, t) = \frac{\mu_0}{4\pi} \int_{\Omega_\text{电源}} \frac{\mathbf j (\mathbf r_0, t - \frac{|\mathbf R - \mathbf r|}{c})}{|\mathbf R - \mathbf r|} \,\mathrm d^3 r.
$$
带入可得
$$
\mathbf A(\mathbf R, t) = - \frac{q \mu_0 \mathbf E_0}{4\pi i m \omega} \int_\Omega \rho(\mathbf r) \frac{\exp [-i \mathbf k_i \cdot \mathbf r_0] \exp[i \omega (t - \frac{|\mathbf R - \mathbf r|}{c})]}{|\mathbf R - \mathbf r|} \,\mathrm d^3 r.
$$
然后利用远场条件
$$
\mathbf R \gg \mathbf r \implies \frac{1}{|\mathbf R - \mathbf r|} \approx \frac{1}{|\mathbf R|} = \frac{1}{R},
$$
从而
$$
\mathbf A(\mathbf R, t) = - \frac{q \mu_0 \mathbf E_0}{4\pi i m \omega} \frac{\exp [-i \mathbf k_i \cdot \mathbf r_0 + i\omega t]}{R} \int_\Omega \rho(\mathbf r) \exp[- i \omega \frac{|\mathbf R - \mathbf r|}{c}] \,\mathrm d^3 r.
$$
进一步注意到
$$
|\mathbf R - \mathbf r| = \sqrt{(\mathbf R - \mathbf r) \cdot (\mathbf R - \mathbf r)} \approx R \sqrt{1 - 2 \frac{\mathbf R \cdot\mathbf r}{R^2}} \approx R (1 - \frac{\mathbf r \cdot \mathbf R}{R^2}),
$$
令
$$
\mathbf k_d = \frac{\omega}{c} \frac{\mathbf R}{R}
$$
可得
$$
\mathbf A(\mathbf R, t) = - \frac{q \mu_0 \mathbf E_0}{4\pi i m \omega} \underbrace{\frac{\exp [-i k_d R + i\omega t]}{R}}_{\text{球面波}} \underbrace{\int_\Omega \rho(\mathbf r) \exp[- i (\mathbf k_i - \mathbf k_d) \cdot \mathbf r] \,\mathrm d^3 r}_{\text{傅里叶变换}}.
$$
后半部分的傅里叶变换将电场源（即电子）的信息从正空间变为倒空间。
我们知道电场的功率正比于磁矢势的平方，从而
$$
P(\mathbf R, t) \propto \left| \int_\Omega \rho(\mathbf r) \exp[- i (\mathbf k_i - \mathbf k_d) \cdot \mathbf r] \,\mathrm d^3 r \right|^2
$$

### 多电子散射

对材料中多个原子所带的多个的电子，电子密度可写为
$$
\rho(\mathbf r) = \sum_j \rho_{a} (\mathbf r - \mathbf r_j),
$$
其中$\rho\_a$是以某原子核为中心的电子密度，$\mathbf r\_j$是该原子核的坐标。
令$\mathbf r' = \mathbf r - \mathbf r\_j$，则积分可变为
$$
P(\mathbf R, t) \propto \left|\sum_j \exp[-i(\mathbf k_i - \mathbf k_d) \cdot \mathbf r_j] \int_\Omega \rho_a(\mathbf r') \exp[-i (\mathbf k_i - \mathbf k_d) \cdot \mathbf r'] \, \mathrm d^3 r \right|^2.
$$

材料对电场的衍射功率满足
$$
P(\mathbf R, t) \propto \left|\sum_j \exp[-i(\mathbf k_i - \mathbf k_d) \cdot \mathbf r_j] f_a(\mathbf Q) \right|^2,
$$
其中
$$
f_a(\mathbf Q) = \int_\Omega \rho_a(\mathbf r') \exp[-i \mathbf Q \cdot \mathbf r'] \,\mathrm d^3 r,
$$
称为*形状因子*，$Q = \mathbf k\_i - \mathbf k\_d$称为*散射向量*。
{: .proposition}

进一步通过平移向量$\mathbf R$将其放置在晶格之中。

晶体中的多个晶面能否产生衍射图案，可通过布拉格衍射条件判定。

若入射电磁场满足
$$\mathbf k_d - \mathbf k_i = \mathbf G \in \text{倒空间},$$
即
$$n \lambda = 2 d_{hkl} \sin \theta,$$
其中$d$表示两个晶面的距离，则能够产生衍射信号。
{: .proposition}

这可类比于光栅的衍射。
