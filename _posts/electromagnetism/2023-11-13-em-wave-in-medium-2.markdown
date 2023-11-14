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

我们通常以振幅衰减至原有的$e^{-1}$倍或能量衰减至原有的$e^{-2}$倍作为指数衰减的特征长度或特征时间的标志。
因此在消光系数为$\kappa$的材质中，电磁波的穿透深度为：
$$\delta = \frac{c}{\omega \kappa} = \frac{\lambda}{2\pi\kappa}$$

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

### 电子跃迁

我们接着考虑吸收光子导致的跃迁和跃迁导致的光子辐射。

考虑只有两个能级的系统，能级二的能量更高，且两能级能量之差满足
$$\Delta E = E_2 - E_1 = h \nu$$
设其上的电子个数为$N\_1, N\_2$。
轨道上的电子和光子之间存在三种交互：

1. 自发辐射（Spontaneous emission）：位于更高能级的电子自发地向更低能级跃迁，向*随机方向*发出频率为$\nu$的光子。设单个电子单位时间内发生该跃迁的概率为$A\_{21}$。
2. 吸收（Absorption）：位于更低能级的电子吸收一个光子的能量并跃迁至更高能级。显然，单个电子发生跃迁的概率近似正比于光子的个数，从而正比于入射光的能量，单个电子单位时间内发生跃迁的概率为
$$W_{12} \propto u(\nu) \iff W_{12} = B_{12} \cdot u(\nu)$$
3. 受激辐射（Stimulated emission）：位于更高能级的电子在光子的刺激下跃迁至低能级，同时发出一个完全相同的光子，单个电子单位时间内发生跃迁的概率为
$$W_{21} \propto u(\nu) \iff W_{21} = B_{21} \cdot u(\nu)$$

考虑到电子的数量守恒，列出微分方程可得：
$$\frac{\d N_2}{\d t} = - \frac{\d N_1}{\d t} = B_{12} u(\nu) N_1 - (B_{21} u(\nu) N_2 + A_{21} N_2)$$

对于热力学平衡的情况，电子数量对时间的导数为零，从而可得：
$$u(\nu) = \frac{A_{21} / B_{21}}{\frac{B_{12} N_1}{B_{21} N_2} - 1}$$
考虑电子数量服从玻尔兹曼分布，即：
$$\frac{N_2}{N_1} = \exp \left[- \frac{E_2 - E_1}{kT} \right]$$
代入可得
$$u(\nu) = \frac{A_{21} / B_{21}}{\frac{B_{12}}{B_{21}} \exp \left[ \frac{h \nu}{kT} \right] - 1}$$
最后注意到根据普朗克黑体辐射公式，发射光的强度为
$$u(\nu) = \frac{8 \pi h \nu^3}{c^3} \frac{1}{\exp[\frac{h\nu}{kT}] - 1}$$
我们可得出
$$B_{12} = B_{21}, \quad \frac{A_{21}}{B_{21}} = \frac{8 \pi h \nu^3}{c^3}$$

因此我们只需要两个系数$A,B$即可描述原子中电子在电磁场下的状态变化，这两个系数称为*爱因斯坦系数*。

#### 多色光情况

对于多色光，并非所有能量都能被用于供电子跃迁。
此时，我们需要为与光子交互的项上乘一个系数$g(\nu)$，变为：
$$\frac{\d N_2}{\d t} = B(\nu) \textcolor{red}{g(\nu)} u(\nu) N_1 - (B(\nu) \textcolor{red}{g(\nu)} u(\nu) N_2 + A(\nu) N_2)$$

其中$g(\nu)$是归一化后的谱密度，满足
$$\int_0^\infty g(\nu) \d \nu = 1$$

#### 能量分析

考虑将上文提到的介质置于坐标$z$与$z+\d z$之间，然后沿$z$正方向发射光子，统计穿过介质后光子的个数（即能量）。
由于自发辐射的光子的方向是随机的，我们不计入这一部分光子。
有
$$\frac{\d u}{\d t} = \frac{\d u}{\d z} \frac{\d z}{\d t} = (h \nu B N_2 - h \nu B N_1) u \frac{\d z}{\d t}$$
考虑到波速：
$$z = \frac{c}{n} t \iff \frac{\d z}{\d t} = \frac{n}{c}$$
从而
$$\frac{\d u}{\d t} = \frac{n h \nu B}{c}(N_2-N_1) u $$


我们可以使用一个系数来表示该材质的特点。

若$\alpha$满足：
$$- \alpha u = \frac{\d u}{\d t}$$
则称其为该介质的衰减系数。
二能级材料在单色光下的衰减系数为
$$\alpha = \frac{n h \nu B}{c} (N_1 - N_2)$$
{: .definition}

