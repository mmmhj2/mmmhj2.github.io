---
title: "对称映射"
categories: "代数"
---

本文将主要研究一种特殊的映射：对称映射。
这种映射虽然和对称同名，但是所指的变换非常不同。
我们将要看到，对称映射一定能化为对称矩阵，从而一定能够被对角化。

本文中我们只考虑欧氏空间，即有限维的实数内积空间。

## 对称映射的定义

线性变换$f: E \to E$是**对称的**，若：
$$\forall (x, y) \in E^2, \, \langle f(x) | y \rangle = \langle x | f(y) \rangle$$
{: .definition}

### 对称映射与投影和对称

一个投影是正交投影，当且仅当其为对称映射。
{: .proposition}

注意到投影是正交投影的充分必要条件是其核空间和像空间互为正交补，我们将反复使用这个定理。\
首先考虑前推后：
$$
\begin{aligned}
    \langle x | p(y) \rangle &= \langle x - p(x) + p(x) | p(y) \rangle \\
    &= \langle \underbrace{x-p(x)}_{\in \ker(p)} | \underbrace{p(y)}_{\in \mathrm{im}(p)} \rangle + \langle p(x) | p(y) \rangle \\
    &= \langle p(x) | p(y) \rangle
\end{aligned}
$$
同理，不难证明$\langle p(x) | y \rangle = \langle p(x) | p(y) \rangle$，从而这个映射是对称的。\
然后考虑后推前。
$$
\begin{aligned}
    \forall x \in \mathrm{im}(p), y \in \ker(p), \; \langle x | y \rangle &= \langle p(x) | y \rangle \\
    &= \langle x | p(y) \rangle = \langle x | 0 \rangle = 0
\end{aligned}
$$
从而$x \perp y$，从而$\mathrm{im}(p) \perp \ker(p)$，证毕。
{: .proof}

一个正交变换是正交对称，当且仅当其为对称映射。
{: .proposition}

首先考虑前推后，设$s$是一个正交对称，从而存在正交投影$p$，满足$s = 2p - \mathrm{Id}$。
从而
$$
\begin{aligned}
    \langle s(x) | y \rangle &= \langle 2 p(x) - x | y \rangle \\
    &= 2 \langle p(x) | y \rangle - \langle x | y \rangle \\
    &= 2 \langle x | p(y) \rangle - \langle x | y \rangle \\
    &= \langle x | 2 p(y) - y \rangle = \langle x | s(y) \rangle
\end{aligned}
$$
然后考虑后推前。
$$
\begin{aligned}
    \langle x | y \rangle &= \langle s(x) | s(y) \rangle &(\text{正交变换保内积}) \\
    &= \langle x | s^2 (y) \rangle
\end{aligned}
$$
移项可得$\langle x | y - s^2(y) \rangle = 0$，由于$x$任取，从而$s^2 = \mathrm{Id}$，从而$s$是正交对称。
{: .proof}

### 对称映射与对称矩阵

一个线性变换$f$是对称变换，那么其在任意一组标准正交的基底下可写为一个对称矩阵；
相对地，若存在一组标准正交基底使其矩阵为对称矩阵，那么它就是对称变换。
{: .proposition}

首先考虑前推后。
设$\mathcal B = (e\_1, \dots, e\_n)$为一组标准正交基，$M$为$f$在其下的矩阵表示，那么有：
$$m_{j,i} = \langle f(e_i) | e_j \rangle = \langle e_i | f(e_j) \rangle = \langle f(e_j) | e_i \rangle = m_{i,j}$$
然后考虑后推前。设$\mathcal B$为一组标准正交基，$M$为$f$在其下的对称矩阵表示，那么有：
$$\langle f(x) | y \rangle = (MX)^\top Y = X^\top M^\top Y = X^\top (MY) = \langle x | f(y) \rangle$$
从而其为一个对称变换。
{: .proof}

注意只有在标准正交基底下内积才能写成行向量乘列向量的形式，因此标准正交基底的条件是不可缺少的。

## 谱定理

接下来我们将研究对称矩阵的对角化。

### 对称变换的相关空间

首先我们考虑一个引理。

设$f$为一个对称变换，那么： \
1）$f$的核空间和像空间为正交补；\
2）$f$的特征子空间两两正交；\
3）设$F$为$f$的一个不变子空间，那么$F^\perp$也是。
{: .proposition}

