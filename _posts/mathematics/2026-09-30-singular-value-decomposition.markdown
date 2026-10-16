---
title: "奇异值分解"
categories: ["代数"]
---

本文中我们将延续对线性空间中变换的讨论，但是将其推广到两个线性空间之间的变换，最终导出奇异值分解。

## 两个内积空间的线性变换

我们这章中约定$V, W$是数域$\mathbf F$上的有限维准希尔伯特空间。
我们将延续[半线性型与厄米型]({% post_url mathematics/2023-06-07-hermitian-forms %})中的讨论，从伴随算子开始。

### 伴随算子的定义

设$u \in \mathcal L(V, W)$，则其伴随算子（Adjoint）$u^\star: W \to V$定义为满足以下条件的唯一映射：
$$\forall v \in V, w \in W, \; (u(v), w)_W = (v, u^\star(w))_V.$$
这个线性映射的存在性和唯一性由里斯表示定理保证。
{: .definition}

<div>
对于不同的空间$V, W$，伴随算子具有以下性质：
<ol>
<li>$$u^\star \in \mathcal L(W, V)$$</li>
<li>$$(u+v)^\star = u^\star + v^\star$$</li>
<li>$$(\lambda u)^\star = \overline{\lambda} u^\star$$</li>
<li>$$(u^\star)^\star = u$$</li>
<li>$$(u \circ v)^\star = v^\star \circ u^\star, \forall v \in \mathcal L(U, V)$$</li>
</ol>
</div>
{: .proposition}

对照之前的性质，只有可逆性一条无法推广到不同的两个空间上。

<small>（伴随算子的矩阵表示）</small>
设$u \in L(V, W)$在某一正交标准基底
$$\mathrm{Span}(v_1, v_2, \dots, v_n) = V, \; \mathrm{Span}(w_1, w_2, \dots, w_n) = W,$$
下的矩阵为$M(u)$，则其对应伴随算子的矩阵表示恰为该矩阵的共轭转置，即
$$M(u)^\dagger = M(u^\star).$$
{: .proposition}

这可通过计算矩阵中的每个元素，再利用内积的性质验证。

### 伴随算子的子空间

对于伴随算子的像空间和核空间，我们有：

设$u \in \mathcal L(V, W)$，则$\ker u \subset V$、$\mathrm{Im}\ u \subset W$，有
$$
\begin{aligned}
\ker u^\star &= (\mathrm{Im}\ u)^\perp, \\
\ker u &= (\mathrm{Im}\ u^\star)^\perp, \\
\mathrm{Im}\ u^\star &= (\ker u)^\perp, \\
\mathrm{Im}\ u &= (\ker u^\star)^\perp. \\
\end{aligned}
$$
{: .proposition}

注意到
$$u^\star(v) = 0 \iff (v, u^\star(w)) = 0 \iff (u(v), w) = 0,$$
这就是说
$$v \in \ker u^\star \iff v \in (\mathrm{Im}\ u)^\perp,$$
这就证明了第一条等式。
交换$u$和$u^\star$可得第二条等式；
两边同时取正交补即可得到剩下的等式。
{: .proof}

对同一空间上的线性变换而言，伴随算子的不变子空间就是原算子的不变子空间的正交补。
但对于两个不同空间上而言，不变子空间的概念不再存在，因此这个命题也需要对应的修改。

设$u \in L(V,W)$，而$F \subset V, G \subset W$是两个子空间。
有
$$u(F) \subset G \implies u^\star(G^\perp) \subset F^\star.$$
{: .proposition}

证明方法则是类似的。

## 奇异值分解

借助伴随算子的定义，我们可以开始考虑奇异值分解了。
首先我们介绍奇异值的概念。

### 奇异值

我们首先证明算子$u^\star \circ u$的一项性质。

设$u \in L(V, W)$，则算子$u^\star \circ u$是半正定的自伴算子，其特征值均非负。
{: .proposition}

自伴性是显然的，接下来证明半正定性。
设$v \in V$为任意矢量，则
$$
(u^\star \circ u(v), v) = (u(v), u(v)) = \Vert u(v) \Vert^2 \ge 0,
$$
从而该算子是半正定的，因此特征值均非负。
{: .proof}

设$u \in L(V, W)$，则其奇异值定义为$u^\star \circ u$的特征值的算术平方根。
奇异值具有和特征值相同的几何重数，即$u^\star \circ u$的特征值对应的特征子空间的维数和奇异值的重数相同。
{: .definition}

