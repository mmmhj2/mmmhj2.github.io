---
title: "准希尔伯特空间"
categories: "代数"
---

本章中我们以二次型和双线性型为基础研究准希尔伯特空间，即带有内积算子的线性空间。
这个空间有时也被称为内积空间。

## 基本定义

若$\varphi$为实线性空间$E$上的一个*正定*对称双线性型，那么$\varphi$可称为$E$的一个**内积**，记为$(\cdot \; \| \; \cdot)$或$\langle \cdot \; \| \; \cdot \rangle$。
这个实线性空间和其内积一起，合称为**准希尔伯特空间**。
{: .definition}

在准希尔伯特空间上，两个重要的不等式总是成立：

- 柯西-施瓦茨不等式：
  $$
  (x | y)^2 \le (x | x) \cdot (y | y)
  $$
- 闵可夫斯基不等式（三角不等式）：
  $$
  \sqrt{(x+y | x+y)} \le \sqrt{(x | x)} + \sqrt{(y | y)}
  $$
{: .theorem}

这两个命题的证明在此前已经出现过了。

### 范数

接下来我们关注*有限维*实数向量空间。

我们定义，一个函数$N : E \to \mathbb R\_+$若满足：<br/>
1）分离性：
$$
N(x) = 0 \implies x = 0
$$
2）正齐次性：
$$
N(\lambda x) = | \lambda | N(x)
$$
3）三角不等式：
$$
N(x + y) \le N(x) + N(y)
$$
那么就称它为$E$的一个**范数**。
{: .definition}

若$N$为有限维实向量空间$E$的一个范数，那么和这个范数相关的距离定义为：
$$
\begin{array}{cccc}
    d: & E^2 & \to & \mathbb R_+ \\
    & (x, y) & \mapsto & N(y - x)
\end{array}
$$
{: .definition}

任何一个范数的距离满足以下三条性质：
1. $d(x,y) = 0 \iff x = y$
2. $d(x,y) = d(y,x)$
3. $d(x,z) \le d(x,y) + d(y,z)$

这些性质都非常显然。

#### 欧氏范数

记$E$为一实准希尔伯特空间，$(\cdot \; | \; \cdot)$为其上的内积，那么函数：
$$
\begin{array}{cccc}
    N: & E & \to & \mathbb R_+ \\
    & x & \mapsto & \sqrt{(x | x)}
\end{array}
$$
是一个范数，称为**欧几里得范数**，简称欧氏范数。
{: .definition}

容易验证这个映射满足所有范数的公理。

欧氏范数满足以下四个等式：
$$
\begin{aligned}
    \Vert x + y \Vert^2 &= \Vert x \Vert^2 + \Vert y \Vert^2 + 2 (x | y) \\
    \Vert x - y \Vert^2 &= \Vert x \Vert^2 + \Vert y \Vert^2 - 2 (x | y) \\
    \Vert x + y \Vert^2 - \Vert x - y \Vert^2 &= 4 (x | y) \\
    \Vert x + y \Vert^2 + \Vert x - y \Vert^2 &= 2( \Vert x \Vert^2 + \Vert y \Vert^2) \\
\end{aligned}
$$
最后一个等式叫做平行四边形等式。
{: .proposition}

这些等式都很容易由计算验证。

（极化恒等式）任何一个满足平行四边形等式的范数$N$都有一个对应的内积：
$$
(x, y) \mapsto \frac{1}{2} \left(N^2(x+y) - N^2(x) - N^2(y) \right)
$$
{: .theorem}

## 正交性

接下来我们回到对一般的实空间的研究。

若准希尔伯特空间中的两个向量的内积为零，则称这两个向量为**正交的**。
{: .proposition}

这个正交定义是对一般的平面几何中的垂直的推广。

记$(f\|g) = \int\_0^{2\pi} f \cdot g$，那么$e_n = \cos nx$和$f_m = \sin mx$是正交的。
这个正交性是傅里叶分析的基础。
{: .exampl}

