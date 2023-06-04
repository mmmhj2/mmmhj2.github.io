---
title: "量子力学导论"
categories: ["波动物理", "量子力学"]
---

本文将以波动物理的观点对量子力学的基础做一些简单的介绍。

## 光与物质的波粒二象性

### 光的波动性

#### 杨氏干涉实验

1801年，英国科学家托马斯·杨让来自同一光源的光通过两个细缝而在光屏上展现出条纹状的干涉图样。
我们设光源位于Z轴上，沿Z轴正方向发射光，两条细缝平行于Y轴，之间的距离为$2a$，中点位于原点处。
可以观察到，光屏上的光强满足：
$$I(x) = 2I_0 \left[ 1 + \cos \left( 2\pi \frac{2ax}{\lambda D} \right) \right]$$
其中$x$是光屏上的点的X坐标，$D$是光屏与细缝的距离，$\lambda$是光的波长。

正如此前所学，这是典型的干涉现象，因此说明光具有波动性。

#### 麦克斯韦方程

英国科学家詹姆斯·克拉克·麦克斯韦在1873年出版《电磁通论》，提出了麦克斯韦方程组，预言了光的本质是电磁波，满足麦克斯韦方程组：
$$
\left\{ 
    \begin{aligned}
        \nabla \cdot \vec E &= \frac{\rho}{\varepsilon_0} \\
        \nabla \cdot \vec B &= 0 \\
        \nabla \times \vec E &= - \frac{\partial \vec B}{\partial t} \\
        \nabla \times \vec B &= \mu_0 \left( \vec j + \varepsilon_0 \frac{\partial \vec E}{\partial t} \right)
    \end{aligned}
\right.
$$
这也说明了光的波动性。

### 光的粒子性

#### 黑体辐射

1900年，德国物理学家马克斯·普朗克通过引入能量子（quantum，复数 quanta），创造性地解决了黑体辐射的理论预言与实验结论不符的问题。
普朗克假设电磁波进行能量交换的最小单位为$E = h \nu$，其中$\nu$为电磁波的波长，$h$为一个常数，后世称为普朗克常数。
当时他认为引入能量子只是出于数学上的便利，而不具有物理含义，完全没有想到这是迈向电磁场的量子理论的第一步。

#### 光电效应

1887年，英国科学家赫兹发现，暴露在光照下的金属能够释出电子，但是此后的科学家们却未能为实验现象提供合理的解释。
具体而言，光电效应具有三个特点：

1. 存在*截止频率*（记为$\nu\_0$）：仅当光照的频率大于金属的截止频率时，才能产生光电效应，这个频率只与金属本身的性质有关，而与光照无关；
2. 存在*遏止电势*（记为$V\_c$）：在发出与接受电子的极板之间施加一个电压，可以影响光电效应产生的电流，具体而言：
   1. 若电压大于遏止电压，那么电流会随电压逐步上升，直至饱和；
   2. 若电压小于遏止电压，那么无论光强如何大，都不会产生光电流；
   3. 遏止电压与光照的强度无关；
   4. 遏止电压与光照的频率和截止频率的差成正比，这是1914年密里根实验发现的。
3. 瞬时发生：从施加光照到光电流出现的时间非常短。

德国科学家阿尔伯特·爱因斯坦借助普朗克能量子的概念解决了这一问题。

首先，电子为了逸出金属，必须对外做功，这个功称为*逸出功*，其值为：
$$W_{ext} = h \nu_0$$

当光子照射到金属上时，其将*全部*能量提供给电子，从而有：
$$h \nu = W_{ext} + E_c$$
其中$E\_c$就是电子逸出之后的动能。

这两个假设就足以解释所有实验现象。

1915年，爱因斯坦在狭义相对论中首次指出，光子是一类特殊的粒子，没有质量，但是具有能量和动量。
其能量和动量之间满足：
$$E = p c$$
除了粒子性之外，光子也具有波动性，其频率为$\nu$，波长为$\lambda$。
其波动性和粒子性通过普朗克-爱因斯坦关系式表示出来：
$$E = h \nu = \hbar \omega = pc \iff p = \frac{h}{\lambda} = \hbar k$$
其中$\omega = 2\pi\nu$、$k = \frac{2\pi}{\lambda}$且$\hbar = \frac{h}{2\pi}$，后者称为约化普朗克常量。
{: .proposition}

### 物质的波动性

#### 电子干涉实验

若我们让光子一个一个地通过杨氏光栅，仍能能在光屏上看到衍射图样，这说明光子并仅仅在两两之间发生干涉，也会与自己发生干涉。
但是，若我们在两条细缝后分别放置一个探测器，那么同时只能有一个探测器激活，并且也不再能观察到衍射图样了。
这说明，测量对量子系统具有重大的影响。
若不对系统进行测量，那么系统位于多个状态的叠加之下，且表现出量子特有的特征，而进行测量之后，系统就会缩减到一个状态上。

这实际上说明了量子系统的概率本质。
通过杨氏光栅的光子携带有整个衍射图样的信息，当与屏幕碰撞时，实际上进行了一次随机试验，这个随机试验的概率分布表现出来就是衍射图样。
因此，量子系统中的粒子的概率是由其波动性确定的。

并非只有光子才能产生干涉。
1961年德国科学家克劳斯·约恩松使用电子成功进行了双缝干涉实验。
在1992年、1999年和2011年，科学家们成功地使用冰冻原子、富勒烯甚至[蛋白质](https://doi.org/10.1038/ncomms1263)这样的大分子观察到了干涉现象。

#### 德布罗意波

1924年，路易·德·布罗意在其博士论文中指出，任何物质都具有波动性，这种波称为物质波或德布罗意波。

德布罗意认为，能量为$E$，动量为$p$的物质的频率为$\nu = \frac{E}{h}$，波长为$\lambda = \frac{h}{p}$。

在量子力学中，各种复杂的波的研究占据重要地位，而傅里叶变换告诉我们，任何复杂的波都可以分解为平面谐波的叠加。
因此，我们直接借用之前的概念，给出波的表示法。

一个沿$\vec e\_x$传播的和自由量子相关的波可以写为：
$$\underline{\psi} = \underline{\psi_0} \exp [i(\omega t - k x)] = \underline{\psi_0} \exp [\frac{i}{\hbar}(Et-px)]$$
{: .proposition}

德布罗意波满足以下方程：
$$i \hbar \frac{\partial \underline{\psi}}{\partial t} = \frac{\hbar^2}{2m} \Delta \underline{\psi} + V(\vec r, t) \underline{\psi}$$
其中$V$是一个与势能相关的函数。
这个方程称为薛定谔方程。
{: .proposition}

这里的正负号的约定和波的约定密切相关，因此可能出现多种不同的符号组合。

## 海森堡不确定性原理

物体的量子性质阻止我们同时精确地测量其位置与速度。
具体而言，我们有以下定理：

在给定瞬间测量物体的X轴位置$x$与其动量$p\_x$，其不确定度满足：
$$\Delta x \Delta p_x \ge \frac{\hbar}{2}$$
其他两轴同理。
{: .theorem}

这个测不准原理和傅里叶变换的性质密切相关。

在此前，我们定义平面波的形式为：
$$\underline{\psi} = \underline{\psi_0} \exp [i(\omega t - k x)] = \underline{\psi_0} \exp [\frac{i}{\hbar}(Et-px)]$$
既然$\omega$和$t$之间具有傅里叶变换的性质，那么$k$和$x$之间也具有这种性质。
傅里叶变换可以实现波函数时域和频域之间的变换，也能实现其*坐标空间*和*动量空间*之间的变换。
从而，位置和距离是一组关于傅里叶变换对称的量。
同样的关系也适用于能量和时间，从而我们也有：
$$\Delta t \Delta E \ge \frac{\hbar}{2}$$

## 波函数的概率阐释

### 概率幅

在光学和声学中，波展示出的物理量的强度，即其能量，和振幅的平方成正比。
同理，在波函数中，某个具体状态下的概率并非与其振幅成正比，而是和振幅的平方成正比。

具体而言，波函数表示了物体在某一状态下的*概率幅*，即物体处于某一状态的概率密度与其模长的平方成正比：
$$\mathcal P(M,t) = k | \underline{\psi}(M,t) |^2, \; k \in \mathbb R$$
物体在给定时间$t$出现在$M$点附近一体积元中的概率为：
$$\mathrm d P = k | \underline{\psi}(M,t) |^2 \mathrm d \tau$$
该常数是归一化常数，因为我们要求概率的积分始终为一：
$$\iiint k | \underline{\psi}(M,t) |^2 \mathrm d \tau = 1$$

这种对波函数振幅的概率诠释是*哥本哈根诠释*的基础。

### 概率阐释与干涉实验

在此前的干涉实验中，我们知道，如果在进入细孔之前观察物体，那么就不会发生干涉，此时物体出现在光屏上任意一点的概率为：
$$\mathcal P = | \underline{\psi_1} |^2 + | \underline{\psi_2} |^2$$
其中$\psi\_1, \psi\_2$表示通过两个孔对应的波函数。

而如果不进行观察，那么就会发生干涉，此时概率为：
$$\mathcal P = | \underline{\psi_1} + \underline{\psi_2} |^2$$

单个电子发生干涉，产生的干涉图样的本质就是其概率密度在光屏上的分布。
而观察这一行为显然对电子产生了影响。

如果我们把两个不同的波函数看作两个不同的基底，那么上面这两个式子可以理解为：
在没有进行观测时，波函数是多个基底的线性组合，其范数的平方就是先将各个基底上的分量加和再计算平方；
而进行观测后，波函数立刻变化为向某个基底的投影，从而其范数的平方变为先投影计算平方再加和。
这种投影使得波函数的状态减少，也称为“坍缩”，从而丧失了波动性而展现出粒子性。

我们说量子具有以下原理：

（波尔互补性原理）量子的波动性和粒子性不可能被同时观测到。
{: .theorem}

### 波包

单色平面波是一个物理模型，并不能作为现实中存在的波函数来使用。
因此，我们使用波包的概念来构建波函数。

波函数由以下式子定义：
$$\psi(\vec r, t) = \frac{1}{(2\pi\hbar)^{3/2}} \int \phi(\vec p) e^{i(\vec p \cdot \vec r - Et)/\hbar} \mathrm d \vec p$$
从而波函数的傅里叶变换为$\phi(\vec p) e^{-i\frac{Et}{\hbar}}$
我们主要研究一维空间。
在一维空间中，归一化系数变为$\frac{1}{\sqrt{2\pi\hbar}}$。
{: .definition}

我们尝试把这个函数对位置求导，这在之后的分析中常常用到。
$$\frac{\mathrm d \psi}{\mathrm d x} = \frac{1}{\sqrt{2\pi\hbar}} \int \phi(\vec p) \frac{ip}{\hbar} e^{ipx/\hbar} \mathrm d p$$
注意到该函数对位置求导相当于在傅里叶变换的函数上乘$\frac{ip}{\hbar}$，这与此前学习的傅里叶变换和拉普拉斯变换的性质相同。

这里我们可以看出，对一般的信号而言，傅里叶变换实现了时域和频域的变换，而对波函数，傅里叶变换实现了位置空间和动量空间的转换。

### 动量的分布

首先从简单的方面入手，尝试计算位置的期望：
$$<x> = \int x | \psi(x) |^2$$

然后求出动量的期望：
$$<p> = \int p | \psi(x) |^2 \mathrm d x$$
然而，量子不确定性意味着$p$和$x$之间不存在函数关系，因此我们不能使用这个式子计算积分，我们只能使用这个式子：
$$<p> = \int p | \phi(p) |^2 \mathrm d p = \int \phi(p)^* \, p \, \phi(p) \mathrm d p$$
所以我们需要找到将$\phi(p)$和$\psi(x)$关联起来的关系，即上文所述的傅里叶变换。

我们尝试构造出已有的结构：
$$\int \phi(p)^* \, p \, \phi(p) \mathrm d p = \int \phi(p)^* \frac{\hbar}{i} \frac{ip}{\hbar} \phi(p) \mathrm d p$$
然后同时对$\frac{ip}{h}\phi(p)$和$\phi(p)^*$使用傅里叶逆变换，得到：
$$\int \phi(p)^* \frac{\hbar}{i} \frac{ip}{\hbar} \phi(p) \mathrm d p = \int \psi(x)^* \frac{\hbar}{i} \frac{\mathrm d \psi(x)}{\mathrm d x} \mathrm d x$$

这意味着，观测一个物体的动量（即求期望），等于在其波函数的概率积分上应用一个算符$\frac{\hbar}{i} \frac{\partial}{\partial x}$。
对于观测位置，我们也有：
$$<x> = \int x | \psi(x) |^2 \mathrm d x = \int \psi(x)^* \, x \, \psi(x) \mathrm d x$$
从而相当于应用一个算符$x$。
我们马上研究这个概念。

### 可观测量

任何一个物理量$A$都可以和一个**可观测量**$\hat{A}$相关。
可观测量是一个*厄米算符*（也称*自伴算符*），即其满足：
$$\int \psi_1^* [\hat A \psi_2] \mathrm d x = \int [\hat A \psi_1^*] \psi_2 \mathrm d x$$
且物理量被观测出的值，即其期望（或平均值），等于：
$$<a>_t = \int \psi^*(\vec r, t) [\hat A \psi(\vec r, t)] \mathrm d x$$
{: .definition}

可观测量对应的物理量可能的取值正是其特征值。

#### 矩阵表示与波函数表示

在上面的定义中，时刻记得波函数是一个矢量，从而其之间的乘法实际上是*内积*。
我们假设系统的维数有限，了解到这一点后，我们可以将所有式子写成行向量与列向量相乘的形式。

记得在复数内积空间，即希尔伯特空间中，计算内积不仅需要转置，还需要进行共轭。
我们记矩阵$A$的共轭转置，也称厄米共轭或厄米转置为$A^\dagger$

从而厄米算符表示共轭转置等于其自己的矩阵：$\hat{A}^\dagger = \hat{A}$。
代入定义中的式子，即可发现：
$$\psi_1^* [\hat A \psi_2] = \langle \psi_1 | \hat A \psi_2  \rangle = \langle \hat{A}^\dagger \psi_1 | \psi_2 \rangle = \langle \hat A \psi_1 | \psi_2 \rangle = [\hat A \psi_1^*] \psi_2$$
从而这两个定义是等价的。

上面这个式子启发我们，内积中的尖括号与共轭转置具有非常强的对应关系，因此我们记希尔伯特空间中的一个向量为$\left\|x\right>$，其共轭转置为$\left<x\right\|=\left\|x\right>^\dagger$。
这种表示方法就是狄拉克记号，常用于量子力学的矩阵表示之中。

由于本笔记以波动物理为主，因此不使用狄拉克记号，而是继续使用上文使用的波函数表示。

### 可观测量与物理量的对应

我们注意到，对位置坐标以及位置矢量，有：
$$\hat x = x, \; \hat y = y, \; \hat z = z, \; \hat {\vec r} = \vec r$$
而对于动量，我们有：
$$\hat p_x = \frac{\hbar}{i} \frac{\partial}{\partial x}, \; \hat{\vec p} = \frac{\hbar}{i} \nabla$$
对于动能，有：
$$
\hat{E_c} 
= \frac{ { \hat{\vec{p}} }^2 }{2m} 
= \frac{1}{2m} \left( \frac{\hbar}{i} \nabla \right)^2 
= - \frac{\hbar^2}{2m} \Delta
$$
对于势能，有：
$$\hat V(\vec r) = V(\vec r)$$
对于能量，有：
$$\hat H = - \frac{\hbar^2}{2m} \Delta + V(\vec r)$$
而对于角动量，有：
$$\hat L = \hat r \times \hat p = \frac{\hbar}{i} \vec r \times \nabla$$

可观测量为“观测”这一重要的量子力学概念提供了数学意义：
对一个物理量的观测，相当于对其波函数的$L_2$内积上应用一次自伴算子。
而被观测的物理量的值恰好就是其可观测量的特征值。

在上面的关系中，我们不难看出，可观测量和对应的物理量一样，具有很多可以运算的性质。
然而，可观测量以及量子力学中使用的期望，究竟在什么程度上和经典力学的物理量对应呢？
这个问题需要从薛定谔方程的解中寻找答案。

## 自由粒子的薛定谔方程

自由粒子指不受力且势能为零的粒子，此时其薛定谔方程可写为：
$$i \hbar \frac{\partial \psi(x,t)}{\partial t} = \frac{\hbar^2}{2m} \frac{\partial^2 \psi^2(x,t)}{\partial x^2}$$

我们考虑利用傅里叶变换在动量空间求解这个偏微分方程：
$$
\begin{aligned}
\psi(x,t) &= \frac{1}{\sqrt{2\pi\hbar}} \int \phi(p) e^{-ipx/\hbar} \mathrm d p \\
\frac{\partial \psi(x,t)}{\partial x} &= \frac{1}{\sqrt{2\pi\hbar}} \int \phi(p) \left( -\frac{ip}{\hbar} \right) e^{-ipx/\hbar} \mathrm d p \\
\frac{\partial^2 \psi(x,t)}{\partial x^2} &= \frac{1}{\sqrt{2\pi\hbar}} \int \phi(p) \left( -\frac{p^2}{\hbar^2} \right) e^{-ipx/\hbar} \mathrm d p
\end{aligned}
$$
这意味着：
$$\mathcal F[\frac{\partial^2 \psi(x,t)}{\partial x^2}] = \left( -\frac{p^2}{\hbar^2} \right) \phi(p,t)$$
注意到我们只对位置变量$x$进行傅里叶变换。
把方程两边同时进行关于位置变量的傅里叶变换：
$$i\hbar \frac{\partial \phi(p,t)}{\partial t} = \left( -\frac{\hbar^2}{2m} \right) \left( -\frac{p^2}{\hbar^2} \right) \phi(p,t)$$
化简可得：
$$i \hbar \frac{\partial \phi(p,t)}{\partial t} = \frac{p^2}{2m} \phi(p,t)$$
从而其解为：
$$\phi(p,t) = \phi(p,0) e^{i \frac{p^2}{2m\hbar}t}$$
再进行傅里叶逆变换，可得：
$$\psi(x,t) = \frac{1}{\sqrt{2\pi\hbar}} \int \phi(p,0) e^{\frac{i}{\hbar}(px-\frac{p^2}{2m}t)} \mathrm d p$$

### 经典力学中的动量

在经典力学中，我们有：
$$p = m \frac{\mathrm d x}{\mathrm d t}$$
那么在量子力学中，动量和位置的期望是否仍然满足这一关系？

我们有：
$$
\begin{aligned}
m \frac{\mathrm d \langle x \rangle}{\mathrm d t} 
&= m \frac{\mathrm d}{\mathrm d t} \int \hat x \psi^*(x,t) \psi(x,t) \mathrm d x \\
&= m (\int \hat x \psi^* \frac{\mathrm d \psi}{\mathrm d t} \mathrm d x + \int \hat x \frac{\mathrm d \psi^*}{\mathrm d t} \psi \mathrm d x) \\ 
\end{aligned}
$$
代入薛定谔方程，分部积分然后化简，可得原式确实等于$\langle p \rangle$。
现在，又根据帕塞瓦尔等式，有：
$$\langle p \rangle = \int p |\phi(p,t)|^2 = \int p |\phi(0,t)|^2 = p_0$$
从而自由粒子的动量守恒，这与经典力学中的动量吻合。

## 常势能下粒子的基态

具有势能的粒子的薛定谔方程具有以下形式：
$$i\hbar\frac{\partial \psi}{\partial t} = \frac{\hat p^2}{2m} \psi + V(\hat {\vec r}, t) \psi$$
等式右边具有一个熟悉的结构，我们可以单独研究它。

### 哈密顿量

粒子的**哈密顿量**是一个算子，是表征了粒子动能和势能的总和的可观测量：
$$\hat H = \frac{\hat p^2}{2m} + V(\hat{\vec r}, t)$$
从而薛定谔方程可写为：
$$i\hbar\frac{\partial \psi}{\partial t} = \hat H \psi$$
{: .definition}

哈密顿量是一个把线性函数映为线性函数的厄米函数。
厄米函数的特征值总为实数，因此哈密顿量的特征值都是实数，这些特征值即为粒子的*基态能量*。

设哈密顿量的一个特征值和对应的特征向量为$E\_a$和$\psi\_a$，满足：
$$\hat H \psi_a = E_a \psi_a$$
其中特征向量$\psi\_a$的列向量也称为其*本征态*。
则其对应的薛定谔方程和其解为：
$$i \hbar \frac{\partial \psi_a}{\partial t} = E_a \psi_a \iff \psi_a(x,t) = \psi_a(x, 0)e^{i E_a t/\hbar}$$
注意到其模方，即概率密度，与时间无关，从而其任何可观测量与时间无关。
{: .proposition}

我们在代数中已经证明，有限维的厄米函数一定可以对角化，从而其特征向量张成的空间就是全空间。
对无限维的厄米函数，如哈密顿量，这一命题依然（部分）成立，因此哈密顿量的特征向量构成了解的一组基底，而薛定谔方程的解总是可以表示为这些特征向量的线性叠加。

薛定谔方程的解可以表示为：
$$\psi(x,t) = \sum_a C_a \psi_a(x) e^{-iE_a t/\hbar}$$
其中$\psi\_a(x)$表示$\psi\_a(x,0)$。
{: .proposition}

这为我们求解薛定谔方程提供了有力的武器。

### 势差

### 势垒

### 无限方势阱

### 有限方势阱
