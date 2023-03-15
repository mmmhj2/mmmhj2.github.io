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

#### 正定与半正定

设$E$为一实数向量空间，$\varphi$为其上的一个双线性映射，若$\forall x \in E, \; \varphi(x,x) \ge 0$，那么称其为*半正定*的；
若$\forall x \in E, x \neq 0, \; \varphi(x,x) > 0$，那么称其为*正定*的。
{: .definition}

对正定我们要求$x \neq 0$，因为对于线性映射，$\varphi(0,0) = 0$。

#### 对称与反对称

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

#### 对称与反对称矩阵

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

#### 基变换

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

我们记映射$\Delta : E \to E^2, \; x \mapsto (x,x)$表示把一个向量“复制”成两份，那么映射$\varphi \mapsto \varphi \circ \Delta$就可以把一个双线性函数映射为一个二次型。
这个映射是线性的，因此其像空间，即二次型组成的空间，是一个*线性空间*。
这说明二次型的线性组合依然是二次型。
但是要注意二次型本身不是一个线性函数。

#### 二次型与对称双线性函数

二次型对应的双线性映射*不是*唯一的，但是如果加以一些限制，那么就可以确定唯一的双线性映射。

对任何二次型$q$，存在一个*唯一*的对称双线性函数$\varphi$，满足$q(x) = \varphi(x,x)$。
这个双线性函数称为$q$的*相伴*对称双线性函数。
{: .theorem}

- 存在性：
  按照定义，存在一个双线性函数$\psi$满足$q(x) = \psi(x,x)$，这个函数不一定是对称的。
  但是，我们可以构造一个对称的线性映射：
  $$
  \varphi(x,y) = \frac{\psi(x,y) + \psi(y,x)}{2}
  $$
  容易验证这个双线性映射是对称的，且$q(x) = \varphi(x,x)$。
- 唯一性：
  设$q(x) = \varphi(x,x)$，其中$\varphi$是一个对称的双线性映射。
  有
  $$
  \begin{aligned}
    \varphi(x,y) &= \frac{1}{2} (\varphi(x+y,x+y) - \varphi(x,x) - \varphi(y,y)) \\
    &= \frac{1}{2} (q(x+y) - q(x) - q(y))
  \end{aligned}
  $$
  因此，$\varphi$由$q$唯一确定，从而其是唯一的。
{: .proof}

我们使用了一个等式：
$$
\varphi(x,y) = \frac{1}{2}(q(x+y) - q(x) - q(y))
$$
这个等式可以帮助我们用任何一个二次型构造对称的双线性映射。
还有一个类似的等式：
$$
\varphi(x,y) = \frac{1}{4}(q(x+y) - q(x-y))
$$
这些等式可以由简单的计算验证。

#### 二次型的矩阵表示

设$E$为一有限维线性空间，$\mathcal B$为其一组基底，$q$为$E$上一个二次型，$\varphi$为$q$的相伴二次型。
那么$q$在基底$\mathcal B$下的矩阵就是$\varphi$在基底$\mathcal B$下的矩阵。
这个矩阵满足：
$$
\begin{aligned}
    q(x) = \varphi(x,x) 
    &= \sum_{1 \le i,j \le n} a_{i,j} x_i x_j \\
    &= \sum_{1 \le i \le n} a_{i,i} x_i^2 + {\color{red} 2} \sum_{1 \le i < j \le n} a_{i,j} x_i x_j
\end{aligned}
$$
{: .definition}

二次型$q(x, y, z) = x^2 + 2y^2 + z^2 + 6xy + 2xz + 4yz$在标准基底下的矩阵为：
$$
\begin{pmatrix}
    1 & 3 & 1 \\
    3 & 2 & 2 \\
    1 & 2 & 1
\end{pmatrix}
$$
{: .exampl}

### 二次型的正定性

设$E$为一实数域的线性空间，那么若$\forall x \in E \backslash \\\{ 0 \\\}$：
$q(x) \ge 0$，那么称其为**正定**的，记$q \in \mathcal{Q}^{++}$；
$q(x) > 0$，那么称其为**正**的（或**半正定**的），记$q \in \mathcal Q^+$。
同理，也有负定和半负定的二次型。
{: .definition}

