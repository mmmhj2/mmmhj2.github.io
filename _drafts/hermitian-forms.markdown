---
title: "半线性型与厄米型"
categories: "代数"
---

本章中我们将把之前研究的许多内容推广到复数域上。

## 半线性映射

复数空间与实数空间虽然相似，但是具有一些不同，其中最大的不同就是映射的线性问题。

### 半线性映射的定义

设$E,F$为两复向量空间，称$f: E \to F$是*半线性的*，若：
$$
\begin{aligned}
    \forall x,y \in E, \quad& f(x+y) = f(x) + f(y) \\
    \forall x \in E, \lambda \in \mathbb C, \quad & f(\lambda x) = \textcolor{red}{\overline{\lambda}} f(x)
\end{aligned}
$$
{: .definition}

不难验证$f$的像仍然为一个子空间，而子空间的原像仍是子空间。
同理，半线性映射的核空间和秩也可按与线性映射相同的方式定义。

设$\varphi: E \times E \to \mathbb C$，若$\varphi(\cdot, y)$是半线性的，且$\varphi(x, \cdot)$是线性的，则称$\varphi$是*半双线性的*，即：
$$
\begin{aligned}
    \varphi(\lambda_1 x_1 + \lambda_2 x_2, y) &= \overline{\lambda_1} \varphi(x_1, y) + \overline{\lambda_2} \varphi(x_2, y) \\
    \varphi(x, \mu_1 y_1 + \mu_2 y_2) &= \mu_1 \varphi(x,y_1) + \mu_2 \varphi(x, y_2) 
\end{aligned}
$$
{: .definition}

使用柯里化技巧，我们记：
$$\gamma_\varphi(x) = \varphi(x, \cdot) = (y \mapsto \varphi(x, y))$$
那么，$\gamma\_\varphi(x)$是线性的，且$\gamma\_\varphi(x) \in E^*$。
从而，$\gamma\_\varphi$是半线性的，因为：
$$
\begin{aligned}
    \forall y \in E, \; \forall (\lambda_1, \lambda_2) \in \mathbb C^2, \; &\forall (x_1, x_2) \in E^2 \\
    \gamma_\varphi (\lambda_1 x_1 + \lambda_2 x_2) (y) &= \varphi(\lambda_1 x_1 + \lambda_2 x_2, y)\\
    &= \overline{\lambda_1} \varphi(x_1, y) + \overline{\lambda_2} \varphi(x_2, y) \\
    &= (\overline{\lambda_1} \gamma_\varphi(x_1) + \overline{\lambda_2} \gamma_\varphi(x_2))(y)
\end{aligned}
$$
同理，$\delta\_\varphi(y)$是线性的。
{: .remark}

### 厄米函数与厄米二次型

若半双线性函数$\varphi$是共轭对称的，则称其为**厄米函数**：
$$\forall x, y \in E, \; \varphi(x,y) = \overline{\varphi(y,x)}$$
与厄米函数对应的二次型称为**厄米二次型**：
$$x \mapsto \phi(x) = \varphi(x,x) \in \mathbb R$$
厄米二次型对应的函数称为其极化形式。
{: .definition}

厄米函数的共轭对称性保证了厄米二次型的值一定是一个实数。

（极化恒等式）
设$\varphi$为一厄米函数，$\phi$为其对应的二次型，那么：
$$
\begin{multline}
    \forall x, y \in E, \\ \varphi(x,y) = \\ \frac{1}{4} [\phi(x+y) - \phi(x-y) + i\phi(x-iy) - i\phi(x+iy)]
\end{multline}
$$
{: .proposition}

首先我们有：
$$
\begin{aligned}
    \phi(x+y) 
    &= \varphi(x+y, x+y) \\
    &= \varphi(x,x) + \varphi(y,y) + \varphi(x,y) + \varphi(y,x) \\
    &= \phi(x) + \phi(y) + 2 \Re \varphi(x,y)
