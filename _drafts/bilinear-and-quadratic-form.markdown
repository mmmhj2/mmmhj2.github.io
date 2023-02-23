---
title: "双线性与二次型"
categories: "代数"
---

本章中我们研究两种特殊的线性映射：双线性映射与二次型。

## 双线性映射

### 双线性映射的定义

称一映射$\varphi: E \times E \to \mathbb{K}$为**双线性**的，若其满足：
$$
\forall \lambda_1, \lambda_2 \in \mathbb K, \; \forall x_1, x_2, y_1, y_2 \in E
$$
$$
\left\{
\begin{aligned}
    \varphi(\lambda_1 x_1 + \lambda_2 x_2, y_1) &= \lambda_1 \varphi(x_1,y_1) + \lambda_2 \varphi(x_2, y_1) \\
    \varphi(x_1, \lambda_1 y_1 + \lambda_2 y_2) &= \lambda_1 \varphi(x_1,y_1) + \lambda_2 \varphi(x_1, y_2) \\
\end{aligned}
\right.
$$
特别地，如果有$\varphi(x,y) = \varphi(y,x)$，则称其为*对称*的；
如果有$\varphi(x,y) = -\varphi(y,x)$，则称其为*反对称*的。
{: .definition}

一个映射是双线性的，相当于说这个映射相对于两个变量都是线性的。

设$E$为一实数向量空间，$\varphi$为其上的一个双线性映射，若$\forall x \in E, \; \varphi(x,x) \ge 0$，那么称其为*半正定*的；
若$\forall x \in E, x \neq 0, \; \varphi(x,x) > 0$，那么称其为*正定*的。
{: .definition}

对正定我们要求$x \neq 0$，因为对于线性映射，$\varphi(0,0) = 0$。

记$E$上双线性映射的集合为$\mathcal{BL}(E)$，对称双线性映射的集合为$\mathcal S (E)$，反对称双线性映射的集合为$\mathcal{AS}(E)$。
这三个集合都是线性空间，且满足以下关系：
$$
\mathcal{BL}(E) = \mathcal{S}(E) \oplus \mathcal{AS}(E)
$$
{: .proposition}

容易验证三个集合都是线性空间，因为它们都对线性组合封闭，然后我们证明这一直和关系。
可以使用定义证明，但此处我们构造一个投影来证明。设：
$$
\begin{aligned}
    \psi: 
    \mathcal{BL}(E) &\to \mathcal{BL}(E) \\
    \varphi &\mapsto \left( (x,y) \mapsto \frac{\varphi(x,y) + \varphi(y,x)}{2} \right)
\end{aligned}
$$
容易验证这个映射是良定义的线性映射，而且$\psi^2 = \psi$，从而是幂等的，从而是一个投影映射。
投影映射的像具有性质：$\mathrm{Im} \psi = \mathrm{Ker} (\mathrm{Id}_E - \psi)$，从而我们直接计算$\psi(\varphi) = \varphi$即可确定其像。
计算可得$\mathrm{Im} \psi = \mathcal{S}(E)$，而$\mathrm{Ker} \psi = \mathcal{AS}(E)$。
根据投影的性质，$\mathrm{Im} \psi \oplus \mathrm{Ker} \psi$，从而原命题得证。
{: .proof}

### 双线性映射的矩阵表示

接下来我们讨论双线性映射的矩阵表示。

此节中，我们假设空间$E$为有限维空间。
{: .remark}

双线性映射$\varphi$在一组基底$\mathcal B = (e_1, \dots, e_n)$下的矩阵为：
$$
\mathrm{Mat}_{\mathcal B}(\varphi) = (\varphi(e_i, e_j))_{1 \le i,j \le n}
$$
{: .definition}

双线性映射
$$
\varphi( 
\begin{pmatrix}
    x_1 \\ x_2
\end{pmatrix},
\begin{pmatrix}
    y_1 \\ y_2
\end{pmatrix}
) = x_1y_1 + 2x_1y_2 + 3x_2y_1 + 4x_2y_2
$$
在标准基底下的矩阵为：
$$
\begin{pmatrix}
    1 & 2 \\
    3 & 4
\end{pmatrix}
$$
{: .exampl}

设$\varphi$为一$E$上的双线性映射，$A$为其在基底$\mathcal B$下的矩阵，那么有：
$$
\forall x, y \in E, \;
\varphi(x,y) = X^\top A Y
$$
其中$X,Y$是$x,y$的*列向量*形式，$X^\top$表示转置。
{: .proposition}

这个命题的证明比较简单，此处不再赘述。

我们已经知道了双线性映射和矩阵的对应关系，接下来就要关心特殊的双线性映射和特殊的矩阵之间的对应关系，下面这个命题就说明了这一点。

若双线性映射$\varphi$是（反）对称的，那么其矩阵在任意基底下是（反）对称的；
若一个双线性映射的矩阵在某一基底下是（反）对称的，那么这个双线性映射是（反）对称的。
{: .proposition} 

我们只证明对称的情况，反对称的情况的证明几乎完全一致。
首先，若$\varphi$是对称的，那么在任何一个基底$\mathcal B = (e\_1, \dots, e\_n)$下，有$\varphi(e\_i, e\_j) = \varphi(e\_j, e\_i)$，从而根据矩阵的定义，它是对称的。
反之，若在一个基底$\mathcal B$下，$\varphi$对应的矩阵是对称的，那么有：
$$
\forall x, y \in E, \; 
\varphi(x,y) = \varphi(x,y)^\top = \left(X^\top A Y\right)^\top = Y^\top A^\top X = Y^\top A X = \varphi(y,x)
$$
从而这个双线性变换是对称的。
{: .proof}

这个证明中用到了一个技巧，即标量的转置等于其自身。

根据这两个命题，我们可以算出几个空间的维数。
假设线性空间$E$的维数为$n$，那么：
$$
\dim \mathcal{BL}(E) = n^2 \;
\dim \mathcal{S}(E) = \frac{n(n+1)}{2} \;
\dim \mathcal{AS}(E) = \frac{n(n-1)}{2}
$$

（基变换）设$\mathcal B$与$\mathcal B^\prime$为$E$的两组基底，且$P$为从前者向后者的过渡矩阵，那么双线性函数在两组基底下的矩阵$A$和$A^\prime$满足：
$$
A^\prime = P^\top A P
$$
{: .proposition}

设$x,y \in E$为两个向量，$X,Y$为其在$\mathcal B$基底下的列向量形式，那么其在$\mathcal B^\prime$下的列向量$X^\prime$和$Y^\prime$满足以下关系：
$$
X = P X^\prime, \; Y = P Y^\prime
$$
从而有：
$$
X^\top A B 
= \left( P X^\prime \right)^\top A \left( P Y^\prime \right)
= {X^\prime}^\top P^\top A P Y^\prime
= {X^\prime}^\top A^\prime Y^\prime
$$
进而有：
$$
\forall X^\prime, Y^\prime, \; {X^\prime}^\top \left( P^\top A P - A^\prime\right) Y^\prime = 0
$$
因此：
$$
P^\top A P = A^\prime
$$
{: .proof}

值得注意的是，和线性变换的基变换不同，此处在原基底下矩阵左边乘的不是过渡矩阵的*逆矩阵*，而是其*转置*。
我们进一步规定这种特殊的矩阵关系：

设$P \in \mathrm{GL}_n, Q \in \mathrm{GL}_m$，若两矩阵$A,B$满足$B = P A Q$，那么称这两个矩阵*等价*；若满足$B = P^{-1} A P$，那么称这两个矩阵*相似*；若满足$B = P^\top A P$，那么称这两个矩阵**合同**。
{: .definition}

等价矩阵不要求两个矩阵$A,B$是方阵，仅要求它们大小相同，而合同和相似有两个要求。

两个合同的矩阵的秩一定相等，且如果两个矩阵合同，那么这两个矩阵一定是同一双线性变换在不同基底下的表示。

不同于相似，两个合同的矩阵的行列式不一定相等，因此双线性变换的行列式和其基底的选择*有关*，这与线性变换不同。

## 二次型

### 二次型的定义

若一个$E$到数域$\mathbb K$的映射$q$满足以下性质，则称其为一个**二次型**：
$$
\exists \varphi \in \mathcal{BS}(E) \;
, \forall x \in E \;
, q(x) = \varphi(x,x)
$$
{: .definition}
