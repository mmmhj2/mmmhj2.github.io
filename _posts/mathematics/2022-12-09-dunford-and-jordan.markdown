---
layout: single
title: "丹佛分解和若尔当标准型"
categories: "代数"
date: 2022-12-09 20:24:00 +0800
---

$$
\newcommand{Ker}{\mathrm{Ker}}
\newcommand{Id}{\mathrm{Id}}
\newcommand{\endrospace}{\mathcal{L}(\mathbb{K})}
\newcommand{\NN}{\mathbb{N}}
\newcommand{\Mat}{\mathrm{Mat}}
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

丹佛分解的结果已经足够优秀，但是幂零矩阵仍然给这个分解赋予极大的不确定性。
我们寻求进一步地将这个矩阵标准化，为此，我们引入若尔当块。

形如
$$
J_n(\lambda) = 
\begin{pmatrix}
\lambda & 1 & 0 & \cdots & 0 & 0 \\
0 & \lambda & 1 & \cdots & 0 & 0 \\
\vdots & \vdots & \ddots & \ddots & \vdots & \vdots \\
0 & 0 & 0 & \cdots & \lambda & 1 \\
0 & 0 & 0 & \cdots & 0 & \lambda
\end{pmatrix}
$$
的矩阵称为$n$阶**若尔当块**。
$n=1$时约定$J_1(\lambda) = \begin{pmatrix} \lambda \end{pmatrix}$。
{: .definition}

不难发现，每个若尔当块正是一个对角矩阵加上一个幂零矩阵。
这个矩阵为幂零矩阵当且仅当$\lambda = 0$，且
设$m \le n$，则$J_n^m(0) = \begin{pmatrix} 0 & I_{n-m} \\\\ 0 & 0 \end{pmatrix}$。
这个矩阵的特征值只有$\lambda$，其特征多项式和最小多项式都是$(X - \lambda)^n$且特征值$\lambda$的几何重数为1。

设$u \in \endrospace$，$\lambda$为$u$的一个特征值。设$m \in \NN, \quad m \le r(\lambda)$，$a \in \Ker (u - \lambda \Id_E)^m \backslash \Ker (u - \lambda \Id_E)^{m-1}$，$\alpha_i = (u - \lambda \Id_E)^{m-i} (a)$。
则$\mathcal B = (\alpha_1, \dots, \alpha_m) = ((u - \lambda \Id_E)^{m-1}(a), \dots, (u - \lambda \Id_E)(a), a)$线性无关，因此构成某个空间的基底。
我们记$F = \mathrm{Vect} \mathcal B$为这个基底张成的空间，则这个空间为$u$的一个不变子空间，且$\Mat_{\mathcal B}(u_F) = J_m(\lambda)$。
{: .proposition}

我们设存在一组不全为零的标量$(\lambda_1, \dots, \lambda_m)$使$\sum_{i=1}^{m} \lambda_i \alpha_i = 0$。
现在我们记$m^\prime$为其中最大的非零量的下标，则$\sum_{i=1}^{m^\prime} \lambda_i \alpha_i = 0$。
有：
$$
0_E = (u - \lambda \Id_E)^{m^\prime-1} \left( \sum_{i=1}^{m^\prime} \lambda_i \alpha_1 \right) = \lambda_{m^\prime} \alpha_1
$$
这是因为对这个求和号再做一次$(u - \lambda \Id_E)^{m^\prime-1}$变换后，所有序号大于一的$\alpha_i$的变换的次数都大于等于$m$了。
我们知道$\alpha_1 = a \neq 0\_E$，从而$\lambda\_{m^\prime} = 0$。
而这与我们的假设矛盾，从而这组向量线性无关。
我们知道$\forall i = 2, 3, \dots , m, \quad (u - \lambda \Id_E)(\alpha_i) = \alpha_{i-1}$。
因此$u(\alpha_i) = \lambda \alpha_i + \alpha_{i-1} \in F$。
我们又有$(u - \lambda \Id_E) (\alpha_1) = 0$，从而$u(\alpha_1) = \lambda \alpha_1 \in F$。
这说明$F$确实是一个不变子空间。简单计算即可验证其矩阵确为若尔当块。
{: .proof}

这个命题已经初步指出了矩阵在根子空间内可化为若尔当块。
接下来，我们还要说明矩阵在全空间内如何化为若尔当标准型。

设$u \in \endrospace$是一个非零的幂零变换，则全空间可写成若干个循环不变子空间的直和，即存在
$S_u(x_1), S_u(x_2), \dots , S_u(x_s)$使
$$
E = \bigoplus_{i=1}^s S_u (x_i)
$$
循环子空间即由变换反复作用在向量上产生的不变子空间：
$$
S_u(x) = \mathrm{Vect} \big( x, u(x), u^2(x), \dots , u^p(x) \big)
$$
其中$p$是使这组向量线性无关的最大整数。
{: .proposition}

这个命题的证明较为复杂，此处略过。

我们把这个全空间的基底重新排序一下，则在基底
$$
\begin{aligned}
( &u^{k_1} (x_1), u^{k_1 - 1} (x_1), \dots , u(x_1), x_1, \\
&u^{k_2} (x_2), u^{k_2 - 1} (x_2), \dots , u(x_2), x_2, \\
&\cdots , \\
&u^{k_t} (x_t), u^{k_t - 1} (x_t), \dots , u(x_t), x_t) \\
\end{aligned}
$$
下，这个变换可以写成如下形式：
$$
\begin{pmatrix}
J_{k_1}(0) & & & \\
& J_{k_2}(0) & & \\
& & \ddots & \\
& & & J_{k_t}(0)\\
\end{pmatrix}
$$

