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

设系综的能量为$E^\*$，若该概率空间的概率测度为
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

### 例子：萨克尔-泰特洛德公式

考虑能量为$E$的封闭系统，该系统仅由$N$个单原子气体粒子构成。
单原子气体被封闭在体积为$V$的立方体盒子（无限大势阱）中。
假设气体分子之间不发生相互作用，即该气体是理想气体，试计算其熵。<br/>
这个系统构成微正则系综，因此需要计算所有的状态数。
不妨设该盒子的长宽高均为$L$，满足$L^3 = V$。
由于粒子之间不发生相互作用，我们可以单独考虑每个粒子。
这是经典的量子力学问题，单个粒子的波函数可分离变量为
$$\psi(\vec r) = \psi_x(x) \psi_y(y) \psi_z(z)$$
以$x$轴为例，其通解为：
$$\psi_x(x) = A_x \exp(i K_x x), \; K_x = \sqrt{\frac{2m E_x}{\hbar^2}}.$$
另一方面，利用周期边界条件，可解得：
$$K_x = \frac{2 \pi n_x}{L}, \; n_x \in \mathbb Z.$$
这两个解都会被用到。
对于单个粒子，其能量为
$$E' = \frac{\hbar^2}{2m} (K_x^2 + K_y^2 + K_z^2),$$
对于$N$个粒子，总能量为
$$E = \frac{\hbar^2}{2m} \sum_{i=1}^n (K_{x,i}^2 + K_{y,i}^2 + K_{z,i}^2).$$
这意味着整个系统的态矢量$\vec K$位于一个$3N$维的超球面上，球面的半径为
$$R = \sqrt{\frac{2mE}{\hbar^2}}.$$
分别考虑半径为$R(E)$和$R(E + \delta E)$（$\delta E$是小量）的球壳，两个体积为
$$
\begin{aligned}
V(E) &= \frac{\pi^{\frac{3N}2}}{\Gamma(\frac{3N}{2}+1)} \left( \frac{2m E}{\hbar^2}\right)^{\frac{3N}{2}} \\
V(E + \delta E) &= \frac{\pi^{3N/2}}{\Gamma(\frac{3N}{2}+1)} \left( \frac{2m (E + \delta E)}{\hbar^2}\right)^{\frac{3N}{2}}
\end{aligned},
$$
其中$\Gamma$是伽马函数。
两者相减，利用广义二项式定理展开至$\delta E$的一次项，得到
$$
\delta V = \frac{\pi^{\frac{3N}{2}}}{\Gamma(\frac{3N}{2})} \left( \frac{\sqrt{2m}}{\hbar} \right)^{3N} E^{\frac{3N}{2}-1} \delta E + O(\delta E^2).
$$
现在我们需要计算单个状态的大小。
观察$K\_x$，注意到每一维的单个状态占据的空间为$2\pi/L$，因此整个系统的单状态大小为
$$V_\text{state} = \left(\frac{2\pi}{L}\right)^{3N} = \frac{(2\pi)^{3N}}{V^N}.$$
两者相除，再除以由于粒子完全相同而重复计数的状态数$N!$（参见[麦克斯韦-玻尔兹曼近似]({% post_url statistical-physics/2024-06-10-marcocanonical-ensemble %}#麦克斯韦-玻尔兹曼近似)），即得总状态数：
$$\Omega(E, N, V) = \frac{V^N}{\Gamma(N) \cdot \Gamma(\frac{3N}{2})} \frac{(2\pi mE)^{\frac{3N}{2}}}{h^{3N}} \frac{\delta E}{E} + O(\delta E^2).$$
然后取对数并利用斯特灵近似：
$$\lim_{x \to \infty} \ln \Gamma(x) = x \ln x - x + O(1),$$
得到
$$
\begin{multline}
\ln \Omega = N \ln V + \frac{3N}{2} \ln \frac{2 \pi m E}{h^2} - N \ln N \\ - \frac{3N}{2} \ln \frac{3N}{2} + \frac{5N}{2} + \ln (\frac{\delta E}{E}) + O(1)
\end{multline}
$$
之前我们只是定义了小量$\delta E$，而没有说明它的取值，现在我们希望将它与$N$联系起来。
不妨定
$$E \gg\delta E > \frac{E}{N} \iff \delta E = O(\frac{1}{N}),$$
这样，有
$$\ln \frac{\delta E}{E} > \ln \frac{1}{N} = O(\log N),$$
从而
$$
\begin{aligned}
\ln \Omega &= N \ln \frac{V}{N} + \frac{3N}{2} \ln \frac{4 \pi m E}{3N h^2} + \frac{5N}{2} + O(\log N)\\
&= N \ln \frac{V}{N} \left( \frac{4 \pi m E}{3N h^2} \right)^\frac{3}{2} + \frac{5}{2}N + O(\log N).
\end{aligned}
$$
最后得到
$$S = k_B \ln \Omega = k_B N \ln \frac{V}{N} \left( \frac{4 \pi m E}{3N h^2} \right)^\frac{3}{2} + \frac{5}{2}k_B N  + O(\log N),$$
即
$$\boxed{\frac{S}{k_B N} = \ln \frac{V}{N} \left( \frac{4 \pi m E}{3N h^2} \right)^\frac{3}{2} + \frac{5}{2}}$$
这个公式叫做萨克尔-泰特洛德公式（Sackur–Tetrode equation）。
{: .exampl}

利用该公式，我们能求出理想气体的比热：
$$\frac{1}{T} = \frac{\partial S}{\partial E} = \frac{3}{2} \frac{N k_B}{E} \iff C_V = \frac{3}{2} N k_B = \frac{3}{2} nR$$
这和分子动理论预测的比热一致。
我们也可以进一步求出理想气体的状态方程，有
$$\frac{p}{T} = \frac{\partial S}{\partial V} = \frac{N k_B}{V} \iff p V = nRT.$$
这种理想气体利用了麦克斯韦-玻尔兹曼近似，因此也叫麦克斯韦-玻尔兹曼理想气体。

关于这个公式，值得一提的是萨克尔和泰特洛德两人分别提出该公式时量子力学还尚未被提出。
泰特洛德在计算状态数量时，没有使用上面的量子力学方法，而是假设粒子的位置和动量被分散在大小为$\Delta x$和$\Delta p$的网格上。
这样，状态数变为
$$\Omega(E, N, V) = \frac{V^N}{N! \cdot \Gamma(3N/2)} \frac{2 \pi^{3N/2}}{(\Delta x \Delta p)^{3n}} (2mE)^{\frac{3N-1}{2}}.$$
接着他设$\Delta x \Delta p = K$，然后通过实验测定了该常数的值，即
$$\Delta x \Delta p = h,$$
这意味着他提前发现了量子力学中量子化或分立的概念。
这个公式和海森堡最初给出的不确定性公式非常相似：
$$\Delta x \Delta p \simeq h.$$
