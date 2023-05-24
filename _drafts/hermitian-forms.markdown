---
title: "半线性型与厄米型"
categories: "代数"
---

本章中我们将把之前研究的许多内容推广到复数域上。

## 半线性映射

复数空间与实数空间虽然相似，但是具有一些不同，其中最大的不同就是映射的线性问题。

### 半线性映射的定义

设$E,F$为两复向量空间，称$f: E \to F$是*半线性的*（Sesquilinear），若：
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

若半双线性函数$\varphi$是共轭对称的，则称其为**厄米函数**（Hermitian function）：
$$\forall x, y \in E, \; \varphi(x,y) = \overline{\varphi(y,x)}$$
与厄米函数对应的二次型称为**厄米二次型**（Hermitian quadratic form）：
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

本节中我们假设$\varphi$为一个厄米函数，$\phi$为其对应的厄米二次型。
我们并不要求这个二次型是非负或正定的，因此即使其不是一个范数，我们仍可以定义其正交性。

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

若一个厄米函数（或二次型）定义的全空间的正交子空间只有零向量，那么这个厄米函数（或二次型）是**非退化的**。
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

### 非迷向空间

若向量$x$对一个二次型$\phi$满足$\phi(x) = 0$，那么称其为**迷向向量**（Isotropic vector）。
若二次型的迷向向量仅有零向量，则称其为**确定的**（也称非迷向的）。
{: .definition}

注意厄米二次型的确定性和厄米函数的确定性的定义不同，但是确定的厄米函数一定对应确定的厄米二次型，反之亦然。
和厄米函数一样，确定的厄米二次型一定是非退化的，但非退化的二次型不一定是确定的。

设$F$为$E$中一有限维子空间，以下三条命题等价：\
1） $\varphi_{\vert F \times F}$是非退化的；\
2） $F \cap F^\perp = \{ 0 \}$；\
3） $E = F \oplus F^\perp$。\
此时$F^\perp$称为$F$的**正交补空间**，而存在正交补空间的子空间称为**非迷向空间**。
{: .definition}

1）与2）的等价由定义显然。
3）推2）也是显然的。
我们仅证明2）推3），即仅需要证明$E = F + F^\perp$。
设$x \in E$，$\gamma\_\varphi (x) \in E^\*$，则$\gamma\_\varphi(x)\_\{\vert F\} \in F^\*$。
另一方面，记$\varphi^\prime = \varphi\_\{\vert F \times F\}$。
由于1）与2）等价，我们知道$\varphi^\prime$是非退化的，从而：
$$\ker (\gamma_{\varphi^\prime}) = F \cap F^\perp = \{ 0 \}$$
从而$\gamma\_\{\varphi^\prime \}$是一个单射。
又因为空间是有限维的，从而其是一个向$F^\*$的满射。
因此存在$y \in F$，满足
$$\gamma_{\varphi^\prime}(y) = \gamma_\varphi(x)_{\vert F}$$
从而：
$$\forall z \in F, \; \varphi(x,z) = \varphi(y,z) \implies \varphi(x-y,z) = 0$$
从而$x-y \in F^\perp$。
因此：
$$\forall x \in E, \; x = \underbrace{(x - y)}_{\in F^\perp} + \underbrace{y}_{\in F}$$
{: .proof}

根据这一命题，我们有：

设$E$为一有限维复空间，那么对任何厄米函数$\varphi$，都存在一组在该函数下正交的基底。
{: .theorem}

这一命题说明任意厄米矩阵$H$都可以合同对角化，即存在可逆矩阵$P$，满足：
$$P^* H P = \mathrm{diag}(\lambda_1, \dots, \lambda_n), \; \lambda_i \in \mathbb R$$

我们使用归纳法证明该结论。
空间为一维时显然，现在设空间为$n$维。
首先，零变换的情况是平凡的，我们只考虑非零的变换，设：
$$\exists a \in E, \text{满足} \phi(a) \neq 0$$
那么$a \mathbb C$是一个非迷向的子空间。
现在考虑其正交子空间：
$$\text{设} \lambda a \in (a \mathbb C)^\perp = \{ a \}^\perp \implies \varphi(\lambda a, a) = \overline{\lambda} \varphi(a,a) = 0 \implies \lambda = 0$$
从而$(a \mathbb C)^\perp \cap (a \mathbb C) = 0$。
根据上述命题，我们知道这说明$E = (a \mathbb C)^\perp \oplus (a \mathbb C)$。
我们知道$(a \mathbb C)^\perp$的维数比全空间少，因此根据归纳假设，该空间中存在一个正交的基底，设为$\mathcal B$。
根据定义，$\\\{ a \\\} \cap \mathcal B$是这个空间的一个正交的基底。
{: .proof}