这个命题可用来导出一下定理：

若$u \in \endrospace$的最小多项式可分至一次项，则总存在一组基底，使这个变换在此基底下可以写成**若尔当标准型**：
$$
\Mat(u) = 
\begin{pmatrix}
J_{k_1}(\lambda_1) & 0 & \cdots & 0 \\
0 & J_{k_2}(\lambda_2) & \cdots & 0 \\
\vdots & \vdots & \ddots & \vdots \\
0 & 0 & \cdots & J_{k_s}(\lambda_s)
\end{pmatrix}
$$
其中$\lambda_i$是特征值（不要求两两不同）。
{: .theorem}

我们设$\chi_u(X) = \prod\_{i=1}^r(X-\lambda\_i)^{m\_i}$，其中$\lambda_i$是两两不同的特征值。
记$F\_i = \Ker \big( (u-\lambda\_i \Id\_E)^{m\_i} \big)$为特征值对应的根子空间。
记$v\_i = (u-\lambda\_i \Id\_E)\_{F\_i}$，则我们有$v\_i^{m\_i} = 0$，从而其为零幂的。
根据以上命题，这个变换在某组基底下可以写成$\lambda = 0$的若尔当标准型。
又因为$u_{F_i} = v_i + \lambda \Id_{F_i}$，从而原变换在这个根子空间下也能写成若尔当标准型，但是对角线上加上特征值。
因为特征多项式是零化多项式，由核引理，根子空间的直和是原空间，从而在全空间下该矩阵可化为若尔当标准型。
{: .proof}

虽然我们知道可以将矩阵化为若尔当标准型，但是却难以直接找到对应的矩阵。
实际上，多数情况下，我们只能先通过各种手段猜出标准型，再去寻找对应的基底。
为保证结论简洁，我们之后假设所有相同的特征值在一个若尔当块内。
以下结论可帮助我们寻找若尔当标准型。

若$f \in \endrospace$可分且只有一个特征值$\lambda$，则记
$\chi_f(X) = (X-\lambda)^n, m_f(X) = (X-\lambda)^\beta, \mathrm{dim} E_\lambda=\gamma$，那么有：
$$
\Mat (f) =
\begin{pmatrix}
J_{d_1}(\lambda) & & & \\
& J_{d_2}(\lambda) & & \\
& & \ddots & \\
& & & J_{d_\gamma}(\lambda)\\
\end{pmatrix}
$$
其每个若尔当块的最大阶数为$\beta$，且一定有至少一个达到最大阶数（因为根子空间的维数为$\beta$），块数为$\gamma$（因为每个若尔当块的几何重数为1）。
如果有多个特征值，则对每个特征值单独处理，然后拼在对角线上即可。
对于可对角化矩阵，$\beta = 1$，从而其若尔当标准型就是对角矩阵。

设$\mathrm{dim} E = 5, \chi_f = (X - \lambda)^5, m_f = (X - \lambda)^3, \mathrm{dim}E_\lambda = 3$，求矩阵的若尔当标准型。
我们知道矩阵的若尔当块一定有一个三阶的，同时有三个若尔当块。因此只可能还有两个一阶的若尔当块。有：
$$
J = \begin{pmatrix}
\lambda & 1 & 0 & 0 & 0\\
0 & \lambda & 1 & 0 & 0 \\
0 & 0 & \lambda & 0 & 0 \\
0 & 0 & 0 & \lambda & 0 \\
0 & 0 & 0 & 0 & \lambda \\
\end{pmatrix}
$$
{: .exampl}

求下列矩阵的若尔当型：
$$
A = \begin{pmatrix}
-1 & -1 & 0 & 0 \\
0 & -1 & 0 & 0 \\
0 & 2 & 0 & -1 \\
0 & -2 & 2 & 3
\end{pmatrix}
$$
其特征多项式为：
$$
\chi_A(X) = (X+1)^2 (X-1) (X-2)
$$
显然，对$1,2$两个特征值，其若尔当块正是一个一维矩阵，对应的特征向量为
$$
X_1 = \begin{pmatrix}
0 \\ 0 \\ 1 \\ -1
\end{pmatrix}
, \quad
X_2 = \begin{pmatrix}
0 \\ 0 \\ 1 \\ -2
\end{pmatrix}
$$
对$-1$这个特征值，其若尔当块只能是$\begin{pmatrix} -1 & 1 \\\\ 0 & -1 \end{pmatrix}$。
我们知道其唯一的特征向量为
$$
X_3 = \begin{pmatrix}
1 \\ 0 \\ 0 \\ 0
\end{pmatrix}
$$
根据矩阵，可列出方程$A X_4 = X_3 - X_4$，从而有
$$
X_4 = \begin{pmatrix}
0 \\ -1 \\ 1 \\ -1
\end{pmatrix}
$$
因此其（一个）若尔当标准型为：
$$
P^{-1} A P =
\begin{pmatrix}
1 & 0 & 0 & 0 \\
0 & 2 & 0 & 0 \\
0 & 0 & -1 & 1 \\
0 & 0 & 0 & -1
\end{pmatrix}
\quad P = (X_1, X_2, X_3, X_4)
$$
{: .exampl}