二次型$q$与其相伴的对称双线性映射的正负性**相同**，即：
$$
\begin{aligned}
    q \in \mathcal Q^+ &\iff \varphi \in \mathcal{BS}^+ \\
    q \in \mathcal Q^{++} &\iff \varphi \in \mathcal{BS}^{++}
\end{aligned}
$$
我们通过这种方式定义对称矩阵的正定与半正定。
{: .proposition}

这个命题可以非常容易地由定义验证。

这几个集合对线性组合不是封闭的，因此并不是子空间。
但是，如果线性组合的组合系数是正的，那么这几个集合就是封闭的。
具有这种结构的集合称为**凸锥**。

如果一个二次型为*正定*的，那么它满足**分离性**：
$$
q(x) = 0 \iff x = 0
$$
{: .proposition}

分离性是范数的一个重要性质，因此正定的二次型和范数由非常紧密的关系，这可以由下一节的几个关系看出来。

我们介绍三种判定正定性的方法：配方法、高斯消元法和基于行列式的方法。

除了使用这几种方法之外，还可以使用特征值来判定矩阵的正定性。
如果一个矩阵可以对角化（二次型的矩阵总是可以对角化），那么其正定当且仅当所有特征值大于零。
特别地，若$\det A = 0$，那么这个矩阵不可能是正定的。

我们在此仅仅提及这个命题作为补充，具体的证明和应用需要更加仔细的研究对称矩阵的性质。

#### 配方法确定二次型的正定性

使用配方法确定二次型$q(x, y, z) = x^2 + 2y^2 + z^2 + 6xy + 2xz + 4yz$是否为正定的：
$$
\begin{aligned}
    q(x, y, z) &= x^2 + 2y^2 + z^2 + 6xy + 2xz + 4yz \\
    &= x^2 + 6xy + 2xz + 2y^2 + z^2 + 4yz \\
    &= (x + 3y + z)^2 - 7y^2 - 2yz
\end{aligned}
$$
这个二次型不可能是正定的，因为有一个平方项的系数为负。
最后一步使用了三项式展开公式：
$$
(x + y + z)^2 = x^2 + y^2 + z^2 + 2xy + 2xz + 2yz
$$
{: .exampl}

#### 高斯消元法确定二次型的正定性

高斯消元法即利用矩阵的初等变换将一个矩阵转化为合同的对角阵。

矩阵初等变换基于矩阵的合同关系：
$$
B = P A P^\top
$$
如果两个矩阵合同，那么它们表示相同的双线性变换，从而表示相同的二次型。
在计算中，左乘一个基本矩阵相当于进行行变换，而右乘一个基本矩阵的转置相当于进行列变换，因此，只要进行相同的行列变换，就可以保持矩阵的合同关系。
在保持合同的同时将矩阵尽量转化为对角矩阵，最后观察对角线的元素，就可以确定变换是否是正定的。
我们同时对单位阵$I$和矩阵进行变换，但*只对单位阵进行行变换*，就可以从单位阵得到最后的$P$矩阵。

确定二次型$q(x,y,z) = x^2 - y^2 - z^2 + 2xy - 2xz + 4yz$是否是正定的。
$$
\begin{aligned}
    &\left(
    \begin{array}{ccc|ccc}
        1 & 1 & -1 & 1 & 0 & 0 \\
        1 & -1 & 2 & 0 & 1 & 0 \\
        -1 & 2 & -1 & 0 & 0 & 1 
    \end{array}
    \right)
    \xrightarrow{L_2 = L_2 - L_1} \\
    &\left(
    \begin{array}{ccc|ccc}
        1 & 1 & -1 & 1 & 0 & 0 \\
        0 & -2 & 3 & -1 & 1 & 0 \\
        -1 & 2 & -1 & 0 & 0 & 1 
    \end{array}
    \right)
    \xrightarrow{C_2 = C_2 - C_1} \\
    &\left(
    \begin{array}{ccc|ccc}
        1 & 0 & -1 & 1 & 0 & 0 \\
        0 & -2 & 3 & -1 & 1 & 0 \\
        -1 & 3 & -1 & 0 & 0 & 1 
    \end{array}
    \right)
    \cdots \\
    &\left(
    \begin{array}{ccc|ccc}
        1 & 0 & -0 & 1 & 0 & 0 \\
        0 & -2 & 0 & -1 & 1 & 0 \\
        0 & 0 & \frac{5}{2} & -\frac{1}{2} & \frac{3}{2} & 1 
    \end{array}
    \right)
