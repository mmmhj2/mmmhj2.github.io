---
layout: post
title: "开放系统及其理论"
categories: thermodynamics
---

$$
\newcommand{\d}{\mathrm{d}}
$$

在热力学中，我们通常研究封闭系统和孤立系统，因为这些系统和外界环境的交互有限，便于研究。
但是现实中，几乎所有热机都是开放系统：内燃机需要不断输入燃料、涡轮只有在流体流动时才能做功。
因此，所有建立在封闭系统的热力学理论，必须能够推广到开放系统，才能指导实践活动。
本文简述一些简单的热力学理论在开放系统的推广。

## 质量守恒

我们定义以下两个矢量来描述物质在系统中和系统间的转移：

- 体积转移矢量$\vec v$；
- 质量转移矢量$\vec j = \mu \vec v$，其中$\mu$表示密度。
{: .definition}

同时定义和其对应的两个速率：

- 体积速率$D(t) = \iint_{M \in S} \vec v (M, t) \cdot \d \vec S (M, t)$，国际制单位为立方米每秒；
- 质量速率$D_m(t) = \iint_{M \in S} \vec v (M, t) \cdot \d \vec S (M, t)$，国际制单位为千克每秒。
{: .definition}

则在无源的情况下，由质量守恒，可得：
$$
\frac{\partial \mu}{\partial t} + \nabla \cdot \left( \mu \vec v (M, t) \right) =
\frac{\partial \mu}{\partial t} + \nabla \cdot \left( \vec j (M, t) \right) = 0
$$
在稳定态下，我们知道系统的各种参数与时间无关，从而有：
$$
\nabla \cdot \left( \vec j (M, t) \right) = 0
$$
这说明这个矢量场是通量守恒的，对任何体积的积分为零。

## 约定与定义

我们总是假设一切流体都在惯性系下。

### 指示功

我们称机器中活动部分对流体所做的功为**指示功**，注意对流体做功则指示功为正。
以元件是否对流体做功为判据将元件分为两类：主动元件和被动元件。
其中主动元件中指示功为正的典型例子有：泵、压缩机、通风风扇；
指示功为负的典型例子有：发动机和涡轮。

### 单位质量表示的物理量

开放系统中流体不断的和外界发生质量交换，从而研究其单位质量下的行为更加方便，也更能突出微观特征。
我们约定以下单位质量表示的物理量：

- 单位质量指示功$w_i$；
- 单位质量内能$u$；
- 单位质量焓$h$；
- 单位质量熵$s$；
- 单位质量体积$v$（即密度的倒数）。

从而我们可以把许多经典等式重写称单位质量的形式。

