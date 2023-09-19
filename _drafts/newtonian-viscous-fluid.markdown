---
title: "牛顿流体"
categories: ["流体力学"]
---

## 黏性流体

上一章中，我们已经知道，流体的应力张量可写为：
$$
\def\d{\mathrm{d}}
\def\D{\mathrm{D}}
\def\pDt#1{\frac{\D #1}{\D t}}
\def\pd#1#2{\frac{\partial #1}{\partial #2}}
\sigma = - p \mathbf I + \tau
$$
将该结果代入动量方程：
$$\rho \pDt{\vec U} = \nabla \cdot \sigma + \rho \vec f = - \nabla p + \nabla \cdot \tau + \rho \vec f$$

$\tau$一项与流体的黏性有关，本节我们将主要研究它的性质。

### 牛顿流体

牛顿流体是指满足**牛顿定律**的流体，即其应力张量的黏性部分$\tau$满足：
$$\tau = (\lambda \nabla \cdot \vec U) \mathbf I+ 2 \mu D$$
其中$\lambda,\mu$是两个常数，称为*第二黏度*和*动力学黏度*，只与流体有关。
$D$是一个对称的三阶矩阵，定义为：
$$D_{ij} = \frac{1}{2} \left( \partial_j U_i + \partial_i U_j \right)$$
称为*变形率张量*，和流体的剪切密切相关。
{: .definition}

常见的流体如空气和水都是牛顿流体。

若流体是不可压缩的，则黏性张量是变形率张量的线性函数，此时，若流体不受变形，则其应力张量变成一个简单的数量矩阵。

在后文中，若非特别提及，则默认流体为牛顿流体。

### 流体运动的分解

接下来我们考虑一下变形率张量的物理学意义。

将速度进行多项式展开，可得：
$$U_i(\vec x) = U_i(\vec x_p) + \sum_{j=1}^3 \pd{U_i(\vec x_p)}{x_j} (x_j - x_{j,p}) + o(\Vert \vec x - \vec x_p \Vert)$$

考虑矩阵$J\_{ij} = \pd{U\_i}{x\_j}$，
任何矩阵总可以写为一个对称矩阵和反对称矩阵之和：
$$
\begin{aligned}
J_{ij} &= D_{ij} + \omega_{ij} \\ \iff
\pd{U_i}{x_j} &= \frac{1}{2} (\pd{U_i}{x_j} + \pd{U_j}{x_i}) + \frac{1}{2} (\pd{U_i}{x_j} - \pd{U_j}{x_i})
\end{aligned}
$$
从而，在忽略高阶无穷小的情况下，流体的速度可写为：
$$\vec U(\vec x) = \vec U (\vec x_p) + D(\vec x_p) \cdot (\vec x - \vec x_p) + \omega (\vec x_p) \cdot (\vec x - \vec x_p)$$

现在，我们令$\vec \Omega = \frac{1}{2} \nabla \times \vec U$
不难发现：
$$
\Omega_1 = \frac{1}{2} (\pd{U_3}{x_2} - \pd{U_2}{x_3}) = \omega_{32} = - \omega_{23}
$$
其他几个分量同理，因此$\omega$可写为：
$$
\omega = \begin{pmatrix}
0 & -\Omega_3 & \Omega_2 \\
\Omega_3 & 0 & - \Omega_1 \\ -
\Omega_2 & \Omega_1 & 0 \\
\end{pmatrix}
$$
从而可将矩阵乘法转化为叉乘，可得：
$$\vec U(\vec x) = \underbrace{\vec U (\vec x_p)}_\text{平移} + \underbrace{D(\vec x_p) \cdot (\vec x - \vec x_p)}_\text{变形} + \underbrace{\Omega (\vec x_p) \times (\vec x - \vec x_p)}_\text{转动}$$

因此，流体的平移和转动均不产生变形。

### 总结

