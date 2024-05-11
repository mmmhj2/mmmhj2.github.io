---
title: "微正则系综"
categories: ["统计物理"]
---

本文研究一种特殊的系综——微正则系综。

## 微正则系综的定义

微正则系综的定义与孤立系统密切相关。

### 孤立系统

孤立系统——即不和外界发生质能交换的系统——具有三个守恒量：
能量$E$、物质的量$N$和体积$V$。

孤立系统作为一种热力学系统，也具有状态参量。
传统上，状态参量可分为广延量和强度量两种，而在统计物理中，我们使用另一种分类：外参量和内参量。

表示强加于系统的外界条件约束的参量称为*外参量*（Exterior parameter）；
表示系统内在性质的参量称为*内参量*（Interior parameter）。
{: .definition}

容易混淆的是孤立系统的三个守恒量，这三个守恒量也是外界约束，因此是外参量。
内参量和外参量是根据希望研究的内容选择的。
如果我们希望对一个参量施加约束以进行研究，那么这个参量就是外参量。

### 微正则系综

微正则系综是最简单的一种系综，其只具有一个能量，因此易于研究。

设系综的能量为$E^*$，若该概率空间的概率测度为
$$P(a) = \begin{cases} 0 &, E(a) \neq E^* \\ \frac{1}{\Omega(E^*)} &,  E(a) = E^*
\end{cases}$$
则称该系综为*微正则系综*（Microcanonical ensemble）。
{: .definition}

微正则系综通常用于描述孤立系统，因为孤立系统不发生质能交换，其能量自然是确定的。

## 微正则系综的研究

### 系综的熵

微正则系综的熵可由简单的计算得到：
$$S_\text{microcanonical} = - k \Omega(E) \frac{1}{\Omega(E)} \ln \frac{1}{\Omega(E)} = k \ln \Omega$$

现在考虑能量在区间$[E, E+\mathrm d E]$区间之中的孤立系统，类比微正则系综的熵，我们可将其熵表示为
$$S = k \ln \rho(E)$$

### 系统的内参量

根据热力学恒等式
$$\mathrm d E = T \mathrm d S - p \mathrm d V + \mu \mathrm d N$$
我们有
$$\mathrm d S = \frac{1}{T} \mathrm d E + \frac{p}{T} \mathrm d V - \frac{\mu}{T} \mathrm d N$$
其中$T$表示温度、$p$表示压强、$\mu$表示化学势。
因此，对于任何指定的微观态，只需要知道其外参量，就可以求出——更准确地说，定义出——该微观态下这三个参量的值。

微正则系综中给定微观态的微观温度、压强和化学势定义为
$$
\begin{aligned}
T^* &= \frac{1}{ \frac{\partial S^*}{\partial E} } \\
p^* &= T^* \frac{\partial S^*}{\partial V} \\
\mu^* &= - T^* \frac{\partial S^*}{\partial N}
\end{aligned}
$$
{: .definition}

### 自发熵增

我们之前已经知道，孤立系统的自发变化使其熵增加，现在我们可以使用统计物理知识来证明它。

设对一微正则系综施加额外约束$x = \tilde x$，则取消该约束后系统的熵增加。
{: .proposition}

我们已经说明微正则系综的熵为
$$S =  k \ln \Omega$$
显然，施加约束将使得系统的可能状态减少。
令$x$固定为某值时系统的状态数为$\omega$，满足
$$\Omega(E, N, V) = \sum_x \omega(E, N, V, x)$$
则有
$$\omega(E, N, V, \tilde x) \le \Omega(E, N, V)$$
故
$$S_{\tilde x} \ge S$$
{: .proof}

这个命题看似简单，却导向以下重要结论。

设孤立系统中某项内参数$x$在$x\_\max$时可能的微观状态数最多，从而熵最大，则该内参数$x$的分布可视为为以其为中心的正态分布
$$p(x) \approx \frac{1}{\sqrt{2 \pi \sigma^2}} \exp \left[ - \frac{(x - x_\max)^2}{2 \sigma^2} \right]$$
{: .proposition}

考虑$x$取固定值$\tilde x$时的概率
$$p(\tilde x) = \frac{\omega(E, N, V, \tilde x)}{\Omega(E, N, V)}$$
则这个概率分布的熵可写为
$$s(\tilde x) = k \ln \omega(E, N, V, \tilde x)$$
考虑在$x\_\max$处进行泰勒展开
$$
\begin{aligned}
s(\tilde x) &= s(x_\max) + (\tilde x - x_\max) \cancel{\frac{\mathrm d s}{\mathrm d x}} \\ &+ \frac{(\tilde x - x_\max)^2}{2} \frac{\mathrm d^2 s}{\mathrm d x^2} + \mathcal O(\tilde x^3) \\
&\approx s(x_\max) + \frac{(\tilde x - x_\max)^2}{2} \frac{\mathrm d^2 s}{\mathrm d x^2}
\end{aligned}
$$
两边取指数并归一化，即可得到概率
$$p(x) \approx \frac{1}{\sqrt{2 \pi \sigma^2}} \exp \left[ - \frac{(x - x_\max)^2}{2 \sigma^2} \right], \, \sigma \propto \sqrt{N}$$
{: .proof}

该命题说明，孤立系统物理量的系综平均在熵最大处取得，且$N$极大时，可认为该物理量就在熵最大处取得。

### 子系统的平衡

考虑由两个孤立的子系统组成的系统，显然该系统本身也是孤立的。
若允许两个孤立的子系统之间进行质能交换，则达到平衡后，新系统的内参量如何变化？
热力学中，我们已经知道，若达到平衡，则两子系统的内参量必然相等。
现在我们来证明这个命题。

设两个孤立的系统之间以某种界面接合。
若该界面是导热的，则平衡后两系统的温度相等；
若该界面是活动的，则平衡后两系统的压强相等；
若该界面是可透过的，则平衡后两系统的化学势相等。
{: .proposition}

首先考虑导热的界面。
注意到总系统总是孤立的，则在界面导热前后，系统的总能量不变：
$$E_1 + E_2 = E_1' + E_2' = E_\text{tot}$$
然而，在界面导热前，$E\_1$和$E\_2$是两个孤立系统的外参量，而在导热后，由于两个系统不再是孤立系统，这两个量不再是外参量，而变为内参量。
相对地，由于总系统总是孤立的，$E_\text{tot}$总是外参量。
当然，界面导热前后，子系统的物质的量和体积总是外参量。
由于系统的内参量在熵最大处取得，有
$$
\begin{aligned}
0 &= \frac{\mathrm d s}{\mathrm d E_1} = \frac{\mathrm d s_1(E_1')}{\mathrm d E_1'} + \frac{\mathrm d s_2(E_2')}{\mathrm d E_1'} \\
&= \frac{1}{T^*_1} + \frac{\mathrm d s_2 (E_2')}{\mathrm d E_2'} \frac{\mathrm d E_2'}{\mathrm d E_1'} \\
&= \frac{1}{T^*_1} - \frac{1}{T^*_2}
\end{aligned}
$$
从而两系统温度相等。
其余物理量的证明类似。
{: .proof}