热力学恒等式：
$$
\left\{
\begin{aligned}
\d U &= T \d S - P \d V \\
\d H &= T \d S + V \d P
\end{aligned}
\right.
\iff
\left\{
\begin{aligned}
\d u &= T \d s - P \d v \\
\d h &= T \d s + v \d P
\end{aligned}
\right.
$$

理想气体状态方程：
$$
PV = nRT \iff Pv = rT , \; r = \frac{nR}{m} = \frac{R}{M}
$$
其中$M$表示摩尔质量。

理想气体满足焦耳定律，从而其内能和焓可写成：
$$
\left\{
\begin{aligned}
\d U &= C_v \d T \\
\d H &= C_p \d T
\end{aligned}
\right.
\iff
\left\{
\begin{aligned}
\d u &= c_v \d T \\
\d h &= c_p \d T
\end{aligned}
\right.
$$
其中$c_p = \frac{C_p}{m}, \; c_v = \frac{C_v}{m}$。

迈耶方程可写为：
$$
C_p - C_v = nR \iff c_p - c_v = r
$$
从而可推出：
$$
c_p = \frac{\gamma}{\gamma - 1} r , \; c_v = \frac{1}{\gamma - 1} r
$$

## 热力学第一与第二定律

### 静态开放系统的热力学第一与第二定律

我们从封闭系统的热力学第一定律开始：
$$
\d U + \d E_c = \delta W_{tot} + \delta Q
$$
$W_{tot}$是所有外力做的功。
如果把保守力做功变成势能，则有：
$$
\d U + \d E_c + \d E_p = \delta W + \delta Q
$$
其中$W$是非保守力做的功。

现在假设我们有一个开放系统$\Sigma_0$，如何将其转化为一个封闭系统$\Sigma$呢？
设初始时刻$t$到终止时刻终止时刻$t + \d t$将要流入系统的流体组成的系统为$\Sigma_1$，将要流出系统的流体组成的系统为$\Sigma_2$。
记$\Sigma_t = \Sigma_0 \cup \Sigma_1$，$\Sigma_{t + \d t} = \Sigma_0 \cup \Sigma_2$。
如果系统处于静态，那么$\d t$这段时间里流入系统的流体的质量等于流出系统的流体质量，记为$\d m$。
我们设系统$\Sigma$在$t$时等于$\Sigma_t$，一段微小时间$\d t$后为$\Sigma_{t + \d t}$，则这个系统是一个封闭系统。

这个系统内能的变化可写为：
$$
\begin{aligned}
\d U 
&= U_{\Sigma}(t + \d t) - U_{\Sigma}(t) \\
&= [U_{\Sigma_0} (t + \d t) + U_{\Sigma_2} (t+\d t)] - [U_{\Sigma_0} (t) + U_{\Sigma_1} (t)] \\
&= U_{\Sigma_2} - U_{\Sigma_1} \quad \text{静止态下物理量与时间无关} \\
&= (u_{\Sigma_2} - u_{\Sigma_1}) \d m
\end{aligned}
$$
同理，其其他宏观能量的变化也可写为：
$$
\d E_c = (e_{c,2} - e_{c,1}) \d m , \; \d E_p = (e_{p,2} - e_{p,1}) \d m
$$

外界非保守力对气体做的功有三大部分：气体进入系统时压缩，离开系统时膨胀和对系统活动部件做的功，即指示功。
气体的摩擦不做功。
此时有：
$$
\begin{aligned}
\delta W
&= \delta W_\text{进入} + \delta W_\text{离开} + \delta W_i \\
&= P_1 V_1 - P_2 V_2 + \delta W_i \\
&= (P_1 v_1 - P_2 v_2 + w_i) \d m
\end{aligned}
$$
我们再把热量也写成单位质量的形式：
$$
\delta Q = q \d m
$$

从而整个等式都变成了单位质量的形式：
$$
\begin{aligned}
\d U + \d E_c + \d E_p 
&= \delta W + \delta Q \\
\d m \left[ (u_2 - u_1) + (e_{c,2} - e_{c,1}) + (e_{p,2} - e_{p,1}) \right]
&= \d m (P_1 v_1 - P_2 v_2 + w_i + q) \\
h_2 - h_1 + e_{p,2} - e_{p,1} + e_{c,2} - e_{c,1} &= w_i + q \\
\Delta h + \Delta e_p + \Delta e_c &= w_i + q
\end{aligned}
$$
如果宏观动能和势能的变化可以忽略，则该等式还可以进一步简化：
$$
\Delta h = w_i + q
$$

通过引入质量速率，还可以进一步把该等式化为功率的形式：
$$
D_m (\Delta h + \Delta e_c + \Delta e_p) = P_i + P_{th}
$$
其中$P_i$表示指示功率，$P_{th}$表示系统接受热的功率。

---

同理，我们也可以把热力学第二定律也写成单位质量的形式：
$$
\d S = \delta S_\text{交换} + \delta S_\text{产生}, \; \delta S_\text{产生} \ge 0
\iff
\d s = \delta s_\text{交换} + \delta s_\text{产生}, \; \delta s_\text{产生} \ge 0
$$

---

综上，我们通常使用以下公式研究开放系统：

对于静止态开放系统，以下封闭系统的公式的变体成立：
$$
\d h = \delta w_i + \delta q
$$
这是热力学第一定律的开放系统版本（忽略宏观动能和势能）。
$$
\d s = \delta s_e + \delta s_c, \; s_c \ge 0
$$
这是热力学第二定律的开放系统版本。
$$
\d h = T \d s + v \d P
$$
这是热力学恒等式的开放系统版本。
{: .proposition}

### 伯努利定理

我们假设不可压缩的气体无粘性、无热交换地流动的稳定态。
有：
$$
\Delta h + \Delta e_c + \Delta e_p = w_i + q = 0
$$
由热力学恒等式：
$$
\d h = T \d s + v \d P
$$
气体无粘性、无热交换，则其变化为等熵变化。
又其不可压缩，从而单位质量体积（密度$\rho$的倒数）为常数，因此有：
$$
\d h = \rho^{-1} \d P
$$
从而：
$$
\rho^{-1} \Delta P + \Delta e_c + \Delta e_p = 0
$$
一般来说，势能只有重力势能，那么：
$$
\frac{P_2 - P_1}{\rho} + \frac{1}{2} (v_2^2 - v_1^2) + g (z_2 - z_1) = 0
$$
移项可得：
$$
P_1 + \frac{1}{2} \rho v_1^2 + \rho g z_1 = P_2 + \frac{1}{2} \rho v_2^2 + \rho g z_2
$$
这就是伯努利定理。

## 多方过程

我们知道，系统的焓$h$和熵$s$都是状态函数，它们的值只与状态有关而与路径无关。
这允许我们设计虚构的可逆过程，从而求出整个系统在任意两个状态之间的熵变和焓变。

对于这个虚构的可逆过程，我们知道：
$$
\d h = \delta w_{i,\text{虚}} + \delta q_{\text{虚}} \quad
\d s = \delta s_e = \frac{\delta q_{\text{虚}}}{T}
$$
如果实际过程是绝热的，我们可以直接求出其指示功。
此外，其环境熵变为零，我们还可以直接给出过程中产生的熵。

通常，我们设计的过程都是**多方过程**。

多方过程指满足以下关系的过程：
$$
PV^k = const \iff P^{1-k} T^k = const
$$
$k$称为其多方指数。

为使设计的过程的起始态和终止态与实际过程相同，我们要求$P_1^{1-k} T_1^k = P_2^{1-k} T_2^k$
因此其$k$可由以下关系求出：
$$
k = \frac{\ln \frac{P_1}{P_2}}{\ln \frac{P_1}{P_2} + \ln \frac{T_1}{T_2}}
$$

其中$k$为某些值时，多方过程变成一个简单的过程：

- $k = 0 \implies P = const$ 等压可逆过程；
- $k = 1 \implies T = const$ 等温可逆过程；
- $k = \gamma$ 绝热可逆（等熵）过程；
- $k = \infty \implies V = const$ 等容可逆过程。
