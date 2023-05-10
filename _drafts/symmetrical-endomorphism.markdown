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

设$A \in \mathcal M_n(\mathbb R)$是一个对称矩阵，那么存在一个正交矩阵$P \in \mathcal O_n(\mathbb R)$和一个由特征值组成的实对角矩阵$D$，满足：
$$D = P^{-1} A P = P^\top A P$$
这意味着对称矩阵可以同时被*相似对角化*和*合同对角化*。
{: .proposition}
<!--
## 黑塞矩阵

## 圆锥曲线
-->

## 极分解

### 正定矩阵的特征值

本节中我们将关心用两种特殊的矩阵来表示可逆矩阵：正交阵与正定阵。

回忆以下之前关于正定矩阵的定义，我们知道，对称矩阵是正定的，等价于其对应的二次型是正定的，当且仅当其将对所有非零列向量$x$满足：
$$x^\top M x > 0, x \neq 0$$
这又等价与其正惯性系数等于空间维数，又等价于其所有顺序主子式大于零。

利用谱定理，我们马上就能证明以下命题：

对称矩阵$M$是*正定的*，当且仅当其所有特征值都大于零。
记这样的矩阵的集合为$\mathcal P\_n(\mathbb R)$
{: .proposition}

根据谱定理，我们将对称矩阵对角化：
$$M = P^\top D P, \, D = \mathrm{diag}(\lambda_1, \dots, \lambda_n), \; \lambda_i \in \mathrm{Spec}(M)$$
从而：
$$x^\top M x > 0 \iff x^\top P^\top D P x > 0 \iff (Px)^\top D (Px) > 0$$
这个式子对所有非零$x$成立，当且仅当$\lambda\_i > 0$。
{: .proof}

### 对称矩阵的平方根

设$S$为一正定的对称矩阵，则存在唯一的正定的对称矩阵$T$，满足$T^2 = S$。
称矩阵$T$为$S$的平方根，记为$\sqrt{S}$。
{: .proposition}

**存在性：**
令$S = P^{-1} D P$，$D = \mathrm{diag}(\lambda\_1, \dots, \lambda\_n)$是特征值组成的对角阵。
令$\tilde{D} = \mathrm{diag}(\sqrt{\lambda\_1}, \dots, \sqrt{\lambda\_n})$，
不难验证$T = P^{-1} \tilde{D} P$满足条件。\
**唯一性：**
记$t,s$为二线性变换，其在标准基底下的矩阵为$T,S$，$S$对称且其特征值大于零，满足$t \circ t = s$。
不难发现由于$t \circ s = t \circ t \circ t = s \circ t$，两线性变换可交换。
记$E\_{\lambda\_i}$为其一个特征子空间，显然其也是一个不变子空间。
由于两线性变换可交换，因此两不变子空间相同，所以$E\_{\lambda\_i}$也是$t$的不变子空间。
记$t\_i = t\_{E\_{\lambda\_i}}$，从而$t\_i^2 = s\_i = \lambda\_i \mathrm{Id}\_{E\_{\lambda\_i}}$。
若$\mu \in \mathrm{Spec}(t\_i)$，则$\mu^2 = \lambda\_i$，因为特征值一定是零化多项式的根，且$t$是对称的，从而特征值一定存在。
又$T \in \mathcal{P\_n}$，从而其特征值大于零，从而$\mu > 0, \mu = \sqrt{\lambda\_i}$。
$t\_i$只有这一个特征值，且其可对角化，从而$t\_i = \mathrm{Id}\_{E\_{\lambda\_i}}$。
注意到根据以上关系，$t$由$s$唯一地构造出来：
$$t = \sum_{\lambda_i \in \mathrm{Spec}(s)} \sqrt{\lambda_i} p_{E_{\lambda_i}}$$
从而$t$唯一，从而$T$唯一。
{: .proof}

注意到
$$S = P^\top D P = P^\top \tilde{D} \tilde{D} P = (\tilde{D} P)^\top (\tilde{D}P)$$
由于$P$是两个正交标准基底转换形成的正交矩阵，如果使用格拉姆-施密特正交化算法，则会生成一个上三角矩阵。
又因为$\tilde{D}$是一个对角阵，所以$\tilde{D}P$也是一个三角阵，因此可将正定的对称矩阵$S$写为：
$$S = L^\top L$$
其中$L$是一个上三角阵。
这种分解方式称为矩阵的**科列斯基分解**（Cholesky decomposition）。
可以验证这种分解方式也是唯一的。

设$M \in \mathcal{M}_n(\mathbb R)$。
若$A = M^\top M$，则$A$是一个特征值非负的对称矩阵。
相对地，若$A$是一个特征值非负的对称矩阵，那么存在$M$使$A = M^\top M$。
{: .proposition}

**前推后**：
首先，$(M^\top M)^\top = M^\top M$，从而$A$是对称的。
其次，对所有行向量$X$，有
$$X^\top A X = X^\top M^\top M X = (MX)^\top (MX) = \Vert MX \Vert^2 \ge 0$$
**后推前**：
根据谱定理，特征值非负的对称矩阵$A$满足：
$$P^{-1} A P = D, \; D = \mathrm{diag}(\lambda_1, \dots, \lambda_n), \; \lambda_i \ge 0$$
从而设
$$\tilde{D} = \mathrm{diag}(\sqrt{\lambda_1}, \dots, \sqrt{\lambda_n})$$
不难验证$M = P \tilde{D} P^{-1}$满足条件。
{: .proof}

这个命题可以看作科列斯基分解在半正定对称矩阵上的推广。
值得注意的是，此时的分解$M$不一定是唯一的。

### 可逆矩阵的极分解

设$M \in \mathrm{GL}_n(\mathbb R)$，则矩阵$S = M^\top M \in \mathcal{P}_n(\mathbb R)$是正定的对称矩阵。
记$T \in \mathcal{P}_n(\mathbb R)$为$S$的平方根矩阵，则$MR^{-1}$是一个正交矩阵。
{: .proposition}

对称性不难验证。设$X$是$S$的一个特征向量（特征向量非零），$\lambda$为其对应的特征值，则：
$$\Vert MX \Vert^2 = (MX)^\top (MX) = X^\top S X = \lambda X^\top X = \lambda \Vert X \Vert^2$$
又注意到可逆矩阵的特征值非零，从而$\lambda > 0$，从而$S$是正定的。
更进一步地：
$$(MR^{-1})^\top (MR^{-1}) = R^{-1} M^\top M R^{-1} = R^{-1} S R^{-1} = I_n$$
同理不难验证反方向，从而$(MR^{-1})^\top = (MR^{-1})^{-1}$，从而其为正交矩阵。
{: .proof}

（极分解）设$M \in \mathrm{GL}_n(\mathbb R)$，从而存在唯一一对正交矩阵$O \in \mathrm{O}_n$和正定矩阵$R \in \mathcal{P}_n$，满足：
$$M = OR$$
这种分解称为矩阵的**极分解**。
{: .theorem}

**存在性：**
设$R = \sqrt{M^\top M}$，从而$M = MR^{-1} R = OR$。\
**唯一性：**
$M^\top M$正定，从而$R$唯一，从而$O = MR^{-1}$唯一。
{: .proof}

这种分解称为极分解，因为其形式与复数的极坐标形式非常相似。
我们知道：
$$z = e^{i\theta} r$$
其中$r$是复数的模长，而$\theta$是复数的辐角。
如果把正交矩阵看作旋转，而把正定矩阵看作长度，那么这两者形式上是非常相似的。

若$M$不是可逆的，那么这个分解仍然存在，但是$R$是半正定的，且分解不唯一。
