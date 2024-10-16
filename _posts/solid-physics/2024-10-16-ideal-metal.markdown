---
title: "理想金属"
categories: ["固体物理"]
---

固体物理是研究固体——特别是晶体——性质的学科。
本文将首先研究经典的金属模型，然后引入量子力学模型。

## 经典理论的困难

在统计物理学中，我们已经接触了许多经典理论，其中重要的一点是*能量均分定理*（Equipartition Theorem）。

平衡时粒子的平均能量在各自由度上均分：
$$E_\text{tot} = \sum_{i=1}^N \frac{1}{2} \phi_i$$
其中$\phi$是一个二次型函数，通常为以下三者之一
$$
\begin{aligned}
E_\text{平动能} &= \frac{1}{2} m v_{x, y, z}^2 \\
E_\text{转动能} &= \frac{1}{2} I_{x,y,z} \omega_{x,y,z}^2 \\
E_\text{势能} &= \frac{1}{2} k_{x} x^2 = \frac{1}{2} k_{y} y^2 = \frac{1}{2} k_{z} z^2
\end{aligned}
$$
{: .theorem}

能量均分定理的简单推论为，任何物质的比热都是常数。
这是因为，根据玻尔兹曼分布，分子在单自由度上的动能总是$\frac{1}{2} k_B T$，从而总的能量和温度呈线性关系。
然而，这一推论已被实验证伪——一般来讲，在$0\, \text{K}$附近，半导体与绝缘体的比热与温度的三次方成正比；而导体的与温度成线性关系——这意味着我们需要更加精确的模型。

### 特鲁德模型 

经典理论的一大问题在于没有考虑电子的分布。
我们尝试使用经典的电子模型——**特鲁德模型**进行计算。

特鲁德模型使用以下四个假设：
1. 电子之间相互独立；
2. 介质呈电中性；
3. 电子是经典粒子，不考虑量子与相对论效应。
4. 电子与介质中（晶格上）的中性粒子发生碰撞，因此受到阻碍运动的力。

特鲁德模型中，单个电子的运动方程为
$$\frac{\mathrm d \vec p}{\mathrm d t} = - \frac{p}{\tau} + q \vec E$$
其中$\tau$是表征受碰撞频率的因子，称为*平均自由时间*（Mean free time）。<br/>
{: .proposition}

若加入边界条件
$$p(0) = 0$$
则该方程的一维解为
$$p(t) = - qE \exp\left[ - \frac{t}{\tau} \right] + q E \tau$$
从而其电流密度为
$$\vec j = \rho \vec v = \frac{nq^2}{m} \tau \vec E = \sigma \vec E$$
其中$n$是每单位体积含有的电子量，$\sigma$为材质的电导率。

#### 与量子现象的矛盾

典型金属的电导率约为$10^7 \,\mathrm{\Omega \cdot m}$。
再设单个原子仅贡献一个电子，且原子大小为一埃（$10^{-10} \,\text{m}$），则可估计平均自由时间约为$10^{-15} \,\text{s}$。
根据不确定性原理，有
$$\Delta E \cdot \Delta t \ge \frac{1}{h}$$
从而能量的不确定性约在$10^{-19} \, \mathrm J$数量级上。
而单个电子在$1 \,\mathrm V$的电场中的能量为
$$E = 1\,\mathrm{eV} = 1.6 \times 10^{-16} \, \mathrm J$$
这个数量级与不确定性相仿，说明存在没有考虑到的量子现象。

#### 计算热容

