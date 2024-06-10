---
title: "正则系综"
categories: "统计物理"
---

本文主要研究统计物理中的又一个系综——正则系综。

## 正则系综的定义

孤立系统和微正则系综为我们提供了一个进行研究的简单样本，
然而世界并不像形而上学家们认识的一样总是孤立的、静止的、片面的。
系统之间的联系是普遍的，我们毕竟还是要研究发生各种关系的系统。
正则系综在孤立系统上更进一步，研究恒温平衡系统中的粒子的状态分布。

### 恒温热库

为了引入恒温这一概念，首先考察恒温的来源——恒温热库。

**热库**（Heat bath, Thermal resevoir）是温度维持不变的系统。
通常，当一个系统$\mathcal T$中物质的量远大于与其发生热量交换的另一个系统时，可认为该系统$\mathcal T$是热库。
{: .definition}

考虑系统$\mathcal T$与$\mathcal S$，其中$N\_{\mathcal T} \gg N\_{\mathcal S}$，设总能量为$E$，则热库的温度为
$$\frac{1}{T_{\mathcal T}} = \frac{\partial s_{\mathcal T}}{\partial E_{\mathcal T}}(E_{\mathcal T}) = \frac{\partial s_{\mathcal T}}{\partial E_{\mathcal T}}(E - E_{\mathcal S})$$
在$E$处进行泰勒展开，可得
$$\frac{1}{T_{\mathcal T}} = \frac{\partial s_{\mathcal T}}{\partial E_{\mathcal T}}(E) - E_{\mathcal S} \frac{\partial^2 s_{\mathcal T}}{\partial E_{\mathcal T}^2} + \mathcal O(E_{\mathcal S}^2)$$
现在进行量纲分析，设
$$s_{\mathcal T} \propto N_{\mathcal T}, \quad E_{\mathcal T} \propto N_{\mathcal T}, \quad E_{\mathcal S} \propto N_{\mathcal S}$$
则
$$\frac{\partial s_{\mathcal T}}{\partial E_{\mathcal T}} \sim \frac{N_{\mathcal T}}{N_{\mathcal T}} \gg \frac{N_{\mathcal S} N_{\mathcal T}}{N_{\mathcal T}^2} \sim E_{\mathcal S} \frac{\partial^2 s_{\mathcal T}}{\partial E_{\mathcal T}^2}$$
从而
$$\frac{1}{T_\mathcal T} \approx \frac{\partial s_{\mathcal T}}{\partial E_{\mathcal T}}(E)$$
与系统$\mathcal S$无关。
{: .proof}

### 正则系综

我们已经给出了热库的概念，进而可以给出正则系综的定义。

若系综$(A, \Sigma, P)$的概率测度为
$$P(a) = \frac{\exp \left( -\frac{E_a}{kT} \right)}{\sum_{a' \in A} \exp \left( - \frac{E_{a'}}{kT} \right)}$$
其中$k$为玻尔兹曼常数，$T$为系统的温度，则称该系综为**正则系综**（Canonical ensemble）。
{: .definition}

系统的温度即是由与其达成平衡的热库的温度确定的。

通常我们记$\beta = \frac{1}{kT}$，且令归一化系数
$$Z = \sum_{a' \in A} \exp \left( - \frac{E_{a'}}{kT} \right)$$
则该概率测度可简写为
$$P(a) = \frac{\exp \left( -\beta E_a \right)}{Z}$$
这个归一化系数也叫做*配分函数*（Partition function）。

注意概率的值与能量参考点的选择无关，因为参考点导致的常数差异会被配分函数消去。

正则系综与热库有密切关系。

与热库维持热平衡的恒温系统是正则系综，而系统的温度就是热库的温度。
{: .proposition}

考虑热库$\mathcal T$与待研究系统$\mathcal S$，两者构成的总系统是孤立系统，适用微正则系综。
设总系统的状态数为$\Omega(E)$，而热库的状态数为$\omega\_\mathcal T(E)$
总系统中，子系统$\mathcal S$处于某一微观态$a$，而热库处于任意微观态的的概率为
$$P_\text{total}(a) = \frac{1}{\Omega(E_\text{total})}$$
从而根据乘法原理，系统$\mathcal S$处于该微观态的概率为
$$P_\mathcal S(a) = \frac{\omega_T(E_\text{total} - E_a)}{\Omega(E_\text{total})}$$
根据微正则系综的熵表达式，有
$$s_\mathcal T = k \ln \omega_\mathcal T \implies \omega_T(E_\text{total} - E_a) = \exp \left[ \frac{s_\mathcal T(E_\text{total} - E_a)}{k} \right]$$
现在进行泰勒展开，有
$$
\begin{aligned}
s_\mathcal T(E_\text{total} - E_a) &= s_\mathcal T(E_\text{total}) - E_a \frac{\partial s_\mathcal T}{\partial E}(E_\text{total} - E_a) + \mathcal O(E_a^2) \\
& \approx s_\mathcal T (E_\text{total}) - \frac{E_a}{T}
\end{aligned}
$$
从而
$$\omega_T \propto \exp \left( - \frac{E_a}{kT} \right)$$
进行归一化原命题即得证。
{: .proof}

配分函数也可写为含简并度的形式：
$$Z = \sum_{a' \in A} \exp \left( - \frac{E_{a'}}{kT} \right) = \sum_{e \in E(A)} \Omega(e) \exp \left( - \beta e \right)$$
在连续情况下，也可写为
$$Z = \int_{E_\text{基态}}^\infty \rho(E) \exp (-\beta E) \,\mathrm d E$$

