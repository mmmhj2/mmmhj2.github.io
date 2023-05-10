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
与厄米函数对应的二次型称为*厄米二次型*：
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
