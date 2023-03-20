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