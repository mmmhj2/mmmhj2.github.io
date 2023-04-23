---
title: "欧氏空间的等距变换"
categories: "代数"
---

本章中，我们将研究有限维内积空间（即欧氏空间）的等距变换。

## 等距变换的定义

设$f: E \to E$为一映射，称其为**等距变换**，若：
$$
f(0_E) = 0_E
$$
且
$$
\forall (u,v) \in E^2, \; \Vert f(u) - f(v) \Vert = \Vert u - v \Vert
$$
后者称为*保距离性*。
{: .definition}

等距变换还有一个等价的定义：

这个定义等价于：
$$
\forall (u,v) \in E^2, \; (f(u) | f(v)) = (u|v)
$$
这个性质称为*保内积性*。
{: .proposition}

先由前一个定义推后一个定义：
$$
\begin{aligned}
    (f(u) | f(v)) 
    &= \frac{1}{2} (\Vert f(u) \Vert^2 + \Vert f(v) \Vert^2 - \Vert f(u)-f(v) \Vert^2) \\
    &= \frac{1}{2} (\Vert f(u)-f(0) \Vert^2 + \Vert f(v)-f(0) \Vert^2 - \Vert f(u)-f(v)\Vert^2) \\
    &= \frac{1}{2} (\Vert u \Vert^2 + \Vert v \Vert^2 - \Vert u-v \Vert^2) \\
    &= \frac{1}{2} (\Vert u \Vert^2 + \Vert v \Vert^2 - (\Vert u \Vert^2 + \Vert v \Vert^2 - 2(u|v))) \\
    &= (u|v)
\end{aligned}
$$
再用后一个定义推前一个定义：
首先验证$f(0) = 0$
$$
\Vert f(0) \Vert^2 = (f(0) | f(0)) = (0|0) = 0 \implies f(0) = 0
$$
然后验证保距离性：
$$
\begin{aligned}
    \Vert f(u) - f(v) \Vert^2 
    &= (f(u) | f(u)) + (f(v) | f(v)) - 2 (f(u) | f(v)) \\
    &= (u|u) + (v|v) - 2(u|v) \\
    &= \Vert u - v \Vert^2
\end{aligned}
$$
由于距离非负，两者相等。
{: .proof}

在定义之中，我们并不要求该映射为线性映射。
实际上，我们很快就能知道，满足这些条件的映射一定是线性的。
{: .remark}

### 等距变换的基本性质

所有等距变换都是*线性的双射*。
线性变换的集合，记为$\mathcal O (E)$，是$GL(E)$的一个子群。
{: .proposition}

通过计算不难证明
$$
\Vert f(au+bv) - (af(u)+bf(v)) \Vert^2 = 0
$$
因此所有等距变换都是线性的。
注意到这些映射都是有限维下的变换，因此我们只需要证明其是满射或单射之一即可。
我们选择证明其为单射，即$\ker f = \\\{ 0 \\\}$。
设$u \in E$满足$f(u) = 0$，则有：
$$
(u|u) = (f(u)|f(u)) = 0
$$
因此$u = 0$，从而证毕。
注意到我们已经证明$\mathcal O(E) \subset GL(E)$，不难验证子群的三个公理：
$\mathrm{Id}\_E \in \mathcal O(E)$、对复合封闭并存在逆元。
{: .proof}

以下四条命题等价： \
1）$f$是保范数（即$\Vert f(u) \Vert = \Vert u \Vert$）的线性映射； \
2）$f$是等距变换；\
3）$f$是线性映射，且将**所有**正交标准基底映射为正交标准基底；\
4）$f$是线性映射，且将**一个**正交标准基底映射为正交标准基底。
{: .proposition}

- 首先证明一推二：
已知$f$是线性的，那么$f(0) = 0$。
然后有：
$$
\Vert f(u) - f(v) \Vert = \Vert f(u-v) \Vert = \Vert u - v \Vert
$$
从而该映射是保距离的。
- 然后证明二推三：
设$(e\_1, \dots, e\_n)$是一组标准正交的基底，那么：
$$
\forall i, j, \; (f(e_i) | f(e_j)) = (e_i | e_j) = \delta_{i,j}
$$从而根据定义$(f(e\_1), \dots, f(e\_n))$是标准正交的，又其有$n$个，因此是一组基底。
- 三推四是显然的。
- 最后证明四推一：
设$(e\_1, \dots, e\_n)$是一组标准正交基底，且$(f(e\_1), \dots, f(e\_n))$也是标准正交的基底，那么：
$$
\begin{aligned}
\forall u \in E, \; \Vert f(u) \Vert^2 &= \Vert \sum_{i=1}^n f(u_i e_i) \Vert^2 \\
&= \Vert \sum_{i=1}^n u_i f(e_i) \Vert^2 \\
&= \sum_{i=1}^n u_i = \Vert u \Vert^2
\end{aligned}
$$
从而该映射是保范数的。
{: .proof}

## 等距变换与正交矩阵

本节中我们将研究等距变换的矩阵形式——正交矩阵。
回忆一下正交矩阵的定义：

可逆矩阵$M$是一个正交矩阵，当且仅当其满足$M^{-1} = M^\top$。
{: .definition}

显然，若$M$是正交的，那么其逆$M^{-1}$和转置$M^\top$都是正交矩阵。
正交矩阵的列向量（和行向量）可以看作典范基底下的一组标准正交基底的坐标。

对三维的情况，如果要验证一个矩阵是正交矩阵，只需要验证前两列标准正交，且第三列等于前两列的外积即可。

以下命题揭示了等距变换与正交矩阵的关系。

一个线性变换是等距变换，当且仅当其在一组*标准正交基底*下的矩阵是一个正交矩阵。
{: .theorem}

