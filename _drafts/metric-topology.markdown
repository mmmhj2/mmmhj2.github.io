---
title: "度量拓扑基础"
categories: "分析"
---

本文介绍度量拓扑中的基本概念。

## 距离与范数

设$\mathbb K$为实数或复数数域，$E$为$\mathbb K$上的向量空间。

<div>
向量空间$E$上的一个<strong>范数</strong>为满足以下三条公理的映射$E \to \mathbb R, \; x \mapsto \Vert x \Vert$：
$$
\begin{array}{ll}
    \forall x \in E, \forall \lambda \in \mathbb{K} & \Vert \lambda x \Vert = | \lambda | \Vert x \Vert \\
    \forall x, y \in E & \Vert x + y \Vert \le \Vert x \Vert + \Vert y \Vert \\
    \forall x \in E & \Vert x \Vert = 0 \implies x = 0
\end{array}
$$
这三条性质分别称为齐次性、三角不等式和分离性。<br/>
一个具有范数的向量空间称为<strong>赋范向量空间</strong>。
</div>
{: .definition}

根据范数的定义不难导出一个不等式：
$$
\forall x, y \in E,\; | \Vert x \Vert - \Vert y \Vert | \le \Vert x - y \Vert
$$

设$X$为一集合，其映射$\mathbf{d}: X \times X \to \mathbb R\_+$称为**距离**，若其满足以下三个公理：
$$
\begin{array}{ll}
    \forall x, y \in X & \mathbf{d}(x,y) = \mathbf{d}(y,x) \\
    \forall x,y,z \in X & \mathbf{d}(x,z) \le \mathbf{d}(x,y) + \mathbf{d}(y,z) \\
    \forall x,y \in X & \mathbf{d}(x,y) = 0 \iff x = y
\end{array}
$$
具有距离的任意集合称为**度量空间**。
{: .definition}

任何赋范向量空间都是度量空间，其距离可由：
$$
\mathbf{d}(x,y) = \Vert x - y \Vert
$$
定义。
这个距离称为与范数相关的距离。
{: .proposition}

考虑到度量空间和赋范向量空间的一致性，接下来我们只研究赋范向量空间形式的度量空间，记一个度量空间为$X$。
度量空间$X$上的距离记为$\mathbf{d}_X$。

### 球与有界

设$a$为$X$上一点，$r$为正实数，我们定义三个概念：
1）设$r$非零，则$X$上以$a$中心，半径为$r$的**开球**表示：
$$
B(a,r) = \{ x \in X | \mathrm{d}(a,x) < r \}
$$
2）$X$上以$a$中心，半径为$r$的**闭球**表示：
$$
\overline{B}(a,r) = \{ x \in X | \mathrm{d}(a,x) \le r \}
$$
3）$X$上以$a$中心，半径为$r$的**球面**表示：
$$
B(a,r) = \{ x \in X | \mathrm{d}(a,x) = r \}
$$
{: .definition}

我们记一个度量空间的单位（开）球为$B(0,1)$。

赋范线性空间上的球$b$都是**凸**的，即：
$$
\forall a,b \in B, \; [a,b] = \{(1-t)a + tb, t \in [0,1]\} \subset B
$$
{: .proposition}

若$X$的一个集合可以被包含在一个球中，那么称其为**有界的**；
相对地，若一个映射的像可以被包含在一个球中，那么称这个映射是**有界的**。
{: .definition}

$X$的一个子集$A$是有界的，当且仅当映射$\mathbf{d}$关于$A \times A$的像是有界的。
{: .proposition}

有界集合的子集也是有界的；
*有限个*有界子集的并也是有界的。
{: .proposition}

### 李普希茨连续

设$X,Y$为二度量空间，对一个映射$f: X \to Y$，若存在一固定实数$C$：
$$
\forall x, x^\prime \in X, \; \Vert \mathbf{d}_Y (f(x), f(x^\prime)) \Vert \le C \Vert \mathbf{d}_X(x, x^\prime) \Vert
$$
则称其为$C$-李普希茨连续的，简称**李普希茨连续**的。
{: .definition}

