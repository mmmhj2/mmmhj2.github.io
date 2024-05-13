---
title: "类氢原子"
categories: ["量子力学"]
---

本文主要介绍量子力学中的类氢原子（Hydrogenic atoms），即任何只具有一个电子的原子或离子的模型。

## 类氢原子的哈密顿量

原子核和单个电子的总能量是容易写出的：
$$E = \frac{p_Z^2}{2 m_Z} + \frac{p_e^2}{2 m_e} - \frac{Z e^2}{4 \pi \epsilon_0 \Vert r_e - r_Z \Vert}$$
其中$Z$是原子核的电荷数（即原子数），下标$Z$表示原子核，下标$e$表示电子，这三项分别代表原子核的动量、电子的动量和原子核与电子之间的电势能。
从而其哈密顿量为
$$\hat H = \frac{\hat p_Z^2}{2 m_Z} + \frac{\hat p_e^2}{2 m_e} - \frac{Z e^2}{4 \pi \epsilon_0 \Vert \hat r_e - \hat r_Z \Vert}$$

### 约化质量

接下来我们考虑以整个系统的质心为参考系原点，将哈密顿量化为质心的部分和相对质心的部分。

令
$$
\left\{
    \begin{aligned}
    \vec {\hat R} &= \frac{m_e \vec{\hat r_e} + m_Z \vec{\hat r_z}}{m_e + m_Z} \\
    \vec {\hat P} &= \vec{\hat P_e} + \vec{\hat P_Z} \\
    M &= m_e + m_Z \\
    \vec{\hat r} &= \vec{\hat r_e} - \vec{\hat r_Z} \\
    \vec{\hat p} &= \frac{m_Z \vec{\hat p_e} - m_e \vec{\hat p_Z}}{m_Z + m_e} \\
    m &= \frac{1}{\frac{1}{m_e} + \frac{1}{m_Z}}
    \end{aligned}
\right.
$$
前三项是系统质心的位置、动量和质量，后三项是电子和原子核之间的差距，从而利用这六项可以表出新的哈密顿量：
$$\hat H = \frac{\hat P^2}{2M} + \frac{\hat p^2}{2m} - \frac{Ze^2}{4 \pi \epsilon_0 \hat r}$$

注意到原子核的质量远远大于单个电子的，因此
$$\vec{\hat P} \approx \vec{\hat p_Z}, \quad M \approx m_Z, \quad \vec{\hat p} \approx \vec{\hat p_e}, \quad \frac{1}{m} \approx \frac{1}{m_e}$$
这就意味着哈密顿量的第一项基本由原子核主导，而第二项基本由电子主导。
再观察到哈密顿量只有$\vec R$和$\vec r$两个变量，我们可以考虑对波函数进行分离变量
$$\psi_\text{总}(\vec R, \vec r) = \psi_\nu(\vec R) \psi_e(\vec r)$$
第一项下标$\nu$表示原子核，主要由原子核控制，第二项主要由电子控制。

对波函数应用哈密顿量，以得到其本征能量：
$$\hat H \psi_\text{总} = \psi_e (\frac{\hat P^2}{2M} \psi_\nu) + \psi_\nu [(\frac{\hat p^2}{2m} - \frac{Ze^2}{4 \pi \epsilon_0 \hat r}) \psi_e]$$
现在令
$$\frac{\hat P^2}{2M} \psi_\nu = \varepsilon_\nu \psi_\nu, \quad (\frac{\hat p^2}{2m} - \frac{Ze^2}{4 \pi \epsilon_0 \hat r}) \psi_e = \varepsilon_e \psi_e$$
从而
$$\hat H \psi_\text{总} = (\varepsilon_\nu + \varepsilon_e)\psi_\nu \psi_e$$
注意到经过分离变量之后，哈密顿算符变成了一个自由粒子的哈密顿算符与一个球形电场中的带电粒子的哈密顿算符。

### 电子的哈密顿量

考虑球坐标系下的拉普拉斯算子
$$
\nabla^2 = \frac{1}{r} \frac{\partial^2}{\partial r^2} r +
\frac{1}{r^2} \left(
    \frac{\partial^2}{\partial \theta^2} + \frac{1}{\tan \theta} \frac{\partial}{\partial \theta} + \frac{1}{\sin^2\theta} \frac{\partial^2}{\partial \varphi^2}
\right)
$$
注意到动量算子化简后可得
$$\hat L^2 = - \hbar^2 \left( \frac{\partial^2}{\partial \theta^2} + \frac{1}{\tan \theta} \frac{\partial}{\partial \theta} + \frac{1}{\sin^2 \theta} \frac{\partial^2}{\partial \varphi^2} \right)$$
从而
$$\nabla^2 = \frac{1}{r} \frac{\partial^2}{\partial r^2} r - \frac{1}{\hbar^2 r^2} \hat L^2$$
将带电粒子动量${\hat p}$中的哈密顿算符替换，从而得到
$$\hat H_e = \frac{ {\hat p}^2 }{2m} - \frac{Ze^2}{4 \pi \epsilon_0 r} = - \frac{\hbar^2}{2mr} \frac{\partial^2}{\partial r^2}r + \frac{\hat L^2}{2mr^2} - \frac{Ze^2}{4 \pi \epsilon_0 r}$$
我们之前已经说明了动量平方算符和任何单个方向的动量算符都是对易的，简单的计算说明，哈密顿算符和动量平方算符以及单方向动量算符都是对易的。
这意味着以下命题：

对带电粒子发出的电场中的另一个带电粒子，可观测量
$$\{ \hat H, \hat L^2, \hat L_z \}$$
构成对易物理量完备集合。
{: .proposition}

如果考虑电子的自旋，则还需要加入自旋动量$\hat S\_z$。

### 电子的薛定谔方程

应用电子的哈密顿算符，可以得到电子的薛定谔方程：
$$\left( - \frac{\hbar^2}{2mr} \frac{\partial^2}{\partial r^2}r + \frac{\hat L^2}{2mr^2} - \frac{Ze^2}{4 \pi \epsilon_0 r} \right) \psi_e = \varepsilon_e \psi_e$$
对波函数进行分离变量，令
$$\psi_e (\vec r) = R(r) Y_{l}^{m_l}(\theta, \varphi)$$
其中$Y$是球谐函数，$l$和$m\_l$分别是$\hat L^2$和$\hat L_z$的量子数，即轨量子数和磁量子数。
这两个量子数能够出现，是因为其对应的算符在对易物理量完备集合之中。

进一步注意到
$$
\begin{aligned}
\frac{\hat L^2}{2mr^2} \psi_e (\vec r)
&= \frac{\hat L^2}{2mr^2} R(r) Y_{l}^{m_l}(\theta, \varphi) \\
&= \frac{\hbar^2 l (l+1)}{2mr^2} R(r) Y_{l}^{m_l}(\theta, \varphi)
\end{aligned}
$$
从而我们可以进行化简、重组，得到简化的薛定谔方程。

类氢原子的薛定谔方程为
$$- \frac{\hbar^2}{2mr} \frac{\partial^2}{\partial r^2} r R(r) + V_l(r) R(r) = \varepsilon_e R(r)$$
其中
$$V_l(r) = \frac{\hbar^2 l (l+1)}{2mr^2} - \frac{Ze^2}{4 \pi \epsilon_0 r}$$
是电子绕原子核转动和电场产生的势能。
{: .proposition}

## 电子能级

我们已经知道了类氢原子电子的两个量子数：角量子数$l$和磁量子数$m\_l$
$$\hat L^2 \psi = \hbar^2 l(l+1) \cdot \psi, \quad \hat L_z \psi = \hbar m_l \cdot \psi$$
由于该电子的对易物理量完备集合具有三个元素，我们还需要一个对应哈密顿量——即总能量——的量子数，这个量子数就是主量子数（Principle quantum number）。

类氢原子中电子的总能量对应的量子数为主量子数，总能量满足
$$\varepsilon_n = - \frac{m}{\hbar^2} \left( \frac{Ze^2}{4 \pi \epsilon_0} \right)^2 \frac{1}{2n^2}$$
主量子数$n$为自然数，且角量子数$l$小于主量子数。
主量子数代表了电子能处于的能级。
{: .proposition}

通常我们令玻尔半径
$$a_0 = \frac{4 \pi \epsilon_0 \hbar^2}{m e^2} \approx 0.529 \, \text{Å}$$
从而总能量可改写为
$$\varepsilon_n = - \frac{1}{2m} \frac{\hbar^2}{a_0^2} \frac{Z^2}{n^2} \approx - 13.6 \frac{Z^2}{n^2} \, \text{eV}$$

### 氢原子谱

以氢原子为例，电子每个能级的能量为
$$\varepsilon_n = - \frac{\hbar^2}{2m a_0^2} \frac{1}{n^2} \approx - \frac{13.6}{n^2} \, \text{eV}$$
从而，电子在两个能级之间跃迁发出的电磁波波长反比例于能级平方倒数之差
$$\frac{1}{\lambda} = R_\infty \left( \frac{1}{n^2} - \frac{1}{m^2} \right)$$
其中$R\_\infty$称为里德伯常量。

根据其中一个能级的主量子数，氢原子光谱有不同的命名。
如$n=2$时称为巴尔末系。

### 简并度

注意到电子具有四个量子数——主量子数、角量子数、磁量子数和自旋量子数，而其能量只与主量子数有关，因此其能级一定是简并的。

回忆到简并度定义为特征空间的重数，即相同特征值下的不同特征向量的组合，我们尝试计算其简并度。
注意到除主量子数之外的其他量子数的取值范围：
$$
\begin{cases}
m_s & = + \frac{1}{2}, - \frac{1}{2} \\
l  &= 0, \dots, n-1\\
m_l &= -l, \dots, l
\end{cases}
$$
利用乘法原理和加法原理，可得
$$g_n = 2 \sum_{l = 0}^{n-1} (2l +1) = 2 n^2$$
