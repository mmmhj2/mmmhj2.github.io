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
然而，这一推论已被实验证伪，这意味着我们需要更加精确的模型。

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
$$N = \frac{1}{6 \pi^2} \left( \frac{2mE}{\hbar^2} \right)^{\frac{3}{2}} V$$
{: .proposition}

参见[例子：无限势阱的状态密度]({% post_url statistical-physics/2024-04-29-introduction %}#例子无限势阱的状态密度)。
注意边界条件可选择波函数势阱外为零或首尾相等，后者称为周期边界条件（或玻恩-冯·卡门条件）。
{: .proof}
