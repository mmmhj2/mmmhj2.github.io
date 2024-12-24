---
layout: single_legacy
title: "重访电磁感应"
categories: "电磁学"
date: 2022-11-30 20:40:00 +0800
---

在高中的学习中，我们已经知道：变化的磁场产生电场。
这一点可由麦克斯韦方程组验证：
$$
\begin{aligned}
\nabla \cdot \vec E (M,t) & = \frac{\rho(M,t)}{\epsilon_0} \\
\nabla \cdot \vec B (M,t) & = 0 \\
\nabla \times \vec E (M, t) & = - \frac{\partial \vec B}{\partial t}  (M, t)\\
\nabla \times \vec B (M, t) & = \mu_0 \vec j (M, t) + \mu_0 \epsilon_0 \frac{\partial \vec E}{\partial t}(M, t)
\end{aligned}
$$
第三项方程，也称麦克斯韦-法拉第方程，给出了电场的旋度与磁场的时变之间的关系。

在本文中，我们利用磁准静态假设来研究电磁感应。
之前，我们已经研究过磁准静态假设了，我们知道，在此状态下，静磁场有关的公式仍然可以使用。
接下来，我们分两种情况来讨论电磁感应：动生电动势和感生电动势。

## 感生电动势

首先，我们需要知道电动势指的是什么。
回忆一下高中物理教科书上的内容：

**电动势**是反映电源把其他形式的能转换成电能的本领的物理量。
{: .definition}

这个定义是感性、定量的，而我们需要更加理性、定性的定义，以便于进行计算与论证。

在电路中，我们知道，载流子在电路中做的功等于其电荷量乘上电势降。
那么，根据能量守恒定律，一定有元件为其提供能量。
从而，我们对电动势有如下定量的定义：

在闭合回路$\Gamma$中，电荷$q$受非静电力$\vec F$所接受的功为
$$
W_e = \oint_{\Gamma} \vec{F} \cdot \mathrm{d} \vec{l} = q e_N
$$
其中，$e_N$即为该电路的电动势。
{: .definition}

在电磁感应中，所谓非静电力就是感生电场的库仑力，此时有
$$
\begin{aligned}
q e_N 
&= \oint_{\Gamma} \vec{F} \cdot \mathrm{d} \vec{l} \\
&= \oint_{\Gamma} q \vec{E} \cdot \mathrm{d} \vec{l} \\
\iff e_N &= \oint_{\Gamma} \vec{E} \cdot \mathrm{d} \vec{l}
\end{aligned}
$$
从而，感生电场的电动势就是其在电路上的积分。

我们希望得出感生电场与磁场之间的关系，注意电标势中就有磁场对时间的导数，带入即有：
$$
\begin{aligned}
e_N 
&= \oint_{\Gamma} \vec{E} \cdot \mathrm{d} \vec{l} 
= \oint_{\Gamma} - \nabla V - \frac{\partial \vec A}{\partial t} \mathrm d \vec l \\
&= - \underbrace{\oint_{\Gamma} \nabla V \mathrm d \vec l}_{\text{有势场的环路积分为零}} - 
\oint_{\Gamma} \frac{\partial \vec A}{\partial t} \mathrm d \vec l \\
&= - \oint_{\Gamma} \frac{\partial \vec A}{\partial t} \mathrm d \vec l \\
\end{aligned}
$$

对于感生电动势，我们可以直接带入麦克斯韦方程，然后使用斯托克斯公式：
$$
\begin{aligned}
e_N &= \oint \vec E \cdot \mathrm d \vec l = \iint \nabla \times \vec E \mathrm d \vec S \\
&= \iint - \frac{\partial \vec B}{\partial t} \cdot \mathrm d \vec S 
= - \frac{\partial}{\partial t} \iint \vec B \mathrm d \vec S \\
&= - \frac{\partial \Phi}{\partial t}
\end{aligned}
$$
当然也可以在感生电场的式子里带入$\nabla \times \vec A = \vec B$。

从而，我们得出了感生电动势的法拉第定律：

闭合回路在变化的磁场下产生的感生电动势$e$为
$$
e(t) = - \frac{\partial \Phi}{\partial t}
$$
感生电场为
$$
\vec E = - \frac{\partial \vec A}{\partial t}
$$
其中$\Phi$为闭合回路围成的任意面积的磁通量，方向由右手定则确定。
{: .proposition}

磁场的散度为零，这保证由回路张成的任意面积下求得的磁通量相同。

此处的负号就是楞次定律：
感生电动势产生的磁场必然对抗磁通量的变化。

## 动生电动势

我们知道，导线如果切割磁感线，也会产生电动势。
但是，如果以地面为参考系，磁场并不会发生变化。
因此，我们需要以运动的部分为参考系来仔细考察，这需要我们进行参考系的转换。

