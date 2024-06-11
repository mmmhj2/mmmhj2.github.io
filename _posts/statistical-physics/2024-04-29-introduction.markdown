---
title: "统计物理导论"
categories: ["统计物理"]
---

本文主要介绍统计物理的基本概念——即通过研究大规模微观粒子（称为“系综”，ensemble）的状态描述宏观系统的一门科学。

## 概率与熵

### 系综

无论出于理论还是实际考量，我们都不可能确定微观系统中每个粒子的状态，但我们可以研究大规模微观粒子组成的系统的行为，这是通过概率学这一数学武器完成的。

统计物理学的研究对象为**系综**（ensemble），系综是有限个或无限个粒子的集合，这些粒子的状态按一定的概率取得。
数学上说，令$(A, \Sigma, P)$为一概率空间，其中$A$表示某个物理系统的所有微观状态（microstate）的集合，即状态空间（State space）或相空间（Phase space），$\Sigma \subset \mathcal P(A)$是$A$的$\sigma$代数，$P: \Sigma \to [0, 1]$，则该概率空间称为一个系综。
该概率空间的期望称为系综平均。
{: .definition}

系综的概念约于十九世纪末提出，早于柯尔莫哥洛夫对概率论的公理化，因此统计物理学中常用系综指代概率空间。

我们将特别考虑系统在平衡状态下的三种系综——微正则系综、正则系综和巨正则系综。
这三种系综中的粒子对不同的微观状态的分布各不相同。

### 统计熵

“熵”表示了一个系统的不确定程度。
若我们希望用一个数学函数来表示系统的不确定程度，那么这个函数应当具有以下性质：

1. 该函数总是大于等于零。
2. 当该系统被完全确定时，该函数为零。
3. 当系统的所有可能状态的概率相等时，系统最不确定，因此该函数取最大值。
4. 当两个独立的系统组成一个新系统时，新系统的函数应为原系统之和。

对数函数恰好满足最后一个性质，即：
$$\ln P(A \cap B) = \ln P(A) + \ln P(B)$$

系统的**统计熵**（entropy）定义为
$$S = - k \sum_{a \in A} P(a) \ln P(a)$$
其中$k$为一常数，统计物理学中常选择玻尔兹曼常数
$$k = k_B \approx 1.38 \times 10^{-23} \,\text{J/K}$$
{: .definition}

## 简并度

多个微观状态的宏观表现可能是一致的，这种情况下我们称发生了*简并*。

设$E: A \to \mathbb R$ 为一函数，$E^*$为一常数，则集合
$$A^* = \{ a \in A \,|\,  E(a) = E^* \}$$
表示该函数取同一值时所有微观状态的集合。
该集合的基数称为**简并度**（Degeneracy），记为$\Omega(E^*)$。
{: .definition}

对平衡态的系统，某一微观状态$a$出现的概率仅与系统的能量$E(a)$有关，即
$$\forall a,b \in A^*, \quad P(a) = P(b)$$
这一假设称为统计物理基本假设（Fundamental Postulate of Statistical Physics），也叫等概率原理（Equal *A Priori* Probability Postulate）。
{: .theorem}

因此，我们可以认为系统处于某状态的概率是能量的函数，我们使用$P(E_j)$来表示这种概率。
这样，系统的系综平均即可从由微观态表示变为由能量表示：
$$<E> = \sum_{a \in A} E(a) \cdot P(a) = \sum_{e \in E(A)} e \cdot \Omega(e) \cdot P(e)$$

### 状态密度

对离散情况，简并度的概念足够清晰且易于计算，而对连续的情况，则需要使用状态密度进行计算。

某能量$E$的**状态密度**（Density of states）是能量微元区间$[E, E + \mathrm d E]$中的状态数，即
$$\rho(E) = \frac{\delta N(E)}{\mathrm d E} = \frac{\mathrm d \Phi(E)}{\mathrm d E}$$
其中$\Phi$表示能量小于等于$E$的状态总数。
{: .definition}

### 例子：无限势阱的状态密度

考虑困在三维无穷势阱（长宽高为$L\_x, L\_y, L\_z$）中的量子，给出其状态密度。<br/>
首先考虑势阱中量子的（定态）薛定谔方程：
$$\hat H \psi(\vec r) = - \frac{\hbar^2}{2m} \nabla^2 \psi (\vec r) = E \psi (\vec r)$$
分离变量，得到
$$\psi(\vec r) = \psi_x(x) \cdot \psi_y(y) \cdot \psi_z(z)$$
以X轴为例，有
$$- \frac{\hbar^2}{2m} \frac{\mathrm d^2}{\mathrm d x^2} \psi_x(x) = E_x \psi(x)$$
求解，可得
$$\psi_x(x) = A_x \exp(i K_x x), \quad K_x = \sqrt{\frac{2m E_x}{\hbar^2}}$$
这里利用循环边界条件，而非势阱外波函数为零的边界条件以简化计算，得到
$$\psi_x(0) = \psi_x(L_x) \implies K_x = \frac{2 \pi n_x}{L_x}, \, n_x \in \mathbb Z$$
其余两轴同理，得到波函数的解
$$\psi(\vec r) = A \exp(i \vec K \cdot \vec r), \quad \vec K = \begin{bmatrix} \frac{2 \pi n_x}{L_x} \\ \frac{2 \pi n_y}{L_y} \\ \frac{2 \pi n_z}{L_z} \end{bmatrix}$$
总能量为
$$E = E_x + E_y + E_z = \frac{\hbar^2}{2m} K^2$$
接下来计算状态密度，首先计算$\Phi(E)$，即计算
$$\frac{\hbar^2}{2m} K^2 \le E \iff K^2 \le \frac{2mE}{\hbar^2}$$
的状态总数。
注意到上式相当于将矢量$\vec K$限制在半径为$\frac{2mE}{\hbar^2}$的球中，球的体积为
$$V_\text{球} = \frac{4}{3} \pi \left(\frac{2mE}{\hbar^2}\right)^3$$
观察向量$\vec K$，单个状态占据的等效体积为
$$V_\text{状态} = \frac{8 \pi^3}{L_x L_y L_z} = \frac{8 \pi^3}{V}$$
其中$V$为势阱的体积。从而
$$\Phi(E) = \frac{V_\text{球}}{V_\text{状态}} = \frac{1}{6 \pi^2} \left( \frac{2mE}{\hbar^2} \right)^{\frac{3}{2}} V$$
最后，求导可得
$$\rho(E) = \frac{\mathrm d \Phi(E)}{\mathrm d E} = \frac{V}{4 \pi^2} \left( \frac{2m}{\hbar^2} \right)^{\frac{3}{2}} \sqrt{E}$$
注意此处只考虑了粒子的平动，没有考虑转动和自旋。
加上自旋后，使用该公式导出的结论只适用于单原子分子（没有转动自由度）。
{: .exampl}

## 各态经历假设

即使我们利用简并度简化了系综平均的计算，列举所有可能的能量仍不是一项可轻易完成的工作。
利用各态经历假设，我们可以更进一步地简化系综平均。

平衡状态下系统的系综平均与时间平均等价，即在足够长的时间内，系统将以一定概率经历所有可能的状态。
数学上可将该假设写为
$$<E> = <E>_t$$
这一假设称为各态经历假设（Ergodic hypothesis），满足各态经历假设的系统称为遍历系统（Ergodic system）。
{: .proposition}

较简单系统的各态经历假设已经利用数学工具得到了证明（参见刘维尔定理），而更一般的各态经历假设仍未得到证明。
