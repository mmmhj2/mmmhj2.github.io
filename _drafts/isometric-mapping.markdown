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
