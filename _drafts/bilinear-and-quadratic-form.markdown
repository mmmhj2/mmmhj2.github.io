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
投影映射的像具有性质：$\text{Im} \psi = \text{Ker} (\mathrm{Id}_E - \psi)$，从而我们直接计算$\psi(\varphi) = \varphi$即可确定其像。
计算可得$\text{Im} \psi = \mathcal{S}(E)$，而$\text{Ker} \psi = \mathcal{AS}(E)$。
根据投影的性质，$\text{Im} \psi \oplus \text{Ker} \psi$，从而原命题得证。
{: .proof}

### 双线性映射的矩阵表示

接下来我们讨论双线性映射的矩阵表示，为此，我们假设空间$E$为有限维空间。

双线性映射$\varphi$在一组基底$\mathcal B = (e_1, \dots, e_n)$下的矩阵为：
$$
\text{Mat}_{\mathcal B}(\varphi) = (\varphi(e_i, e_j))_{1 \le i,j \le n}
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
其中$X,Y$是$x,y$的*列向量*形式。
{: .proposition}

若双线性映射$\varphi$是（反）对称的，当且仅当其矩阵在某一基底下是（反）对称的。
{: .proposition}
