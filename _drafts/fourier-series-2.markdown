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
{: .theorem}

始终注意我们要求这个函数是正规化的，即$f(x) = \frac{1}{2} \left( f(x-) + f(x+) \right)$。

为了证明这个定理，我们尝试计算一下傅里叶级数的部分和：
$$
\begin{aligned}
S_n (f) (x) 
&= \sum_{k=-n}^{n} \hat f (k) e^{ikx} \\
&= \frac{1}{2\pi} \sum_{k=-n}^{n} \int_0^{2\pi} f(t) e^{-ikt} \d t e^{ikx} \\
&= \frac{1}{2\pi} \int_0^{2\pi} f(t) \sum_{k=-n}^{n} e^{ik(x-t)} \d t
&= \frac{1}{2\pi} \int_0^{2\pi} f(x-t) \sum_{k=-n}^{n} e^{ik(t)} \d t
\end{aligned}
$$
这个求和是有限的，从而总可以和积分交换。
我们注意到，似乎这个求和变成了原函数和一个级数卷积的形式。
我们把这个级数称为**狄利克雷核**，记为：
$$
D_n(x) = \sum_{k=-n}^{n}e^{ikx} = 1 + 2 \sum_{k=1}^{n} \cos kx
$$
这个级数具有一些性质，可以帮助我们证明狄利克雷定理。

我们有：
$$
\begin{aligned}
& S_n(f)(t) - \frac{1}{2} \left( f(x_0+) + f(x_0-) \right) \\
&= \frac{1}{2\pi} \int_{-\pi}^{\pi} D_n(t) f(x_0 - t) \d t - \frac{1}{2} \left( f(x_0+) + f(x_0-) \right) \\
&= \frac{1}{2\pi} \int_{-\pi}^{0} D_n(t) \left[f(x_0 - t) - f(x_0+)\right] \d t +
\frac{1}{2\pi} \int_{0}^{\pi} D_n(t) \left[f(x_0 - t) - f(x_0-)\right] \d t
\end{aligned}
$$
我们先研究其中一个积分，在利用相同的办法证明另一个积分。
尝试计算一下$D_n(x)$的值：
$$
\begin{aligned}
D_n(x) 
&= \sum_{k=-n}^{n}e^{ikx} = e^{-ikn} \frac{1 - e^{i(2n+1)x}}{1 - e^{ix}} \\
&= \frac{e^{-i(n+1/2)x} + e^{i(n+1/2)x}}{e^{-ix/2} - e^{ix/2}} \\
&= \frac{\sin (n + \frac{1}{2}) x}{\sin \frac{1}{2} x} \\
&= \cos nx + \sin nx \cot \frac{1}{2} x
\end{aligned}
$$
带入第二个积分中：
$$
\begin{aligned}
& \; \int_{0}^{\pi} D_n(t) \left[f(x_0 - t) - f(x_0-)\right] \d t \\
&= \int_{0}^{\pi} \left( \cos nx + \sin nx \cot \frac{1}{2} x \right) \left[f(x_0 - t) - f(x_0-)\right] \d t \\
&= \int_{0}^{\pi} \cos nx \left[f(x_0 - t) - f(x_0-)\right] \d t + \int_{0}^{\pi} \sin nx \cot \frac{1}{2} x \left[f(x_0 - t) - f(x_0-)\right] \d x
\end{aligned}
$$
我们设一个函数$u(x)$：
$$
u(x) = \left\{
\begin{aligned}
&f(x_0 - t) - f(x_0-) &\quad x \in (0, \pi] \\
&0 &\quad x = 0 \\
&u(-x) &\quad x \in [-\pi,0)
\end{aligned}
\right.
$$
可以看出，这个函数是一个周期为$2\pi$的偶函数。
上述积分的第一部分可看作是这个函数的傅里叶系数。
再设一个函数$v(x)$:
$$
v(x) = \left\{
\begin{aligned}
&[f(x_0 - t) - f(x_0-)] \cot \frac{1}{2} x &\quad x \in (0, \pi] \\
&0 &\quad x = 0 \\
&-v(-x) &\quad x \in [-\pi,0)
\end{aligned}
\right.
$$
可以看出，这个函数是一个周期为$2\pi$的奇函数。
上述积分的第二部分可看作是这个函数的傅里叶系数。
显然，这两个函数满足本文开头的命题的前提条件，因此它们的傅里叶系数趋于零。
所以，整个积分趋于零。
因此，$S_n(f)(t) - \frac{1}{2} \left( f(x_0+) + f(x_0-) \right)$趋于零，从而定理得证。
{: .proof}

## 一致收敛与泊松核

## 二次收敛