\end{aligned}
$$
由线性，我们可得：$\varphi(x,-y) = -\varphi(x,y)$，且$\varphi(\lambda x, \lambda y) = |\lambda|^2 \varphi(x,y)$
从而在原式中将$y$替换为$-y$，可得：
$$\phi(x-y) = \phi(x) + \phi(y) - 2 \Re \varphi(x,y)$$
从而我们有：
$$\phi(x+y) - \phi(x-y) = 4 \Re \varphi(x,y)$$
另一方面，我们有：$\varphi(x,iy) = i \varphi(x,y)$
从而$\Re \varphi(x,iy) = - \Im \varphi(x,y)$
然后在原式中将$y$替换为$iy$，可得：
$$\phi(x+iy) - \phi(x-iy) = - 4 \Im \varphi(x,y)$$
代入原式右侧即可得证。
{: .proof}

设$\varphi$为以半双线性型，则其为一个厄米函数，当且仅当：
$$\forall x, \; \varphi(x,x) \in \mathbb R$$
{: .proposition}

前推后是显然的，根据定义，$\varphi(x,x)$等于其共轭，因此是实数。
现在证明后推前。
将$\varphi(x+y,x+y) \in \mathbb R$展开，可得：
$$\varphi(x+y) = \varphi(x,x) + \varphi(y,y) + \varphi(x,y) + \varphi(y,x) \in \mathbb{R}$$
从而
$$\varphi(x,y) + \varphi(y,x) \in \mathbb R$$
用$iy$替换$y$，可得：
$$\varphi(x,iy) + \varphi(iy,x) = i (\varphi(x,y) - \varphi(y,x)) \in \mathbb R$$
从而：
$$
\begin{cases}
    \varphi(x,y) + \varphi(y,x) \in \mathbb R \\
    \varphi(x,y) - \varphi(y,x) \in i \mathbb R
\end{cases}
$$
从而$\varphi(x,y) = \overline{\varphi(y,x)}$，从而其为厄米函数。
{: .proof}

### 半双线性型的正定性

按照和实数双线性形相同的方式，我们也能定义半双线性型的正定性。

1） 一个半双线性型称为*正的*（或半正定的），若满足：
$$\forall x, \varphi(x,x) \in \mathbb R_+$$
根据上一个命题，一个正的半双线性型一定是厄米函数。 \
2） 一个半双线性型称为*确定的*，若其满足：
$$\forall x \neq 0, \; \varphi(x,x) \neq 0$$
既是正的又是确定的半双线性型简称为正定的。
正定的半双线性型一定是一个厄米函数，称为*厄米内积*。\
3） 一个半双线性型称为*非退化的*，若其满足：
$$\forall y, \; \varphi(x,y) = 0 \implies x = 0$$
{: .definition}

所有确定的厄米函数一定是非退化的；
反之所有非退化的*正*厄米函数一定是正定的。
{: .proposition}

前推后是显然的，使用定义即可。
现在考虑后推前。这里我们先不加证明地使用柯西-施瓦茨不等式：
设$\exists x, \; \varphi(x,x) = 0$
$$\forall y, \; \varphi(x,y) \le \sqrt{\varphi(x,x)} \sqrt{\varphi(y,y)} = 0$$
又因为该厄米函数是正的，从而其值等于零。
又因为其为非退化的，从而$x = 0$。
这就证明了其确定性。
{: .proof}

## 半线性映射的矩阵

和双线性型一样，半双线性型的矩阵也具有特殊的性质。
而厄米函数和厄米二次型则和对称双线性型与二次型相似，其矩阵具有一定的对称性。

### 共轭转置矩阵

设$A \in \mathcal M_{n,p} (\mathbb C)$，则将其每一项元素取共轭产生的矩阵称为**共轭矩阵**，记为$\overline{A}$。
共轭矩阵的转置矩阵（或转置矩阵的共轭矩阵）称为该矩阵的*共轭转置矩阵*，也称**厄米矩阵**，记为$A^*$。
{: .definition}

实矩阵的共轭矩阵就是自己，从而其厄米矩阵就是其转置矩阵。
厄米矩阵可类比于实矩阵的转置矩阵，具有相当多类似的性质。

