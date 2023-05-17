---
layout: single_legacy
title: "几个常见非线性微分方程的解"
categories: "微分方程"
date: 2022-11-28 13:20:00 +0800
--- 

## 可分离变量方程

我们研究可分离变量方程
$$
y^\prime = f(t, y) = g(t) h(y)
$$
其中$g: I \to \mathbb R$连续，$h: J \to \mathbb R$局部李普希茨连续（即在任意点存在一个李普希茨连续的邻域）。
我们称满足$h(y^\*) = 0$的实数$y^\*$为静止点。
如果静止点存在，那么常函数$y(t) = y^\*$是方程的一个解。
根据柯西定理（解的局部唯一性），方程的所有解要么为此常函数，要么在任意点不与此常函数重合。

假设$y \neq y^\*$，则$h(y) \neq 0$。
方程两边同时除以$h(y)$，可得：
$$
\frac{y^\prime}{h(y)} = g(t)
$$
我们设$H$为$\frac{1}{h(y)}$的原函数，$G$为$g(t)$的原函数，则有
$$
H(y) = G(t) + K, \quad K \in \mathbb R
$$
若$H(y)$为双射，则可解出
$$
y(t) = H^{-1}(G(t) + K)
$$

## 伯努利方程

形如
$$
y^\prime = a(t) y + b(t) y^\alpha \quad \alpha \in \mathbb R
$$
的方程称为伯努利方程。
当$\alpha = 0, 1$时，方程退化为一个简单的线性方程，因此我们只研究其他情况。
我们记$F(t, y) = a(t) y + b(t) y^\alpha$

- 若$\alpha > 1$，显然零是一个解。此时$F$关于$y$局部李普希茨连续，利用柯西定理可说明任何非零解在任意处非零。
- 若$\alpha < 0$，则对于任何解，$(t,0)$不在其定义域内。
- 若$0 < \alpha < 1$，可根据解可导且导数连续进一步研究解及其定义域。

我们设$y$在区间$I$上非零，在该区间上研究其解。
$$
\begin{aligned}
y^\prime &= a(t) y + b(t) y^\alpha \\
\frac{y^\prime}{y^\alpha} &= a(t) \frac{1}{y^{\alpha-1}} + b(t) \\
\frac{1}{1-\alpha} z^\prime &= a(t) z + b(t) \quad z = y^{\alpha-1}
\end{aligned}
$$
我们把方程变成了一个一阶线性方程，此时可用正常的方式求解。

## 黎卡提方程

形如
$$
y^\prime = a(t) y^2 + b(t) y + c(t)
$$
的微分方程叫做黎卡提方程。
设$F(t,y) = a(t) y^2 + b(t) y + c(t)$，$F$局部李普希茨连续，因此最大解唯一。
如果我们已经知道其一个特解，则所有的解都可由其导出。

设$\varphi_0$为其一个特解，则设所有解为$y = \varphi_0 + z$。
求导可得：
$$
\begin{aligned}
y^\prime &= \varphi_0^\prime + z^\prime \\
&= a(t)(\varphi_0^2 + 2 \varphi_0 z + z^2) + b(t) (\varphi_0 + z) + c(t) \\
&= \underbrace {a(t) \varphi_0^2 + b(t) \varphi_0 + c(t)}_{= \varphi_0^\prime} + a(t)( 2 \varphi_0 z + z^2) + b(t) z \\
\iff z^\prime &= a(t) z^2 + (2 a(t) \varphi_0 + b(t)) z
\end{aligned}
$$
这样我们就又把该方程化为了二次伯努利方程，可用上述办法求解。

## 贝塞尔方程的一组解

形如
$$
x^2 y^{\prime \prime} + x y^\prime + (x^2 - n^2) y = 0, n \in \mathbb N
$$
的方程叫做贝塞尔方程。
此处，我们利用幂级数展开来求一个特殊的解。

我们假设该方程的解在零的一个邻域内可以展开成幂级数，从而有：
$$
\forall x \in (-r, r) \quad y(x) = \sum_{k=0}^{\infty} a_k z^k
$$
带入原方程，可得：
$$
\begin{aligned}
\sum_{k=2}^{\infty} a_k k (k-1) x^k + 
\sum_{k=1}^{\infty} a_k k x^k + 
\sum_{k=0}^{\infty} a_k x^{k+2} - 
n^2 \sum_{k=0}^{\infty} a_k x^k 
&= 0 
\\ -n^2 a_0 + (1-n^2)a_1x + 
\sum_{k=2}^{\infty}((k^2 - n^2) a_k + a_{k-2}) x^k 
&= 0
\end{aligned}
$$

我们知道，如果幂级数的和为零，那么一定其每项系数都为零，从而我们有：
$$
\left\{
\begin{aligned}
n^2 a_0 &= 0 \\
(1-n^2) a_1 &= 0 \\
\forall k \ge 2 \quad (k^2 - n^2) a_k + a_{k-2} &= 0
\end{aligned}
\right.
$$
我们假设$a_{-1} = a_{-2} = 0$，则可进一步化简：
$$
\forall k \ge 0 \quad (k-n)(k+n)a_k + a_{k-2} = 0
$$
从而我们知道若$k < n$，或$k$与$n$不同奇偶，则$a_k = 0$。
因此，解可写为：
$$
y(x) = x^n \sum_{k=0}^{\infty} a_{n+2k} x^{2k}
$$
且
$$
\forall k \ge 0 \quad a_{n+2k} 
= -\frac{1}{4} \frac{a_{n+2(k-1)}}{k(n+k)} 
= \frac{(-1)^k}{4^k} \frac{n! a_n}{k! (n+k)!}
$$
从而解为：
$$
\forall x \in (-r, r) \quad
2^n n! a_n \sum_{k=0}^{\infty} \frac{(-1)^k}{k! (n+k)!} \left( \frac{x}{2} \right)^{n+2k}
$$

我们可进一步验证这个解实际上在$\mathbb R$上成立。

我们可以把后面的系数提取出来，单独变成一个函数，有：
$$
\forall x \in \mathbb R \quad
J_n(x) = \sum_{k=0}^{\infty} \frac{(-1)^k}{k! (n+k)!} \left( \frac{x}{2} \right)^{n+2k}
$$
这个函数叫做**第一类贝塞尔函数**。

GCC的[数学库](https://www.gnu.org/software/libc/manual/html_mono/libc.html#index-j0)里有几个非常容易导致编译错误的函数`j0`、`j1`、`y0`、`y1`就是贝塞尔函数。
其中，`j0`和`j1`就是上文提到的第一类贝塞尔函数。