\end{aligned}
$$
从而这个二次型不是正定的。
{: .exampl}

在上面的变换中，左侧的矩阵最终为一个对角矩阵$D$，右侧的矩阵为一个过渡矩阵$P$，满足：
$$
D = P A P^\top \iff P^{-1} A {P^\top}^{-1}
$$
现在有：
$$
q(x) = X^\top A X = (X^\top P^{-1}) D ({P^\top}^{-1} X)
$$
设标准基底为$\mathcal B$，而对角矩阵所在的基底为$\mathcal B^\prime$，那么向量$X$在第二个基底下的坐标就是$X^\prime = {P^\top}^{-1} X$。
这说明从第一个基底到第二个基底的过渡矩阵$P_{\mathcal B \to \mathcal B^\prime} = P^\top$。

#### 使用行列式判定正定性

这里我们不加证明地给出使用行列式判定正定性的方法。

一个对称双线性型是正定的，当且仅当在一组基底下其所有顺序主子式：
$$
\Delta_i = \left|
\begin{array}{ccc}
    a_{1,1} & \cdots & a_{1, i} \\
    \vdots & \ddots & \vdots \\
    a_{i, 1} & \cdots & a_{i, i}
\end{array}
\right|
$$
都大于零。
{: .proposition}

### 二次型的常见关系

这里不加证明地给出几个与二次型相关的等式与不等式。

（平行四边形等式）
对任何二次型$q$，
$$
q(x + y) + q(x - y) = 2 (q(x) + q(y))
$$
{: .proposition}

这个不等式来自几何中的一个不等式：
$$
| \vec x + \vec y |^2 + | \vec x - \vec y |^2 =  2 \left( |\vec x|^2 + |\vec y|^2 \right)
$$
注意在这个命题中，我们不要求二次型$q$是正定的。

（柯西-施瓦茨不等式）
若二次型$q$及其相伴双线性映射$\varphi$是正定的，那么
$$
\forall x,y \in E, \; \varphi(x,y)^2 \le q(x) q(y)
$$
{: .proposition}

这非常容易让人想起其范数形式：
$$
| x \cdot y |^2 \le |x| |y| 
$$
实际上，它们的证明也是完全一致的。

构造多项式$P(t) = q(x+ty) = q(x) + 2t \varphi(x,y) + t^2 q(y) \ge 0$，然后应用其判别式$\Delta < 0$即可。
{: .proof}

（闵可夫斯基不等式）
若二次型$q$及其相伴双线性映射$\varphi$是正定的，那么
$$
\forall x,y \in E, \; \sqrt{q(x+y)} \le \sqrt{q(x)} + \sqrt{q(y)}
$$
{: .proposition}

两边同时平方然后应用柯西-施瓦茨不等式即可。
{: .proof}

回忆其范数形式：
$$
| x + y | \le |x| + |y|
$$
实际上就是三角形不等式。

从上面的讨论中，我们不难发现，一个对称的双线性映射和**内积**非常相似；
相对地，一个二次型和这个内积导出的**范数**（$\Vert x \Vert = < x, x >$）的平方非常相似。

## 对称双线性的简化

本节中，我们设$E$为$\mathbb K$上一个有限维向量空间，$\varphi$为其中一个对称双线性函数，$q$为其相关的二次型。

我们称$\varphi$或$q$的秩为其*任意一个基底下*矩阵的秩。
如果一个对称双线性型（或二次型）的秩和空间的维数相等，那么称其为**非退化**的。
{: .definition}

非退化对称双线性型还有一个等价的定义：

设$\varphi$为一个对称双线性型，若满足
$$
\forall y \in E, \; \varphi(x, y) = 0
$$
的向量$x$有且仅有$x = 0$一个，那么这个双线性型就是**非退化**的。
{: .definition}

考虑在矩阵形式下解决这个问题。
若矩阵$A$是满秩的，那么使$X^\top A Y = 0$的矩阵$X$当然只有零矩阵。
反之，若$X^\top A Y = 0$，这说明$\ker (X^\top A) = \mathcal M_{n,1}$，从而$\mathrm{dim} \ker (X^\top A) = n$。
根据秩定理，这说明$\mathrm{rank} (X^\top A) = 0$，因此$X^\top A = 0$。
考虑到$A$是一个对称矩阵，转置可得$A X = 0$，因为满足该条件的$X$仅有$X = 0$一个，因此$\ker A = \\\{0\\\}$，从而$\mathrm{rank}(A) = n$。
{: .proof}

