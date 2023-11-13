---
title: "介质中的电磁波 Ⅱ"
categories: "电磁学"
--- 

一年以前，我们利用经典电子模型简单介绍并推导了介质中的电磁波。
本文将进一步利用半量子理论给出介质中电磁波的更多性质。

## 经典理论：自由电子和束缚电子

### 电位移和磁场强度向量

我们在此前的讨论中提到过电位移向量，本部分将进一步引入磁化强度向量。

定义电位移（Electric displacement）向量为：
$$\vec D = \epsilon_0 \vec E + \vec P = \epsilon_0 \epsilon \vec E$$
磁场强度向量为：
$$\vec H = \frac{\vec B}{\mu_0} - \vec M = \frac{\vec B}{\mu_0 \mu}$$
其中$\vec P$为极化向量：
$$\vec P = \sum e \vec X$$
而$\vec M$为磁化强度向量
{: .definition}

在非铁磁体性材料中，磁化强度接近零，而$\mu \approx 1$，从而我们几乎不会使用磁场强度向量。

利用这两个向量，麦克斯韦方程组可改写为：
$$
\begin{aligned}
\nabla \cdot \vec D & =  \rho \\
\nabla \cdot \vec B & = 0 \\
\nabla \times \vec E  & = - \frac{\partial \vec B}{\partial t} \\
\nabla \times \vec H  & = \vec j + \frac{\partial}{\partial t} \vec D
\end{aligned}
$$

### 电子的德鲁德模型

德鲁德模型是关于自由电子和束缚电子的一个模型，其与一年前提到的耦合电子模型基本相同，只是增加了自由电子。
此时电子的运动方程为：
$$
\def\d{\mathrm{d}}
\frac{\d^2 \vec x}{\d t^2} + \gamma \frac{\d \vec x}{\d t} + \omega_0^2 \vec x = - \frac{e}{m_e} \vec E
$$
其中$\gamma$是表示电子与其他粒子碰撞而产生的阻尼系数，$\omega_0$是谐振子的固有频率，表示电子被原子核吸引产生的库仑力。
对自由电子，应取$\omega\_0 = 0$，左侧的$\omega\_0^2 \vec x$项应被省略。

该方程的解为：
$$
\begin{aligned}
\vec x &= \frac{- e / m_e}{(\omega_0^2 - \omega^2) + i \gamma \omega} \vec E_0 \exp [i \omega t] \\
&= - \frac{e}{m_e} \left( \frac{\omega^2_0 - \omega^2}{(\omega_0^2 - \omega^2)^2 + \gamma^2 \omega^2} - i \frac{\gamma \omega}{(\omega_0^2 - \omega^2)^2 + \gamma^2 \omega^2} \right) \vec E_0 \exp[i \omega t]
\end{aligned}
$$

一个电子对极化向量的贡献为：
$$\vec p = -e \vec x$$
考虑到分子内部具有不同类型的电子或带电粒子，我们需要对一系列粒子的极化向量加权求和。
最后求出极化向量并得出相对介电常数$\epsilon$为
$$\epsilon = 1 + \sum_j N_j \frac{e_j^2}{m_j \epsilon_0} \frac{1}{\omega_{0,j}^2 - \omega^2 - i \gamma_j \omega} + \frac{\omega_p^2}{-\omega^2 - i \gamma_\text{自由} \omega}$$

考虑到$\epsilon$并非一个常数，我们可称其为*（相对）介电函数*。

### 介质中的波动方程

利用改写的麦克斯韦方程组我们可以得出以下波动方程：

在绝缘（$\vec j = 0$）且电中性（$\nabla \cdot \vec E = 0$）的介质中的电场的波动方程为：
$$\nabla^2 \vec E - \epsilon_0 \epsilon \mu_0 \mu \frac{\partial^2 \vec E}{\partial t^2} = 0$$
{: .proposition}

在导电（$\vec j = \sigma \vec E$）且电中性的介质中的电场的波动方程为：
$$\nabla^2 \vec E - \epsilon_0 \tilde \epsilon \mu_0 \mu \frac{\partial^2 \vec E}{\partial t^2} = 0$$
其中
$$\tilde \epsilon = \epsilon + i \frac{\sigma}{\epsilon_0 \omega}$$
称为广义介电函数。
{: .proposition}

注意到介质导电正是其中的自由电荷运动导致的，我们可以使用前一节求出的值来对应该方程中的系数。
$$\tilde \epsilon = \underbrace{1 + \sum_j N_j \frac{e_j^2}{m_j \epsilon_0} \frac{1}{\omega_{0,j}^2 - \omega^2 - i \gamma_j \omega}}_{\epsilon = 1 + \chi} + \underbrace{\frac{\omega_p^2}{-\omega^2 - i \gamma_\text{自由} \omega}}_{i \frac{\sigma}{\epsilon_0 \omega}}$$

无论对于以上哪种介质，我们都可以写出其色散关系：

介质中电磁波的色散关系为：
$$\vec k^2 = \frac{\omega^2}{c^2} \tilde \epsilon \mu \iff \vec k = \frac{\omega}{c} \tilde n$$
其中
$$\tilde n^2 = \tilde \epsilon \mu = n - i \kappa$$
称为光学系数，其实部即为折射系数，虚部的相反数[^1]称为消光系数。
{: .proposition}

[^1]: 根据平面谐波的指数约定不同，此处可以为虚部或虚部的相反数。

## 半经典理论：能级模型

我们此前的理论并没有考虑电子的量子特性，因此不能对激光等现象做出合理的解释。
本节中我们将引入能级理论来进一步细化我们的模型。

### 量子数与能量

求解薛定谔方程非常复杂，幸而我们可以使用几个参数来表示电子的能量。

电子在原子中的能量状态可以由三个量子数表示：
1. 主量子数$n$（Principal quantum number）表示电子距离原子核的距离，即其所在的层数；
2. 轨量子数$l \in [0, n-1]$（Orbital quantum number，也称角量子数）表示电子在电子层中的子层数；
3. 磁量子数$m \in [-l, l]$（Magnetic quantum number）表示电子所在的轨道数。

电子只能在相邻的状态间转移，即
$$\Delta l = \pm 1, \quad \Delta m = -1,0,1$$

利用三个量子数，我们可以表示出电子的能量

电子的能量由两个部分组成：在原子产生的势阱中的势能$E\_n$，这是主量子数的函数；和绕原子核转动产生的动能$E\_l$，这是轨量子数的函数。即
$$E = E_n(n) + E_l(l) = - V_0 + (n + \frac{1}{2}) h \nu + \frac{l(l+1)\hbar^2}{I}$$
其中$I$是转动惯量。
{: .proposition}

主量子数改变而放出或吸收的光子通常位于近红外区，而轨量子数改变放出或吸收的光子通常位于远红外和微波区。

对于原子和分子，这些能量表现出强烈的分立特征。
而对于成分复杂的固体，这些能量则会形成连续的能带。
固体中越多的电子能够从电子数量较多的能带（称为价带）进入尚未被大量电子占用的能带（称为导带），其导电性就越好。