设$A$为一非空集合，则一点到此集合的距离，定义为：
$$
\mathbf{d}(x,A) = \inf_{a \in A} \mathbf{d}(x, a)
$$
是1-李普希茨连续的。 \
这是因为，根据下确界的定义，对任意一对$x, x^\prime$，对任意$\varepsilon > 0$，存在一个$a$，使$\mathbf d(x,A) > \mathbf d(x, a) - \varepsilon$，从而：
$$
\mathbf{d}(x^\prime, A) - \mathbf{d}(x, A) \le \mathbf{d}(x^\prime, a) - \mathbf{d}(x,a) + \varepsilon \le \mathbf{d}(x^\prime, x) + \varepsilon
$$
从而取$\varepsilon \to 0$：
$$
\mathbf{d}(x^\prime, A) - \mathbf{d}(x,A) \le \mathbf{d}(x,x^\prime)
$$
然后交换$x, x^\prime$可得不等式的另外一侧。
{: .exampl}

### 空间的积

设$X\_1, \dots, X\_n$为度量空间，称其**积**的集合为$X\_1 \times \cdots \times X\_n$，对应的距离为：
$$
\mathbf{d}(x,y) = \max_{i = 1, \dots, n} \mathbf{d}_{X_i}(x_i, y_i)
$$
{: .definition}

设$X\_1, \dots, X\_n$为度量空间，则\
1）对所有$i \in [\\\![ 1, n ]\\\!]$，*典范满射*$X\_1 \times \cdots \times X\_n \to X\_i$是1-李普希茨的；\
2）所有积空间中的球都是每一个空间中的球的积。
{: .proposition}

## 基本概念

### 开集合与闭集合

设$A$为$X$的一个子集，$a$为$X$上一点。\
1）称$a$为$A$的**内部点**（或$A$为$a$的邻域），若在$A$中存在一个开球包含$a$； \
2）称$a$为$A$的**接触点**（或称闭包点），若所有以$a$为中心的开球交于$A$。
{: .definition}

内部点和接触点在某种意义上是*对偶*的：
$a$是$A$的内部点，当且仅当$a$不是$X \backslash A$的接触点；反之亦然。

设$A$为$X$的一个子集，若其中所有点都是*内部点*，那么称其为**开集合**；
若$A$的所有**接触点**都包括在其中，那么称其为**闭集合**。
{: .definition}

一个集合是开集合，当且仅当其补集合为闭集合。
{: .proposition}

所有开球都是开集合，所有闭球都是闭集合。
{: .proposition}

设$a$为$X$上一点：\
1）$a$的任何邻域的超集都是$a$的邻域；\
2）$a$的有限个邻域的交集仍是$a$的邻域。
{: .proposition}

1）空集与$X$既是开集合，又是闭集合；\
2）*有限个*开集合的交仍是开集合，*有限个*闭集合的并仍是闭集合；\
3）*任意个*开集合的并仍是开集合，*任意个*闭集合的交仍是闭集合。
{: .proposition}

#### 内部与闭包

设$A$为$X$的一个子集：\
1）称$A$的**内部**，记为$A^\circ$，表示所有$A$包含的开集合的并集，即$A$包含的最大（在包含这一偏序关系下）开集；\
2）称$A$的**闭包**，记为$\overline{A}$，表示所有包含$A$的闭集合的交集，即包含$A$的最小闭集；\
3）$A$的闭包与内部的差记为该集合的**边界**，边界上的点称为边界点。
{: .definition}

一个集合的*内部*，即其所有内部点的集合；
一个集合的*闭包*，即其所有闭包点的集合。
{: .proposition}

若$X$中一个集合的闭包等于$X$，那么称这个集合是**稠密的**，或称其为处处稠密的。
{: .definition}

#### 聚点与孤立点

