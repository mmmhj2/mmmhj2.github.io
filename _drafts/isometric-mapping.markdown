---
title: "欧氏空间的等距变换"
categories: "代数"
---

本章中，我们将研究有限维内积空间（即欧氏空间）的等距变换。

## 等距变换

设$f: E \to E$为一映射，称其为**等距变换**，若：
$$
f(0_E) = 0_E
$$
且
$$
\forall (u,v) \in E^2, \; \Vert f(u) - f(v) \Vert = \Vert u - v \Vert
$$
后者称为*保距离性*。
{: .definition}

等距变换还有一个等价的定义：

这个定义等价于：
$$
\forall (u,v) \in E^2, \; (f(u) | f(v)) = (u|v)
$$
这个性质称为*保内积性*。
{: .proposition}

先由前一个定义推后一个定义：
$$
\begin{aligned}
    (f(u) | f(v)) 
    &= \frac{1}{2} (\Vert f(u) \Vert^2 + \Vert f(v) \Vert^2 - \Vert f(u)-f(v) \Vert^2) \\
    &= \frac{1}{2} (\Vert f(u)-f(0) \Vert^2 + \Vert f(v)-f(0) \Vert^2 - \Vert f(u)-f(v)\Vert^2) \\
    &= \frac{1}{2} (\Vert u \Vert^2 + \Vert v \Vert^2 - \Vert u-v \Vert^2) \\
    &= \frac{1}{2} (\Vert u \Vert^2 + \Vert v \Vert^2 - (\Vert u \Vert^2 + \Vert v \Vert^2 - 2(u|v))) \\
    &= (u|v)
\end{aligned}
$$
再用后一个定义推前一个定义：
首先验证$f(0) = 0$
$$
\Vert f(0) \Vert^2 = (f(0) | f(0)) = (0|0) = 0 \implies f(0) = 0
$$
然后验证保距离性：
$$
\begin{aligned}
    \Vert f(u) - f(v) \Vert^2 
    &= (f(u) | f(u)) + (f(v) | f(v)) - 2 (f(u) | f(v)) \\
    &= (u|u) + (v|v) - 2(u|v) \\
    &= \Vert u - v \Vert^2
\end{aligned}
$$
由于距离非负，两者相等。
{: .proof}

在定义之中，我们并不要求该映射为线性映射。
实际上，我们很快就能知道，满足这些条件的映射一定是线性的。
{: .remark}
