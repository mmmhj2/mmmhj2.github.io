---
title: "应力张量"
categories: "结构力学"
tags: ["连续介质力学"]
---

本文将主要介绍结构力学中的应力张量。

## 应力

本章中我们将给出应力的定义。

### 柯西应力

#### 柯西假设

首先考虑作用在某一系统上的外力，按照作用的方式不同，其可分为表面力和体积力，分别写为：
$$
\def\d{\mathrm{d}}
\begin{aligned}
\mathbf F_r &= \int_S \d \mathbf F_S + \int_V \d \mathbf F_V \\
&= \int_S \mathbf T \d S + \int_V \rho \mathbf f \d V
\end{aligned}
$$

而对于系统的内力，我们使用柯西假设进行研究：

对于介质$D$内部一点$P$，使用一个面$S$将介质经过$P$点分为两个部分，该点处的内力只与$P$点的位置和该点处表面的法向有关，即：
$$\mathbf T = \mathbf T(P, \vec n)$$
同时，如果反转该点处法向量的方向，那么受力的方向也反转：
$$\mathbf T(P, \vec n) = - \mathbf T (P, - \vec n)$$
{: .proposition}

这意味着任意选取该表面，只要法向保持不变，介质内部的某一点处的内力一定相等。

#### 柯西四面体

接下来我们希望给出任何一个面上内力的数学表述。
我们考虑构造一个如下图所示的四面体，同时考虑体积力和面积力，假设处于平衡状态($\mathbf a = 0$)，应用牛顿定律：

![](/assets/structmech/Cauchy_tetrahedron.svg "From https://commons.wikimedia.org/wiki/File:Cauchy_tetrahedron.svg licensed under Creative Commons Attribution-Share Alike 3.0 Unported")

$$
\begin{aligned}
0 &= \int_V \rho \mathbf f \d V + \int_{A_1, A_2, A_3, A} \mathbf T \mathrm d S
\end{aligned}
$$

考虑无穷小从四面体，此时可将该四面体视为一个点$P$，从而体积力忽略，而面积力变为：
$$- A_1 \mathbf T(P, \vec e_1) - A_2 \mathbf T(P, \vec e_2) - A_3 \mathbf T(P, \vec e_3) + A \mathbf T(P, \vec n) = 0$$
这意味着任何一个平面的表面力可由三个正交的（更一般地，线性独立的）法向量上的应力求得。

更进一步地，注意到：
$$A_1 = A (\vec n \cdot \vec e_1),\ A_2 = A (\vec n \cdot \vec e_2),\ A_3 = A (\vec n \cdot \vec e_3)$$
代入可得：
$$\mathbf T(P, \vec n) = n_1 \mathbf T(P, \vec e_1) + n_2 \mathbf T(P, \vec e_2) + n_3 \mathbf T(P, \vec e_3)$$
我们可将该式子写成矩阵的形式，从而得到柯西应力张量。

柯西应力张量是描述了某点处任意方向的应力的二阶张量，在某一坐标系$R$下，可写为：
$$\sigma(P) = 
\begin{pmatrix} \mathbf T(P, \vec e_1) & \mathbf T(P, \vec e_2) & \mathbf T(P, \vec e_3) \end{pmatrix} =
\begin{pmatrix}
\sigma_{11} & \sigma_{12} & \sigma_{13} \\
\sigma_{21} & \sigma_{22} & \sigma_{23} \\
\sigma_{31} & \sigma_{32} & \sigma_{33} \\
\end{pmatrix}
$$
从而任意方向的应力可有矩阵乘法求得：
$$\mathbf T(P, \vec n) = \sigma(P) \cdot \vec n = \sigma(P) \cdot \begin{pmatrix} n_1 \\ n_2 \\ n_3 \end{pmatrix}$$
{: .definition}

同理，对该四面体应用力矩平衡（角动量定理），可以发现柯西应力矩阵是一个对称矩阵。

任一点处的柯西应力矩阵是一个对称矩阵。
{: .proposition}

#### 法向应力与切向应力

通过点乘可以求出任意一点的法向应力，而通过将应力与法向应力相减即可得到切向应力。

$$\sigma_n = \vec n \cdot \mathbf T(P, \vec n),\ \sigma_t = \sigma - \sigma_n = \sigma - \vec n \cdot \mathbf T(P, \vec n)$$