我们将电子视为[理想气体]({% post_url statistical-physics/2024-05-30-canonical-ensemble %}#例子量子势阱与理想气体)，则在不考虑自旋的情况下，单个电子的正则配分函数为：
$$
z = \frac{V}{\Lambda^3} = \frac{V}{\left(\frac{2 \hbar^2 \beta \pi}{m}\right)^{3/2}}
$$
根据麦克斯韦-玻尔兹曼近似，多个全同而不可辨的粒子的配分函数为
$$Z = \frac{z^N}{N!} = \frac{\left[ V \left(\frac{m}{2 \hbar^2 \beta \pi}\right)^{3/2}\right]^N}{N!}$$
从而
$$E = - \frac{\partial \ln Z}{\partial \beta} = \frac{3}{2} N k_B T$$
这意味着材质的比热依然为常数，因此虽然该模型考虑了自由电子，但仍无法解释热容的变化。

## 索莫菲模型

我们尝试引入部分量子力学的概念，在此之前，首先回忆如何计算势阱中量子的状态数：

困在三维无穷势阱（长宽高为$L\_x, L\_y, L\_z$）中的量子的状态数（不考虑自旋）为
$$N = \frac{L_x L_y L_z k_{x,\max} k_{y,\max} k_{z,\max}}{6\pi^2} = \frac{1}{6 \pi^2} \left( \frac{2mE}{\hbar^2} \right)^{\frac{3}{2}} V,$$
其中$k$是波矢：
$$k_{x,y,z} = \frac{2 \pi n_{x,y,z}}{L_{x,y,z}}, \, n \in \mathbb N.$$
根据波矢与能量的关系，还有
$$k_{x,\max}^2 + k_{y,\max}^2 + k_{z,\max}^2 = \frac{2mE}{\hbar^2}.$$
{: .proposition}

参见[例子：无限势阱的状态密度]({% post_url statistical-physics/2024-04-29-introduction %}#例子无限势阱的状态密度)。
注意边界条件可选择波函数势阱外为零或首尾相等，后者称为周期边界条件（或玻恩-冯·卡门条件）。
{: .proof}

一般认为该问题在三个方向上是对称的，此时单个状态占据的空间为
$$V_\text{状态} = \frac{8 \pi^3}{L^3} = \frac{8 \pi^3}{V},$$
从而总状态数为
$$N = \frac{\frac{4}{3} \pi k_{\max}^3}{V_\text{状态}} = \frac{4\pi}{3} k_{\max}^3 \frac{V}{(2\pi)^3}.$$
若考虑电子的自旋，则状态数还需乘二：
$$N = 2 \frac{4\pi}{3} k_{\max}^3 \frac{V}{(2\pi)^3}.$$

### 量子理想气体

**索末菲模型**认为，在$0\,\text{K}$下，电子量子仍呈类似理想气体的分布：
$N$个电子在状态空间中从低能量状态（波矢为零）向上堆积，每个状态（含自旋）仅含有一个电子，且电子之间互不影响。
这种模型称为*自由电子气*（Free electron gas）模型或*费米气体*（Fermi gas）模型，因为电子是费米子，满足泡利不相容原理。

索末菲模型预测，绝对零度下导体中电子的最大波矢为
$$k_f = \left( 3 n \pi \right)^{1/3},$$
其中$n$为电子密度。
该波矢即最大能量电子与最小能量电子的波矢之差，也称为*费米波矢*（Fermi wavevector）。
从而其最大能量为
$$\epsilon_f = \frac{\hbar^2}{2m}\left( 3 n \pi \right)^{2/3}，$$
称为*费米能量*(Fermi energy)。
{: .proposition}

费米能量对应的温度称为*费米温度*(Fermi temperature)：
$$T_f = \frac{\epsilon_f}{k_B}.$$
从物理意义上讲，费米温度是最低能量电子通过热运动到达最高能量激发态所需的温度。

根据泡利不相容原理，每个电子只能占据一个状态，因此状态数即为电子数，从而电子密度为
$$n = \frac{N_\text{电子}}{V} = \frac{2 \frac{4\pi}{3} k_{\max}^3 \frac{V}{(2\pi)^3}}{V} = 2 \frac{4\pi}{3} k_{\max}^3 \frac{1}{(2\pi)^3}.$$
移项即得
$$k_{\max} = \left( 3 n \pi \right)^{1/3}.$$
又
$$\epsilon = \frac{\hbar^2 k^2}{2m} = \frac{\hbar^2}{2m}\left( 3 n \pi \right)^{2/3}.$$
{: .proof}

### 计算比热

接下来利用索末菲模型计算比热，首先我们求解绝对零度下电子的总能量。
直接对单个电子的能量求和过于复杂，我们可以考虑直接在状态空间上进行积分：
$$E = \int_\Omega \frac{\hbar^2 k^2}{2m} 2 g(k) \, \mathrm d^3 k,$$
其中
$$g(k) = \frac{V}{(2 \pi)^3},$$
表示状态密度（不含自旋）。
根据对称性，换元到球坐标系下求解：
$$ \mathrm d^3 k = 4 \pi r^2 \, \mathrm d r,$$
从而
$$E = \int_0^{k_f} \frac{\hbar^2 k^2}{2m} 2\frac{V}{(2 \pi)^3} 4 \pi r^2 \, \mathrm d r.$$
解为
$$E = \frac{5}{3} n \epsilon_f V \iff \overline \epsilon = \frac{3}{5} \epsilon_f.$$

对非零度的情况，我们使用费米-狄拉克统计为电子数加权，并将积分域拓展到正无穷：
$$E = \int_0^\infty \epsilon(k) \frac{2V}{(2 \pi)^3} \frac{1}{\exp[\beta(\epsilon(k) - \mu)]+1} 4 \pi r^2 \, \mathrm d r,$$
其中$\epsilon$即为电子能量。

值得注意的一点是，我们可以将状态密度$\frac{2V}{(2\pi)^3}$表示为与能量相关的函数：
$$g(\epsilon) \, \mathrm d \epsilon = 2 g(k) 4\pi k^2 \,\mathrm d k = \frac{2V}{(2\pi)^3} 4\pi k^2 \mathrm d k.$$
从而
$$g(\epsilon) = \frac{8\pi k^2 g(k)}{\mathrm d \epsilon / \mathrm d k} = \frac{V}{2\pi^2} \left( \frac{2m}{\hbar^2} \right)^{3/2} \sqrt{\epsilon}.$$
注意，自旋产生了额外的二倍系数。
这种密度称为系统的*能态密度*（Density of states）。
重写后的积分为
$$E = \int_0^\infty \epsilon g(\epsilon) \frac{1}{\exp[\beta(\epsilon - \mu)] + 1} \, \mathrm d \epsilon.$$
提取常数，可得
$$E = \frac{V}{2\pi^2} \left( \frac{2m}{\hbar^2} \right)^{3/2} \int_0^\infty \frac{\epsilon^{3/2} \, \mathrm d \epsilon}{\exp[\beta(\epsilon - \mu)] + 1}.$$
这个积分称为*费米-狄拉克积分*（Fermi-Dirac intergral），在一般情况下没有解析解。

我们可利用*索末菲展开*（Sommerfeld expansion）进行近似。

当$\beta \to \infty$时，有：
$$
\begin{multline}
\int_{-\infty}^\infty \frac{H(\epsilon) \, \mathrm d \epsilon}{\exp[\beta(\epsilon - \mu)] + 1} \\
= \int_{-\infty}^\mu H(\epsilon) \,\mathrm d \epsilon + \frac{\pi^2}{6 \beta^2} H'(\mu) + O\left(\frac{1}{\beta \mu}\right)^4.
\end{multline}
$$
{: .proposition}

我们先对电子数应用此展开，有
$$N = \frac{V}{2\pi^2} \left( \frac{2m}{\hbar^2} \right)^{3/2}  \int_0^\infty \frac{\sqrt{\epsilon} \, \mathrm d \epsilon}{\exp[\beta(\epsilon - \mu)] + 1}.$$
从而
$$
\begin{aligned}
N &= \frac{V}{2\pi^2} \left( \frac{2m}{\hbar^2} \right)^{3/2} \left[ \int_0^\mu \sqrt{\epsilon} \,\mathrm d \epsilon + \frac{\pi^2}{6\beta^2} \frac{1}{2\sqrt{\mu}} + \cdots \right] \\
& \approx \frac{V}{3\pi^2} \left( \frac{2m}{\hbar^2} \right)^{3/2} \mu^{3/2} + \frac{V}{24 \beta^2} \left( \frac{2m}{\hbar^2} \right)^{3/2} \mu^{-1/2}.
\end{aligned}
$$
提取常数并重写方程，可得
$$\left[\frac{\hbar^2}{2m} \left( 3 \pi^2 \frac{N}{V} \right)^{2/3}\right]^{3/2} = \epsilon_f^{3/2} \approx \mu^{3/2} + \frac{\pi^2}{8\beta^2} \mu^{-1/2}.$$
利用泰勒展开将方程线性化，然后求解，这直接给出以下命题。

索末菲模型预测，金属电子的化学势为
$$\mu \approx \epsilon_f \left[ 1 - \frac{\pi^2}{12\beta^2 \epsilon_f^2} \right]^{-2/3},$$
其中
$$\epsilon_f = \frac{\hbar^2}{2m} \left( 3 \pi^2 n\right)^{2/3}$$
为费米能量。
{: .proposition}

按照类似的步骤，我们也可求出金属电子的能量。

索末菲模型预测，金属电子的总能量为
$$E \approx \frac{3}{5} N \epsilon_f + \frac{\pi^2}{4 \beta^2} \frac{N}{\mu_f}.$$
从而其比热为
$$C_v = \frac{\pi^2}{2} k_B n \frac{k_BT}{\epsilon_f} = \frac{\pi^2}{2} \frac{n T}{T_f}$$
{: .proposition}

这成功解释了绝对零度附近比热和温度的线性关系。
