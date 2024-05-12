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