### 简化相关的定理

我们记$\mathcal B = (e\_1, \dots, e\_n)$为$E$的一组基底，而$(\psi\_1, \dots, \psi\_n)$为其对偶基底。

若$\mathrm{Mat}_{\mathcal B} \varphi$是对角矩阵，那么称$\mathcal B$是关于$\varphi$**正交**的。
{: .definition}

如果矩阵是对角矩阵，那么说明$i \neq j, \; \varphi(e\_i, e\_j) = 0$，回忆上文中关于内积和对称双线性函数的类比，这说明两个基底向量垂直，因此我们称其为正交的。

以下几个命题是等价的：
- $\mathcal B$是关于$\varphi$或$q$正交的且
  $$\mathrm{Mat}_{\mathcal B} \varphi = \mathrm{diag}(\alpha_1, \dots, \alpha_n)$$；
- 有：
  $$
  \varphi(x,y) = \sum_{i=1}^n \alpha_i x_i y_i
  $$
  且：
  $$
  q(x) = \sum_{i=1}^n \alpha_i x_i^2
  $$
- 有：
  $$
  q = \sum_{i=1}^n \alpha \psi_i^2
  $$
  其中$(\psi\_1, \dots, \psi\_n)$为$\mathcal B$的对偶基底。

#### 合同对角化

对所有有限维空间的二次型（或对称双线性型），都存在一组基底，使其矩阵为对角阵。
{: .theorem}

这个命题等价于对任何二次型$q$：
$$
\begin{aligned}
    q(a_1, \dots, a_n) &= \sum_{i=1}^n \alpha_{i,i} x_i^2 + \sum_{i,j=1\\ i \neq j}^n \alpha_{i,j} x_i x_j \\
    &= \sum_{i=1}^m \beta_i \psi_i^2 (x_1, \dots, x_n)
\end{aligned}
$$
其中$m = \mathrm{rank} q$，$\psi_i$为对角化基底的对偶基底，可视为一组线性独立的线性映射。
{: .proposition}

我们提供一个构造性的证明，根据证明的步骤就可以构造这组基底。

使用归纳法，对$\dim E = 1$，这个结论显然；
若$q = 0$，这个结论也显然，因此我们研究$q \neq 0$的情况。
设$\dim E = n$，且这个命题对$\dim E = n-1$成立，那么分类讨论在标准基底下该函数的对角线上是否有非零元素。
若含有非零元素，那么我们同时使用行变换和列变换将这个元素移动到$\alpha_{1,1}$的位置，由于同时使用这两个变换，变换前后的矩阵是合同的。
然后我们进行配方：
$$
\begin{aligned}
    q(x_1, \dots, x_n) &= a_{1,1} (x_1^2 + 2\sum_{i=2}^n \frac{\alpha_{1,i}}{\alpha_{1,1}} x_1 x_i) + q^\prime (x_2, \dots, x_n) \\
    &= a_{1,1} (x_1^2 + \sum_{i=2}^n \frac{\alpha_{1,i}}{\alpha_{1,1}} x_i)^2 + q_2 (x_2, \dots, x_n) \\
    &= a_{1,1} \psi_1^2 (x_1, \dots, x_n) + q_2(x_2, \dots, x_n)
\end{aligned}
$$
从而使用归纳法，$q_2$可以转化为对偶基底的平方和，注意$q^\prime \neq q_2$，后者带有配方产生的额外项。
不难发现$\psi\_1$和$q\_2$中所有函数都是独立的，因为仅有$\psi\_1$中含有$x\_1$
如果对角线不含有非零元素，那么我们任取一个非零元素并移动到$\alpha_{1,2}$的位置，然后进行配方：
$$
\begin{aligned}
    q(x_1, \dots, x_n) &= 2 \alpha_{1,2} \left( x_1 x_2 + \sum_{i=3}^n \frac{\alpha_{1,i}}{\alpha_{1,2}} x_1 x_i + \sum_{i=3}^n \frac{\alpha_{1,i}}{\alpha_{1,2}} x_2 x_i \right) + q^\prime (x_3, \dots, x_m) \\
    &= 2 \alpha_{1,2} \left( x_1 + \sum_{i=3}^n \frac{\alpha_{2,i}}{\alpha_{1,2}} x_i \right) \left( x_2 + \sum_{i=3}^n \frac{\alpha_{1,i}}{\alpha_{1,2}} x_i \right) + q_3 (x_3, \dots, x_m)