我们设大写字母表示一个矩阵，而小写字母表示复数。

- $$\overline{(\overline A)} = A, \; (A^*)^* = A$$
- $$\overline{A+B} = \overline{A} + \overline{B}, \; (A+B)^* = A^* + B^*$$
- $$\overline{aA} = \overline{a} \overline{A}, \; (aA)^* = \overline{a} A^*$$
- $$\overline{A \cdot B} = \overline{A} \cdot \overline{B}, \; (AB)^* = B^* A^*$$
- $$(\overline{A})^{-1} = \overline{A^{-1}}, \; (A^*)^{-1} = (A^{-1})^*$$
- $$\det \overline A = \overline{\det A}, \; \det A^* = \overline{\det A}$$
- $$\mathrm{rank}(A) = \mathrm{rank}(\overline A) = \mathrm{rank}(A^*)$$
{: .proposition}

这些命题都容易证明。
唯一需要注意的就是最后一点。
注意到矩阵的秩等于其最高阶非零子式的阶数，而共轭和共轭转置不会使非零的行列式变为零，因此不会改变矩阵的秩。

### 厄米函数的矩阵

设$E$为一有限维的复向量空间，$\mathcal B = (e\_1, \dots, e\_n)$为一个基底。
$\varphi$为其上一厄米函数。

在任何一组基底下，厄米函数的矩阵定义为：
$$A \in \mathcal M_n(\mathbb C), (a_{i,j}) = \varphi(e_i, e_j)$$
从而其矩阵是一个厄米矩阵，满足：
$$A = A^*$$
且
$$\varphi(x,y) = \sum_{i=1}^n \overline{x_i} \sum_{j=1}^n \varphi(e_i, e_j) y_j = X^* AY$$
{: .proposition}

（厄米函数的变基）设$\mathcal B$、$\mathcal B^\prime$为两个不同的基底，$A, A^\prime$为$\varphi$在其下的矩阵，那么：
$$P_{\mathcal B \to \mathcal B^\prime}^* A P_{\mathcal B \to \mathcal B^\prime} = A^\prime$$
称满足这种关系的两个矩阵**合同**。
{: .proposition}

设$x,y \in E$，而$X,X^\prime, Y,Y^\prime$分别为其在两个基底下的列向量，那么：
$$\varphi(x,y) = X^* A Y = {X^\prime}^* A^\prime Y^\prime$$
又有
$$X = P_{\mathcal B \to \mathcal B^\prime} X^\prime, \; Y = P_{\mathcal B \to \mathcal B^\prime} Y^\prime$$
代入即可得证。
{: .proof}

和对称的双线性型不同，厄米函数不构成一个子空间，因为其对线性组合不封闭。
{: .remark}

## 复空间的正交性

设$A$为$E$的一个子集，$\varphi$为$E$的一个厄米函数，则与$A$正交的集合为：
$$A^\perp = {y \in E | \forall x \in A, \; \varphi(x,y) = 0}$$
即：
$$A^\perp = \bigcap_{x \in A} \ker \gamma_\varphi(x)$$
从而$A^\perp$是一个子空间，因此也称为$A$的**正交子空间**。
{: .definition}

### 正交空间的性质

- $$A \subset B \implies B^\perp \subset A^\perp$$
- $$(\mathrm{Span}(A))^\perp = A^\perp$$
- $$A \subset (A^\perp)^\perp$$
- $$(F+G)^\perp = F^\perp \cap G^\perp, \; F^\perp + G^\perp \subset (F \cap G)^\perp$$，若$F,G$为两个子空间。
{: .proposition}

这些证明和实空间中的一模一样。
我们提供第四个命题的另一种证明：
$$
\begin{aligned}
    (F+G)^\perp &= (\mathrm{Span}(F \cap G))^\perp = (F \cap G)^\perp \\
    &= \bigcap_{x \in F \cup G} \gamma_\varphi (x) \\
    &= \left( \bigcap_{x \in F} \gamma_\varphi(x) \right) \cap \left( \bigcap_{x \in G} \gamma_\varphi(x) \right) \\
    &= F^\perp \cap G^\perp