### 伽利略变换与电磁场

假设运动的导线上$M$点处有一个点电荷，电荷量为$q$，我们定义以下两个参考系：
- 参考系1：地面参考系；
- 参考系2：导线参考系。
导线参考系以$\vec v_e$的速度匀速相对地面参考系运动，从而两个系都是惯性系。
记参考系1中$M$点的场为$\vec E_1, \vec B_1$；
记参考系2中$M$点的场为$\vec E_2, \vec B_2$。
根据经典力学，我们知道物体的加速度和惯性参考系无关，从而在两个系中只受洛伦兹力的电荷，其受的洛伦兹力也是一样的。
我们有：
$$
\begin{aligned}
\vec F_1 = q \left( \vec E_1 + \vec v_{M/1} \times \vec B_1 \right)
&= q \left( \vec E_2 + \vec v_{M/2} \times \vec B_2 \right) = \vec F_2 \\
\vec E_1 + \left( \vec v_{M/2} + \vec v_e \right) \times \vec B_1
&= \vec E_2 + \vec v_{M/2} \times \vec B_2 \\
\vec E_1 + \vec v_e \times \vec B_1 + \vec v_{M/2} \times \vec B_2
&= \vec E_2 + \vec v_{M/2} \times \vec B_2 \\
\end{aligned}
$$
从而我们得出
$$
\left\{
\begin{aligned}
\vec E_2 &= \vec E_1 + \vec v_e \times \vec B_1 \\
\vec B_2 &= \vec B_1
\end{aligned}
\right.
$$

这一变换有两大前提：
首先，系统的速度不能过快，否则应使用洛伦兹变换；
其次，系统应处在磁准静态下，即系统中的电荷相对磁场极小，否则会出现矛盾。
如果使用洛伦兹变换，则场的准确结果为：
$$
\left\{
\begin{aligned}
\vec E_\parallel &= \vec E_\parallel^\prime \\
\vec E_\perp &= \gamma_e \left( \vec E_\perp^\prime - \vec v_e \times \vec B_\perp^\prime \right) \\
\vec B_\parallel &= \vec B_\parallel^\prime \\
\vec B_\perp &= \gamma_e \left( \vec B_\perp^\prime + \frac{1}{c^2} \vec v_e \times \vec E_\perp^\prime \right)
\end{aligned}
\right.
$$
下标表示与相对速度垂直或平行的分量，$\gamma_e = \frac{1}{\sqrt{1-\frac{v_e^2}{c^2}}}$。
此结果普遍适用。
{: .remark}

### 动生电动势的计算

我们直接利用定义计算电动势：
$$
\begin{aligned}
W_e &= \oint q \vec E_2 \cdot \mathrm d \vec l = q \oint \vec E_2 \cdot \mathrm d \vec l \\
&= q \oint \left( \vec E_1 + \vec v_e \times \vec B \right) \cdot \mathrm d \vec l \\
&= q \left( \underbrace{\oint \vec E_1 \cdot \mathrm d \vec l}_{保守场环路积分为零} + \oint \left( \vec v_e \times \vec B \right) \cdot \mathrm d \vec l \right) \\ 
&= q \oint \left( \vec v_e \times \vec B \right) \cdot \mathrm d \vec l \\
&= q e_L
\end{aligned}
$$
注意$E_1$是环境中的静电场，从而一定是保守场，而在有时变磁场的电磁波中，电场不一定是保守场（参见电标势）。

这样，我们就算出了动生电动势的大小，同时由最后一个等式也能求出动生电场。

闭合回路在磁场下的动生电动势为：
$$
e_L = \oint_{\Gamma} \left( \vec v_e \times \vec B \right) \cdot \mathrm d \vec l
$$
动生电场为：
$$
\vec E = \vec v_e \times \vec B
$$
其中$v_e$为相对磁场（默认惯性系）的速度。
{: .proposition}

如果整个回路只有一条直导线在运动，则该等式退化为高中所学的等式$E = BLv$。

### 安培力

类似感生电动势的楞次定律，我们希望找出动生电动势的楞次定律。
这表示，动生电动势会对运动部分施加一个与运动方向相反的反作用力。
这个力就是**安培力**，其元力为：
$$
\mathrm d \vec F_A = i \mathrm d \vec l \times \vec B
$$
其中，$i \mathrm d \vec l$称为**元电流**，方向约定为与电流同向。

同样的，如果整个回路只有一条直导线在运动，则该等式退化为高中所学的等式$F = BIL$。

## 法拉第电磁感应定律

在高中的学习中，我们已经知道，感生电动势和动生电动势可统一为感应电动势，即磁通量的变化会产生感应电势。
这一节，我们来证明这一定律，即动生电动势也可表示为磁通量的变化。
始终注意，我们要求电磁场处于磁准静态下。

我们假设回路在$t$时间围成的面积为$\Sigma_t$，在一微小时间后其围成的面积为$\Sigma_{t + \mathrm d t}$，此时间内回路划过的面积为$\Sigma_{\text{侧}}$。
这三个面积围成一个闭合的体积，从而磁场在其上的通量之和为零，因为磁场的散度为零。
我们有：
$$
\newcommand{\oiint}{\,\bigcirc\kern{-13.5pt}\int\kern{-7.2pt}\int}
\begin{aligned}
0 &= \oiint \vec B \cdot \mathrm d \vec S \\
&= \iint_{\Sigma_t} \vec B \cdot \mathrm d \vec S +
\iint_{\Sigma_{t + \mathrm d t}} \vec B \cdot \mathrm d \vec S +
\iint_{\Sigma_{\text{侧}}} \vec B \cdot \mathrm d \vec S
\end{aligned}
$$
这里注意所有面积都是有向的。
如果我们规定保持一个环路的方向不变，那么一定有一个通量为负数，具体可见下图：

![](/assets/em/directed-surfaces.svg)
{: .align-center}

$$
\begin{aligned}
0 &= \Phi(t) - \Phi(t + \mathrm d t) + \iint_{\Sigma_{\text{侧}}} \vec B \cdot \mathrm d \vec S \\
&= \Phi(t) - \Phi(t + \mathrm d t) + \oint_{\Gamma} \vec B \cdot \left( \mathrm d \vec u \times \mathrm d \vec l \right)
\end{aligned}
$$
这里我们将侧面积展开成了长度微元和位移微元的积分，具体可见下图：

![](/assets/em/lateral-area.svg)
{: .align-center}

我们知道，对于安培力，其元功为：
$$
\delta W_A = \vec F_A \cdot \mathrm d \vec u 
= i \left( \mathrm d \vec l \times \vec B \right) \cdot \mathrm d \vec u
= i \vec B \cdot \left( \mathrm d \vec u \times \mathrm d \vec l \right)
$$
从而在上述式子中在左右两边同时乘上$i$，再移项可得：
$$
\begin{aligned}
i \left( \Phi(t + \mathrm d t) - \Phi(t) \right)
&= i \oint_{\Gamma} \vec B \cdot \left( \mathrm d \vec u \times \mathrm d \vec l \right) \\
&= \delta W_A \\
\iff i \frac{\mathrm d \Phi}{\mathrm d t} &= P_A 
\end{aligned}
$$

由于安培力的功率为$P_A = - e_L i$，$- \frac{\mathrm d \Phi}{\mathrm d t} = e_L$

## 总结

- 感生和动生的电场和电动势分别为：
 + 感生：$\vec E = -\frac{\partial \vec A}{\partial t}$,$e = - \frac{\partial \Phi}{\partial t}$
 + 动生：$\vec E = \vec v_e \times \vec B$,$e = \oint_{\Gamma} \left( \vec v_e \times \vec B \right) \cdot \mathrm d \vec l$
- 电磁感应的电场与电动势的关系为：
$$
e = \oint_{\Gamma} \vec E \cdot \mathrm d \vec l
$$
- 法拉第电磁感应定律：（只与时间有关时为全导数）
$$
e = - \frac{\partial \Phi}{\partial t}
$$
其中的负号即为楞次定律。
- 安培力：
$$
\mathrm d \vec F = i \mathrm d \vec l \times \vec B
$$
力电耦合关系：其功率和电磁感应产生的电功率大小相等
$$
P_A = -ei = -P_{\text{电功率}}
$$
^
- 电磁感应产生的电场并不是保守场。
- 同时发生感生和动生感应时，感应电场为：
$$
\vec E = - \frac{\partial \vec A}{\partial t} + \vec v_e \times \vec B
$$
感应电动势为其在回路上的积分。
- 感生和动生电势的统一只有在相对论环境下才能证明。
{: .remark}

## 自感与互感

当回路中有电流时，根据麦克斯韦方程，电路可能会产生磁场。
对于这种情况，我们将流过电路的磁通量分为两个部分：
$$
\Phi(t) = \underbrace{\iint_{M \in S} \vec B_{\text{外部}} \cdot \vec S (M)}_{\Phi_{\text{外部}}} +
 \underbrace{\iint_{M \in S} \vec B_{\text{自发}} \cdot \vec S (M)}_{\Phi_{\text{自发}}}
$$

我们分别研究这两个部分。

### 自感与自感系数

根据毕奥—萨伐尔定律，电流元产生的磁场为$\frac{\mu_0}{4\pi} i \mathrm d \vec l \times \vec r \frac{1}{r^3}$
从而，自感磁通量可以写为：
$$
\begin{aligned}
\Phi_{\text{自发} }
&= \iint \vec B \mathrm d \vec S \\
&= \iint \left[ \oint \frac{\mu_0}{4\pi} i \mathrm d \vec l \times \vec r \frac{1}{r^3} \right] \mathrm d \vec S \\
&= i \underbrace{\iint \left[ \oint \frac{\mu_0}{4\pi} \mathrm d \vec l \times \vec r \frac{1}{r^3} \right] \mathrm d \vec S}_{\text{常数}}
\end{aligned}
$$

我们将这个与几何参数相关的常数称为**自感系数**，记作$L$，单位为亨利。
则自感磁通量可以写为$\Phi = L i$。

当外磁场不存在时，变化的自感磁场可以引起自感电动势，有法拉第电磁感应定律：
$$
e(t) = - \frac{\mathrm d \Phi_{\text{自}}}{\mathrm d t} = - \frac{\mathrm d Li(t)}{\mathrm d t}
$$
很多情况下，自感磁场相对于外部磁场可以忽略不记。

接下来我们来看看能量的情况。
若电感在空间中单独存在，则电磁场的能量（忽略电场的能量）为：
$$
E = \iiint \frac{\left( \vec B \right)^2}{2\mu_0} \mathrm d \tau = \frac{1}{2} L i^2 
$$

### 互感与互感系数

我们假设空间中有两个足够接近的电路，则电路一产生的磁场在电路二中的通量为$\Phi_{1 \to 2}$，反之为$\Phi_{2 \to 1}$。
我们称这两个电路为*耦合*的，电路一中电流的改变会改变磁场，从而改变电路二的电流。
有以下结论：

我们记电路一对电路二的感应系数为$M_{12}$，则有
$$
\Phi_{1 \to 2} = M_{12} i1
$$
同理有
$$
\Phi_{2 \to 1} = M_{21} i2
$$

有
$$
M_{12} = M_{21}
$$
从而我们称这个系数为互感系数。
{: .theorem}

$$
\begin{aligned}
\Phi_{2 \to 1}
&= \iint_{C1} \vec B_2 \mathrm d \vec S = \iint_{C1} \nabla \times \vec A_2 \mathrm d \vec S = \oint_{C1} \vec A_2 \mathrm d \vec l_1 \\
&= \oint_{C1} \left( \frac{\mu_0}{4\pi} \oint_{C2} \frac{\vec j_2 \mathrm d \vec l_2}{r} \right) \mathrm d \vec l_2 \\
&= i_2 \oint_{C1} \oint_{C2} \frac{\mu_0}{4 \pi r} \mathrm d \vec l_2 \mathrm d \vec l_1
\end{aligned}
$$
可以发现，电流后的系数对于两个回路是相等的。
{: .proof}

从而，如果没有外电场，那么空间中的磁场为：
$$
\vec B (M) = \vec B_1 (M) + \vec B_2 (M)
$$
且磁通量可写为：
$$
\left\{
\begin{aligned}
\Phi_1 &= L_1 i_1 + M i_2 \\
\Phi_2 &= M i_1 + L_2 i_2
\end{aligned}
\right.
$$
磁场的能量为：
$$
E = 
\frac{1}{2} L_1 i_1^2 + 
\frac{1}{2} L_2 i_2^2 + 
M i_1 i_2  
$$

综合自感和互感，我们可以定义磁耦合系数：
$$
m = \frac {\left| M \right|}{\sqrt{L_1 L_2}} \quad 0 \le m \le 1
$$
磁耦合系数表征了两个电路的自感和互感的相对关系。
如果$m$很小，说明漏磁严重。

如果一个线圈产生的通量完全穿过另一个线圈，此时$m = 1$，我们称其为全耦合；
如果$m < 0.5$，称其为松散耦合；
如果$m > 0.5$，称其为紧密耦合。

### 广义欧姆定律

我们综合以上研究，给出电磁感应与自感的线圈的等效电路。

![](/assets/em/generalized-ohms-law.svg)
{: .align-center}

对感应电动势，我们采用电源约定，即其电动势上升方向与电流方向相同。
对线圈和电阻，我们采用用电器约定，即其电动势下降方向与电流方向相同。
应该注意到，在前文的研究之中，所有电动势（包括线圈的电动势）都是以电源约定给出的。

此时有：
$$
\begin{aligned}
E_A - U_L - U_R + e &= E_B \\
E_A - E_B &= U_L + U_R - e \\
&= R i + L \frac{\mathrm d i}{\mathrm d t} + \frac{\mathrm d \Phi}{\mathrm d t}
\end{aligned}
$$