如果通过外力使得材质中位于高能级的电子数大于位于低能级的，则可能使得电磁波在通过该介质后强度不降反增。
这就是激光器的原理。

## 介质与激光理论

本节中我们将介绍利用活性介质和法布里-佩罗共振腔产生激光的基本原理。

### 共振腔

在光学课程中，我们初步介绍了法布里-佩罗共振腔——即两面放置在一定距离$L$间的镜子。

#### 共振腔的模式

若共振腔中发生共振，则其中的一个单色波一定为驻波，记
$$E(z,t) = f(z) \chi(t)$$
则根据达朗贝尔方程和两端电场为零的边界条件，容易解出：
$$\chi(t) = A e^{-i (\omega t + \varphi)}, \quad f(z) = f_0 \sin(k_p z)$$
其中
$$k_p = p\frac{\pi}{L}, \quad p \in \mathbb N_*$$

这意味着能够发生共振的电磁波的频率一定是一个定值的整数倍，这些频率称为共振腔的*模式*。

共振腔中一个能够发生共振的波矢（或波长、频率等）称为该共振腔的*模式*（Mode）。
一维的共振腔的模式为
$$k_p = p \frac{\pi}{L} \iff \nu_p = p \frac{c}{2nL} \iff \lambda_p = \frac{2nL}{p}$$
相邻两个模式的频率差称为模式间距。
{: .definition}

#### 共振腔的损耗

考虑对振幅的反射和透射系数分别为$r\_1, r\_2, t\_1, t\_2$的两面镜子构成的共振腔，光线从一号镜子射入，透过镜子变为$E\_a$，然后被介质损耗，变为$E\_b$，被二号镜子分为透射部分$E\_\text{out}$和反射部分$E\_c$，再被介质损耗为$E\_d$，则：
$$
\begin{aligned}
E_a &= t_1 E_\text{in} + r_1 E_d \\
E_b &= e^{ikL} E_a \\
E_c &= r_2 E_b \\
E_d &= e^{ikL} E_c \\
E_\text{out} &= t_2 E_b
\end{aligned}
$$
解得
$$E_\text{out} = t_1 t_2 E_\text{in} e^{ikL} \frac{1}{1 - r_1 r_2 e^{2ikL}}$$

首先假设$k$只有实部，则介质不发生能量变化，此时根据相位一致的原理，应有
$$k = p \frac{\pi}{L}$$

---

现在考虑能量的损耗。
假设电磁波发生衍射和被介质吸收两种损耗，则经过两次反射并到达开始点的电磁波的能量为：
$$u(2L) = u_0 e^{-(\alpha_\text{衍} + \alpha_\text{吸})2L} (r_1 r_2)^2 = u_0 e^{-(\alpha_\text{衍} + \alpha_\text{吸} + \frac{1}{L} \ln (\frac{1}{r_1r_2}))2L}$$
我们可以定义一个新的常量来表示它。

共振腔的等效损耗为：
$$\alpha = \alpha_\text{衍} + \alpha_\text{吸} + \frac{1}{L} \ln (\frac{1}{r_1r_2})$$
它表示了衍射、吸收和反射时产生的损耗。
{: .definition}

#### 共振腔的品质因子

我们使用共振腔的品质因子来衡量其保存能量的能力。

共振腔的品质因子定义为其包含的能量与损耗的能量之比：
$$Q_p = 2 \pi \frac{\text{包含的能量}}{\text{损耗的能量}} = \frac{2\pi}{T} \frac{u}{|\frac{\d u}{\d t}|}$$
其中$T$是电磁波往返所需的时间。
{: .definition}

其有几个等价的表示方法：
$$
\begin{aligned}
Q &= \frac{2\pi}{T} \frac{u}{|\frac{\d u}{\d t}|} \\
&= \frac{2\pi}{T} \frac{n}{c \alpha} \\
&= \frac{2\pi}{\lambda_p} \frac{nL}{\alpha_\text{吸}L + \alpha_\text{衍}L - \ln (r_1 r_2)} \\
\end{aligned}
$$

利用品质因子，我们可以求出光子的平均存在时间与路程：
$$\tau_p = \frac{Q_p}{\omega_p}, \quad L_p = \frac{c}{n} \tau_p = \frac{1}{\alpha}$$

### 活性介质

我们已经知道，介质中的损耗和爱因斯坦系数与能级电子数差距密切相关：
$$\alpha = \frac{n h \nu B}{c} g(\nu) \Delta N$$

当且仅当$\Delta N < 0$，即高能级的电子数大于低能级的时，介质中的损耗才能为负数，即介质实际上放大了电磁波的能量。
此时，我们称损耗系数的相反数为放大系数$\beta$。

#### 增益饱和