根据厄米矩阵的对角化的形式，我们称其对角阵中的非零的实数个数为其**秩**。
这一定义也可拓展到厄米函数和厄米二次型上。

## 复希尔伯特空间

对正的厄米函数$\varphi$，有：
$$\varphi \text{确定} \iff \varphi \text{非退化}$$
{: .proposition}

此外，若$\varphi$是确定的，那么它不会改变符号。

若复向量空间$E$装备有一正定的（从而是非退化的）厄米二次型$\phi$，则：
$$\Vert \cdot \Vert : x \mapsto \sqrt{\phi(x)}$$
可作为其一个范数，$(E, \phi)$合称**准希尔伯特空间**。
若空间$E$是完备的，那么又可称为**希尔伯特空间**。
若空间是有限维的（从而一定是完备的），那么又可称为**厄米空间**。
{: .definition}

在准希尔伯特空间中，由于其二次型正定且非退化，任何有限维子空间都是非迷向的，且存在正交补。

复准希尔伯特空间有许多与实内积空间相同的性质，此处仅列出而不再证明。

（柯西-施瓦茨不等式）设$\phi$为一非负厄米二次型，$\varphi$为其对应的厄米函数，那么：
$$|\varphi(x,y)|^2 \le \phi(x) \phi(y)$$
{: .proposition}

（闵可夫斯基不等式）设$\phi$为一非负厄米二次型，则：
$$\sqrt{\phi(x+y)} \le \sqrt{\phi(x)} + \sqrt{\phi(y)}$$
{: .proposition}

（勾股定理）若两向量正交，则：
$$(x, y) = 0 \implies \Vert x+y \Vert^2 = \Vert x \Vert^2 + \Vert y \Vert^2$$
然而，若两向量满足：
$$\Vert x+y \Vert^2 = \Vert x \Vert^2 + \Vert y \Vert^2$$
则其内积的实部为零，但虚部不一定为零。
{: .proposition}

（正交投影）设$\mathcal B = \\\{ \varepsilon\_1, \dots, \varepsilon\_n \\\}$为有限维子空间$F$的一个正交标准基底，那么从$x$向$F$的正交投影可以写为：
$$p_F(x) = \sum_{k = 1}^n (\varepsilon_k, x) \varepsilon_k = \sum_{k=1}^n \overline{(x, \varepsilon_k)} \varepsilon_k$$
{: .definition}

## 厄米空间与伴随算子

接下来我们将研究厄米空间的性质。
这个空间中的许多性质在无穷维情形下也能得到推广，并且是量子力学的重要数学基础。

本章中我们设$E$为一厄米空间，$\varphi$为其对应的正定的厄米函数。

### 伴随算子的定义

设$u \in \mathcal L(E)$，则存在唯一的$u^\* \in \mathcal L(E)$，使：
$$\forall (x,y) \in E^2, \; \varphi(u(x), y) = \varphi(x, u^*(y))$$
称$u^\*$为$u$的**伴随算子**。
在正交标准基底下，$u^\*$的矩阵表示就是$u$的厄米矩阵。
{: .definition}

这一定义对无限维的情况也有效，但我们目前只关心有限维的情况。

设$x, y \in E$，$X,Y$为其对应的列向量，$A,B$分别为$u$和$u^*$的矩阵，$S$为厄米函数的矩阵。
则：
$$(AX)^* SY = X^* A^* SY = X^* BSY$$
注意到$S$可逆，从而$B = S^{-1} A^\* S$，两者唯一确定。
在标准正交基底下，$S = I\_n$，从而$B = A^\*$
{: .proof}

和厄米矩阵类似，伴随算子也具有一些运算上的性质：

1. $$(u+v)^* = u^* + v^*$$
2. $$(\lambda u)^* = \overline{\lambda} u^*$$
3. $$(u^*)^* = u$$
4. $$(u \circ v)^* = v^* \circ u^*$$
5. $$u \text{可逆} \iff u^* \text{可逆}, \; (u^*)^{-1} = (u^{-1})^*$$
{: .proposition}