（勾股定理）若两个向量$u,v$正交，那么有：
$$
\Vert u + v \Vert^2 = \Vert u \Vert^2 + \Vert v \Vert^2
$$
{: .proposition}

$$
\begin{aligned}
    \Vert u + v \Vert^2 &= \Vert u \Vert^2 + \Vert v \Vert^2 + 2 (u | v) \\
    &= \Vert u \Vert^2 + \Vert v \Vert^2
\end{aligned}
$$
{: .proof}

### 正交子空间

设$E$为一准希尔伯特空间，内积为$(\cdot \;|\; \cdot)$，$x \in E$。
$x$的正交子空间，记为$x^\perp$，表示：
$$
x^\perp = \{ y \in E \;|\; y \perp x \} = \{ y \in E \;|\; (x|y) = 0 \}
$$
同理，设$A$，为$E$中一个子集（可以不是子空间），则$A^\perp$表示：
$$
A^\perp = \{ y \in E \;|\; \forall x \in A, x \perp y \}
$$
单个向量或一个子集的正交子空间是一个子空间。
{: .definition}

设$\varphi\_x: y \mapsto (x|y)$，不难验证这个映射是线性的，因此$x^\perp$是其核空间，从而是一个子空间。
$A^\perp$可以视作所有元素的正交子空间的交集，因此也是一个子空间。
{: .proof}

#### 正交子空间的性质

正交子空间具有以下这些性质。

1. $E^\perp = \\\{ 0 \\\}$，$0^\perp = E$
2. $A \subset B \implies B^\perp \subset A^\perp$
3. $F = \mathrm{Vect}(\mathcal G) \implies F^\perp = \mathcal G^\perp$
4. $A \subset (A^\perp)^\perp$
5. 若$F$为$E$的子空间，那么$F \oplus F^\perp$
6. 若$F,G$为$E$的两个子空间，那么$(F+G)^\perp = F^\perp \cap G^\perp$，$F^\perp + G^\perp \subset (F \cap G)^\perp$
{: .proposition}

前几点比较显然，此处只证明第六点。
设$x \in (F+G)^\perp$，那么$\forall x\_F \in F \subset F+G$，因此$x \perp x\_F$，同理可得$x \perp x\_G$，因此
$$
x \in F^\perp \wedge x \in G^\perp \implies x \in F^\perp \cap G^\perp \implies (F+G)^\perp \subset F^\perp \cap G^\perp
$$
反之，设$x \in F^\perp \cap G^\perp$，那么$\forall x\_F \in F, x\_G \in G$：
$$
(x | x_F + x_G) = (x | x_F) + (x | x_G) = 0
$$
从而$x \in (F+G)^\perp$。
因此$(F+G)^\perp \supset F^\perp \cap G^\perp$。
因此$(F+G)^\perp = F^\perp \cap G^\perp$。
对后者，不难发现$F \cap G \subset F$，$F \cap G \subset G$，从而
$F^\perp \subset (F \cap G)^\perp$，$G^\perp \subset (F \cap G)^\perp$，从而
$F^\perp + G^\perp \subset (F \cap G)^\perp$。
{: .proof}

注意到第四点和第六点中是包含而非等于，且第五点中的直和不一定等于全空间。
我们接下来将会看到对*有限维空间*的特殊情况。
{: .remark}

#### 子空间的正交

对两个子空间$F,G$，称其为**正交**的，若从中任取两个向量都是正交的：
$$
\forall x \in F, y \in G, \; x \perp y
$$
对于有限维的子空间，这相当于限定两个子空间的所有基底都是两两正交的。
{: .definition}

若两个子空间$F,G$是正交的，那么：
$$
F \subset G^\perp ,\; G \subset F^\perp \text{且} F \cap G = \{ 0 \}
$$
反之，若$F \subset G^\perp$或$G \subset F^\perp$，那么这两个子空间是正交的。
{: .proposition}

