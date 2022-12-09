---
layout: post
title: "丹佛分解和若尔当标准型"
categories: algebra
---

$$
\newcommand{Ker}{\mathrm{Ker}}
\newcommand{Id}{\mathrm{Id}}
\newcommand{\endrospace}{\mathcal{L}(\mathbb{K})}
\newcommand{\NN}{\mathbb{N}}
$$

## 丹佛分解

在前面的文章中，我们提到了核引理，其中一个重要的关系就是：
> 设$p_k$为从$\mathrm{Ker}(P(u))$到$\mathrm{Ker}(P_k(u))$之间的投影，这个投影可由一个多项式诱导。即$$\exists Q_k \in \mathbb K [X], p_k = Q_k(u)$$

当时我们没有给出如何寻找这个多项式的方法，这里我们简单说明一下。

我们已经知道，$P(X)$可被分解为多个互素多项式之积，即$P(X) = \prod P_i(X)$。
现在我们假设$Q_k(X) = \prod_{i \neq k} P_i(X) = \frac{P(X)}{P_k(X)}$。
简单的计算可以说明，这组多项式$(Q_k)$的公因式为$1$，从而根据主理想整环上的裴蜀定理，存在一组多项式$(A_k)$使得：
$$
Q_1 \times A_1 + \cdots Q_r \times A_r = 1
\implies \Id_E = Q_1(u) \circ A_1(u) + \cdots + Q_r(u) \circ A_r(u)
$$
从而向$\Ker(P_k(u))$上投影的变换即为$(Q_k \cdot A_k)(u)$。
这个多项式的存在性将应用于丹佛分解的证明之中。

---

我们知道，任何满足最小多项式可分为一次项的矩阵，都可以与一个上三角矩阵相似。
但是，相似的这个上三角矩阵并不是唯一的，并且具有高度的任意性。
因此，我们需要把这个三角矩阵化为更加标准的形式。

设$u \in \endrospace$，若$\chi_u$可分之一次项（从而可上三角化），则存在唯一一对变换$(d,n) \in (\endrospace)^2$，满足
$d$可对角化，$n$幂零，$u = d + n$，且$d \circ n = n \circ d$。
{: .proposition}

这个分解就叫做**丹佛分解**，也叫**若尔当–谢瓦莱分解**或**半单幂零分解**。
如果不限定两个变换可交换，则实际上存在无穷多对满足其他条件的变换。
需要注意的是，虽然变换是唯一的，其对应的矩阵表示显然并不是唯一的。

- 存在性：
我们记$\chi_u(X) = \prod_{k=1}^r (X - \lambda_k)^{m_k}$，其中$m_k$为对应特征值的代数重数。
我们知道，特征多项式指数显然大于等于最小多项式对应项的指数，又由最小多项式的指数就是根子空间的指数，从而我们有
$F_k = \Ker \left((u - \lambda_k \Id_E)^{r_k}\right) = \Ker \left((u - \lambda_k \Id_E)^{m_k}\right)$。
进而我们可以将全空间分解成根子空间的直和：
$$
E = \bigoplus_{k=1}^{r} F_k
$$
现在我们记$p_k$为向对应根子空间的投影，记$p_k = P_k(u)$。
根据前文所述的方法，我们可以把这个多项式写成$P_k(X) = A_k(X) \prod_{i \neq k}(X - \lambda_i)^{m_i}$，其中$A_k(X)$为裴蜀恒等式中的系数。
现在记$d = \sum \lambda_k p_k$。
这个变换是许多个投影变换的和，又这些投影变换的像的直和为全空间，从而这个变换显然是可以对角化的。
接下来记$n = u-d = \sum (u-\lambda_k \Id_E) \circ p_k$，并证明这个变换是幂零的。
我们知道，两个直和空间的投影变换的复合为零变换，从而$p_i \circ p_j = \delta_{i,j} p_i$。
因此有$\forall q \in \NN^\*, \quad n^q = \sum (u - \lambda_k \Id_E)^q \circ p_k$，这可直接用二项式展开验证。
设$q = \max(m_1, m_2, \dots, m_r)$。我们把$(X - \lambda_k)^q \cdot P_k(X)$中的$P_k$展开，
可发现这个多项式被特征多项式整除，从而是一个零化多项式。
因此有$n^q = 0$。
我们知道$p_k$是由$u$的多项式生成的，从而$d$和$n$都是由$u$的多项式生成的，从而可交换。
- 唯一性：
我们设$(d,n)$和$(d^\prime, n^\prime)$为两组不同的满足题设的变换。
我们知道$d$和$d^\prime$都是由$u$的多项式生成的，从而可交换，从而可同时对角化，即可在同一组基底下对角化。
从而$d-d^\prime$也可同时对角化。
又$u = d+n = d^\prime+n^\prime \iff d-d^\prime=n^\prime-n$，从而$d-d^\prime$是一个可对角化的幂零变换。
这说明其为零变换，从而$d=d^\prime$，矛盾。
{: .proof}

这个定理的证明中也给出了如何寻找这两个变换的方法，和变换后矩阵的形式。
具体而言，变换后的矩阵为一个对角分块矩阵，矩阵中的每一块代表一个根子空间，其长宽均为对应代数重数，对角线上为这个根子空间的特征值。
每个块减去对角线上的特征值后为一个幂零矩阵，通常可写为严格的上三角阵。

$$
\begin{pmatrix}
3 & -1 & 1 \\
2 & 0 & 1 \\
1 & -1 & 2
\end{pmatrix}
\sim
\begin{pmatrix}
2 & 1 & 0 \\
0 & 2 & 0 \\
0 & 0 & 1
\end{pmatrix}
\sim
\begin{pmatrix}
1 & 0 & 0 \\
0 & 2 & 1 \\
0 & 0 & 2
\end{pmatrix}
\sim
\begin{pmatrix}
2 & 2 & 0 \\
0 & 2 & 0 \\
0 & 0 & 1
\end{pmatrix}
$$
这个矩阵的特征多项式为$\chi(X) = (X-1) (X-2)^2$
{: .exampl}

## 若尔当标准型
