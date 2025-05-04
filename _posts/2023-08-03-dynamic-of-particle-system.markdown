---
title: '质点系动力学'
categories: ['理论力学']
---

为了求解刚体的动力学问题，我们还需要研究刚体的运动学。
刚体的运动按求解难易程度可分为平面运动，定点运动和任意运动，我们将分别考虑这些问题。
在此之前，我们先来考虑更一般的情况：质点系的动力学。

下面的命题只作为介绍，而不加以证明。

## 质点的相对运动

首先复习一下质点运动学相关的知识。

当我们需要同时在两个参考系之下研究同一质点的运动时，通常我们规定一个参考系是确定的、静止的，称为定参考系，而另一个是运动的，称为动参考系。
通常，我们知道质点在动参考系下的运动和动参考系相对定系的运动，而希望求解质点相对定系的运动。
我们把质点相对定系的速度和加速度称为*绝对速度*和*绝对加速度*，运动称为*绝对运动*；
质点相对动系的速度和加速度称为*相对速度*和*相对加速度*，运动称为*相对运动*；
而动系相对定系的运动称为*牵连运动*。

动系与定系之间存在运动，而动点运动的每一瞬时，动系上都有一点与其重合，该点称为**瞬时重合点**，此点对定系的速度和加速度称为*牵连速度*和*牵连加速度*。
牵连运动通常由拉丁字母下标$e$表示，来自法语`entraînment`，意为“驱动”。

质点的绝对速度和加速度都可以由相对运动和牵连运动导出，关键的两条定理称为速度和加速度合成定理。

### 速度与加速度合成定理

分别研究动点和瞬时重合点的运动，不难发现绝对位移是相对位移和牵连位移的矢量和。
对其求导即可得到速度合成定理。

动点的绝对速度等于其牵连速度与相对速度的矢量和：
$$\vec v_a = \vec v_e + \vec v_r$$
这一定理称为**速度合成定理**。
{: .proposition}

当牵连运动为平移时，加速度也满足类似的关系：

牵连运动为平移时，动点的绝对加速度等于牵连加速度和相对加速度的矢量和：
$$\vec a_a = \vec a_e + \vec a_r$$
{: .proposition}

当牵连运动为定轴转动时，加速度中还有一项科氏加速度：

当牵连运动为定轴转动时，动点的绝对加速度可表示为：
$$\vec a_a = \vec a_e + \vec a_r + \underbrace{2 \vec \omega \times \vec v_r}_{\vec a_c}$$
其中$\vec \omega$牵连的定轴转动的角速度矢量，一般按右手定则确定方向。
{: .proposition}