如果选择的平面法向恰好与表示柯西应力所用的基底重合，那么不难发现法向应力正好位于柯西应力的对角线上。
从而切向应力就在上三角或下三角的位置。

$$
\begin{pmatrix}
\textcolor{red}{\sigma_{11}} & \textcolor{blue}{\sigma_{12}} & \textcolor{blue}{\sigma_{13}} \\
\textcolor{blue}{\sigma_{21}} & \textcolor{red}{\sigma_{22}} & \textcolor{blue}{\sigma_{23}} \\
\textcolor{blue}{\sigma_{31}} & \textcolor{blue}{\sigma_{32}} & \textcolor{red}{\sigma_{33}} \\
\end{pmatrix}
\quad
\textcolor{red}{\text{法向}}
\quad
\textcolor{blue}{\text{切向}}
$$

切向的应力也称为剪力，有时用$\tau$表示。
如果将切应力用剪力表示，则可直接将法向应力称为应力。

#### 旋转与变基

处于数学上的严谨性，我们必须说明，应力在其本质上是一个线性变换，而非一个矩阵，因此其蕴涵了对坐标系变换的不变性。
在物理和工程上，我们通常处理的只是其矩阵形式。

和任何线性变换一样，在不同的基底，即坐标系下，同一个应力的矩阵表示并不相同。
物理和工程上选择的基底总是正交标准基底，因此任何选择的过渡矩阵都是正交矩阵。
利用这一点，我们可以给出应力旋转的关系。

$$\sigma' = Q^\top \cdot \sigma \cdot Q$$
其中
$$Q = \begin{pmatrix} e_1' & e_2' & e_3' \end{pmatrix}$$
是从原基底到新基底的过渡矩阵。

### 局部平衡方程

考虑一个无穷小的、与坐标轴对齐的长方体，其长、宽和高分别为微元$\d x\_1, \d x\_2, \d x\_3$。
从而，其面积和体积微元为：
$$\d S_1 = \d x_2 \d x_3, \quad \d V = \d x_1 \d x_2 \d x_3$$

其体积力容易得到，考虑其面积力：
$$
\begin{aligned}
\mathbf F_S &= T \d S \\
&= \mathbf T(x_1 + \d x_1, \vec e_1) \d S_1 + \mathbf T(x_2 + \d x_2, \vec e_2) \d S_2 + \mathbf T(x_3 + \d x_3, \vec e_3) \d S_3 \\
&+ \mathbf T(x_1, -\vec e_1) \d S_1 + \mathbf T(x_2, -\vec e_2) \d S_2 + \mathbf T(x_3, -\vec e_3) \d S_3 \\
&= \sum_{i=1}^3 (\mathbf T(x_i + \d x_i, \vec e_i) - \mathbf T(x_i, \vec e_i)) \d S_i
\end{aligned}
$$
然后应用牛顿第二定律，可得：
$$\sum_{i=1}^3 (\mathbf T(x_i + \d x_i, \vec e_i) - \mathbf T(x_i, \vec e_i)) \d S_i + \rho (\mathbf f - \mathbf a) \d V = 0$$
两边同时除以$\d V$，从而得到：
$$\sum_{i=1}^3 \frac{\partial \mathbf T(P, \vec e_i)}{\partial x_i} + \rho (\mathbf f - \mathbf a) = 0$$
注意到第一个积分正是散度，从而得到局部平衡方程。

对任何介质中的应力张量，其和体积力的关系为：
$$\nabla \cdot \sigma + \rho (\mathbf f - \mathbf a) = 0$$
该方程称为局部平衡方程。
{: .proposition}

该偏微分方程具有边界条件：
$$\mathbf T(P, \vec n) = \mathbf T_\text{外}$$

### 主应力

应力是一个对称矩阵，因此必然可对角化，我们据此定义其主应力。

应力张量必然具有三个正交的特征向量。
当三个特征向量的长度均为一时，其对应的特征值按从大到小的顺序分别称为第一、第二和第三主应力。
这三个特征向量所在的方向称为主应力方向。
{: .definition}

在主应力方向确定的坐标系下，应力可写为：
$$\sigma_P = \begin{pmatrix} \sigma_1 & 0 & 0 \\ 0 & \sigma_2 & 0 \\ 0 & 0 & \sigma_3 \end{pmatrix}$$

