---
title: "张量分析无痛入门"
categories: "分析"
---

## 反变与协变

为了理解张量分析这一庞杂的主题，让我们首先从最简单的情境开始。
我们来考虑最简单的向量：平面向量。

我们首先回忆一些基本的代数知识：
1. 平面向量构成实数域上的二维线性空间$\mathbb R^2$，它们之间可以加减并作内积，得到一个实数；还可以通过数乘来乘一个实数。
2. 如果说平面向量构成一个代数，那么将平面向量映射为实数的线性映射也构成一个线性空间，这一空间称为其*对偶空间*，记为$\mathbb {R^2}^\*$，其中的元素称为对偶向量或协向量。
   - <small>例如，考虑映射$(x, y) \mapsto x$和映射$(x, y) \mapsto y$，它们均是将平面向量映射为实数的线性函数。这两个映射之间可以加减（$(x, y) \mapsto x \pm y$），也可以做数乘（$(x, y) \mapsto \lambda x, \lambda \in \mathbb R$），并且得到的依然是将平面向量映射为实数的线性函数。</small>
3. 平面向量与其对偶向量之间存在与双射，这两个空间同构。
   - <small>对任何有限维向量空间中基底，我们总是构造对偶空间的基底：
$$e_i: x_1 \mathbf e_1 + \cdots + x_n \mathbf e_n \mapsto x_i,$$
该函数“选择”出第$i$个坐标。容易验证这样的线性函数共有$n$个且均线性无关</small>。
   - <small>对于欧几里得空间，由于存在内积，因此具有一个特别的双射：
$$\circ^\top: \mathbb R^2 \to {\mathbb R^2}^*, x \mapsto (y \mapsto x \cdot y),$$
这个映射将一个向量映射到与这个向量做内积这个映射上。
特别地，这个同构与坐标选择无关，因此称为典范同构</small>。

现在让我们结束这些抽象的代数讨论，回到大家都喜欢的坐标表示上吧。
我们考虑平面向量空间的任意一组基底$\mathbf e\_1, \mathbf e\_2$，那么在该基底下任何向量均可写为
$$\mathbf x =  x_1 \mathbf e_1 + x_2 \mathbf e_2.$$
我们可以利用矩阵表示来将其写为“行向量”乘列向量的形式。
习惯上向量的坐标占据列向量的位置，因此：
$$\mathbf x =  \begin{bmatrix} \mathbf e_1 & \mathbf e_2 \end{bmatrix} \begin{bmatrix} x_1 \\ x_2 \end{bmatrix}.$$

### 反变向量

现在考虑另一基底
$$\mathbf e_1' = \mathbf e_1 T_{11} + \mathbf e_2 T_{21},\; \mathbf e_2' = \mathbf e_1 T_{12} + \mathbf e_2 T_{22},$$
或可写为
$$\begin{bmatrix} \mathbf e_1' & \mathbf e_2' \end{bmatrix} = \begin{bmatrix} \mathbf e_1 & \mathbf e_2 \end{bmatrix} \begin{bmatrix} T_{11} & T_{12} \\ T_{21} & T_{22} \end{bmatrix} = \begin{bmatrix} \mathbf e_1 & \mathbf e_2 \end{bmatrix} T.$$

当我们希望得到向量$\mathbf x$在另一个坐标系下的坐标时，有
$$\begin{bmatrix} \mathbf e_1' & \mathbf e_2' \end{bmatrix} \begin{bmatrix} x_1' \\ x_2' \end{bmatrix} = \begin{bmatrix} \mathbf e_1 & \mathbf e_2 \end{bmatrix} \begin{bmatrix} x_1 \\ x_2 \end{bmatrix} = \begin{bmatrix} \mathbf e_1 & \mathbf e_2 \end{bmatrix} T T^{-1} \begin{bmatrix} x_1 \\ x_2 \end{bmatrix},$$
因此
$$\begin{bmatrix} x_1' \\ x_2' \end{bmatrix} = T^{-1} \begin{bmatrix} x_1 \\ x_2 \end{bmatrix}.$$
这意味着对于坐标系变换这一操作而言，向量是*反变*（Contravariant）的。
向量的坐标变换所使用的矩阵是基底的坐标变换矩阵的*逆矩阵*。

