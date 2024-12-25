---
title: "矩阵微积分导论"
categories: ["代数"]
---

最近研究机器学习相关内容时常遇到与矩阵相关的微积分计算，遂撰此文以总结之。

后文可能会大量使用爱因斯坦求和约定，请注意。

## 向量的梯度

先考虑一些比较简单的问题，即向量的梯度问题。

### 矩阵乘向量的梯度

首先考虑最简单的问题，即矩阵乘向量的梯度。

设$A$为一矩阵，$x$为一列向量，则
$$\nabla_x Ax = \frac{\partial Ax}{\partial x} = A, \; \nabla_x x^TA = \frac{\partial x^T A}{\partial x} = A^T.$$
此处，$\partial x$表示对$x$的梯度。
{: .proposition}

考虑加托导数的定义，有
$$\nabla_x Ax \cdot h = \left. \frac{\mathrm d}{\mathrm d x} A(x + \lambda h) \right|_{\lambda = 0} = A \cdot h.$$
从而
$$\nabla_x Ax = A.$$
对$x^T A$的梯度，我们不考虑行向量与列向量的区别，以避免陷入协变与反变的复杂问题中，此时有
$$\nabla_x x^T A = \nabla_x A^T x = A^T.$$
此证明亦可使用爱因斯坦求和约定迅速完成：
$$[Ax]_i = A_{ij} x_k,$$
从而
$$[\nabla_x Ax]_{ij} = [Ax]_{i,j} = \frac{\partial A_{ik} x_k}{\partial x_j} = A_{ik} \delta_{jk} = A_{ij}.$$
{: .proof}

### 二次型的梯度

接下来考虑二次型$x^T A x$的梯度。

二次型$x^T Ax$的梯度为
$$\nabla x^T Ax = \frac{\partial x^T Ax}{\partial x} = (A+A^T)x.$$
{: .proposition}

使用爱因斯坦求和约定来进行证明：
$$
\begin{aligned}
[\nabla x^T A x]_n &= \frac{\partial}{\partial x_n} A_{ij} x_i x_j \\
& = A_{ij} \delta_{in} x_j + A_{ij} x_i \delta_{jn} \\
&= A_{nj} x_j + A_{in} x_i \\
&= [Ax]_n + [A^T x]_n \\
&= [(A+A^T)x]_n.
\end{aligned}
$$
也可利用加托导数来证明。
{: .proof}

若$A$是对称矩阵，则有
$$\nabla x^T A x = 2 Ax.$$
这和常见的二次函数的一阶导非常相似。

## 矩阵的梯度

接下来我们考虑矩阵的梯度。
这一节中，我们约定小写黑体字母表示向量，大写黑体字母表示矩阵，斜体字母表示标量或函数。

### 矩阵梯度的定义与约定

我们使用分子记法来定义矩阵的梯度：

设$f(\mathbf A)$为一标量函数，$\mathbf A$为矩阵，则其梯度为
$$\nabla_{\mathbf A} f(\mathbf A) = \left[ \frac{\partial f(\mathbf A)}{\partial A_{ij}} \right] = \begin{pmatrix}
\frac{\partial f(A)}{\partial A_{11}} & \cdots & \frac{\partial f(A)}{\partial A_{m1}} \\
\vdots & \ddots & \vdots \\
\frac{\partial f(A)}{\partial A_{1n}} & \cdots & \frac{\partial f(A)}{\partial A_{mn}}
\end{pmatrix}.$$
该梯度矩阵的维数与矩阵$\mathbf A^T$一致。
{: .definition}

矩阵以及向量的梯度长期以来存在两种记法：
1. *分子记法*：标量对向量的偏导$\frac{\partial f}{\partial \mathbf x}$为行向量，向量对标量的偏导$\frac{\partial \mathbf f}{\partial x}$为列向量，向量对向量的偏导为$\frac{\partial \mathbf f}{\partial \mathbf x} = [\frac{\partial \mathbf f_i}{\partial \mathbf x_j}]$，标量对矩阵的偏导$\frac{\partial f}{\partial \mathbf A}$的维数与$A^T$一致；
2. *分母记法*：标量对向量的偏导$\frac{\partial f}{\partial \mathbf x}$为列向量，向量对标量的偏导$\frac{\partial \mathbf f}{\partial x}$为行向量，向量对向量的偏导为$\frac{\partial \mathbf f}{\partial \mathbf x} = [\frac{\partial \mathbf f_j}{\partial \mathbf x_i}]$，标量对矩阵的偏导$\frac{\partial f}{\partial \mathbf A}$的维数与$A$一致。