奇异值与特征值在描述映射的性质上具有很大的相似性，为了证明这些相似性，我们还需要继续研究算子$u^\star \circ u$的核空间和像空间。

设$u \in L(V, W)$，则
$$\ker u^\star \circ u = \ker u, \; \mathrm{Im}\ u^\star \circ u = \mathrm{Im}\ u^\star,$$
且
$$\dim \mathrm{Im}\ u^\star \circ u = \dim \mathrm{Im}\ u^\star = \dim \mathrm{Im}\ u$$
{: .proposition}

因为
$$u(v) = 0 \implies u^\star u(v) = 0,$$
显然$\ker u^\star u \subset \ker u$。
另一方面，若$v \in \ker u^\star u$，那么
$$(u^\star u(v), v) = \Vert u(v) \Vert^2 = 0,$$
从而$u(v) = 0.$
这就证明了$\ker u^\star u = \ker u$。
另一方面，有
$$\mathrm{Im}\ u^\star u = \ker (u^\star u)^\perp = (\ker u)^\perp = \mathrm{Im}\ u^\star.$$
最后，有
$$\dim \mathrm{Im}\ u = \dim (\ker u^\star)^\perp = \dim W - \dim \ker u^\star = \dim \mathrm{Im}\ u^\star,$$
最后一步来自秩-零化度定理。
{: .proof}

借助上面的命题，我们有：

算子$u$是单射，当且仅当$0$不是其的奇异值；
算子$u$是满射，当且仅当其非零奇异值个数与$W$的维数相等；
算子$u$是酉变换，当且仅当其奇异值均为$1$。
{: .proposition}

<div>
<p>
算子$u$是单射当且仅当其核空间仅含$0$。
我们又知道$\ker u = \ker u^\star u$，则算子$u$是单射当且仅当$\ker u^\star u = \{0\}$，从而当且仅当$0$不是$u^\star u$的特征值，从而当且仅当$0$不是其的奇异值。
</p>
<p>
我们知道，像空间的维数等于考虑重数下映射非零特征值的个数。
我们又知道$u^\star \circ u$的像空间的维数等于$u$的像空间的维数，从而算子$u$是满射，当且仅当$u^\star \circ u$非零特征值的个数与$W$的维数相等，当且仅当其非零奇异值个数与$W$的维数相等。
</p>
<p>
最后，注意到$u$是酉变换，当且仅当$u^\star u = I$，从而当且仅当其所有特征值均为一。
</p>
</div>
{: .proof}

### 算子的奇异值分解

现在我们介绍奇异值分解。

设$u \in L(V, W)$，其非零奇异值为$s\_1, s\_2, \dots, s_m$，$m \le \dim V$，那么存在两组向量：
$$v_1, v_2, \dots, v_m \in V, \; w_1, w_2, \dots, w_m \in W,$$
这两组向量分别两两正交，且范数均为一，且满足
$$
\forall x \in V, \; u(x) = s_1 (x, v_1) w_1 + s_2 (x, v_2) w_2 + \cdots + s_m (x, v_m) w_m.
$$
这种分解方法称为*奇异值分解*（Singular value decomposition）。
{: .theorem}

我们给出这些向量的构造性证明。
设 $\dim V = n$，且 $u$ 的所有奇异值为
$$s_1 \ge s_2 \ge \dots \ge s_m > 0 = s_{m+1} = \cdots = s_n.$$
由于$u^\star u$是半正定的自伴算子，根据谱定理该算子可对角化，即存在 $V$ 的一组正交标准基底$v\_i$，满足
$$
u^\star \circ u(v_i) = s_i^2 v_i, \; \forall i \in [\![1, n]\!].
$$
注意 $s\_i$ 是按从大到小排序的，前 $m$ 项非零，因此设向量组 $w\_i$ 为：
$$w_i = \frac{u(v_i)}{s_i}, \; i \in [\![1, m]\!].$$
现在我们计算对任意向量 $u(x)$ 的值：
$$
\begin{aligned}
u(x) &= u( (x, v_1) v_1 + (x, v_2) v_2 + \cdots + (x, v_n) v_n ) \\
&= (x, v_1) u(v_1) + (x, v_2) u(v_2) + \cdots + (x, v_n) u(v_n).
\end{aligned}
$$
注意到$\ker u^\star u = \ker u$，有
$$u(v_i) = u^\star u(v_i) = 0, \; \forall i \in [\![m+1, n]\!],$$
从而可将这些项消去，得到
$$
u(x) = (x, v_1) u(v_1) + \cdots + (x, v_m) u(v_m).
$$
然后利用 $w\_i$ 的定义，得到
$$u(x) = s_1 (x, v_1) w_1 + s_2 (x, v_2) w_2 + \cdots + s_m (x, v_m) w_m.$$
最后我们证明$w\_i$的正交归一性，直接计算即有
$$
\begin{aligned}
(w_i, w_j) &= (\frac{u(v_i)}{s_i}, \frac{u(v_j)}{s_j}) \\
&= \frac{1}{s_i s_j} (v_i, u^\star u(v_j)) \\
&= \frac{s_j^2}{s_i s_j} (v_i, v_j) = \delta_{i,j},
\end{aligned}
$$
这就完成了证明。
{: .proof}