### 对偶空间与协向量

对于对偶空间中的协向量，坐标变换又如何作用于它们呢？
一般来讲，为了确定坐标变换的效果，需要给出空间的基底，但对于这个特别的情况，我们可以直接利用矩阵来进行运算。

任何一个协向量$f$（即线性函数），我们用行向量来表示它在某一基底下的坐标表示。
由于
$$\begin{bmatrix} f_1 & f_2 \end{bmatrix} \begin{bmatrix} x_1 \\ x_2 \end{bmatrix} = \begin{bmatrix} f_1' & f_2' \end{bmatrix} \begin{bmatrix} x_1' \\ x_2' \end{bmatrix} = \begin{bmatrix} f_1' & f_2' \end{bmatrix} T^{-1} \begin{bmatrix} x_1 \\ x_2 \end{bmatrix},$$
有
$$\begin{bmatrix} f_1' & f_2' \end{bmatrix} = \begin{bmatrix} f_1 & f_2 \end{bmatrix} T.$$

因此，对偶空间中的协向量使用和基底变换相同的变换来完成坐标变换，所以协向量是*协变*（Covariant）的。

### 爱因斯坦求和约定

对于只有两个分量的情况，将每个分量展开还不太麻烦；
但对于维数更高的情况，我们不得不使用求和记号$\sum$。
而若需要操作大量向量和矩阵，那么即使使用求和符号也会带来很大的负担。
为此，爱因斯坦提出了以下求和约定：

1. 若向量是协变的，那么将其索引置于下标位置上；若向量是反变的，则将其索引置于上标位置上。习惯上协变位于反变之前。
2. 若式子中的某一索引由变量表示，且该变量恰好出现了两次：一次在上标位置、一次在下标位置，就意味着对该索引求和。求和的范围由语境确定，通常是向量所在空间的维数。
3. 求和的变量称为绑定变量，未被求和的变量称为自由变量，自由变量的用法与其他式子中的用法没有区别。

例如，向量在某基底下的坐标可写为
$$\mathbf x = \sum_{i = 1}^n \mathbf e_i x^i = \mathbf e_i x^i.$$
而对于矩阵，由于矩阵右乘列向量仍为列向量，而左乘行向量仍为行向量，有：
$$\mathbf x' = T^{-1} \mathbf x = {T^{-1}}_j^i \mathbf x^j.$$
这意味着$T\_j^i$表示矩阵第$i$行第$j$列的元素。

利用爱因斯坦求和约定，我们可以非常容易地写出更高维情况下的反变与协变。

设$\mathbb R^n$空间中两基底$\mathbf e$和$\mathbf e'$满足
$$\mathbf e_i' = \mathbf e_j T^j_i,$$
那么其中向量的坐标表示是*反变*的，即满足
$$x_i' = x_j {T^{-1}}_i^j,$$
而其对偶空间中的协向量的坐标表示是*协变*的，即满足
$${f^i}' = T^i_j f^j.$$
{: .proposition}

在欧几里得空间这一非常特殊的内积空间之下，若我们再选择正交标准基底这一非常特别的基底，那么任何向量的对偶向量，就是其列向量的转置。
在这种情况下，我们可以不再区分协变和反变向量

### 微分与对偶空间

#### 笛卡尔空间下的微分算子

## 张量的定义

### 张量的朴素定义

#### 坐标不变性

### 张量的代数定义


## 度量空间

### 内积与度量张量、反变与协变

### 球坐标系与柱坐标系

### 闵可夫斯基时空
