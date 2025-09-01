---
title: "拉格朗日量与广义势能"
categories: ["理论力学"]
---

之前我们简单介绍过拉格朗日力学的中心概念，即拉格朗日量。
当时，我们说拉氏量是动能与势能之差：
$$\mathcal L = T - V.$$
在许多情况下，系统的能量如此简单的处理，尤其是系统所受外力取决于速度时。
典型的例子包括线性空气阻力和磁场中的洛伦兹力。
在本文中，我们将介绍*速度相关势能*（Velocity dependent potential）这一概念，来解决这些问题。

## 瑞利耗散与速度相关势

### 瑞利耗散势

我们首先考虑最简单的线性阻尼的情况。
假设系统的广义坐标为
$$\mathbf q = (q_1, \dots, q_i, \dots, q_n),$$
并设系统的阻尼为
$$\mathbf F = \mathbf K \mathbf {\dot q}.$$

在拉格朗日力学中，势场产生的有势力写为
$$Q'_i = \frac{\partial V}{\partial q_i}.$$
按照类似的想法，我们可以构造一个速度相关的“势能”$\mathcal R$，满足
$$F_i = \frac{\partial \mathcal R}{\partial \dot q_i}.$$
根据这个想法，可以构造函数
$$\mathcal R = \frac{1}{2} {\mathbf {\dot q}}^\top \mathbf K \mathbf {\dot q},$$
然后将拉格朗日方程改写为
$$
\renewcommand{\dif}{\mathrm{d}}
\frac{\dif}{\dif t} \frac{\partial \mathcal L}{\partial \dot q_i} - \frac{\partial \mathcal L}{\partial q_i} + \frac{\partial \mathcal R}{\partial \dot q_i} = 0.
$$
这个势能称为*瑞利耗散势能*，是速度相关势能的一种。

### 速度相关势

我们考虑更一般的情况，对第二类拉格朗日方程，定义为
$$\frac{\dif}{\dif t} \frac{\partial T}{\partial \dot q_i} - \frac{\partial T}{\partial q_i} = Q_i,$$
若广义力能写为
$$Q_i = - \frac{\partial V}{\partial q_i}, V = V(\mathbf q, t),$$
的形式，那么就可以将其移相并纳入$T$中，重写为
$$
\frac{\dif}{\dif t} \frac{\partial T - V}{\partial \dot q_i} - \frac{\partial T - V}{\partial q_i} = 0,
$$
这是因为$V$不显含广义速度，因此
$$\frac{\partial V}{\partial \dot q_i} = 0.$$
若$V$显含广义速度，那么还是可能可以将其移相并化简，只是此时条件发生了变化。
根据以上说明，我们可给出速度相关势能的定义。

若系统上所有广义力均可写为
$$Q_i = - \frac{\partial U}{\partial q_i} + \frac{\dif}{\dif t} \frac{\partial U}{\partial \dot q_i}, U = U(\mathbf q, \mathbf {\dot q}, t)$$
的形式，那么有
$$\frac{\dif}{\dif t} \frac{\partial T - U}{\partial \dot q_i} - \frac{\partial T - U}{\partial q_i} = 0,$$
此时系统的拉格朗日量可写为
$$\mathcal L = T - U,$$
$U$称为系统的速度相关势能。
{: .definition}

### 洛伦兹力的速度相关势能

考虑电磁场中带点粒子的运动，该粒子受洛伦兹力：
$$\mathbf F = e \mathbf E + e \mathbf v \times \mathbf B.$$
这个力能否写为速度相关势能的形式呢？

考虑电磁场的电标势$\phi$和磁矢势$\mathbf A$，有
$$\mathbf E = - \nabla \phi - \frac{\dif \mathbf A}{\dif t},\; \mathbf B = \nabla \times \mathbf A.$$
代入洛伦兹力表达式，可得
$$
\mathbf F = e (- \nabla \phi - \frac{\dif \mathbf A}{\dif t} + \mathbf v \times \nabla \times \mathbf A).
$$
计算可得
$$F_x = e\left( - \frac{\partial}{\partial x}(\phi - \mathbf v \cdot \mathbf A) + \frac{\dif}{\dif t} \frac{\partial}{\partial \dot x} ( \phi - \mathbf v \cdot \mathbf A)\right),$$
从而
$$U(\mathbf x, \mathbf v) = e (\phi - \mathbf v \cdot \mathbf A)$$
正是系统的一个速度相关势能。