在进行计算时，务必确保选择的约定一致。

由于习惯上一般认为梯度是列向量，在选择分子记法时，有
$$\nabla_{\mathbf x} f = \left( \frac{\partial f}{\partial \mathbf x} \right)^T.$$
在上文求梯度时，我们没有考虑这个转置产生的问题，因为当时我们认为行向量和列向量是等价的。
而将矩阵纳入考虑之后，这些转置的约定就更加重要了。

### 矩阵微元

使用分子记法的一大好处是我们可以定义矩阵的微元。

矩阵$\mathbf A$的微元定义为
$$\mathrm d \mathbf A = \begin{pmatrix}\mathrm d A_{11} & \cdots & \mathrm d A_{1m} \\ \vdots & \ddots & \vdots \\ \mathrm d A_{n1} & \cdots & \mathrm d A_{nm} \end{pmatrix}.$$
{: .definition}

利用矩阵微元，能够简化许多计算，例如证明以下命题。

<small>（雅可比公式）</small>
设$\mathbf A$为一非奇异方阵，则
$$\mathrm d \det\mathbf A = \det \mathbf A \cdot \mathrm{tr}(\mathbf A^{-1} \cdot \mathrm d \mathbf A).$$
{: .proposition}

将行列式视为对矩阵中每个元素的导数，利用链式法则，有
$$\mathrm d \det \mathbf A = \sum_{i,j} \frac{\partial \det\mathbf A}{\partial A_{ij}} \mathrm d A_{ij}.$$
根据行列式的拉普拉斯展开，对任意一行$i$，有
$$\det \mathbf A = \sum_j A_{ij} c_{ij},$$
其中$c\_{ij}$为该矩阵的代数余子式（cofactor）。
从而
$$
\begin{aligned}
\frac{\partial \det\mathbf A}{\partial A_{ij}} 
&= \frac{\partial}{\partial A_{ij}} \sum_k A_{ik} c_{ik} \\
&= \sum_k c_{ik} \frac{\partial A_{ik}}{\partial A_{ij}} + A_{ik} \frac{\partial c_{ik}}{\partial A_{ij}} \\
&= \sum_k c_{ik} \delta_{jk} = c_{ij},
\end{aligned}
$$
这是因为第$i$行的代数余子式肯定不含$A\_{ij}$。
重新带入，得到
$$
\begin{aligned}
\mathrm d \det \mathbf A &= \sum_{i,j} c_{ij} \mathrm d A_{ij} \\ 
&= \mathbf c : \mathrm d \mathbf A \\
&= \mathrm{adj}(A)^T : \mathrm d \mathbf A \\
&= \mathrm{tr}(\mathrm{adj}(\mathbf A) \cdot \mathrm d \mathbf A),
\end{aligned}
$$
其中$\mathrm{adj}$表示伴随矩阵，$:$是二阶张量内积，即弗罗比尼乌斯内积。
最后注意到
$$\mathrm{adj}(\mathbf A) = \det \mathbf A \cdot \mathbf A^{-1},$$
带入即完成证明。
{: .proof}

下一结论是研究矩阵微元的一大有力结论。

设$\mathbf A, \mathbf B, \mathbf C$为三矩阵，且$\mathbf C = \mathbf A \circ \mathbf B$，其中$\circ$表示任意一种乘积，包括但不限于：矩阵乘法、弗罗比尼乌斯内积、阿达马积等，那么
$$\mathrm d \mathbf C = \mathrm d \mathbf A \circ \mathbf B + \mathbf A \circ \mathrm d \mathbf B.$$
{: .proposition}