1. 设$u,v$分别属于$f$的核空间和像空间，则存在$v\_0$使得$f(v\_0) = v$。
   从而
   $$\langle u | v \rangle = \langle u | f(v_0) \rangle = \langle f(u) | v_0 \rangle = 0$$
   从而核空间正交于像空间，从而两空间的交集为空集。又两空间的维数相加和全空间相等，因此两空间互为正交补。
2. 设$\lambda\_1, \lambda\_2$为两个不同的特征值，$E\_1, E\_2$为其对应的特征子空间。
   设$x\_1 \in E\_1, x\_2 \in E\_2$，则：
   $$\lambda_1 \langle x_1 | x_2 \rangle = \langle f(x_1) | x_2 \rangle = \langle x_1 | f(x_2) \rangle = \lambda_2 \langle x_1 | x_2 \rangle$$
   从而：
   $$\lambda_1 \langle x_1 | x_2 \rangle = \lambda_2 \langle x_1 | x_2 \rangle \implies \langle x_1 | x_2 \rangle = 0$$
   从而两个空间正交。
3. 欲证$F^\perp$为不变子空间，即证$\forall x \in F^\perp, f(x) \in F^\perp$，这等价于证明$\forall y \in F， f(x) \perp y$。
   有
   $$\langle f(x) | y \rangle = \langle \underbrace{x}_{\in F} | \underbrace{f(y)}_{\in F^\perp} \rangle = 0$$
   从而得证。
{: .proof}

### 对称变换的特征值

实对称变换的特征值**都是实数**。
{: .proposition}

设$\lambda \in \mathbb C$为对称变换$f$的一个特征值，欲证其为实数。
设$x$为其对应的一个特征向量，$\mathcal B$为$E$的一个基底，$A$为$f$在其下的矩阵，$X$为其对应的列向量。
有$AX = \lambda X$，从而：
$$
\begin{aligned}
    \overline{X^\top} A X = \lambda \overline{X^\top} X 
    &\implies \overline{(\overline{X^\top} A^\top \overline{X})^\top} = \overline{\lambda X^\top \overline{X}} \\
    &\implies \overline{X^\top} \overline{A^\top} X = \overline{\lambda} \overline{X^\top} X \\
    &\implies \overline{X^\top} A X = \overline{\lambda} \overline{X^\top} X \\
\end{aligned}
$$
从而
$$\lambda \overline{X^\top} X = \overline{\lambda} \overline{X^\top} X$$
从而$\lambda = \overline{\lambda}$，因此$\lambda \in \mathbb R$。
值得注意的由于特征值和矩阵都是实数，从而$x$也是实数。
{: .proof}

### 谱定理

设$f$为$E$中一个对称变换，则存在一组由其特征向量组成的标准正交基底。
即，所有对称矩阵都存在一组标准正交基底，使其可以对角化。
{: .theorem}

我们用归纳法证明。
首先，当空间的维度为$1$时，显然原命题成立。
设空间为$n$维，且原命题对$n-1$维成立。
设$\lambda$为一实特征向量，$e\_1$为其对应的特征向量，不妨设其范数为$1$。
$\mathbb Re\_1$是其一个特征子空间，从而是一个不变子空间。
根据上面的引理，我们知道$e\_1^\perp$也是其一个不变子空间。
从而我们可以把$f$的矩阵化为一个对角分块矩阵，而不变子空间$e\_1^\perp$的维数为$n-1$，从而其可以对角化。
设其对角化的标准正交基底为$\mathcal B^\prime = (e\_2, \dots, e\_n)$，也是由其特征向量组成的。
不难验证$\mathcal B = (e\_1, e\_2, \dots, e\_n)$是由特征向量组成的标准正交基底。
{: .proof}

设$A \in \mathcal M_n(\mathbb R)$是一个对称矩阵，那么存在一个正交矩阵$P \in \mathcal P_n(\mathbb R)$和一个实对角矩阵$D$，满足：
$$D = P^{-1} A P = P^\top A P$$
这意味着对称矩阵可以同时被*相似对角化*和*合同对角化*。
{: .proposition}

## 黑塞矩阵

## 圆锥曲线

## 极分解