称$X$中的一点$x$为$A$的**聚点**，若所有以$x$为中心的开球与$A$的交集包含至少一个不同于$x$的点。
称$A$中的一点$a$为**孤立点**，若存在一个以$a$为中心的开球与$A$的交集仅包括$a$。
{: .definition}

记$A$的聚点的集合为$A^\prime$，孤立点的集合为$I$，那么$I = \overline{A} \backslash A^\prime$。
{: .proposition}

这一命题说明，如果存在孤立点，那么就有不是聚点的闭包点，进而可能存在不是聚点的边界点。

### 连续性与极限

#### 连续函数的定义

设$X, Y, Z$为度量空间，其上的距离记为$\mathbf{d}_X, \mathbf{d}_Y, \mathbf{d}_Z$。

设$f: X \to Y$为一映射，称其在$a$点是**连续**的，若：
$$
\forall \varepsilon > 0 \; \exists \delta > 0 \; \forall x \in X \quad
\mathbf{d}_X(a,x) < \delta \implies \mathbf{d}_Y(f(a), f(x)) < \varepsilon
$$
即对于任意一个足够接近于$a$的点，其映射后的点之间的距离也可以足够接近。 \
若$f$在一个集合中的所有点都连续，那么称其在这个集合上连续；若$f$在$X$上连续，那么我们直接称它是连续的。
{: .definition}

显然，李普希茨连续的函数一定是连续的。

根据定义，函数在$X$的孤立点处总是连续的。
{: .remark}

设$f: X \to Y$为一映射，$a$为$X$上一点，则$f$在$a$处连续，当且仅当$f(a)$的所有邻域的原像都是$a$的邻域。
从而以下三个命题等价：\
1）映射$f$是连续的；\
2）$Y$中所有开集的原像是$X$中的开集；\
3）$Y$中所有闭集的原像是$X$中的闭集。
{: .proposition}

函数$f$在$X$上是**一致连续**的，若其满足：
$$
\begin{aligned}
    \forall \varepsilon > 0 \; \exists \delta > 0 \; \forall x, x^\prime \in X \\
    \mathbf{d}_X(x,x^\prime) < \delta \implies \mathbf{d}_Y(f(x), f(x^\prime)) < \epsilon
\end{aligned}
$$
{: .definition}

注意到在一致连续的定义中，$x$的选择在$\varepsilon$的选择之后，因此一致连续比连续更“强”。

#### 连续函数的性质

设$f: X \to Y$，$g: Y \to Z$，若$f$在$a \in X$处连续且$g$在$f(a) \in Y$中连续，那么$g \circ f$在$a$处连续。
同理，若$f,g$都是连续的，那么$g \circ f$是连续的。
{: .proposition}

设$Y$为$Y\_1, \dots, Y\_n$的积空间，$f: X \to Y$在某一点是连续的，当且仅当这个映射的每一个分量$f\_i: X \to Y\_i$在该点处连续。
{: .proposition}

设$E$为一赋范向量空间，那么其上的连续映射是关于线性运算封闭的：两个在$a$点处连续的映射的线性组合仍然在$a$点处连续。
从而，若记从$X$到$E$的连续映射的集合为$\mathcal{C}(X;E)$，则集合实际上是$E^X$的子空间。
{: .proposition}

$\mathbb K^n$空间上的任何多项式映射在$\Vert \Vert_\infty$范数下都是连续的。
实际上，由于有限维空间下所有范数都是等价的，这一连续性与范数的选择无关。
{: .proposition}

#### 极限

设$a$为$X$中一非孤立点，$f: X \backslash \{a\} \to Y$在$a$处有**极限**，若存在一个$b \in Y$使：
$$
\forall \varepsilon > 0 \; \exists \delta > 0 \; \forall x \in X \backslash \{a\} \quad
\mathrm{d}_X(a,x) < \delta \Rightarrow \mathrm{d}_Y(b, f(x)) < \varepsilon
$$
点$b$若存在，则是唯一确定的，这个点称为其**极限**，记为：
$$
\lim_{x \to a} f(x) = b
$$
{: .definition}

