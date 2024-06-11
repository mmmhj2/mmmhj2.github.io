---
title: "巨正则系综"
categories: "统计物理"
---

本文主要研究统计物理中的最后一个系综——巨正则系综。

## 巨正则系综

和微正则系综、正则系综一样，巨正则系综也用于描述一类热力学系统——开放系统。
在定义巨正则系综之前，首先介绍用于辅助定义的巨正则库。

巨正则库是温度与化学势不随热或粒子的交换而变化的系统。
通常，当一个系统$\mathcal R$的粒子数远大于另一个与其发生交换的开放系统$\mathcal S$的，则在研究$\mathcal S$时，可将$\mathcal R$视为巨正则库。
{: .definition}

和热库一样，巨正则库总是和待研究的系统一并存在的，只有确定了待研究的系统，才能判定另一个系统是否是巨正则库。

当系统$\mathcal R$的粒子数远大于另一个系统时，通过利用微正则系综来研究作为孤立系统的整个系统，可以证明$\mathcal R$的温度和化学势与另一个系统无关，证明方式与热库的证明类似。

### 巨正则系综的定义

按照类似的方法，我们给出巨正则系综的定义：

若系综$(A, \Sigma, P)$的概率测度为
$$P(a) = \frac{\exp \left( -\frac{E_a - \mu N_a}{kT} \right)}{\sum_{a' \in A} \exp \left( - \frac{E_{a'} - \mu N_{a'}}{kT} \right)}$$
其中$k$为玻尔兹曼常数，$T, \mu$为系统的温度和化学势，$E_a, N_a$分别为处于该状态下的能量和粒子数量，则称该系综为**巨正则系综**（macrocanonical ensemble 或 grand canonical ensemble）。
{: .definition}

系统的温度和化学势是通过与其达成平衡的巨正则库的温度与化学势确定的。
此处特别注意，由于定义中显式地使用了每个状态的粒子数量，巨正则系综*不能*处理粒子可辨的情况。
对粒子可辨的情况，要么使用微正则系综，要么使用正则系综和后文介绍的麦克斯韦-玻尔兹曼近似。

巨正则系综概率的正规化系数称为这个系综的配分函数，即巨配分函数$\Xi$：
$$\Xi = \sum_{a \in A} \exp \left( - \frac{E_{a} - \mu N_a}{kT} \right)$$
{: .definition}

巨配分函数也可视为以下幂级数求和
$$
\begin{aligned}
\Xi(T, V, \mu) &= \sum_{a \in A} \exp \left( - \frac{E_{a} - \mu N_a}{kT} \right) \\
&= \sum_{a \in A} \exp \left( - \beta E_{a}\right) \exp \left( \beta \mu N_a \right) \\
&= \sum_{N = 0}^\infty Z(T, V, N) \left[ \exp(\beta \mu) \right]^N
\end{aligned}
$$
其中$Z(T,V,N)$即为由当前系统的温度和体积确定的正则系综的配分函数，$z = \exp(\beta \mu)$也称为逸度（fugacity）。

### 巨正则势

和其他系综一样，我们也可定义巨正则系综的热力学势。

巨正则系综的热力学势称为**巨热力学势**（Grand potential），也称朗道自由能（Landau free energy），定义为：
$$J = - k T \ln \Xi$$
该函数就是开放系统的特征函数。
{: .definition}

巨热力学势和前几个热力学势具有以下关系：

巨热力学势$J$、自由能$F$和熵$S$具有以下关系
$$J = F - \mu N = E - TS - \mu N$$
{: .proposition}

直接利用熵的定义：
$$
\begin{aligned}
S &= - k \sum_{a \in A} P(a) \ln P(a) \\
&= -k \sum_{a \in A} P(a) \ln \frac{\exp \left( -\beta E_a + \beta \mu N_a \right)}{\Xi} \\
&= -k \sum_{a \in A} P(a) [(-\beta E_a + \beta \mu N_a) - \ln \Xi]
\end{aligned}
$$
现在注意到
$$E = \langle E \rangle = \sum_{a \in A} P(a) E_a$$
且粒子数同理，可得
$$S = \frac{E}{T} - \frac{\mu N}{T} + k \ln \Xi$$
移项，得到
$$J = - k T \ln \Xi = E - \mu N - T S$$
又
$$F = E - TS$$
从而
$$J = F - \mu N $$
{: .proof}

根据以上关系，我们可以利用热力学势重写热力学恒等式：

利用巨热力学势，热力学恒等式可重写为
$$\mathrm d J = - S \mathrm d T - p \mathrm d V - N \mathrm d \mu$$
{: .proposition}

已知
$$J = E - TS - \mu N$$
从而
$$\mathrm d J = \mathrm d E - (T \mathrm d S + S \mathrm d T) - (\mu \mathrm d N + N \mathrm d \mu)$$
根据热力学恒等式，有
$$\mathrm d E = T \mathrm d S - p \mathrm d V + \mu \mathrm d N$$
从而
$$\mathrm d J = - S \mathrm d T - p \mathrm d V - N \mathrm d \mu$$
{: .proof}

利用上述热力学恒等式，巨正则系综的多个重要热力学参量也可由巨热力学势表出：
$$
\begin{aligned}
N &= - \frac{\partial J}{\partial \mu} \\
S &= - \frac{\partial J}{\partial T} \\
p &= - \frac{\partial J}{\partial V}
\end{aligned}
$$

此外，巨正则系综的能量也可由巨配分函数表出：

巨正则系综的能量为
$$\langle E \rangle = - \frac{\partial \ln \Xi}{\partial \beta} + \mu \langle N \rangle$$
{: .proposition}

考虑期望的定义
$$
\begin{aligned}
\langle E \rangle &= \sum_{a \in A} P(a) E_a \\
&= \sum_{a \in A} \frac{\exp(-\beta(E_a - \mu N_a))}{\Xi} E_a \\
&= \sum_{a \in A} \frac{\exp(-\beta(E_a - \mu N_a))}{\Xi} (E_a-\mu N_a) + P(a) \mu N_a \\
&= - \frac{1}{\Xi} \frac{\partial \Xi}{\partial \beta} + \mu \langle N \rangle = - \frac{\partial \ln \Xi}{\partial \beta} + \mu \langle N \rangle
\end{aligned}
$$
{: .proof}

### 几个系综的比较

下表总结了微正则系综、正则系综和巨正则系综的重要参数。

| | 微正则系综 | 正则系综 | 巨正则系综 |
|---|:---:|:---:|:---:|
| 热力学系统 | 孤立系统 | 封闭系统 | 开放系统 |
| 外参量 | $E, V, N$ | $T, V, N$ | $T, V, \mu$ |
| 配分函数 | N/A | $Z = \sum \exp \left( - \beta E\_a\right)$ | $\Xi = \sum \exp \left( - \beta E\_a + \beta \mu N\_a \right)$ |
| 特征函数 | $S = k \ln \Omega$ | $F = -kT \ln Z$ | $J = - k T \ln \Xi$ | 
| 热力学势 | $-S$ | $F$ | $J$ |
| 重要内参量 | $T = \frac{1}{\frac{\partial S}{\partial E}}$ <br/> $p = T \frac{\partial S}{\partial V}$ <br/> $\mu = - T \frac{\partial S}{\partial N}$ | $S = - \frac{\partial F}{\partial T}$ <br/> $p = - \frac{\partial F}{\partial V}$ <br/> $\mu = \frac{\partial F}{\partial N}$ | $S = - \frac{\partial J}{\partial T}$ <br/> $p = - \frac{\partial J}{\partial V}$ <br/> $N = - \frac{\partial J}{\partial \mu}$ <br/>  |
| 能量关系 | N/A | $F = E - TS$ <br/> $E = - \frac{\partial \ln Z}{\partial \beta}$ | $J = E - TS - \mu N$ <br/> $E = - \frac{\partial \ln \Xi}{\partial \beta} + \mu N$ |

利用三种特征函数，可以写出三个不同的热力学恒等式：
$$
\begin{aligned}
    \mathrm d E &= T \mathrm d S - p \mathrm d V + \mu \mathrm d N \\
    \mathrm d F &= - S \mathrm d T - p \mathrm d V + \mu \mathrm d N\\
    \mathrm d J &= - S \mathrm d T - p \mathrm d V - N \mathrm d \mu
\end{aligned}
$$

几个系综在一定情况下是等价的。

当宏观系统处于**热力学极限**（Thermodynamic limit）时，即
$$V \to \infty, \quad N \to \infty, \quad \frac{V}{N} \to \text{Const.}$$
时，平衡态下的巨正则、正则与微正则系综等价，三个系综给出相同的结果。
{: .proposition}

在热力学极限下，不同系综产生的微观的不同不再有显著的影响。

## 微观统计

在巨正则系综下，由于微观粒子——费米子和玻色子——的性质不同，粒子可能不能具有相同的状态，因此不同的系统具有不同的分布。

组合数学上讲，设有$N$个粒子，每个粒子可能具有$M$个状态。
则对费米子而言，总的可能状态数为$Z = \binom{M}{N}$，使用类似这种统计方法的系综称为服从费米-狄拉克统计；
而对玻色子而言，总的可能状态数为$Z = \binom{M+N-1}{N}$，使用类似这种统计方法的系综称为服从玻色-爱因斯坦统计。
后者可由隔板法得到。
这两种方法中，我们均假设粒子无法分辨，然而在一些情况下，我们可使粒子能够取得相同的状态但可以分辨，此时可能的状态数介于两者之间，可视为两种粒子的近似，这种统计称为麦克斯韦-玻尔兹曼统计。
我们将逐一研究这些统计。

### 费米子与费米-狄拉克统计

为研究单个量子的状态，首先需要重构配分函数。

设系统处于状态$a$下，而系统中的某一个量子处于状态$\lambda$下，则系统的巨配分函数可写为
$$\Xi = \prod_{\lambda} \xi_\lambda, \quad \xi_\lambda = \sum_{N_i} \exp \big( - \beta N_i (\varepsilon_\lambda - \mu) \big)$$
其中$\xi\_\lambda$称为量子态$\lambda$的巨配分函数，$\varepsilon\_\lambda$是该量子态的能量。
巨热力学势为
$$J = \sum_\lambda J_\lambda, \quad J_\lambda = - k T \ln \xi_\lambda $$
{: .proposition}

注意到总系统在状态$a$下的能量与粒子数是处在各个量子态下的量子的能量和数量之和，即
$$E_a = \sum_{\lambda} \varepsilon_\lambda n_\lambda, \quad N_a = \sum_{\lambda} n_\lambda$$
从而配分函数可写为
$$
\begin{aligned}
    \Xi &= \sum_{a \in A} \exp \big(- \beta (E_a - \mu N_a) \big) \\
    &= \sum_{a\in A} \exp \left[ - \beta \left( \sum_\lambda \varepsilon_\lambda n_\lambda - \mu \sum_\lambda n_\lambda \right) \right]
\end{aligned}
$$
由于每个微观态$a$均可由不同量子态下的量子数唯一确定，对状态$a$的求和可变为对可能的量子数的集合的求和，即
$$
\begin{aligned}
    \Xi &= \sum_{\{n_\lambda\}} \exp \left[ - \beta \left( \sum_\lambda \varepsilon_\lambda n_\lambda - \mu \sum_\lambda n_\lambda \right) \right] \\
    &= \sum_{\{n_\lambda\}}  \exp \left[ - \beta \sum_\lambda \varepsilon_\lambda n_\lambda \right] \exp \left[ \beta \mu \sum_\lambda n_\lambda \right] \\
    &= \sum_{\{n_\lambda\}} \prod_\lambda \exp \big( - \beta (\varepsilon_\lambda n_\lambda + \mu n_\lambda)\big)
\end{aligned}
$$
由于总是在有限集合上求和，可以任意调换求和和乘积的顺序。
调换顺序即得证。
{: .proof}

利用单个量子态的配分函数和热力学势，可简单算出每个状态下费米子的数量期望。

对费米子，处于状态$\lambda$的量子的数量为
$$N^\text{FD}_\lambda = \langle N^\text{FD}_\lambda \rangle = \frac{1}{\exp (\beta (\varepsilon_\lambda - \mu)) + 1}$$
这种分布称为**费米-狄拉克分布**（Fermi-Dirac distribution）
{: .theorem}

对费米子，处于任意状态的量子的数量要么为零，要么为一，因此
$$\xi_\lambda^\text{FD} = \sum_{N = 0}^1 \exp \big( - \beta N_i (\varepsilon_\lambda - \mu) \big) = 1 + \exp(- \beta (\varepsilon_\lambda - \mu))$$
从而
$$
N_\lambda^\text{FD} = - \frac{\partial J_\lambda}{\partial \mu} = k T \frac{\partial \ln \xi_\lambda}{\partial \mu} = \frac{1}{\exp (\beta (\varepsilon_\lambda - \mu)) + 1}
$$
{: .proof}

值得注意的是，该统计与选择的系综无关——在微正则系综、正则系综和巨正则系综下均可得到相同的结果，只是推导的方式不同。

根据该分布，容易注意到，当$\varepsilon\_\lambda < \mu$时，若系统温度趋近于零，则该状态的粒子数趋于一；反之，当$\varepsilon\_\lambda > \mu$，则趋于零。
这意味着系统偏向于能量低于当前化学势的状态。

### 玻色子与玻色-爱因斯坦统计

对玻色子，我们有

对玻色子，处于状态$\lambda$的量子的数量为
$$N^\text{BE}_\lambda = \langle N^\text{BE}_\lambda \rangle = \frac{1}{\exp (\beta (\varepsilon_\lambda - \mu)) - 1}$$
这种分布称为**玻色-爱因斯坦分布**（Bose-Einstein distribution）。
该函数仅在$\varepsilon\_\lambda > \mu$时有意义。
{: .theorem}

对玻色子，处于量子态$\lambda$的量子数可任意大，因此
$$\xi_\lambda = \sum_{N = 0}^\infty \Big[\exp \big(- \beta (\varepsilon_\lambda - \mu) \big) \Big]^N$$
该级数是等比数列，仅在$\varepsilon_\lambda > \mu$时收敛，此时
$$
\begin{aligned}
\xi_\lambda &= \lim_{N \to \infty} \frac{1 - \Big[\exp \big(- \beta (\varepsilon_\lambda - \mu) \big) \Big]^N}{1 - \exp \big(- \beta (\varepsilon_\lambda - \mu) \big)} \\ &= \frac{1}{1 - \exp \big(- \beta (\varepsilon_\lambda - \mu) \big)}
\end{aligned}
$$
从而
$$N_\lambda^\text{BE} = k T \frac{\partial \ln \xi_\lambda}{\partial \mu} = \frac{1}{\exp\beta(\varepsilon_\lambda - \mu) - 1}$$
{: .proof}

注意到玻色-爱因斯坦统计要求所有态的能量大于化学势，因此基态能量也必须大于化学势。
在这种情况下，当温度趋于零时，状态的量子数也趋于零。
特别地，当$\varepsilon\_0 \to^+ \mu$时，粒子数区域正无穷，所有粒子均向基态聚集，这种特殊的状态称为玻色-爱因斯坦凝聚态。

### 麦克斯韦-玻尔兹曼近似

有些时候，例如应用分子动理论时，系统非常庞大以至于量子态的影响可以忽略。
此时，系统中的粒子不再是量子，也不再具有不可分辨的特性[^discernable]。
我们使用麦克斯韦-玻尔兹曼分布来计算每个状态的量子数。

[^discernable]: 在经典力学下，任何一个粒子的运动都是严格符合力学规律的，有着可确定的运动轨迹，可以相互区分。这种全同而可辨的粒子称为“定域粒子”。

对同一系统，分别考虑粒子可辨与不可辨下的正则配分函数，若某一状态下的粒子数极小，则其满足
$$Z_\text{不可辨} = \frac{1}{N!} Z_\text{可辨}^N$$
其中$Z\_\text{不可辨}$是整个系统的配分函数，而$Z\_\text{可辨}$是被视为可辨的单个粒子组成的系统的配分函数。这种近似称为麦克斯韦-玻尔兹曼近似。
可辨的粒子组成的系统满足**麦克斯韦-玻尔兹曼分布**（Maxwell-Boltzmann distribution），即粒子数为
$$N_\lambda^\text{MB} = \langle N_\lambda^\text{MB} \rangle = \exp \big[ -\beta (\varepsilon_\lambda - \mu) \big]$$
{: .theorem}

考虑粒子数极小的情况，此时无论对费米-狄拉克分布还是玻色-爱因斯坦分布，都有
$$\exp \beta (\varepsilon_\lambda - \mu) \gg 1$$
由于麦克斯韦-玻尔兹曼近似是对这种极限状态的估计，我们有
$$\xi_\lambda^\text{FD} \approx \xi_\lambda^\text{BE} \approx \xi_\lambda^\text{MB} \approx 1 + \exp\big(- \beta(\varepsilon_\lambda - \mu)\big)$$
从而
$$\ln \xi_\lambda = \ln \Big[1 + \exp\big(- \beta(\varepsilon_\lambda - \mu)\big) \Big] \approx \exp\big(- \beta(\varepsilon_\lambda - \mu)\big)$$
因此
$$\ln \Xi = \sum_\lambda \exp\big(- \beta(\varepsilon_\lambda - \mu)\big) $$
对每个粒子，显然其正则配分函数为
$$Z_\text{可辨} = \sum_\lambda \exp (-\beta \varepsilon_\lambda)$$
从而
$$\ln \Xi = Z_\text{可辨} \exp \beta \mu  \iff \Xi = \exp (Z_\text{可辨} \exp \beta \mu)$$
进行幂级数展开，可得
$$\Xi = \sum_N \frac{Z_\text{可辨}^N \exp N\beta\mu }{N!}$$
又对整个系统，
$$\Xi = \sum_{N = 0}^\infty Z_\text{不可辨} \left[ \exp(\beta \mu) \right]^N$$
从而
$$Z_\text{不可辨} = \frac{Z_\text{可辨}^N}{N!}$$
粒子个数可容易导出
$$N_\lambda^\text{MB} = k T \frac{\partial \ln \xi_\lambda}{\partial \mu} = \exp (\beta (\varepsilon_\lambda - \mu))$$
{: .proof}
