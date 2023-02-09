---
layout: single
title: "核引理与凯莱-哈密顿定理"
categories: algebra
date: 2022-11-25 22:22:00 +0800
--- 

我们已经知道，若一个矩阵满足一定条件，则其可以在某一组基底下被表示为一个对角矩阵。
具体而言，如果其特征子空间的直和恰好构成全空间，则有
$$
A = P \times \Lambda \times P^{-1}, \Lambda = \mathrm{diag}(\lambda_1, \lambda_2, \dots, \lambda_n)
$$
其中$\lambda_i$表示$A$的所有特征值，$P$是对应特征子空间的基底组成的过渡矩阵。

对角阵有许多有趣的性质，将矩阵化为对角阵因此有广泛的应用，比如用于求解线性常微分方程组。
但是，并不是所有矩阵都能通过特征值分解转化为对角阵，这促使我们寻找更进一步地将所有矩阵转化为更一般形式的方法。
实际上，所有矩阵都可以化为所谓[约当标准型](https://en.wikipedia.org/wiki/Jordan_normal_form)。
本文利用多项式的性质给出与约当标准型密切相关的两个重要定理。

约定$E$为数域$\mathbb{K}$的线性空间，$\mathcal{L}(E)$表示$E$上的自同态的集集合；
$\mathbb{K}[X]$表示$\mathbb{K}$上的多项式环。

## 零化多项式与最小多项式

### 定义

设$u \in \mathcal{L}(E)$，即$u$为$E$线性空间上的自同态。称满足$P(u) = 0$的多项式$P$为$u$的**零化多项式**。

有限维线性变换一定存在零化多项式。
{: .proposition}

假设$e_u: \mathbb K [X] \to \mathcal L (E)$为$u$的求值变换，即$P \mapsto P(u)$，那么显然有$P \in \mathrm{Ker} (e_u)$。
注意到$\mathrm{Ker} (e_u)$既是$\mathbb K [X]$的*子空间*，又是其*理想*，我们把这个理想称作**零化理想**。

由于多项式环实际上是一个主理想整环，因此其上的任何一个理想都是主理想。
因此，零化理想必然是由某一个多项式生成的，这个多项式就是**最小多项式**，记为$M_u$。显然，零化多项式是唯一的一个首一多项式。这等价于以下定义：

称$M_u$为最小多项式，若：
 1) $M_u$为首一多项式；
 2) $\forall P \in \mathbb K [X], M_u \| P \iff P(u) = 0$；
 3) $M_u(u) = 0$。
{: .definition}

### 性质

先给出几个比较显然的性质。

假设$u \in \mathcal L (E)$，其中$E$为一有限维空间。
$A$为$u$在任意基底下的矩阵，则有：
- $\forall A, M_A = M_u$，即线性变换在任意基底下的最小多项式不变。这也说明最小多项式是相似不变量。
- $M_A = M_{A^T}$，即转置的最小多项式相同。

设$u$有一最小多项式，且$F$为$u$的不变子空间，即$\forall x \in F, F(x) \in F$，则将$u$限制在$F$上而产生的线性变换$u_F$也有最小多项式，且$M_{u_F} \| M_u$。

首一多项式$P$的伴随矩阵$C_P$的最小多项式也是$P$。
伴随矩阵定义为：
$$
C_P = 
\begin{pmatrix}
0 & 0 & \cdots & 0 & -a_0 \\
1 & 0 & \cdots & 0 & -a_1 \\
0 & 1 & \cdots & 0 & -a_2 \\
\vdots & \vdots & \ddots & \vdots & \vdots \\
0 & 0 & \cdots & 1 & -a_{n-1}
\end{pmatrix}
$$

我们再来研究和特征值有关的性质。这些性质比较重要。

设任意多项式$P \in \mathbb K [X]$，$x \in \mathrm E_\lambda (u)$，即$x$属于$u$关于特征值$\lambda$的特征子空间中，那么有$P(u)(x) = P(\lambda)(x)$。
这就是说，$x$经过$P(u)$这个线性变换等价于数乘$P(\lambda)$
{: .proposition}

显然的推论就是：$P(\lambda)$是$P(u)$的特征值，$u$的所有特征值都是其零化多项式的根。

我们已经知道，所有特征值都是零化多项式的根，那么是否存在一个特殊的零化多项式多项式，其所有的根都是特征值呢？
当然是存在的。我们有如下定理：