首先考虑前推后，设$M$是等距变换$f$在一组标准正交基$(e\_1, \dots, e\_n)$下的矩阵，有：
$$
\begin{aligned}
    <f(u) | f(v)> &= <u | v> \\
    (Mu)^\top (Mv) &= u^\top v \\
    u^\top (M^\top M) v &= u^\top v
\end{aligned}
$$
由于这个等式对任何一对向量$u,v$都成立，我们取$u = e\_i$，$v = e\_j$，可得：
$$
e_i^\top (M^\top M) e_j = (M^\top M)_{i,j} = \delta_{i,j} \implies M^\top M = I
$$
从而这个矩阵是正交矩阵。 \
然后考虑后推前。
设$M$是线性映射$f$在一个标准正交基底下的矩阵，且其为正交阵。
$$
\begin{aligned}
    \forall x \in E, \Vert f(x) \Vert^2 &= \langle f(x) | f(x) \rangle \\
    &= (Mx)^\top (Mx) \\
    &= x^\top M^\top M x \\
    &= x^\top x = \Vert x \Vert^2
\end{aligned}
$$
从而这个线性映射保距离，因此是等距变换。
{: .proof}

这个证明的第一部分实际上没有使用标准正交基的条件，因此实际上存在一些不是标准正交的基底使等距变换的矩阵仍是正交的。

### 正交群

若$M$正交，则$| \det M | = 1$。
我们记正交阵的集合为$\mathcal O\_n(\mathbb R)$；
其中行列式为正的记为$\mathcal {SO}\_n(\mathbb R)$或$\mathcal O\_n^+ (\mathbb R)$，
行列式为负的记为$\mathcal O\_n^- (\mathbb R)$。
{: .proposition}

$$
(\det M)^2 = \det (M^\top M) = \det I = 1
$$
{: .proof}

1. $\mathcal O\_n(\mathbb R)$和$\mathcal {SO}\_n(\mathbb R)$是$GL\_n(\mathbb R)$的子群；
2. $\mathcal O\_n(\mathbb R)$与$\mathcal O(E)$（$E$空间上的等距变换）同构。
{: .proposition}

1. 容易验证子群的三个公理；
2. 取$\mathcal B$为$E$的一个标准正交基底，则容易验证：
   $$
   \begin{array}{cccc}
    \varphi: & \mathcal O(E) & \to & M_n(R) \\
    & f & \mapsto & \mathrm{Mat}_{\mathcal B}(f)
   \end{array}
   $$
   是一个群同构，即一个双射的保乘法映射。
   注意群同构不同于线性映射，单射要求$\ker \varphi = \varphi(\\\{1\_E\\\}) = {1\_F}$，其中$1$表示乘法单位元，而非零。
{: .proof}

$\mathcal O\_n^- (\mathbb R)$不是一个群，其不包含单位元，也不保乘法。
{: .remark}

## 等距变换的手性

称两组基底$\mathcal B$和$\mathcal B^\prime$的方向（手性）相同，若：
$$\det_B(B^\prime) = \det(P_{B \to B^\prime}) > 0$$
若选择一个基底来定义空间的方向，那么与此基底同向的基底称为右手（Direct）的，否则称为左手（Indirect）的。
{: .definition}

不难验证，方向相同这一关系构成一个等价关系，而方向相同的向量构成一个等价类。

若等距映射*保持方向*，即对所有基底$\mathcal B$，$f(\mathcal B)$与其同向，则称这个等距映射是右手的，否则称为左手的。
右手等距变换的集合称为$\mathcal{SO}(E)$，左手等距变换的集合称为$\mathcal O^-(E)$。
{: .definition}

等距映射$f$是右手的，当且仅当其行列式为正一；
其为左手的，当且仅当其行列式为负一。
{: .proposition}

从而，等距映射的手性与基底无关，因为其行列式与基底无关。

根据定义，若$\mathcal B$与$f(\mathcal B)$同向，那么说明$\det\_{\mathcal B}(f(\mathcal B)) > 0$，从而根据线性变换行列式的定义，$\det f > 0$。
又等距变换的行列式绝对值为1，因此得证，反之亦然。
{: .proof}

$\mathcal{SO}(E)$与$\mathcal{SO}\_n(R)$同构；$\mathcal O^-(E)$与$\mathcal O^-\_n(R)$之间存在双射。
{: .proposition}

## 等距变换与不变空间

设$f: E \to E$为一*实数空间*上的线性映射，那么其至少存在一个一维或二维的不变子空间。
{: .proposition}

设$M \in M_n(\mathbb R)$为$f$的一个矩阵，其在复数域下至少有一个特征值，记为$\lambda = a + ib$。
设$Z = X + iY$，其中$X,Y \in \mathbb C^n$，满足$MZ = \lambda Z$，因此构成了一个特征子空间。
有$\overline{MZ} = M \overline{Z} = \overline{\lambda Z}$，因为实数的共轭是自己。
从而：
$$
\begin{array}{ccccccc}
    MX &=& \frac{1}{2 } (MZ + M \overline Z) &=& \frac{1}{2 }(\lambda Z + \overline{\lambda Z}) &=& aX - bY \\
    MY &=& \frac{1}{2i} (MZ - M \overline Z) &=& \frac{1}{2i}(\lambda Z - \overline{\lambda Z}) &=& bX + aY
\end{array}
$$
从而$X,Y$至多可以产生一个二维的空间，就是我们要求的不变子空间。
若$\lambda$是实数，那么这个空间是一维的。
{: .proof}

复数域上的线性映射可以有任意维的不变子空间，因为复数矩阵总是可以上三角化。
{: .remark}
