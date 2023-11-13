---
title: "负载下构件的模型"
categories: "结构力学"
tags: ["连续介质力学", "材料力学"]
---

本文将以梁为例子介绍结构力学中常见的模型。

## 准备工作

### 自然坐标系

我们需要回忆一下关于自然坐标系的知识。

设$\vec R(s)$表示一条曲线，$s$为弧长，则对其上任意一点$P(s)$，以下三个向量是正交的：
$$
\def\d{\mathrm{d}}
\vec x_1 = \frac{\d \vec R}{\d s}, \ 
\vec x_2 = \frac{\d \vec x_1}{\d s}, \
\vec x_3 = \vec x_1 \times \vec x_2
$$
向量$\vec x\_1$称为切向量，其一定为单位向量；向量$\vec x\_2$的方向向量称为法向量，其模长称为曲率；向量$\vec x\_3$的方向向量称为副法向量。
这三个向量的方向向量组成的正交标准坐标系称为自然坐标系（或Frenet坐标系、曲线坐标系）。
{: .definition}

### 旋量理论

首先介绍用于同时描述平动和转动的数学工具：旋量（Screw）。

旋量是两个三维矢量组成的有序对，在空间中一点可表示为：
$$[T(A)] = \begin{pmatrix} \vec R \\ \vec M(A) \end{pmatrix}$$
对空间中任意两点$A,B$，满足
$$[T(B)] = \begin{pmatrix} \vec R \\ \vec M(B) = \vec M(A) + \vec R \times \vec{AB} \end{pmatrix}$$
{: .definition}

许多运动都可以表示成旋量的形式。
特别地，力和其对某一点的矩满足：
$$\vec M(B) = \vec M(A) + \vec F \times \vec{AB}$$
因此就是一个旋量，称为力旋量（Wrench）；

刚体的角速度和其上任意一点的速度满足
$$\vec v(B) = \vec v(A) + \vec \Omega \times \vec{AB}$$
因此也是一个旋量，称为速度旋量（Twist）。

刚体的平面运动位移（转动向量和任意一点的位矢）也是一个旋量，称为位移旋量。

旋量最重要的两个运算为加法和内积，再加上数量积就构成了一个代数系统。