$u$的所有特征值都是其最小多项式的根；最小多项式的根都是特征值。
{: .theorem}

我们还知道一个多项式，它的所有根都是特征值：特征多项式。
这一重大的共同点促使我们寻找最小多项式和特征多项式之间的关系。
实际上，特征多项式就是一个零化多项式，这一定理就是**凯莱-哈密尔顿定理**。
在研究这个定理之前，我们先来研究一个重要的引理：核引理。

## 核引理

<div>
假设$(P_1, P_2, \dots, P_r) \in \mathbb K^r [X]$为一组互素的多项式，$P = \prod P_i$。
<ul>
<li>
以下直和分解成立：
$$
\mathrm{Ker}(P(u)) = \bigoplus _{i=1}^{r} \mathrm{Ker}(P_i(u))
$$
</li>
<li>
设$p_k$为从$\mathrm{Ker}(P(u))$到$\mathrm{Ker}(P_k(u))$之间的投影，这个投影可由一个多项式诱导。即$$\exists Q_k \in \mathbb K [X], p_k = Q_k(u)$$
</li>
</ul>
</div>
{: .lemma}

我们着重关心对零化多项式使用该引理的情况：
注意到对于零化多项式，$P(u) = 0 \implies \mathrm{Ker}(P(u)) = E$。
从而对于每一个零化多项式，核引理给出了将全空间直和分解的一种方法。

## 凯莱-哈密尔顿定理

此节中我们假设$E$为有限维空间。
{: .remark}

设$\chi_u \in \mathbb K [X]$表示$u$的特征多项式，有：
$$
\chi_u(u) = 0
$$
{: .theorem}

即有限维线性变换的特征多项式是零化多项式。

- 设
$x \in E \backslash \\{ 0\_E \\} $
，$p$为使$u^p \in F = \mathrm{Vect} (u^k(x), k = 1, 2, \dots , p-1) $
的最小整数。存在一组系数
$(a_k)_{k=1,2, \dots ,p-1}$
使
$$
u^p(x) = \sum_{k=0}^{p-1} -a_k u^k(x)
$$
- $F$为$u$的不变子空间，从而由将$u$限制在$F$上形成的变换$u_F$可以写成
$$
A = 
\begin{pmatrix}
0 & 0 & \cdots & 0 & -a_0 \\
1 & 0 & \cdots & 0 & -a_1 \\
0 & 1 & \cdots & 0 & -a_2 \\
\vdots & \vdots & \ddots & \vdots & \vdots \\
0 & 0 & \cdots & 1 & -a_{n-1}
\end{pmatrix}
$$
这恰好是多项式
$$
P(X) = X^p + \sum_{k=0}^{p-1} a_kX^k
$$
的伴随矩阵。
- 简单计算可得，矩阵$A$的特征多项式$\chi_A$恰好也是$P(X)$。
我们又知道多项式的伴随矩阵的最小多项式就是自己，从而有
$$
P = \chi_A = \chi_{u_F} = M_A \implies P(u_F) = \chi_{u_F}(u_F) = M_A(u_F) = 0
$$
这样我们就完成了在子空间上特征多项式*等于*最小多项式的证明，进而说明在子空间上特征多项式是一个零化多项式。
接下来我们把该结论推广到全空间上。
- 我们已经知道$F$是$u$的一个不变子空间，因此其特征多项式整除全空间上$u$的特征多项式。
这是因为如果存在不变子空间，那么在某个基底下$u$的矩阵可以表示为对角分块矩阵，其中对角线上的某个矩阵就是$u_F$在该基底下的矩阵表示，从而对这个对角分块矩阵求特征多项式，可得整除性。因此，我们假设$\chi_u(X) = Q(X) \times \chi_{u_F}(X)$，有
$$
\begin{aligned}
\chi_u(u)(x) 
&= Q(u)(x) \times \chi_{u_F}(u)(x) \\
&= Q(u) \circ \chi_{u_F}(u) (x) \\
&= Q(u)(\chi_{u_F}(u)(x)) \\
&= Q(u)(\chi_{u_F}(u_F)(x)), \text{因为} x \in F \implies P(u_F)(x) = P(u)(x)\\
&= Q(u)(0) \\
&= 0
\end{aligned}
$$
- 注意到上述证明没有对$x$施加限制，因此$\chi_u(u)(x) = 0, \forall x \in E, x \neq 0_E$
从而该定理得证。
{: .proof}

