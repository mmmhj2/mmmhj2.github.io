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

我们又知道在受点负载的位置，内力应当等于外力，因此可以得到偏微分方程的边界条件。
利用圣维南定律进行计算时，需要使用到这些边界条件。

### 圣维南定律

圣维南定律，或圣维南假设，是一条关于梁的内应力的假设。

在非奇点处，梁所受的应力只与内力旋量（或称内力的主矢和主矩）有关。
{: .proposition}

此处奇点是指梁的性质不连续的点，如受到集中力（包括约束力）的点或横截面积突变的点。

我们能够利用这条定律来求解应力，只需要先利用外力解出内力，然后再用内力解出应力即可。
已知外力求解应力的问题称为圣维南问题。

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
$$\sigma_N = \sigma_{11},\ \vec \tau = \sigma_{12} \vec x_2 + \sigma_{13} \vec x_3$$

圣维南问题的方程可写为：
$$
\begin{aligned}
\partial_j \sigma_{ij} &= 0 & \text{（局部平衡方程）} \\
\partial_{ll} \sigma_{ij} + \frac{1}{1+\nu} \partial_{ij} \sigma_{kk} &= 0 & \text{（相容性方程）} \\
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
$\partial \Sigma$表示$\Sigma$的边界。
$\Phi$是一个满足以下条件的标量函数，称为应力函数（Stress function）：
$$
\begin{aligned}
\nabla^2 \Phi(x_2, x_3) + 2 &= 0 & \forall P \in \Sigma \\
\Phi(x_2, x_3) &= 0 &\forall P \in \partial \Sigma
\end{aligned}
$$
这个函数通常使用数值方法求出。
{: .proposition}

不出意料地，尽管圣维南问题的约束条件众多，得出的结论能够很好地应用于许多并不满足该要求的梁上。

以半径为$R$的圆柱形梁为例，一个满足条件的$\Phi$函数为：
$$\Phi(r, \theta) = \frac{1}{2} (R^2 - r^2)$$
而应力为
$$\sigma_{1r} = 0,\quad \sigma_{1\theta} = -\frac{M_t}{I}r$$
其中
$$I = \frac{\pi R^4}{2}$$<br/>
又其剪力可写为
$$\vec \tau = \sigma_{1r} \vec e_r + \sigma_{1\theta} \vec e_\theta$$
从而圆上最大的剪力为
$$|\vec \tau| = |M_t| \times \frac{2}{\pi R^2}$$
{: .exampl}

对于圆环形梁，相似的步骤给出：
$$I = - \frac{\pi}{2}\left( R_\text{外}^2 - R_\text{内}^2 \right),\ |\vec \tau|_\text{max} = |M_t| \times \frac{2R_\text{外}}{\pi \left( R_\text{外}^4 - R_\text{内}^4 \right)}$$
{: .exampl}

### 剪力与特解

上文中给出的解需要求出一个$\Phi$函数才能给出，对一些特别的情况，我们可以更方便地给出解。

通过将一个横截面分为连续的两块，并其边界上应用局部平衡方程，可以得到以下关于剪力和应力的命题。

设梁受到沿$\vec x\_2$方向的剪力$\vec T\_2$，则可用一沿$\vec x\_3$轴平行的直线$\Gamma$将横截面分为两个部分$x\_2 \le a$和$x\_2 > 0$。在该平面上，由剪力$\vec T\_2$引起的应力为：
$$\sigma_{12}^{T_2} = \frac{T_2}{J_2} \frac{\mu_2(x_2)}{b(x_2)},\ \sigma_{13}^{T_2} = 0$$
其中$\mu\_2(x\_2)$表示$x\_2 \le 2$部分的面积，而$b(x\_2)$表示该横截面的宽度。
{: .proposition}

设矩形梁对齐坐标轴放置，长为$H$，沿$\vec x\_2$轴；宽为$b$。
其受到沿$\vec x\_2$方向的剪切内力$\vec T\_2$，试计算其应力的剪切部分。 <br/>
根据上文的命题有
$$\sigma_{12}^{T_2} = \frac{T_2}{J_2} \frac{\mu_2(x_2)}{b(x_2)},\ \sigma_{13}^{T_2} = 0$$
依次计算可得：
$$
\begin{aligned}
b(x_2) &= b \\
\mu_2(x_2) &= \int_{-\frac{H}{2}}^{x_2} x b \d x = \frac{b}{2} \left( x_2^2 - \frac{H^2}{4} \right) \\
J_2 &= \int_{-\frac{b}{2}}^{\frac{b}{2}}\int_{-\frac{H}{2}}^{\frac{H}{2}} x_2^2 \d x \d y = \frac{bH^3}{12}
\end{aligned}
$$
从而
$$\sigma_{12}^{T_2} = \frac{6 T_2}{b H} \left[ \left( \frac{x_2}{H}\right)^2 - \frac{1}{4} \right]$$
最大剪应力自然为
$$|\tau|_\text{max} = \frac{3T_2}{2bH}$$
{: .exampl}

### 梁的断裂判据

注意到梁的应力张量具有非常特殊的形式，我们可以简化梁的断裂判据。

（冯·米塞斯判据）
延性材料构成的梁的冯·米塞斯判据为：
$$\sigma_\text{VM} = \sqrt{\frac{3}{2} s_{ij} s_{ij}} = \sqrt{\sigma_{11}^2 + 3 (\sigma_{12}^2 + \sigma_{13}^2)} = \sqrt{\sigma_N^2 + 3 \tau^2} \le \sigma_e$$
{: .proposition}

（朗肯判据）
脆性材料构成的梁的朗肯判据为：
$$\sigma_\text{I} = \frac{1}{2}\left( \sigma_{11} + \sqrt{\sigma_{11}^2 + 4 \tau^2} \right) \le \sigma_{r}$$
{: .proposition}