对满足奇异值分解条件的向量组，$v\_i$ 是 $\ker u^\perp$ 的一组正交标准基底、而 $w\_i$ 是 $\mathrm{Im}\ u$的一组正交标准基底。
{: .proposition}

第二点是容易证明的。
根据奇异值分解的定义，所有 $u$ 的像一定能写成 $w\_i$ 的线性组合，因此有
$$\mathrm{Span}(w_1, \dots, w_m) = \mathrm{Im}\ u,$$
而$w\_i$已经是标准正交的，因此它构成像空间的一组基底。
针对第一点，首先根据奇异值分解的定义，设$k \in \ker u$，则
$$u(k) = 0 = s_1 (k, v_1) w_1 + \cdots + s_m (k, v_m) w_m,$$
从而
$$(k, v_i) = 0, \forall i \in [\![1, m]\!] \implies v_i \in \ker u^\perp.$$
另一方面，$v\_i$ 本身就是正交归一的，且其数量等于维数：
$$m = \dim \mathrm{Im}\ u^\star u = \dim \mathrm{Im}\ u^\star = \dim \ker u^\perp,$$
因此这是 $\ker u^\perp$ 的一组正交标准基底。
{: .proof}

### 矩阵的奇异值分解

根据奇异值分解的算子形式，我们可以容易地给出其矩阵形式。

设$A \in \mathbf F_{k \times n}$为一（实或复）矩阵，其秩为 $m$。则其总是可写为三个矩阵的乘积：
$$
A = U \Sigma V^\star,\; U \in \mathbf F_{k \times k}, \Sigma \in \mathbf F_{k \times n}, V \in \mathbf F_{n \times n},
$$
其中$U, V$是酉矩阵，$\Sigma$是对角矩阵，对角线上的值称为该矩阵的奇异值。
{: .proposition}

从算子形式到矩阵形式的方法是比较直接的。
首先我们将$v\_i, w\_i$两组向量填充成对应空间的完整基底，对于 $V$ 空间我们可以直接选择 $u^\star u$ 的谱分解给出的基底；对于 $W$ 空间则可以先填充成任意基底，然后通过 Gram-Schmidt 正交化得到正交标准基底。
出于记号的便利性，后面的证明我们指的总是这组正交标准基底，在这组基底下，我们给出矩阵 $A$ 的坐标表示。
根据特征值分解的算子形式，设 $u$ 是该矩阵 $A$ 对应的算子，我们有
$$
u(v_i) = \sum_{j=1}^m s_j (v_i, v_j) w_j = \begin{cases}
s_i w_i &, i \in [\![1, m]\!] \\
0 &, i \in [\![m+1, n]\!]
\end{cases},
$$
因此其在该新坐标系下的矩阵为
$$
\Sigma = \begin{pmatrix}
\mathrm{diag}(s_1, s_2, \dots, s_m) & \mathbf 0_{m \times (n-m)} \\
\mathbf 0_{(k-m)\times n} & \mathbf 0_{(k-m)\times(n-m)}
\end{pmatrix}_{k\times n}.
$$
现在令
$$
U = \begin{pmatrix} w_1 \vert \cdots \vert w_k \end{pmatrix}, V = \begin{pmatrix} v_1 \vert \cdots \vert v_n \end{pmatrix},
$$
由于这两组向量都是正交标准基底，这两个矩阵是都是酉矩阵。
根据坐标变换公式，对任何向量$x \in V$，有
$$A x = U \Sigma V^{-1} x = U \Sigma V^* x,$$
从而
$$A = U \Sigma V^*.$$
{: .proof}

对于秩$m$小于空间维数的矩阵$A$，奇异值分解中相当多的数据都会因为奇异值矩阵$\Sigma$的对角线上的零元素而被浪费。
有多种优化方法可用于减少计算奇异值分解所需的内存消耗，包括约简奇异值分解（Reduced SVD）和压缩奇异值分解（Compact SVD）。