关于集合包含关系的四个命题容易根据定义证明，实际上，两个子空间正交*当且仅当*一个子空间在另一个的正交子空间之中。
最后不难发现：$F \cap G \subseteq F \cap F^\perp = \\\{ 0 \\\}$。
{: .proof}

### 正交向量组

一组向量$(x\_i)$是**正交**的，若其中的向量两两正交；
是**标准正交**的，若满足：
$$
\forall i,j, \; (x_i | x_j) = \delta_{i,j}
$$
$\delta$为克罗内克符号。
{: .definition}

所有不含零向量的正交向量组$(x\_i)$是线性无关的。
{: .proposition}

根据线性无关的定义，设$\exists (\lambda\_i)$满足$\sum \lambda\_i x\_i = 0$。
$$
\forall k \quad (\sum \lambda_i x_i | x_k) = \lambda_k \Vert x_k \Vert^2 = 0
$$
从而$(\lambda\_i) = 0$，因此线性无关。
{: .proof}

根据这一命题，不难发现，任何$n$维的欧氏空间（即有限维的内积空间）中的一组$n$个向量是*标准正交基底*，当且仅当其标准正交。

设$(x\_i)$为一组正交的向量，那么：
$$
\left\Vert \sum x_i^2 \right\Vert = \sum \Vert x_i \Vert^2
$$
{: .proposition}

这一命题不难由计算验证。

我们之前提到过，一个子空间与其正交子空间构成直和，但是和空间不一定是全空间。
对有限维的内积空间，我们有：

### 有限维的正交

设$E$为一$n$维欧氏空间，且$F \subset E$为一个子空间，那么
$$
F \oplus F^\perp = E
$$
称$F^\perp$为$F$的**正交补空间**。
{: .theorem}

若$F$为$E$的平凡子空间则显然，现在不妨设$\dim F = p \in [\\\![ 1, n-1 ]\\\!]$。
记：
$$
\begin{array}{cccc}
    f: & E & \to & \mathbb R^+ \\
    & x & \mapsto & \left( (x_1 | f_1), \cdots, (x_p | f_p) \right)
\end{array}
$$
其中$(f\_1, \dots, f\_p)$是$F$的一组基底。
不难验证这是良定义的线性变换，且$\ker f = F^\perp$。
根据秩-零化度定理，有：$\dim F = n = \dim \ker f + \mathrm{rank}(f)$。
我们又知道$\mathrm{rank}(f) \le p$，从而有$\dim F^\perp \ge n - p$。
因此$\dim F^\perp + \dim F \ge \dim E$。
又显然$\dim F^\perp + \dim F \le \dim E$，因为两者都是$E$的子空间，从而有：
$$
\dim F^\perp + \dim F = \dim E
$$
又两者构成直和，因此其直和一定为全空间。
{: .proof}

在欧几里得空间中，有：
$$
\begin{aligned}
    \dim F^\perp &= \dim E - \dim F \\
    (F^\perp)^\perp &= F \\
    \dim (F^\perp)^\perp &= \dim F
\end{aligned}
$$
{: .proposition}

正如此前所述，这些关系仅在**有限维空间**成立。
{: .remark}

## 正交投影

设$E$为一任意维准希尔伯特空间，而$F$为其中一个子空间，满足$F \oplus F^\perp = E$，那么平行于$F^\perp$向$F$的投影称为$F$的**正交投影**，记作$p\_F$。
{: .definition}