## 自由能函数

在微正则系综中，我们使用熵（或负熵）来研究系统的微观状态。
对于正则系综，我们使用新的热力学势函数——自由能函数。

### 自由能函数的定义

正则系综的自由能函数（Free energy function）定义为
$$F = - k T \ln Z$$
{: .definition}

和微正则系综的熵一样，我们可以自由能函数定义正则系综的微观状态，并研究其自发演化的方向。

例如，能量的系综平均可由自由能函数导出。

正则系综能量的系综平均与自由能函数之间满足
$$<E> = F - T \frac{\partial F}{\partial T}$$
{: .proposition}

有
$$
\begin{aligned}
\langle E \rangle &= \sum_{a \in A} E(a) P(a) = \sum_{a\in A} E(a) \frac{\exp \big(-\beta E(a)\big)}{Z} \\
&= \frac{1}{Z} \sum_{a \in A} E(a) \exp \big( - \beta E(a) \big) = - \frac{1}{Z} \frac{\partial Z}{\partial \beta}
\end{aligned}
$$
注意到
$$\frac{\partial F}{\partial T} = - k \ln Z - k T \frac{\partial \ln Z}{\partial \beta} \frac{\partial \beta}{\partial T} = - k \ln Z + \frac{1}{T} \frac{\partial \ln Z}{\partial \beta}$$
从而
$$<E> = - \frac{\partial \ln Z}{\partial \beta} = F - T \frac{\partial F}{\partial T}$$
{: .proof}

同理，能量的方差为
$$(\Delta E)^2 = <E^2> - <E>^2 = \frac{\partial^2 \ln Z}{\partial \beta^2}$$
而热容为
$$C_V = \frac{\partial E}{\partial T} = \frac{\partial F}{\partial T} - \frac{\partial F}{\partial T} - T \frac{\partial^2 F}{\partial T^2} = - T \frac{\partial^2 F}{\partial T^2}$$

正则系综的熵与自由能函数之间满足
$$S = - \frac{F}{T} + \frac{E}{T} \iff F = E - TS$$
{: .proposition}

根据定义
$$S = k \sum_{a \in A} P(a) \ln P(a)$$
直接代入计算即可：
$$
\begin{aligned}
S &= k \sum_{a \in A} \frac{\exp(-\beta E_a)}{Z} \ln \frac{\exp(-\beta E_a)}{Z} \\
&= k \sum_{a \in A} \frac{\exp(-\beta E_a)}{Z} (- \beta E_a - \ln Z) \\
&= \frac{E}{T} - \frac{F}{T}
\end{aligned}
$$
{: .proof}

### 自由能函数与内参量

热力学基本关系可由自由能表出：
$$\mathrm d F = \textcolor{red}{- S \mathrm d T} - p \mathrm d V + \mu \mathrm d N$$
{: .proposition}

我们已经知道
$$\mathrm d E = T \mathrm d S - p \mathrm d V + \mu \mathrm d N$$
而同时
$$\mathrm d F = \mathrm d E - \mathrm d (TS) = \mathrm d E - T \mathrm d S - S \mathrm d T$$
代入即可。
{: .proof}

利用热力学基本关系，可以表出所有内参量：
$$
\begin{aligned}
S &= - \frac{\partial F}{\partial T} \\
p &= - \frac{\partial F}{\partial V} \\
\mu &= \frac{\partial F}{\partial N}
\end{aligned}
$$
而任意内参量的分布也是以期望为中心的正态分布，其证明与微正则系综完全相同，只需要将$\Omega$替换为配分函数并将负熵替换为自由能函数即可。

### 系统的自发演化

我们马上证明，自由能函数是正则系综的热力学势——即任何自发的变化必将使得系统的自由能函数下降。

自由能函数是正则系综的热力学势。
{: .proposition}

仍然考虑由热库$\mathcal T$和另一系统$\mathcal S$构成的孤立系统，根据微正则系综的研究，总系统的热力学势为负熵，即自发变化必将使得其熵增加。
则热库处于一微观态，而系统$\mathcal S$处于能量为$E\_\mathcal S$的微观态的概率为
$$P(E_\mathcal S \cap E_\mathcal T) = P_\mathcal S(E_\mathcal S) P_\mathcal T(E_\text{tot} - E_\mathcal S) = P_\mathcal S(E_\mathcal S) P_\mathcal T(E_\text{tot} - E_\mathcal S)$$
从而总系统的熵为
$$
\begin{aligned}
s &= - k \sum_{E_\mathcal S} P_\mathcal S(E_\mathcal S) P_\mathcal T(E_\text{tot} - E_\mathcal S) \ln\left[P_\mathcal S(E_\mathcal S) + P_\mathcal T(E_\text{tot} - E_\mathcal S)\right] \\
&= s_\mathcal S - \sum_{E_\mathcal S} P_\mathcal S(E_\mathcal S) s_\mathcal T(E_\text{tot} - E_\mathcal S) \\
&= s_\mathcal S + s_\mathcal T(E_\text{tot}) - \frac{<E_\mathcal S>}{T} = s_\mathcal T(E_\text{tot}) - \frac{F_\mathcal S}{T}
\end{aligned}$$
由于总系统为孤立系统，自发变化必使其熵增加。
而$s\_\mathcal T$是一个常数，因此$F_\mathcal S$必然减少。
{: .proof}