\end{aligned}
$$
{: .proof}

这里需要注意的是，由于我们没有限定该半双线性型是确定的（从而不是非退化的），全空间的正交子空间可以不是$\{0\}$。
这个子空间可以看作$\gamma\_\varphi$的核空间，即$\gamma\_\varphi(x)$为零函数的空间。
实际上，我们可以给出一个非退化的等价定义：

若一个厄米函数定义的全空间的正交子空间只有零向量，那么这个厄米函数是**非退化的**。
{: .definition}

### 正交子空间的维数

若$E$为一有限维空间，$F$为其上的一个子空间，那么：
$$\mathrm{dim} (F) + \mathrm{dim} (F^\perp) = \mathrm{dim}(E) + \mathrm{dim}(F \cap E^\perp)$$
{: .proposition}

设$\{e\_1, \dots, e\_k\}$为$F \cap E^\perp$的一组基底，则其满足$\gamma\_\varphi(e\_i) = 0$，因为其在$E$的正交子空间中。
现在我们将其补全为$F$的一组基底：
$${e_1, \dots, e_k, e_{k+1}, \dots, e_p}, p = \mathrm{dim}(F)$$
从而：
$$x \in F^\perp \iff \forall i = k+1, \dots, p \; , \quad \varphi(e_i,x) = \gamma_\varphi(e_i) (x) = 0 $$
接下来我们证明$\gamma\_\varphi(e\_i)$线性无关，从而上式产生$p-k$个无关的方程。
设
$$\sum_{i=k+1}^p \lambda_i \gamma_\varphi(e_i) = 0$$
验证所有系数均为零：
$$
\begin{aligned}
    & \sum_{i=k+1}^p \lambda_i \gamma_\varphi(e_i) = \gamma_\varphi (\sum_{i=k+1}^p \overline{\lambda_i} e_i) \\
    \implies & \sum_{i=k+1}^p \overline{\lambda_i} e_i \in \ker \gamma_\varphi = E^\perp
\end{aligned}
$$
从而
$$\sum_{i=k+1}^p \overline{\lambda_i} e_i \in E^\perp \cap F$$
但是该空间仅仅由前$k$个基底生成，所以$\lambda\_i = 0$。
这就验证了这些函数的线性无关性。
由于这些函数线性无关，$\gamma\_\varphi(e_i) (x) = 0$就产生$p-k$个线性无关的方程，其解空间的维数即为$n-p+k$。
代入即可得：
$$\mathrm{dim} (F) + \mathrm{dim} (F^\perp) = p+n-p+k = n+k = \mathrm{dim}(E) + \mathrm{dim}(F \cap E^\perp)$$
{: .proof}

这一命题的几何解释即为，若$\varphi$不是非退化的，那么就存在一些向量和所有向量都正交，从而既在$F$之中，又在$F^\perp$之中。
这些向量就在子空间$F \cap E^\perp$之中，因此我们需要减去它们的维数。

若$\varphi$是非退化的，则：
$$F^\perp + G^\perp = (F \cap G)^\perp$$
{: .proposition}

我们已经给出了一个包含关系，因此只需要验证其维数相等即可。
$$
\begin{aligned}
    \mathrm{dim}(F^\perp+G^\perp) &= \mathrm{dim} (F^\perp) + \mathrm{dim} (G^\perp) - \mathrm{dim} (F^\perp \cap G^\perp) \\
    &= \underbrace{n - \mathrm{dim} (F)}_{\mathrm{dim}(E^\perp) = 0} + n - \mathrm{dim} (G) - \mathrm{dim} (F+G)^\perp \\
    &= n - \mathrm{dim} (F) - \mathrm{dim} (G) + \mathrm{dim} (F+G) \\
    &= n - \mathrm{dim} (F) - \mathrm{dim} (G) + \mathrm{dim} (F) + \mathrm{dim} (G) - \mathrm{dim} (F \cap G) \\
    &= n - \mathrm{dim} (F \cap G) = \mathrm{dim} (F \cap G)^\perp
\end{aligned}
$$
{: .proof}