根据本节的内容，我们很容易给出流体的三个方程：
$$
\left\{
    \begin{aligned}
        & \frac{\D \rho}{\D t} + \rho \nabla \cdot \vec U = 0 \\
        & \rho \frac{\D \vec U}{\D t} = - \nabla p + \nabla \cdot \tau + \rho \vec f \\
        & \tau = \lambda (\nabla \cdot \vec U) \mathbf I + 2 \mu D
    \end{aligned}
\right.
$$
拆成分量的形式，该方程中的未知量依然比线性无关的方程多，因此是欠定的。
我们要么添加新的方程，要么添加假设并删去一些变量。
前者需要涉及复杂的能量方程，因此我们先考虑后者。

## 不可压缩均匀流体的纳维尔-斯托克斯方程

我们假设该流体是不可压缩且均匀的，因此有：
$$\nabla \cdot \vec U = 0, \rho = \text{常数}, \mu = \text{常数}$$

根据以上假设，我们马上可得出下列结论：
- 质量方程左侧等于零，直接消去；
- $\tau = 2 \mu D$，这使得我们可以计算其散度：
$$(\nabla \cdot \tau)_i = \partial_j \tau_{ij} = \mu \partial_{jj} U_i \iff \nabla \cdot \tau = \Delta \vec U$$

从而得到以下定理：

不可压缩均匀流体满足以下方程组：
$$
\left\{
    \begin{aligned}
    &\pDt{\vec U} = - \frac{1}{\rho} \nabla \rho + \frac{\mu}{\rho} \Delta \vec U + \vec f \\
    &\nabla \cdot \vec U = 0
    \end{aligned}
\right.
$$
这个方程组称为不可压缩均匀流体的纳维尔-斯托克斯方程，简称**纳维尔-斯托克斯方程**或N-S方程。
通常使用$\nu$表示$\frac{\mu}{\rho}$，称为*运动学黏性*。
{: .theorem}

N-S方程的项分别具有以下名称：
- $\pDt{\vec U}$：加速度项或惯性项。
    - $\pd{\vec U}{t}$：非定常项；
    - $\vec U \cdot \nabla \vec U$：非线性项；
- $- \frac{1}{\rho} \nabla p$：压力梯度项。
- $\nu \Delta \vec U$：黏性项。
- $\vec f$：外力项。

### 有势力

当外力$\vec f$是有势力时，其可以写成势场的负梯度：
$$\vec f = - \nabla \Psi$$
此时，令$p_\* = p + \rho \Psi$，即可用压力梯度项完全替代外力项。

### 边界条件

对于有黏性的流体，流体和固体的边界以及流体之间的边界必须满足一定的边界条件，否则速度的偏导趋于无穷，将导致黏性张量趋于无穷。

这要求在流固边界上，$\vec U$和边界速度相等。
这一条件称为*无滑移条件*。

在流体边界上，满足三个条件：
1. $$\vec U_A = \vec U_B$$
2. $$\sigma_A \cdot \vec n = \sigma_B \cdot \vec n$$
3. $$\vec W \cdot \vec n = \vec U \cdot \vec n$$

## 无黏性流动

当流体的黏性可忽略时，其应力张量可写为：
$$\sigma = - p \mathbf I$$
从而有以下命题：

在无黏性、不可压缩、均匀的前提下，N-S方程可改写为：
$$
\left\{
    \begin{aligned}
    &\pDt{\vec U} = - \frac{1}{\rho} \nabla \rho + \vec f \\
    &\nabla \cdot \vec U = 0
    \end{aligned}
\right.
$$
该方程组称为*欧拉方程*。
{: .proposition}

对于无黏性流动的情况，由于黏性张量的约束不再存在，边界条件也发生了变化。

在流固界面上，现在只要求流体的速度法向投影与固体速度法向投影相同，称为有滑移条件。
在流体界面上，也只要求两者在法向上的投影相同。

### 伯努利定律

现在，在无黏性、不可压缩的前提上加上定常和主动力保守的假设，我们有：

- 无黏性：$$\sigma = - p \mathbf I$$
- 定常：$$\pd{}{t} = 0$$
- 不可压缩：$$\nabla \cdot \vec U = 0$$
- 主动力保守：$$\vec f = - \nabla \Psi$$

在最初的动量等式上两边同时乘$\vec U$，从而得到动能的方程：
$$
\begin{aligned}
\rho \vec U \pDt{\vec U} &= \vec U \cdot (\nabla \cdot \sigma + \rho \vec f) \\
\rho \left( \cancel{\pd{}{t} \frac{1}{2} U^2} + \vec U \cdot \nabla \left( \frac{1}{2} U^2 \right) \right) &= \vec U \cdot \left( - \nabla p - \rho \nabla \Psi \right) \\
\vec U \cdot \nabla ( \underbrace{p}_\text{压力} + \underbrace{\frac{1}{2} \rho U^2 + \rho \Psi}_\text{机械能} ) &= 0
\end{aligned}
$$
从而我们得到以下定理：

场$\mathcal H$：
$$\mathcal{H} = p + \frac{1}{2} \rho U^2 + \rho \Psi $$
的梯度正交于流线，即该场在一条流线上始终保持不变。
{: .theorem}

## 无限长导管中的层流

接下来我们研究无限长导管中中*层流*，使用如下假设：

1. 导管沿$x\_1$轴放置，截面为圆形。
2. 流体处于定常状态：$$\pd{}{t} = 0$$
3. 流速于$x\_1$轴平行：$$\vec U = (U(\vec x), 0, 0)$$
4. 主动力有势：$$\vec f = -\nabla \Psi, \ p_* = p + \rho \Psi$$


代入N-S方程，由散度等于零，可知$U$的值与$x\_1$坐标无关：
$$U = U(x_2, x_3)$$
根据动量方程，在$x\_2, x\_3$轴上可得$p\_*$的值只与$x\_1$坐标有关。
在$x\_1$轴上可得：
$$\mu \Delta U = \frac{\mathrm d p_*}{\mathrm d x_1}$$
左侧是关于$x\_2, x\_3$的函数，右侧是关于$x\_1$的函数，两者恒等说明均为常数，设该常数为$G$，从而可解出：
$$p_* = G x_1 + C$$
其中$G$称为轴向压力梯度常数，此处我们直接令$C = 0$。
若该流体沿$x\_1$正向流动，则$G$应为负数。

然后求解$U$：
$$\frac{\partial^2 U}{\partial x_2^2} + \frac{\partial^2 U}{\partial x_3^2} = \frac{G}{\mu}$$
该方程是泊松方程，可使用格林函数法求解。
此处注意到导管的对称性，可使用柱坐标进行求解：
$$
\begin{aligned}
\Delta U &= \frac{1}{r} \pd{}{r} \left( r\ \pd{U}{r} \right) + \cancel{\frac{1}{r^2} \frac{\partial^2 U}{\partial \theta^2}} + \cancel{\frac{\partial^2 U}{\partial x_1^2}} \\
&= \frac{1}{r} \pd{}{r} \left( r \frac{\partial U}{\partial r} \right) = \frac{Gr}{\mu} \\
\implies U(r) &= \frac{1}{4} \frac{Gr^2}{\mu} + C
\end{aligned}
$$
然后使用无滑移边界条件，即可得：
$$U = U_0 \left( 1 - \frac{r^2}{a^2} \right), \ U_0 = - \frac{a^2}{4\mu} G$$

其流量为：
$$Q = \iint_S U \d x_2 \d x_3 = \frac{1}{2} \pi U_0 a^2$$
平均流速为：
$$U_d = \frac{Q}{S} = - \frac{a^2}{8\mu} G$$

从而我们有：

在无限长圆柱形导管中受有势力而层流流动的流体的速度分布为一个抛物面，其中心速度为：
$$U_0 = - \frac{a^2}{4\mu} G$$
其中，$G$是该点处轴向的压力梯度。
{: .proposition}

## 流体的能量

### 流体的动能定理

我们现在来考虑黏性流动的动能问题，正如上文所述，动能可以表示为：
$$\rho \vec U \pDt{\vec U} = \rho \pDt{} \left( \frac{1}{2} U^2 \right) = \vec U \cdot (\nabla \cdot \sigma + \rho \vec f)$$

设$\chi = U^2/2$，应用改写的雷诺定理，可得：
$$
\begin{aligned}
\frac{\d E_k}{\d t} &= \frac{\mathrm d}{\mathrm d t} \iiint_D \rho \chi \mathrm d v \\
&= \iiint_D \rho \pDt{\chi} \mathrm d v + \iint_S \rho \chi (\vec W - \vec U) \cdot \mathrm d \vec S \\
&= \iiint_D \vec U \cdot (\nabla \cdot \sigma + \rho \vec f) \mathrm d v + \iint_S \frac{1}{2} \rho U^2 (\vec W - \vec U) \cdot \mathrm d \vec S \\
\end{aligned}
$$

现在，注意到：
$$
\begin{aligned}
\vec U \cdot(\nabla \cdot \sigma)
&= U_j \partial_i \sigma_{ij} \\
&= \partial_i (U_j \sigma_{ij}) - \sigma_{ij} \partial_i U_j \\
&= \nabla \cdot (U_j \sigma_{ij}) - \frac{1}{2} \sigma_{ij} ( \partial_i U_j + \partial_j U_i) \\
&= \nabla \cdot (U_j \sigma_{ij}) - \sigma_{ij} D_{ij}
\end{aligned}
$$
现在，我们用双点乘符号表示$A\_{ij} B\_{ij}$，则：
$$\vec U \cdot(\nabla \cdot \sigma) = \nabla \cdot (U_j \sigma_{ij}) - \sigma_{ij} : D_{ij}$$
代入原式，可得：
$$
\begin{aligned}
\frac{\d E_k}{\d t} 
&= \iiint_D \vec U \cdot (\nabla \cdot \sigma + \rho \vec f) \d v + \iint_S \frac{1}{2} \rho U^2 (\vec W - \vec U) \cdot \d \vec S \\
&= \iiint_D \nabla \cdot (\vec U \cdot \sigma) \d v - \iiint_D \sigma_{ij}:D_{ij} \d v \\
&+ \iiint_D \vec U \cdot \rho \vec f \d v +
\iint_S \frac{1}{2} \rho U^2 (\vec W - \vec U) \cdot \d \vec S \\
&= \iint_S \vec U \cdot \sigma \cdot \d \vec S + \iiint_D \rho \vec U \cdot \vec f \d v \\
&- \iiint_D \sigma : D \d v + \iint_S \frac{1}{2} \rho U^2 (\vec W - \vec U) \cdot \d \vec S \\
&= P_\text{ext} + P_\text{int} + \iint_S \frac{1}{2} \rho U^2 (\vec W - \vec U) \cdot \d \vec S
\end{aligned}
$$
其中：
$$P_\text{ext} = \iint_S \vec U \cdot \sigma \cdot \d \vec S + \iiint_D \rho \vec U \cdot \vec f \d v$$
表示外力的功率；
$$P_\text{int} = - \iiint_D \sigma : D \d v$$
表示内力（应力）的功率。

从而，我们得到了流体的动能定理：

控制体的动能的变化率等于作用在其上的外力和内力的功率，加上流动导致的动能变化量：
$$\frac{\d E_k}{\d t} = P_\text{ext} + P_\text{int} + \iint_S \frac{1}{2} \rho U^2 (\vec W - \vec U) \cdot \d \vec S$$
若控制体随流体一起运动，则：
$$P_\text{ext} = \frac{\d}{\d t} \iiint_D \frac{1}{2} \rho U^2 \mathrm d v - P_\text{int}$$
{: .theorem}

#### 黏性耗散

我们可以更进一步地讨论内力项：
$$
\begin{aligned} - P_\text{int} 
&= \iiint_D \sigma : D \d v \\
&= \iiint_D (-p \mathbf I + \tau) : D \d v \\
&= \iiint_D (-p \partial_i U_i) \d v + \iiint_D \tau : D \d v \\
&=- \iiint_D p \nabla \cdot U \d v + \iiint_D \tau : D \d v
\end{aligned}
$$
可以看到，其中有两项：
- $$- \iiint_D p \nabla \cdot U \d v $$ 该项与速度散度的相反数成正比，表示流体*压缩*导致的能量变化，对不可压缩流体，该项自然为零。
- $$\iiint_D \tau : D \d v$$ 该项和$\tau$有关，表示黏性导致的能量变化，称为**黏性耗散**，这一项始终非负。

### 流体的机械能守恒

现在我们考虑一个常见的情景：流体从某种机械的一端流向另一端，并在其中与机械发生能量交换。
这种机械可能是涡轮（此时流体向机械做功）或者水泵（此时机械向流体做功）。

我们选择该机械作为控制体，该控制体$D$由三个表面围成：
入口面$S\_1$、出口面$S\_2$以及机械表面$\Sigma$。
$\Sigma$不能穿透，且流体的速度等于表面的速度，即$\vec W = \vec U$，$S\_1,S\_2$视为固定，即$\vec W = 0$。

对流体，我们认为其不可压缩且主动力有势。
设控制体的体积不变，则由于其不可压缩，流量必然处处相等。
特别地，我们认为在两个边界面$S\_1$和$S\_2$上，流体的黏性应力可忽略，即$\tau = 0$。

注意到流体的主动力有势，简单修改动能定理即可得到机械能的计算式：

主动力有势的流体的机械能变化率可由以下公式求得：
$$
\begin{aligned}
\frac{\d E_m}{\d t} &= \frac{\d}{\d t} \iiint_D \rho \left( \frac{1}{2} U^2 + \Psi \right) \d v \\
&= P_\text{ext} + P_\text{int} + \iint_S \rho \left(  \frac{1}{2} U^2 + \Psi \right) (\vec W - \vec U) \cdot \d \vec S
\end{aligned}
$$
{: .proposition}

对于当前的情景，我们可以分别求出外力和内力：

$$P_\text{ext} = \iint_S \vec U \cdot \sigma \cdot \vec n \d S = P_\Sigma - \iint_{S_1 \cup S_2} p \vec U \d \vec S$$
其中$P\_\Sigma$表示机械部分的功率。

$$P_\text{int} = \cancel{- \iiint_D p \nabla \cdot \vec U \d v} + \iiint_D \tau : D \d v$$

由于对机械部分有$\vec W = \vec U$且对出入口有$\vec W = 0$，可以更进一步地简化积分：
$$\iint_S \rho \left(  \frac{1}{2} U^2 + \Psi \right) (\vec W - \vec U) \cdot \d \vec S = - \iint_\textcolor{red}{S_1 \cup S_2} \rho \left(  \frac{1}{2} U^2 + \Psi \right)  \vec U\cdot \d \vec S$$

现在带回原式，可得下列命题：

不可压缩且主动力有势的流体，在机械中的机械能守恒定理可写为：
$$
\begin{aligned}
\frac{\d}{\d t} E_m 
&= \frac{\d}{\d t} \iiint_D \left( \frac{1}{2} U^2 + \Psi \right) \d v \\
&= P_\Sigma - \mathcal D - \iint_{S_1 \cup S_2} \mathcal H \vec U \cdot \d \vec S
\end{aligned}
$$
其中$\mathcal D = \iiint\_D \tau : D \d v$表示黏性耗散，
$\mathcal H = p + \frac{1}{2} \rho U^2 + \rho \Psi$，和伯努利定律中的守恒量相同。
{: .proposition}

该等式右侧第一项表示机械的功率，第二项表示黏性耗散的功率，第三项表示流体交换导致的能量变化。
我们可以重写第三项：
$$ -\iiint_{S_1 \cup S_2} \mathcal H \vec U \cdot \d \vec S = \underbrace{- \iint_{S_1} \mathcal H \vec U \cdot \d \vec S}_{\Phi_1} + \underbrace{\iint_{S_2} \mathcal H \vec U \cdot \d \vec S}_{\Phi_2}$$

从而该命题可以重写：

在机械能守恒的情况下，有：
$$P_\Sigma = \Phi_2 - \Phi_1 + \mathcal D$$
{: .proposition}

### 压头与压头损失

我们可以使用压头来方便地表示能量的变化。

流体的**压头**或**水头**（hydraulic head）表示流体某一截面的平均比能量：
$$H = \frac{\overline \Psi}{\overline Q_v} = \frac{\overline{\iint_S \mathcal H \vec U \cdot \d \vec S}}{\overline{\iint_S \vec U \cdot \d \vec S}}$$
其中$\mathcal H = p + \frac{1}{2}\rho U^2 + \rho \Psi$，通常$\Psi = gh$。
上游截面的压头减下游截面的压头之差，若为负，称为压头损失。
{: .definition}

水力学中的压头通常采用长度的量纲，指当前截面的能量能将该流体对抗重力而推离参考面的高度。

以涡轮机为例，其压头损失与输出功率的关系为：
$$P_\text{涡} = - P_\Sigma = \overline{Q_v} (H_1 - H_2) - \overline{\mathcal D}= \eta \overline{Q_v} (H_1 - H_2)$$
其中$\eta$表示效率。

#### 无限长导管层流的压头损失

现在我们来计算无限长圆柱形导管中层流的压头损失。

有：
$$\mathcal H = p_* + \frac{1}{2} \rho U^2$$
其中
$$p_* = G x_1 + C, \ U = U(x_2, x_3)$$

从而任意两个距离为$L$的截面之间的压头损失（设截面2在截面1下游）为：
$$H_1 - H_2 = \mathcal H_1 - \mathcal H_2 = - GL$$
注意到
$$U_d = - \frac{a^2}{8 \mu} G$$
代入可得：
$$H_1 - H_2 = \frac{8\mu}{a^2} L U_d$$

压头损失与截面之间的距离成线性关系，这种损失称为线性损失。