旋量的加法定义为：
$$[T(A)] + [T'(A)] = \begin{pmatrix}
\vec R + \vec R' \\
\vec M(A) + \vec M'(A)
\end{pmatrix}$$
数乘定义为：
$$[T(A)] \otimes [T'(A)] = \vec R \cdot \vec M'(A) + \vec R' \cdot \vec M(A)$$
{: .definition}

这些运算的定义式都只能应用在同一个点的旋量上，作用点不同时，必须先转移到同一个点上才能进行计算。

#### 旋量的导数

在曲线$\vec R(s)$上定义的旋量$[T(P(s))]$对弧长的导数为：
$$\frac{\d [T(P)]}{\d s} = \lim_{P_1 \to P} \frac{[T(P_1)] - [T(P)]}{\Delta s} = \begin{pmatrix}
\frac{\d \vec R}{\d s} \\
\frac{\d \vec M}{\d s} + \vec x_1 \times \vec R
\end{pmatrix}_P$$
{: .proposition}

旋量$[T]$是一个关于点的函数，为了将其和旋量的参考点区分开，我们在旋量的坐标形式上加上一个下标以表示其参考点。
首先有
$$[T(P)] = \begin{pmatrix}
\vec R(P) \\
\vec M(P)
\end{pmatrix}_P, \quad
[T(P_1)] = \begin{pmatrix}
\vec R(P_1) \\
\vec M(P_1)
\end{pmatrix}_{P_1}$$
转移到同一个点下，有
$$[T(P_1)] = \begin{pmatrix}
\vec R(P_1) \\
\vec M(P_1) + \vec{PP_1} \times \vec R(P_1)
\end{pmatrix}_{P}$$
两者相减，注意到
$$\vec x_1 = \frac{\d \vec R}{\d s} = \lim_{P_1 \to P} \frac{\vec {PP_1}}{\Delta s}$$
即可。
{: .proof}

## 梁模型

有一三维有向曲线$\vec R(s)$，其自然坐标系的标架记为$\vec t\_1, \vec t\_2, \vec t\_3$；有一封闭二维平面图形，重心为$G$，惯量主轴为$\vec x\_1, \vec x\_2, \vec x_3$。
则*梁*（Beam）是该二维平面图形的重心在保持$\vec x\_1$与$\vec t\_1$平行的前提下沿曲线平移扫过的体积。
该有向曲线称为*中性轴*（Neutral axis）；二维平面称为横截面。
{: .definition}

这种定义是相当宽泛的，即使弹簧也可以视作一种梁。

通常对中性轴的长度远大于横截面的特征大小的构件，梁模型的近似效果比较好。

### 梁模型的基本研究方法

为了研究一个结构的模型，我们需要确定其位移、应力、形变和本构关系。
本节中我们将主要研究前两项。

#### 运动学假设

对梁模型，我们有两点基本假设。

- 任意一个横截面$\Sigma(s)$的运动可视作刚体的运动；
- 刚体的位移旋量的参考点选在横截面的重心：
$$[U] = \begin{pmatrix} \vec \omega \\ \vec u (G_\Sigma)\end{pmatrix}_{G_\Sigma}$$

除此之外，我们还认为梁满足欧拉-伯努利假设。

（欧拉-伯努利假设）在梁的形变中，横截面始终与中性线正交，即
$$\vec x_2 \cdot (\frac{\d \vec u}{\d s} + \vec x_1 \times \vec \omega) = \vec x_3 \cdot (\frac{\d \vec u}{\d s} + \vec x_1 \times \vec \omega) = 0$$
{: .proposition}

在定义中我们已经要求尚未形变的横截面与中性轴正交，该命题的数学描述又保证了位移的导数与中性轴正交。

#### 小变形假设

我们依然保持小变形假设，即任何平衡条件，不论是否发生形变，都可应用在未发生形变的构件上并使其保持平衡。

### 负载的简化

接下来考虑梁上负载的简化。

对于梁所受的外力，我们统一将其简化到中性轴的每一个点上，从而等价的受到一个合力和合力偶，可以使用旋量来表示。

对于梁的一个横截面所受的内力，我们将其简化到横截面的重心上。

#### 外部受力的简化

梁上的外部受力可分为两种：分布在某一个表面或体积上的外力和分布集中在一点的外力。

---

对于第一种，我们分三类讨论：体积力、底面积上的作用力和侧面积上的作用力。

设底面或顶面$\Sigma\_A$受到的应力为$\vec T\_\text{SA}$，则其旋量为：
$$
[F_A] = \begin{pmatrix}
\vec R_A = \int_{\Sigma_A} \vec T_\text{SA} \d P \\
\vec M_A = \int_{\Sigma_A} \vec{G_A P} \times \vec T_\text{SA} \d P
\end{pmatrix}
$$

设侧面所受的应力为$\vec T\_\text{SL}$，则中性轴上所受应力的线密度旋量为：
$$
[f_L(s)] = \begin{pmatrix}
\vec f(s) = \int_{\partial \Sigma(s)} \vec T_\text{SL} \d S \\
\vec m(s) = \int_{\partial \Sigma(s)} \vec{GP} \times \vec T_\text{SL} \d S
\end{pmatrix}
$$
其中$\partial \Sigma(s)$表示弧长为$s$处的侧面积，$f(s)$表示该应力的线密度。

设体积力为$\vec f\_V$，则应力线密度旋量为：
$$
[f_V(s)] = \begin{pmatrix}
\vec f(s) = \int_{\Sigma(s)} \vec f_V(P) \d P \\
\vec m(s) = \int_{\Sigma(s)} \vec{GP} \times \vec f_V(P) \d P
\end{pmatrix}
$$
$f(s)$表示该应力的线密度。

---

对于集中在一点或几点的外力，我们总是可以利用力系简化的技巧将其变为作用在横截面重心的合力和合力矩组成的旋量。

#### 内部受力的简化

为了研究梁内部的受力，我们选择$s\_0$处的一个横截面。
$s \le s\_0$的部分称为该梁的上部分，用序号1代表，其余部分称为下部分，用序号2代表。

约定上部分向下部分的作用力为该横截面处的内力：
$$[T] = [T_{1 \to 2}] = - [T_{2 \to 1}]$$

为了求解内力，我们可以使用上部分或下部分的平衡方程：
$$[T] + \sum [F_{\to 2}] = - [T] + \sum [F_{\to 1}] = [0]$$

通常运用该方程之前需要求解所有的约束力。

内力主矢沿中性轴法向方向的分量称为法向力，包括压力和拉力，记为$N$；
内力主矢减去法向力的力称为剪力，记为$\vec T$。

内力主矩在法向上的分量称为扭矩（Torsion），记为$M\_t$；
内力主矩减去扭矩的部分称为弯矩（Flexure），记为$\vec M\_f$。

### 梁的局部平衡

接下来我们研究梁在平衡状态下的特点。

不受集中于点的外力时，梁在平衡状态满足：
$$\frac{\d}{\d s} [T(s)] = [f(s)]$$
写成分量的形式，即
$$
\begin{aligned}
\frac{\d \vec R}{\d s} &= \vec f(s) \\
\frac{\d M}{\d s} + \vec x_1 \times \vec R &= \vec m(s)
\end{aligned}
$$
其中，$[f(s)]$是外力线密度旋量，包括作用于侧面和体积的外力。
{: .proposition}

对两个横截面$s\_1, s\_2$列出静力学平衡方程：
$$[T(s_1)] - [T(s_2)] + \int_{s_1}^{s_2} [f(s)] \d s = [0]$$
让两个横截面的弧长之差趋于无穷小，即可得：
$$- \frac{\d}{\d s} [T(s)] + [f(s)] = [0]$$
移项即完成证明。
{: .proof}

我们写出其所有分量：
$$
\begin{aligned}
\frac{\d N}{\d s} &= \vec f(s) \cdot \vec x_1 &\text{2D} \\
\frac{\d T_2}{\d s} &= \vec f(s) \cdot \vec x_2 &\text{2D} \\
\frac{\d T_3}{\d s} &= \vec f(s) \cdot \vec x_3 \\
\frac{\d M_t}{\d s} &= \vec m(s) \cdot \vec x_1 \\
\frac{\d M_{f2}}{\d s} - T_3 &= \vec m(s) \cdot \vec x_2 \\
\frac{\d M_{f3}}{\d s} + T_2 &= \vec m(s) \cdot \vec x_3 &\text{2D}
\end{aligned}
$$

在二维情况下，仅有标明`2D`的方程有作用。

若梁受到集中于某一点（点所在的横截面的弧长为$s$）的载荷，那么该点的力旋量不再是连续的，因此不能进行求导。
此时有
$$
\begin{aligned}
\vec R(s^+) - \vec R(s^-) &= \vec F \\
\vec M(s^+) - \vec M(s^-) &= \vec m
\end{aligned}
$$
其中$\vec F$和$\vec m$表示所受点外力的主矢和主矩。
