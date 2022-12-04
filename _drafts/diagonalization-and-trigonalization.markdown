---
layout: post
title: "矩阵的对角化与上三角化"
categories: algebra
--- 

$$
\newcommand{dim}{\mathrm{dim}}
\newcommand{ker}{\mathrm{ker}}
\newcommand{Id}{\mathrm{Id}}
$$

我们之前已经研究了特征多项式和最小多项式的相似性，而我们又知道矩阵可对角化与其特征多项式和特征值有重大关系。
这些关系促使我们去寻找可对角化与最小多项式的关系。

## 可对角化与最小多项式

我们有如下命题：

矩阵可对角化当且仅当其最小多项式可分至不重复的一次项。
{: .proposition}

- 若矩阵$A$可对角化，则其与一个有特征值组成的对角矩阵相似：
$$
A \sim 
\begin{pmatrix}
\lambda_1 & & & & & & (0) \\
 & \ddots & & & & & \\
 & & \lambda_1 & & & & \\
 & & & \ddots & & & \\
 & & & & \lambda_r & & \\
 & & & & & \ddots & \\
(0) & & & & & & \lambda_r
\end{pmatrix}
$$
这个矩阵的最小多项式显然为$M(X) = (X - \lambda_1) \cdots (X - \lambda_r)$。
又由于最小多项式是相似不变量，从而$A$的最小多项式与它的相同，从而其最小多项式可分至不重复的一次项。
- 我们假设$M_A(X) = (X - \lambda_1) \cdots (X - \lambda_r)$，从而$M_A(A) = 0$。
根据核引理，有$E = \bigoplus_{i=1}^{r} \mathrm{Ker}(A - \lambda_i I_n)$，从而全空间可表示成特征子空间的直和，因此矩阵可对角化。
{: .proof}

利用指数的性质，我们还能给出一个简单（但不甚严密）的证明：

$$
\begin{aligned}
\text{矩阵可对角化} 
&\iff \dim E_{\lambda_k} = m(\lambda_k) \quad \text{几何重数等于代数重数} \\
&\iff \dim F_{\lambda_k} = \dim E_{\lambda_k} \quad \text{根子空间的维数等于代数重数} \\
&\iff F_{\lambda_k} = E_{\lambda_k} \\
&\iff \ker(u - \lambda_k \Id_E) = \ker (u - \lambda_k \Id_E)^2 = \cdots \\
&\iff r^\prime(\lambda_k) = 1 \iff r(\lambda_k) = 1 \\
&\iff \text{最小多项式可分}
\end{aligned}
$$
{: .proof}

这个定理有几个推论：

矩阵可对角化，当且仅当其**一个**零化多项式可分至不重复的一次项。
{: .proposition}

我们知道，将变换限制在不变子空间上后，其最小多项式整除原变换的最小多项式，从而如果原变换的最小多项式可分，新变换的也是可分的。

若变换$u$可对角化，那么将其限制在任何一个不变子空间$F$上，限制后的变换$u_F$仍可对角化。
{: .proposition}

### 可同时对角化

称一组变换$(u_i)$可**同时对角化**，若存在某一组基底$B$，使其中所有变换均可在此基底下对角化。
这组基底$B$称为同时对角化基底。
{: .definition}

我们可以利用以下命题判定线性变换是否可同时对角化：

一组变换$(u_i)$可同时对角化，当且仅当其中每一个变换都可对角化且两两可交换。
{: .proposition}

- 若两个变换可同时对角化，则有$u_i = P D_i P^{-1}, \; u_j = P D_j P^{-1}$，从而
$$u_i \circ u_j = P D_i D_j P^{-1} = P D_j D_i P^{-1} = u_j \circ u_i$$
- 我们用强数学归纳法证明逆命题。
  + 空间为$n = 1$维时，显然。
  + 空间为$n + 1$维时，我们设该命题对小于等于$n$维的空间都成立。
  若$u_i$都是位似变换，显然；
  若存在$u_{i_0}$不是位似变换，则其至少有两个特征值，我们记$E = F \oplus G$，其中$F$是一个特征子空间。
  由于所有变换都是可交换的，$u_{i_0}$的特征子空间都是其他变换的不变子空间。
  又因为$G$为其他特征子空间的直和，从而其也是其他变换的不变子空间。
  我们把所有变换都分别限制在$F$和$G$上。
  此时被限制的变换仍然满足均可对角化且两两可交换。
  又因为$F,G$均不是零空间，从而其维数介于1和$n$之间。
  从而由归纳假设，命题得证。
{: .proof}
