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