联系极限与连续的定义，不难发现，一个函数$f$在$a$处有极限，当且仅当：
$$
\tilde{f}(x) =
\begin{cases}
    f(x)    &\text{若} x \neq a \\
    b       &\text{否则}
\end{cases}
$$
在$a$处连续。
函数$\tilde{f}$称为$f$在$a$处的连续性延拓。
{: .proposition}

设$Y$为$Y\_1, \dots, Y\_n$的积空间，$f: X \to Y$在$a \in X$点存在，当且仅当其每个分量在该点处的极限存在。
若这个极限存在，那么其值为：
$$
\lim_{x \to a} f(x) = (\lim_{x \to a} f_1(x), \cdots, \lim_{x \to a} f_n(x))
$$
{: .proposition}

在某一点处有极限的函数的线性组合在该点处仍然有极限，且线性组合的函数的极限等于极限的线性组合。
{: .proposition}

### 序列性质

称$X$中一个序列$(x_n)$是**收敛的**，若存在$a \in X$，满足：
$$
\forall \varepsilon > 0 \; \exists n \in \mathbb{N} \; \forall p \in \mathbb{N} \quad
p \ge n \implies \mathbf{d}(a, x_p) < \varepsilon
$$
若序列不是收敛的，那么称其为**发散的**。
若$a$存在，那么它是唯一的，称为序列的**极限**。
{: .definition}

设$(x\_n)$为$X$中一个序列，$a$为$X$上一点，那么以下两个命题等价：\
1）数列$(x\_n)$收敛至$a$；\
2）设$V$为$a$的任意一个领域，则序列中不在这个邻域中的点只有*有限个*。
{: .proposition}

因此，一个序列是收敛的，那么它一定是有界的。

序列和函数极限一样，关于积空间和线性组合也满足一样的性质，在此不再赘言。

#### 拓扑概念的序列性质

（聚点的序列性质）设$a$为$X$上的一点，$A$为$a$的子集，则$a$是$A$的一个聚点，当且仅当$A$中存在一个序列收敛至$a$。
{: .proposition}

（闭集合的序列性质）$X$的一个子集$A$是一个闭集合，当且仅当，所有在$A$中的序列，若在$X$下有极限，那么其极限在$A$之中。
{: .proposition}

（极限存在性的序列性质）设$a$为$X$中一个非孤立点，$f: X\backslash \\\{a\\\} \to Y$为一映射，那么映射$f$在$a$点有极限，当且仅当对所有$X\backslash\\\{a\\\}$中的序列$(x\_n)$，若其收敛至$a$，则$(f(x\_n))$收敛。这一命题在实数域下称为海涅定理。
{: .proposition}

（连续的序列性质）设$f: X \to Y$，其在$a$点连续，当且仅当对所有$X$中的序列$(x\_n)$，若其收敛至$a$，则$(f(x\_n))$收敛。
{: .proposition}

（一致连续的序列性质）$f$为一致连续的，当且仅当对所有$X$中的序列$(x\_n)$，$(x^\prime\_n)$，有：
$$
\lim_{n \to \infty} \mathbf{d}(x_n, x^\prime_n) = 0 \implies \lim_{n \to \infty} \mathbf{d}
$$
{: .proposition}

## 紧密集

本章中，我们设$(U\_i)$表示集合$U$的一个*覆盖*，若这列集合的并集包含$U$。

称一个度量空间$K$是**紧密**的，若其满足*博雷尔-勒贝格性质*，即其开覆盖必有有限子覆盖：
若存在一列开集$(U\_i)\_{i \in I}$满足$K \subset \bigcup\_{i \in I}$，那么必然存在$I$的一个有限子集$\\\{ i\_1, \dots, i\_n \\\}$使$K \subset U\_{i\_1} \cup \cdots \cup U\_{i\_n}$
{: .definition}

### 极限点
