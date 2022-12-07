---
layout: post
title: "傅里叶级数——收敛行为"
categories: analysis
---

$$
\newcommand{d}{\mathrm{d}}
\newcommand{TT}{\mathbb{T}}
\newcommand{ZZ}{\mathbb{Z}}
\newcommand{CC}{\mathbb{C}}
\newcommand{RR}{\mathbb{R}}
\newcommand{NN}{\mathbb{N}}
$$

我们已经知道，傅里叶系数$\hat f : \ZZ \to \CC$是有界的，其不能大于原函数的上确界。
实际上，我们有以下定理：

设$f \in \mathcal C_m (\TT)$，则$\lim_{n \to \pm \infty} \hat f (n) = 0$。
{: .proposition}

只考虑$n \to \infty$的情况，因为$n \to -\infty$时可取$f^\prime(x) = f(-x)$。
在学习黎曼积分时，我们已经知道，任何分段连续函数，都可以用一个阶梯函数逼近。
因此，我们先考虑阶梯函数的情形。
设$f$为一阶梯函数，我们把整个区间的积分转化为在每个阶梯上的积分，则有：
$$
\begin{aligned}
2 \pi \hat f (n)
&= \sum_{k=1}^{N} \int_{x_{k-1}}^{x_k} f(x) e^{-inx} \d x \\
&= \frac{1}{in} \sum_{k=1}^N y_k \left( e^{-inx_{k-1}} - e^{-inx_k} \right) \\
&= O \left( \frac{1}{n} \right) \to 0 
\end{aligned}
$$
接下来，若$f$不是一个阶梯函数，则对于任意的$\varepsilon > 0$一定存在一个阶梯函数$\phi : [0,2\pi] \to \CC$满足：
$$
\forall x \in [0, 2\pi] \quad \left| f(x) - \phi(x) \right| \le \frac{\varepsilon}{2}
$$
我们已经证明了，对阶梯函数，其傅里叶系数趋于零，从而有：
$$
\exists n_0 \in \NN \quad \forall n \in \NN \quad 
n > n_0 \implies \left| \hat \phi(n) \right| \le \frac{\varepsilon}{2}
$$
我们固定$n_0$，有：
$$
n > n_0 \implies \left| \hat f(n) \right|
\le \left| \widehat{f - \phi}(n) \right| + \left| \hat \phi(n) \right|
\le \sup_\RR \left( \left| f - \phi \right| + \left| \phi \right| \right)
\le \varepsilon
$$
从而原命题得证。
{: .proof}

我们此前已经知道，傅里叶系数和导数满足一定关系：
$$
\hat f(n) = \frac{\widehat{f^{(n)}}(n)}{(in)^{(p)}} = o \left( \frac{1}{n^p} \right)
$$
从而，我们可以说傅里叶系数的收敛速度表征了函数的“光滑性”。
对于一个光滑（无穷阶可导）的函数，其傅里叶系数极快地收敛至零。

现在，我们已经知道傅里叶系数一定收敛至零，那么傅里叶级数一定收敛至原函数吗？
又是以什么方式收敛的呢？

## 逐点收敛与狄利克雷核

以下命题被称为狄利克雷收敛定理，是判定傅里叶级数收敛的重要命题：

设$f \in \mathcal C_m (\TT)$，若其在$x_0 \in \RR$点左右皆可导，即两个极限
$$
\lim_{x \to x_0-} \frac{f(x) - f(x_0-)}{x - x_0} \quad
\lim_{x \to x_0+} \frac{f(x) - f(x_0+)}{x - x_0}
$$
存在，则傅里叶级数在该点收敛至$f(x_0)$。
{: .proposition}

始终注意我们要求这个函数是正规化的，即$f(x) = \frac{1}{2} \left( f(x-) + f(x+) \right)$。

## 一致收敛与泊松核

## 二次收敛