我们希望证明以上几个命题，但是不采用力学中经常使用的以下标表示坐标系的方式，因为这样较为混乱。
借助仿射变换这一代数工具，我们可以直接将研究任意两个坐标系中的坐标显式地表示出来，然后计算它们的时间导数。
考虑任意两个三维坐标系中的质点的坐标$\vec r$和$\vec r'$，我们有：
$$\vec r' = \Omega \vec r + \vec x,$$
其中$\Omega \in SO(3)$是一个正交矩阵，表示两个坐标系之间的旋转，而$\vec x \in \mathbb R^3$则表示两个坐标系之间的平移。
我们约定$\vec r$所在的坐标系为动系，其坐标称为相对坐标。
对时间求导，可得：
$$\dot{\vec r'}= \dot{\Omega} \vec r + \Omega \dot{\vec r} + \dot {\vec x}.$$
现在考虑正交矩阵对时间的导数，这实际上是一个无穷小旋转并可用李代数相关的知识研究，但这里我们提供一个比较初等的研究方式。
由于矩阵$\Omega$正交，有
$$\Omega^T \Omega = I.$$
两边对时间求导，得到
$$\dot \Omega^T \Omega + \Omega^T \dot \Omega = (\Omega^T \dot \Omega)^T + \Omega^T \dot \Omega = 0.$$
这意味着$\Omega^T \dot \Omega$是一个斜对称矩阵。
而向量左乘一个斜对称矩阵等价于左侧叉乘一个向量，即
$$\exists \vec \omega, \forall \vec a, \; \Omega^T \dot \Omega \vec a = \vec \omega \times \vec a,$$
从而
$$\dot \Omega \vec a = \Omega (\vec \omega \times \vec a).$$
代入原式，得到
$$
\begin{aligned}
\dot {\vec r'} &= \Omega (\vec \omega \times \vec r + \dot{\vec r}) + \dot{\vec x} \\
\vec v_a &= \underbrace{\Omega \dot{\vec r}}_{\vec v_r} + \underbrace{\Omega \vec \omega \times \vec r + \dot{\vec x}}_{\vec v_e}.
\end{aligned}
$$
这就得到了
$$\vec v_a =  \vec v_r + \vec v_e,$$
同时也说明了$\vec \omega$的物理意义，即角速度矢量。
再次求导，得到：
$$\ddot{\vec r'} = \ddot \Omega \vec r + 2 \dot \Omega \dot{\vec r} + \Omega \ddot{\vec r} + \ddot{\vec x}.$$
现在我们需要研究$\ddot \Omega$，对任何矢量$\vec a$：
$$
\begin{aligned}
\ddot \Omega \vec a + \dot \Omega \dot{\vec a} &= \dot \Omega(\vec \omega \times \vec a) + \Omega (\dot{\vec \omega} \times \vec a) + \Omega (\vec \omega \times \dot{\vec a}) \\
\ddot \Omega \vec a & = \Omega(\vec \omega \times \vec \omega \times \vec a) + \Omega(\vec \alpha \times \vec a) \\
&= \Omega (\vec \omega \times \vec \omega + \vec \alpha) \times \vec a.
\end{aligned}
$$
其中$\vec \alpha = \dot {\vec \omega}$。
代回原式，得到
$$\ddot{\vec r'} = \Omega (\vec \omega \times \vec \omega \times \vec r + \vec \alpha \times \vec r + 2 (\vec \omega \times \dot{\vec r}) + \ddot{\vec r}) + \ddot{\vec x}.$$
这就是加速度合成的最一般表达，其中$\vec \omega \times \vec \omega \times \vec r$称为向心加速度，对应的惯性力为离心力；$\vec \alpha \times \vec r$称为欧拉加速度，对应的惯性力为欧拉力；$2 \vec \omega \times \dot {\vec r}$称为科里奥利加速度，对应的惯性力为科里奥利力。
注意这些加速度前面均带有$\Omega$，这意味着这些加速度是在动系中计算的。
现在考虑定轴转动这一特殊情形，有
$$\ddot{\vec x} = 0, $$
从而
$$
\begin{aligned}
\ddot{\vec r'} &= \Omega (\vec \omega \times \vec \omega \times \vec r + \vec \alpha \times \vec r + 2 (\vec \omega \times \dot{\vec r}) + \ddot{\vec r}) \\
\vec a_a &= \underbrace{2 \Omega \vec \omega \times \dot{\vec r}}_{\vec a_c} + \underbrace{\Omega (\vec \omega \times \vec \omega \times \vec r + \vec \alpha \times \vec r)}_{\vec a_e} + \underbrace{\Omega \ddot{\vec r}}_{\vec a_r}.
\end{aligned}
$$
{: .proof}

现在，若假设定系为惯性系，应用牛顿第二定律，可得：
$$m \vec a_a = \vec F \iff m (\vec a_r + \vec a_e + \vec a_c) = \vec F$$
从而，在动系下看来，动点似乎受到了两个虚拟的力：
$$m \vec a_r = \vec F - m \vec a_e - m \vec a_c = \vec F + \vec F_e + \vec F_C$$
这两力称为*牵连惯性力*和*科氏力*。

或者，利用动静法的说法，有：
$$\vec F_{i,a} = \vec F_{i,r} + \vec F_e + \vec F_C$$
即在定系下的惯性力等于动系下的惯性力与牵连惯性力和科氏力之和。

以高中常见的定速圆周运动为例，以圆心为中心建立和动点一同旋转的参考系，在该参考系下，动点是静止且平衡的，但是外力却只有电磁力、拉力或支持力提供的向心力。
这种平衡的原因就是牵连惯性力，在动系中进行受力分析时，纳入惯性力才能让系统平衡，这种惯性力以离心力的形式出现。

容易观察到所有惯性力均与物体的质量成正比，而重力恰好也与物体的质量成正比，这意味着一个问题——重力是否也可能是一种惯性力？
实际上，这正是广义相对论的核心：重力是四维时空中的一种惯性力。

## 质点系的动量定理

质点系中各个质点的动量之和称为质点系的**动量**（momentum）。
设一个具有$n$个质点的质点系中，每个质点的质量为$m\_i$，速度为$\vec v\_i$，那么质点系的动量定义为：
$$\vec p = \sum_{i=1}^n m_i \vec v_i$$
{: .definition}

动量通常记为拉丁字母$p$，来自拉丁语`petere`，意为请求、寻找。

若我们将质点系中每个质点所受的内力和外力利用质点的动量定理分别讨论，则容易看出内力相互抵消，从而只有外力影响系统的动量，这一结论由下一命题总结：

质点系的动量对时间的导数等于作用于质点系上外力的矢量和（主矢）：
$$\frac{\mathrm d \vec p}{\mathrm d t} = \sum_{i=1}^n \vec F_i^\text{外} = \vec F_\text{合}^\text{外}$$
或，质点系的动量在某段时间内的改变量等于外力在该时间内冲量的矢量和（主矢的冲量）：
$$\vec p(t_2) - \vec p(t_1) = \sum_{i=1}^n \vec I_i^\text{外} = \int_{t_1}^{t_2} \vec F_\text{合}^\text{外} \mathrm d t$$
这一结论称为**质点系的动量定理**。
{: .proposition}

当外力的主矢恒为零时，系统的动量保持不变，这一定理称为质点系的动量守恒定理。

### 质心运动定理

运用质点系动量定理研究质点系质心的运动，将质心定义中的位矢对时间求导，然后应用动量定理，不难得出以下命题：

设质点系的质心的加速度为$\vec a\_c$，则：
$$m \vec a_c = \sum_{i=1}^n \vec F_i^\text{外} = \vec F_\text{合}^\text{外}$$
即质点系总质量与质心加速度之数乘等于作用在质点系上外力的主矢。
或表述为：质点系质心的运动，和与质心位置重合、质量与质点系相同的一个假想的质点在受所有外力的情况下的运动相同。
这一命题称为**质心运动定理**。
{: .proposition}

### 变质量质点的动量定理

对改变质量的质点，我们可以用质点系的理论来研究它：

设在$t$时刻，质量为$m$的质点的速度为$\vec v$，质量为$\Delta m$的质点的速度为$\vec u$；
而在$t + \Delta t$时刻，两质点合为一体，速度为$\vec v + \Delta \vec v$。
在这段时间内，系统受到的合外力为$\vec F\_R^\text{外}$，当时间和质量变化足够小时，应用质点系的动量定理并略去高阶无穷小，可得：
$$m \frac{\mathrm d \vec v}{\mathrm d t} = \vec F_R^\text{外} + \frac{\mathrm d m}{\mathrm d t} (\vec u - \vec v) = \vec F_R^\text{外} + \frac{\mathrm d m}{\mathrm d t} \vec v_r$$
其中$\vec v\_r$是$\Delta m$质点相对于另一个质点的相对速度。
这一结论称为变质量质点的动量定理。

## 质点系的动量矩定理

按照动量从质点到质点系的相同推导，我们也可以推广质点系的动量矩的定义。

设一个具有$n$个质点的质点系中，每个质点的质量为$m\_i$，速度为$\vec v\_i$。
取一参考系中*固定*的点$O$，则每个质点对该点的动量矩之和称为系统的**动量矩**（moment of momentum），也称**角动量**（angular momentum）：
$$\vec L_O = \sum_{i=1}^n \vec r_i \times m_i \vec v_i$$
其中$\vec r_i$是中$O$点出发到该质点的矢径。
{: .definition}

将质点的动量矩定理应用于每一个质点，并消去内力，可得质点系的动量矩定理。

质点系对一*固定点*$O$的动量矩对于时间的导数等于作用于其上的外力对该点的矩之和（主矩）：
$$\frac{\mathrm d \vec L_O}{\mathrm d t} = \sum_{i=1}^n \vec r_i \times \vec F_i^\text{外} = \sum_{i=1}^n \vec M_O (\vec F_i^\text{外})$$
这一定理称为**质点系的动量矩定理**。
{: .proposition}

### 对动点的动量矩定理

该定理中要求$O$点必须是一个定点，这为应用该定理带来诸多不便。
现在，我们使用速度合成定理即可研究对动点的动量矩，进而得出对动点的动量矩定理。

设$A$点为一动点，其惯性参考系下的位矢为$\vec r\_A$，建立以其为中心的、相对于惯性系平移的动参考系，设该参考系的速度（即动点的速度，也就是牵连速度）为$\vec v\_A = \vec v\_e$，则：
$$\vec L_O = \vec r_A \times \vec p + \vec r_{AC} \times m \vec v_A + \vec L_A^r$$
其中，$\vec p$为质点系在惯性系下的动量，$\vec r\_{AC}$为质心在动系下的位矢，$\vec L\_A^r$为在质点系在动系中对$A$的动量矩。

特别地，当$A$点与质心重合时，该式可写为可简化为如下命题：

$$\vec L_O = \vec r_C \times \vec p + \vec L_C^r$$
即：质点系对任意固定点的动量矩，等于质点系的动量位于质心时对该点之矩，和质点系相对质心的动量矩的矢量和。
{: .proposition}

将相对动系的动量矩的定义式对时间求导，应用之前提到的动系下的惯性力公式（记得定系是平移的，不存在科氏力），然后分成内力和外力讨论，即可得到相对动点的动量矩定理：

质点系相对动点$A$的动量矩对时间的导数，等于该瞬时作用于质点系上的外力对动点的主矩，与作用于质心的惯性力对该点之矩的矢量和：
$$\frac{\mathrm d \vec L_A^r}{\mathrm d t} = \sum_{i=1}^n \vec M_A (\vec F_i^\text{外}) + \vec r_{AC} \times (- m \vec a_A)$$
其中$\vec a_A$表示$A$点在定系（惯性系）下的加速度。

特别地，当动点$A$与质心重合时，$\vec r\_{AC} = 0$，有以下命题成立：

质点系相对质心的动量矩定理（无论质心是否运动）和相对定点的动量矩定理相同：
$$
\frac{\mathrm d \vec L_C^r}{\mathrm d t} = \sum_{i=1}^n \vec M_C (\vec F_i^\text{外})$$
{: .proposition}

## 质点系的动能定理

首先按照相同的推广方式，我们可以将质点的动能推广到质点系上。

质点系的动能是其中所有质点的动能的总和：
$$T = \sum_{i=1}^n \frac{1}{2} m_i \vec v_i \cdot \vec v_i = \sum_{i=1}^n \frac{1}{2} m_i v_i^2$$
{: .definition}

动能常缩写为拉丁字母$T$，来自法语`travail`，意为劳动、功；
相对地，势能常缩写为拉丁字母$V$，来自法语`voltage`，意为（电）势差。

建立随质心平移的参考系，在此参考系下研究质点的动能，不难发现以下定理：

质点系的动能，等于将质量集中在质心处的一个假想质点按照质心速度移动的动能，加上所有质点在随质心平移的参考系中的动能之和：
$$T = \frac{1}{2} m v_C^2 + \sum_{i=1}^n \frac{1}{2} m_i v_{i,C}^2$$
这一命题称为**柯尼希定理**（König's theorem）。
{: .proposition}

这一命题的显然推论为：平移刚体的动能等于刚体视为质点的动能。

接下来我们给出质点系的动能定理和机械能守恒定理。

质点系动能的微分等于外力的元功和内力的元功之和：
$$\mathrm d T = \sum \delta W^\text{外} + \sum \delta W^\text{内}$$
或，在某一运动过程之中，质点系动能的改变量等于作用与其上的外力和内力的功之和：
$$T_2 - T_1 = \sum W_{1 \to 2}^\text{外} + \sum W_{1 \to 2}^\text{内}$$
这两个等价的命题统称为**质点系的动能定理**。
{: .proposition}

若作用于质点系上的所有外力都是保守力，那么质点系的动能和势能之和在运动过程中保持不变。
这一命题称为**质点系的机械能守恒定理**。
{: .proposition}
