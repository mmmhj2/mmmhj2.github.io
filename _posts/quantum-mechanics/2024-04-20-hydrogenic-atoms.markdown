---
title: "类氢原子"
categories: ["量子力学"]
published: false
---

本文主要介绍量子力学中的类氢原子（Hydrogenic atoms），即任何只具有一个电子的原子或离子的模型。

## 类氢原子的哈密顿量

原子核和单个电子的总能量是容易写出的：
$$E = \frac{p_Z^2}{2 m_Z} + \frac{p_e^2}{2 m_e} - \frac{Z e^2}{4 \pi \epsilon_0 \Vert r_e - r_Z \Vert}$$
其中下标$Z$表示原子核，下标$e$表示电子，这三项分别代表原子核的动量、电子的动量和原子核与电子之间的电势能。
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
&= \frac{\hbar^2 l (l+1)}{2mr^2} R(r) Y(\theta, \varphi)
\end{aligned}
$$
从而我们可以进行化简、重组，得到简化的薛定谔方程。

类氢原子的薛定谔方程为
$$- \frac{\hbar^2}{2mr} \frac{\partial^2}{\partial r^2} r R(r) + V_l(r) R(r) = \varepsilon_e R(r)$$
其中
$$V_l(r) = \frac{\hbar^2 l (l+1)}{2mr^2} + \frac{Ze^2}{4 \pi \epsilon_0 r}$$
是电子绕原子核转动和电场产生的势能。
{: .proposition}