\end{aligned}
$$
现在，我们令
$$
\left\{ 
    \begin{aligned}
        \psi_1 &= \left( x_1 + \sum_{i=3}^n \frac{\alpha_{2,i}}{\alpha_{1,2}} x_i \right) + \left( x_2 + \sum_{i=3}^n \frac{\alpha_{1,i}}{\alpha_{1,2}} x_i \right)\\
        \psi_2 &= \left( x_1 + \sum_{i=3}^n \frac{\alpha_{2,i}}{\alpha_{1,2}} x_i \right) - \left( x_2 + \sum_{i=3}^n \frac{\alpha_{1,i}}{\alpha_{1,2}} x_i \right)
    \end{aligned}
\right.
$$
容易验证这两个函数是线性且独立的。
利用公式$AB = 1 \backslash 4 \left( (A+B)^2 - (A-B)^2 \right)$，可以将上式简化：
$$
q(x_1, \dots, x_n) = \frac{1}{2} a_{1,2} (\psi_1^2 - \psi_2^2) + q_3(x_3, \dots, x_m) 
$$
同理，新的两个函数和$q_3$展开的其他函数都是独立的。
这就完成了命题的证明。
{: .proof}

除了使用这个方法通过配方进行简化之外，我们还可以利用高斯消元的思路，使用行变换和列变换进行简化。
这种简化的思路和上文中提到确定二次型的正定性中的思路一致。

以下推论把矩阵的合同和二次型的简化联系在一起：

所有对称矩阵*合同于*对角阵。
{: .proposition}

### 复数域与实数域上的合同简化

在复数域的$n$维线性空间上，所有对称矩阵（或对称双线性型，或二次型）都可以合同简化为：
$$
J_r = \begin{pmatrix}
    I_r & 0 \\
    0 & 0_{n-r}
\end{pmatrix}
$$
其中$r$为该矩阵的秩。
{: .proposition}

根据上文所述，我们设在一组基底$(f\_1, \cdots, f\_n)$下该对称矩阵合同于一个对角阵$\mathrm{diag}(\alpha\_1, \cdots, \alpha\_r, 0, \cdots, 0)$，
那么记$\beta\_i$满足：$\alpha\_i \beta\_i^2 = 1$，从而在基底
$$
( \beta_1 f_1, \cdots, \beta_r f_r, f_{r+1}, \cdots, f_r)
$$
下，该矩阵合同于$J\_r$。
{: .proof}

在实数域的$n$维线性空间上，所有对称矩阵（或对称双线性型，或二次型）都可以合同简化为：
$$
\begin{pmatrix}
    I_p & 0 & 0 \\
    0 & -I_q & 0 \\
    0 & 0 & 0_{n-p-q}
\end{pmatrix}
$$
其中$r$为该矩阵的秩。
{: .proposition}

这两个命题的证明是相似的。

### 惯性指数

我们称对称双线性函数$\varphi$的**惯性指数**为一对数$(n^+, n^-)$，其中$n^+$表示使$\varphi_{F \times F}$正定的子空间$F$的最大维数，$n^-$表示使$\varphi_{F \times F}$负定的子空间$F$的最大维数。
{: .definition}

（西尔维斯特惯性定理）在所有关于$\varphi$正交的基底下，表示$\varphi$的对角矩阵恰好有$n^+$个正元素和$n^-$个负元素。
{: .theorem}

一个二次型（或对称双线性型）为正定的当且仅当其正惯性指数和空间维数相等；
为负定的当且仅当其负惯性指数与空间维数相等；
为正当且仅当其负惯性指数为零；
为负当且仅当其正惯性指数为零。

#### 确定的双线性型

我们进一步推广正定和负定的定义，提出*确定*的概念：

对对称双线性型，若满足$\varphi(x,x) = 0$的向量仅有$x = 0$一个，那么这个双线性型就是*确定的*。
{: .definition}

一个双线性型是确定的，当且仅当其正负惯性指数之和与空间维数相等。