不难验证正交投影是唯一的。
正交投影是唯一一个满足：
$$
\forall x \in E, \quad \left\{ 
    \begin{aligned}
        p_F \in F \\
        x - p_F \in F^\perp
    \end{aligned}
\right.
$$
的线性变换。

对无限维空间，不是所有子空间都满足直和关系，因此不是所有子空间都有正交投影。
{: .remark}

### 投影算子

准希尔伯特空间中直线$u$的*投影算子*定义为：
$$
\begin{array}{cccc}
    \mathrm{Proj}: & E \times E & \to & E \\
    & (u,v) & \mapsto & \mathrm{Proj}_u(v) = \frac{(u|v)}{(u|u)} u
\end{array}
$$
规定若$u=0$，那么其投影算子为零映射。
{: .definition}

不难验证若$u \neq 0$，那么其投影算子为向$\mathbb K_u$的正交投影。

设$E$为一任意维数的准希尔伯特空间，$F$为一个*有限维*子空间，其一组正交基底为$(e\_1, \dots, e\_p)$。
$F$的正交投影是良定义的，且：
$$
\forall x \in E, \quad p_F = \sum_{i = 1}^p \mathrm{Proj}_{e_i} x
$$
更进一步地，若这组基底是标准正交的，那么：
$$
p_F = \sum_{i = 1}^p (x | e_i) e_i
$$
{: .proposition}

$$
\begin{aligned}
    \forall k, \; (e_k | x - p_F(x)) &= (e_k | x - \sum_{i = 1}^p \frac{(e_i|x)}{(e_i|e_i)} e_i) \\
    &= (e_k | x) - (e_k | \frac{(e_k | x)}{(e_k | e_k)} e_k) = 0
\end{aligned}
$$
从而$x - p_F(x) \in F^\perp$。
不难验证$p_F(x) \in F$，因此$F \oplus F^\perp = E$，从而正交投影是良定义的。
最后容易验证其确实是向$F$平行于$F^\perp$的投影变换，因为其在$F$上恒等且$x - p_F(x) \in F^\perp$。
{: .proof}

我们间接证明了只要子空间是有限维的，尽管全空间是无穷维的，这个直和关系依然成立。
{: .remark}

### 施密特正交化

设$E$为一$n$维欧氏空间，那么其上的任何一个基底$(f\_i)$都有至少一个正交标准基底$(e\_i)$与其对应，且满足：
$$
\forall i \in [\![ 1,n ]\!], \; \mathrm{Span}(f_1, \dots, f_i) = \mathrm{Span}(e_1, \dots, e_i) 
$$
若我们限定$(f\_i | e\_i) > 0$那么这组正交标准基底是唯一的。
{: .proposition}

我们用格拉姆-施密特算法来求解这组基底：
$$
\begin{array}{cccccc}
    g_1 &=& f_1 & e_1 &=& \frac{g_1}{\Vert g_1 \Vert} \\
    g_2 &=& f_2 - p_{F_1}(f_2) & e_2 &=& \frac{g_2}{\Vert g_2 \Vert} \\
    g_3 &=& f_3 - p_{F_2}(f_3) & e_3 &=& \frac{g_3}{\Vert g_3 \Vert} \\
    \vdots && \vdots & \vdots && \vdots \\
    g_n &=& f_n - p_{F_{n-1}}(f_n) & e_n &=& \frac{g_n}{\Vert g_n \Vert}
\end{array}
$$
其中$F_i$表示前$i$个向量$f_i$构成的子空间。
{: .proof}

根据生成这组基底的方法，我们容易看出，从基底$(f\_i)$到$(e\_i)$的过渡矩阵为一个上三角矩阵，这个结论在QR分解之中会被用到。

最后我们总结一下有限维下关于标准正交基底的命题：

1. 所有有限的正交向量都可以补充成一组正交基底；
2. 所有有限的标准正交向量都可以补充成一组标准正交基底；
3. 特别地，只要$E$不为零空间，就一定存在标准正交基底。
{: .proposition}

### 有限维子空间的正交投影

设$p$为$E$上的一个投影，这个投影是正交的，当且仅当
$$
\forall x \in E, \; \Vert p(x) \Vert \le \Vert x \Vert
$$
{: .proposition}

左推右是显然的：
$$
\Vert x \Vert^2 = \Vert x_F \Vert^2 + \Vert x_{F^\perp} \Vert^2 \ge \Vert x_F \Vert^2 = \Vert p_F (x) \Vert^2
$$
考虑左推右，我们设$F = \mathrm{Im} p$、$G = \ker p$，则由投影的性质可知$F \oplus G = E$，我们只需要证明两者正交即可。
$$
\begin{aligned}
    \Vert p(x_F + \lambda x_G) \Vert^2 &= \Vert x_F \Vert^2 \\
    &\le \Vert x_F + \lambda x_G \Vert^2 \\
    &\le \Vert x_F \Vert^2 + 2 \lambda (x_F | x_G) + \lambda^2 \Vert x_G \Vert^2\\
    \implies & 2 \lambda (x_F | x_G) + \lambda^2 \Vert x_G \Vert^2 \ge 0
\end{aligned}
$$
这个二次函数大于等于零，因此其判别式小于等于零，从而我们得出$(x\_F | x\_G) = 0$，因此两个空间正交。
{: .proof}

（贝塞尔不等式）设$E$为一准希尔伯特空间，$(e\_i), i \in I$为一组标准正交向量（不一定是基底，不一定有限），那么
$$
\forall f \in E, \; \sum_{i \in I} (f | e_i)^2 \le \Vert f \Vert^2
$$
{: .proposition}

设$\alpha\_1, \dots, \alpha_r$为$I$的一个有限子集，那么
$$
\sum_{i=1}^r (f | e_{\alpha_i})^2 = \Vert p(f) \Vert^2 \le \Vert f \Vert^2
$$
其中$p$是向空间$\mathrm{Vect}(e\_{\alpha\_i})$的正交投影。
从而这个数列是随着$r$升高而单调有界，从而收敛，并小于$\Vert f \Vert^2$。
{: .proof}

设$\mathcal B = (e_1, \dots, e_n)$为欧几里得空间$E$的一个标准正交基底，那么空间中的所有向量都可以写为：
$$
\forall x \in E ,\; x = \sum_{i=1}^n (x | e_i) e_i
$$
{: .proposition}

这个命题比较显然，只需要把向量向所有标准正交基底投影即可。

任何两个*标准正交*基底之间的过渡矩阵满足：
$$
P_{\mathcal B \to \mathcal B^\prime}^{-1} = P_{\mathcal B^\prime \to \mathcal B} = P_{\mathcal B \to \mathcal B^\prime}^\top
$$
满足自己的逆和转置相同的矩阵称为**正交矩阵**。
{: .proposition}

简记$P = P\_{\mathcal B \to \mathcal B^\prime}$。
$$
P^\top P = (a_{i,j}) = C_i^\top C_j = (C_i | C_j)
$$
其中$C\_i$表示矩阵$P$的第$i$列，也就是$\mathcal B^\prime$的第$i$个向量在$\mathcal B$下的坐标。
那么$a\_{i,j} = (e\_i^\prime | e\_j^prime) = \delta_{i,j}$当且仅当$\mathcal B^\prime$标准正交，从而若标准正交，则转置的矩阵与原矩阵的积为单位阵，从而互为逆。
{: .proof}

## 子空间的距离

设$X$为希尔伯特空间$E$的一个非空子集，那么从向量$u$到$X$的**距离**定义为：
$$
\mathrm{d} (u,X) = \inf_{v \in X} \Vert u - v \Vert
$$
{: .definition}

设$F$为$E$中一个子空间，满足$F \oplus F^\perp = E$，那么从$u$到该子空间$F$的距离在$v = p\_F(u)$处唯一地取得：
$$
\exists ! v = p_F(u), \; \mathrm{d}(u,v) = \Vert u - v \Vert
$$
{: .proposition}

$$
\begin{aligned}
    \Vert u - v \Vert^2 &= \Vert u - p_F(u) + p_F(u) - v \Vert^2 \\
    &= \Vert u - p_F(u) \Vert^2 + \Vert p_F(u) - v \Vert^2 \\
    &\ge \Vert u - p_F(u) \Vert^2
\end{aligned}
$$
当且仅当$p\_F(u) = v$时可以取等。
{: .proof}

但若子空间的正交补不存在，那么距离可能不能在正交投影处取得。
{: .remark}

### 计算距离

设$F$为欧几里得空间$E$的一个子空间，从而设$\mathcal B = (f\_1, \dots, f\_p)$为$F$的一组基底，$\mathcal C = (g\_1, \dots, g\_q)$为$F^\perp$的一组基底。
我们提出几种计算距离的方法。

1. 若$\mathcal B$为一组正交的基底，那么$p\_F(x)$可以非常容易地求出；
2. 若$\mathcal B$不是正交的基底，那么我们可以使用施密特正交化将其化为正交的基底；
3. 若$\mathcal B$不是正交的基底，且正交化计算量过大，那么我们可以直接设$p\_F = a\_1 f\_1 + \cdots + a\_n f\_n$然后解方程：
   $$
   \left\{
    \begin{aligned}
        (x - p_F(x) | f_1) &= 0 \\
        \vdots \\
        (x - p_F(x) | f_n) &= 0
    \end{aligned}
   \right. 
   $$
4. 除此之外，我们不难发现$\mathrm{d}(x, F) = \Vert p_{F^\perp}(x) \Vert$，从而我们可以直接在其正交补空间中求解其距离。

利用这一性质，我们可以计算线性空间中的最小值问题。

求$(2x+y-1)^2 + (x-3y)^2 + (y-1)^2$的最小值。 \
注意到这个式子可以改写为：
$$
\Vert x (2,1,0)^\top + y (1,-3,1)^\top - (1,0,1)^\top \Vert^2
$$
因此我们可以认为这是从$(1,0,1)^\top$到$\mathrm{Span}((2,1,0)^\top, (1,-3,1)^\top)$的距离的最小值。
考虑到距离的最小值总是在正交投影处取得，可以利用正交投影计算其值。
{: .exampl}

## 线性函数

本节中，我们总是假设$E$为一欧氏空间。

对所有的非空向量$a$，$a^\perp$为一超平面；
设$H$为一超平面，则任何一个与其正交的向量称为其**法向量**。
{: .definition}

设$f$为$E$的一个线性函数，那么存在唯一的向量$a$，满足：
$$
\forall x \in E,\; f(x) = (a | x)
$$
{: .proposition}

若$f = 0$，那么取$a = 0$即可。
现在设$f \neq 0$，那么其核空间总是一个超平面，记为$H$，从而存在一个单位长度的法向量，记为$n$，我们接下来验证$a = \lambda n$，其中$\lambda = f(n)$。
设$x =  x^\prime + \alpha n$，其中$x^\prime \in \ker f$。
那么
$$
\begin{aligned}
    f(x) = f(x^\prime) + \alpha f(n) = \alpha f(n) \\
    (a|x) = (f(n)n | x^\prime) + \alpha (f(n)n | n) = \alpha f(n)
\end{aligned}
$$
最后验证其唯一性。
首先注意到$\forall x \in H, (a|x) = f(x) = 0$，从而$a$一定与$n$共线。
然后注意到若存在两个不同的$a$，那么一定有$(a^\prime - a | x) = 0$，从而$a^\prime = a$。
{: .proof}

### 高维向量的外积

利用此前提到的性质，我们可以定义高维空间中向量的外积（叉乘）。

设$E$为一$n$维欧几里得空间，一组$n-1$个向量$(a\_1, \dots, a\_{n-1})$的外积由以下方法定义：
$$
\forall x \in E, \det (a_1, \cdots, a_{n-1}, x) = (a | x)
$$
行列式对任何一个元素都是线性的，从而存在一个向量时其可以表示为内积的形式，那么这个向量就是这些向量的外积，记为：
$$
a = a_1 \wedge \cdots \wedge a_{n-1}
$$
{: .definition}

不难验证这个定义与三维空间的定义是自洽的。

$a\_1 \wedge \cdots \wedge a\_{n-1}$与$a\_1, \dots, a\_{n-1}$正交，且：
$$
\det (a_1, \cdots, a_{n-1}, a_1 \wedge \cdots \wedge a_{n-1}) = 0
$$
{: .proposition}

## QR分解

任何一个可逆的矩阵都可以分解成一个正交矩阵$Q$和上三角矩阵$R$之积。
{: .theorem}

这是我们学习的第五个矩阵分解算法，前四个分别为*LU分解*（即高斯消元）、*特征值分解*（也称谱分解）、*若尔当-谢瓦莱分解*和*若尔当标准型分解*。

我们可以这样理解这个分解方法：若矩阵可逆（即满秩），那么它的列向量一定组成一个基底，记为$\mathcal A$。
我们设空间的典范标准基底为$\mathcal C$，基底通过施密特正交化取得的对应的正交标准基底为$\mathcal B$，那么这个分解相当于：
$$
P_{\mathcal C \to \mathcal A} = P_{\mathcal C \to \mathcal B} P_{\mathcal B \to \mathcal A}
$$
注意到任何两个正交标准基底之间的过渡矩阵为一个正交矩阵，因此$P\_{\mathcal C \to \mathcal B}$是一个正交矩阵。
由于$\mathcal B$是通过施密特正交化获得的，因此$P\_{\mathcal B \to \mathcal A}$正是一个上三角矩阵。

设$A = (a\_1 | \cdots | a\_n)$，$(q\_1, \dots, q\_n)$为$\mathrm{Im} A$的一个标准正交基底，利用施密特正交化计算$q\_i$：
$$
\begin{array}{cclccl}
    q_1 &=& \frac{a_1}{v_1} & v_1 &=& \Vert a_1 \Vert \\
    \vdots &&& \vdots \\
    q_k &=& \frac{a_k - \sum_{i=1}^{k-1} (q_i | a_k) q_i }{v_k} & v_k &=& \Vert a_k - \sum_{i=1}^{k-1} (q_i | a_k) q_i \Vert
\end{array}
$$
从而
$$
\begin{aligned}
    a_1 &= v_1 q_1 \\
    a_k &= (q_1 | a_k) q_1 + \cdots + (q_{k-1}|a_k)q_{k-1} + v_k q_k
\end{aligned}
$$
那么有：
$$
(a_1 | \cdots | a_n) = (q_1 | \cdots | q_n) 
\begin{pmatrix}
    v_1 & (q_1|a_2) & (q_1|a_3) & \cdots & (q_1|a_n) \\
    0 & v_2 & (q_2|a_3) & \cdots & (q_2|a_n) \\
    0 & 0 & v_3 & \cdots & (q_3|a_n) \\
    \vdots & \vdots & \vdots & \ddots & \vdots \\
    0 & 0 & 0 & \cdots & v_n
\end{pmatrix}
$$
{: .proof}

注意到
$$
(q_1 | \cdots | q_n)^\top \cdot (a_1 | \cdots | a_n) = 
\begin{pmatrix}
    v_1 & (q_1|a_2) & (q_1|a_3) & \cdots & (q_1|a_n) \\
    0 & v_2 & (q_2|a_3) & \cdots & (q_2|a_n) \\
    0 & 0 & v_3 & \cdots & (q_3|a_n) \\
    \vdots & \vdots & \vdots & \ddots & \vdots \\
    0 & 0 & 0 & \cdots & v_n
\end{pmatrix}
$$
我们有$v\_k = (q\_k | a\_k)$。