这一重要定理有几个简单推论：
- 最小多项式整除特征多项式；
- 若$u$为有限维实空间内一线性映射，则其不变子空间要么是直线，要么是平面。

## 幂零变换

此节中我们假设$E$为有限维空间。
{: .remark}

在有限维空间上定义的线性变换总是具有以下特性：存在一最小整数$r$使
$$
\{0\} = \mathrm{Ker}(f^0=Id_E) \subset \mathrm{Ker}(f) \subset \mathrm{Ker}(f^2) \subset \cdots \subset \mathrm{Ker}(f^r) = \mathrm{Ker}(f^{r+1}) = \cdots 
$$
注意此处的包含是严格的。我们称$r$为$f$的**指数**。

设$f \in \mathcal L (E)$，$f$为幂零的，当且仅当其特征多项式为$\chi_f(X) = X^n$
{: .proposition}

该命题的简单推论为：若$f \in \mathcal L (E)$是幂零的，则其最小多项式为$M_f(X) = X^r$。

## 总述

此节中我们假设$E$为有限维空间。
此外，我们假设$u \in \mathcal L (E)$是可分至一次项的，通常这表示$\mathbb K = \mathbb C$。
{: .remark}

我们对和线性映射相关的所有多项式之间的关系进行一个总结。

### 特征多项式和特征子空间

对一个线性映射来说，它的特征多项式和谱（即特征值的集合）为：
$$
\chi_u(X) = \prod_{k=1}^{r} (X - \lambda_k)^{m(\lambda_k)}
$$
$$
\mathrm{Spec}(u) = \{ \lambda_1, \lambda_2, \dots , \lambda_r \}
$$
其中，$m(\lambda_k)$被称作特征值的代数重数，有$n = \sum_{k=1}^{r} m(\lambda_k)$。

我们知道对每个特征值，都有一个对应的特征子空间：
$$
E_{\lambda_k}(u) = \mathrm K (u - \lambda_k \mathrm{Id}_E)
$$
这些子空间之间构成直和，其维数称为几何重数，且有$1 \le \mathrm{dim}(E_{\lambda_k}(u)) \le m(\lambda_k)$。

可对角化的充要条件之一就是每个特征值的代数重数等于几何重数。

### 最小多项式

我们已经掌握了特征多项式和最小多项式之间的关系，因此可将最小多项式写为：
$$
M_A(X) = \prod_{k=1}^{r} (X - \lambda_k)^{r(\lambda_k)}
$$
其中，$r(\lambda_k)$被称作特征值的指数，有$r(\lambda_k) \le m(\lambda_k)$。

### 根子空间

对于有限维的线性变换$f = u - \lambda_k \mathrm{Id}_E$，在上一节中我们已经说明了其有一个整数$r^\prime(\lambda_k)$，使
$$
\{0\} = \mathrm{Ker}(f^0=Id_E) \subset \mathrm{Ker}(f) \subset \mathrm{Ker}(f^2) \subset \cdots \subset \mathrm{Ker}(f^{r^\prime(\lambda_k)}) = \mathrm{Ker}(f^{r^\prime(\lambda_k)+1}) = \cdots 
$$
即$r^\prime(\lambda_k)$是线性变换$u - \lambda_k \mathrm{Id}_E$的指数。
我们记这个特殊核空间为根子空间：
$$
F_{\lambda_k}(u) = \mathrm{Ker}(f^{r^\prime(\lambda_k)})
$$

以下两个重要命题总结了两个多项式和两个集合之间的关系。

特征值的指数和其对应变换的指数相同，即
$$
\forall k = 1, 2, \dots , r \quad
r(\lambda_k) = r^\prime(\lambda_k)
$$
{: .proposition}

我们又知道$r(\lambda_k) \le m(\lambda_k)$，从而
$\mathrm{Ker}((u - \lambda_k \mathrm{Id}_E)^{r(\lambda_k)}) = \mathrm{Ker}((u - \lambda_k \mathrm{Id}_E)^{m(\lambda_k)})$

根子空间的维数和其代数重数相同，即
$$
\forall k = 1, 2, \dots , r \quad
\mathrm{dim}(F_{\lambda_k}(u)) = \mathrm{dim}(\mathrm{Ker}((u - \lambda_k \mathrm{Id}_E)^{r(\lambda_k)})) = m(\lambda_k)
$$
{: .proposition}