在这个广义势能下，系统的拉氏量为
$$\mathcal L = T - U = T - e(\phi - \mathbf v \cdot \mathbf A),$$
而其广义动量为
$$\mathbf p = m \mathbf v + e \mathbf A,$$
哈密顿量为
$$\mathcal H = \frac{(\mathbf p - e \mathbf A)^2}{2m} + e \phi.$$

注意磁矢势的选择不是唯一的，即使确定某一规范（gauge）依然如此。
而选择不同的磁矢势，即使它们都满足某一规范，可能会改变拉格朗日量：
$$\mathbf A' \to \mathbf A + \nabla f, \; \phi' \to \phi + \frac{\dif f}{\dif t}, \; \mathcal L' \to \mathcal L + e \frac{\dif f}{\dif t}.$$

## 例子：正交电磁场中带电粒子的运动

考虑在正交的无限大常电磁场中的带电粒子的平面运动，其电荷量为$e$，质量为$m$，电场强度和磁感应强度为
$$\mathbf E = (0, E, 0), \; \mathbf B = (0, 0, B).$$
该带电粒子最初静止且位于原点处，试计算其运动轨迹。

容易知道，该带电粒子的运动轨迹是一条次摆线，这可通过求解牛顿力学给出的全微分方程来得出。
这里，我们尝试利用上面介绍的拉格朗日力学工具求解此问题来作为一次练习。

首先我们需要求解电标势和磁矢势，从而得到拉格朗日量。
对电标势，我们简单地设原点为零势能点，从而
$$\phi(x, y) = - E y.$$
关于磁矢势的计算比较复杂，但对常磁场我们可直接使用结论
$$\mathbf A = \frac{1}{2} \mathbf B \times \mathbf r,$$
其中$\mathbf r$是磁场不变的方向，代入可得
$$\mathbf A(x, y, 0) = \frac{1}{2} B(-y, x, 0).$$

计算拉格朗日量，得到
$$
\begin{aligned}
\mathcal L &= \frac{1}{2}m(\dot x^2 + \dot y^2) - q \left( \phi - (\dot x A_x + \dot y A_y) \right) \\
&= \frac{1}{2}m(\dot x^2 + \dot y^2) + E y q - \frac{qB}{2} y \dot x + \frac{qB}{2} x \dot y.
\end{aligned}
$$
这个拉氏量的性质不太明显，但若我们选择磁矢势
$$\mathbf A'(x, y, 0) = B(-y, 0, 0),$$
那么立刻就能注意到$x$是循环坐标，从而该系统的正则动量在$x$轴方向上守恒：
$$m \dot x - q B y = 0.$$

现在求解全微分方程组
$$
\left\{
    \begin{aligned}
    \frac{\dif}{\dif t}\frac{\partial \mathcal L}{\partial \dot x} - \frac{\partial \mathcal L}{\partial x} = 0, \\
    \frac{\dif}{\dif t}\frac{\partial \mathcal L}{\partial \dot y} - \frac{\partial \mathcal L}{\partial y} = 0, \\
    x(0) = y(0) = 0, \\
    \dot x(0) = \dot y(0) = 0.
    \end{aligned}
\right.
$$

化简可得
$$
m \ddot x - qB \dot y = 0,\; m \ddot y + qB \dot x = Eq.
$$
从而
$$x^{(3)} + \frac{q^2B^2}{m^2} \dot x = \frac{EBq^2}{m^2}.$$
解得
$$x = \frac{E}{B} t - \frac{Em}{B^2 q} \sin(\frac{Bq}{m}t).$$
对$y$坐标，可以使用正则动量守恒，也可直接求解运动方程：
$$y = \frac{Em}{B^2q}\left( 1 - \cos(\frac{Bq}{m}t) \right).$$