对该三阶矩阵，其特征多项式可以利用相似不变量求得：
$$\det (\sigma - \sigma_n \mathbf I) = -\sigma_n^3 + I_1 \sigma_n^2 - I_2 \sigma_n + I_3 = 0$$
其中
$$I_1 = \mathrm{Tr}(\sigma),\ I_2 = \sigma_1\sigma_2+\sigma_2\sigma_3+\sigma_3\sigma_1,\ I_3 = \det(\sigma)$$

#### 应力分解

利用矩阵的迹，我们可以将应力分解为一个数量矩阵和另一个矩阵之和。

$$\sigma = \frac{1}{3} \mathrm{Tr}(\sigma) \mathbf I + \left(\sigma - \frac{1}{3} \mathrm{Tr}(\sigma) \mathbf I \right) = \sigma_s + \sigma_d$$
其中$\sigma\_s$称为球形部分、$\sigma\_d$称为偏离部分，也记作$s$。
{: .definition}

第一个部分可以视为施加在各个方向上均匀的压力，就像在水中受到的水压一样。

#### 莫尔圆

在主应力方向坐标系下，考虑一个应力，将其分解为应力和剪力：
$$\mathbf T^2(P, \vec n) = (\sigma \cdot \vec n)^\top \cdot (\sigma \cdot \vec n)$$
展开，注意到在主应力方向的坐标系下，应力矩阵是一个数量矩阵，从而可得：
$$\sigma^2 + \tau^2 = \sigma_1^2 n_1^2 + \sigma_2^2 n_2^2 + \sigma_3^2 n_3^2$$
其中$\sigma\_i$是主应力。

将应力向法向量上投影，得到：
$$\sigma = \sigma_1 n_1^2 + \sigma_2 n_2^2 + \sigma_3 n_3^2$$

又注意到
$$n_1^2 + n_2^2 + n_3^2 = 1$$
从而可以求解出$n\_i^2$：

$$
\begin{aligned}
n_1^2 = \frac{\tau^2 + (\sigma - \sigma_2)(\sigma - \sigma_3)}{(\sigma_1 - \sigma_2)(\sigma_1 - \sigma_3)} \ge 0 \\
n_2^2 = \frac{\tau^2 + (\sigma - \sigma_3)(\sigma - \sigma_1)}{(\sigma_2 - \sigma_3)(\sigma_2 - \sigma_1)} \ge 0 \\
n_3^2 = \frac{\tau^2 + (\sigma - \sigma_1)(\sigma - \sigma_2)}{(\sigma_3 - \sigma_1)(\sigma_3 - \sigma_2)} \ge 0
\end{aligned}
$$
注意到
$$\sigma_1 > \sigma_2 > \sigma_3$$
移项并重新排序，可得：
$$
\begin{aligned}
\tau^2 + [\sigma - \frac{1}{2} (\sigma_2 + \sigma_3)]^2 \ge (\frac{\sigma_2 - \sigma_3}{2})^2 \\
\tau^2 + [\sigma - \frac{1}{2} (\sigma_1 + \sigma_2)]^2 \ge (\frac{\sigma_1 - \sigma_2}{2})^2 \\
\tau^2 + [\sigma - \frac{1}{2} (\sigma_1 + \sigma_3)]^2 \le (\frac{\sigma_1 - \sigma_3}{2})^2 \\
\end{aligned}
$$

如果以$\sigma$为横轴、$\tau$为纵轴，则这三个不等式给出了三个圆形区域，如下图所示：
![](/assets/structmech/Mohr_Circle.svg)
这个图形称为莫尔圆（Mohr's circle）。
如果知道主应力，则可利用莫尔圆判定应力和剪力的取值范围。

#### 二维莫尔圆

在二维条件下，柯西应力在应力主轴坐标系下可写为：
$$\sigma = \mathrm{diag}(\sigma_1, \sigma_2)$$

假设某一平面的法向量与第一主应力方向的夹角为$\theta$，则该平面上的法向应力和切向应力可写为：
$$\sigma_n = \frac{\sigma_1+\sigma_2}{2} + \frac{\sigma_1 - \sigma_2}{2} \cos (-2\theta), \quad \tau = \frac{\sigma_1 - \sigma_2}{2} \sin (-2\theta)$$

这也给出了一个圆的参数方程。

如果已知主应力和应力主轴，则可绘制莫尔圆，利用其求解任意方向的应力和剪力。
相对地，可以通过试验测定任意两个方向的应力和剪力，然后绘制莫尔圆，从而得出主应力。
