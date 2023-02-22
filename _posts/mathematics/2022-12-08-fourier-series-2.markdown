---
layout: single
title: "傅里叶级数——收敛行为"
categories: "分析"
date: 2022-12-08 21:00:00 +0800
tags: ["傅里叶级数"]
---

我们已经知道，傅里叶系数$\hat f : \mathbb{Z} \to \mathbb{C}$是有界的，其不能大于原函数的上确界。
实际上，我们有以下定理：

设$f \in \mathcal C_m (\mathbb{T})$，则$\lim_{n \to \pm \infty} \hat f (n) = 0$。
{: .proposition}

只考虑$n \to \infty$的情况，因为$n \to -\infty$时可取$f^\prime(x) = f(-x)$。
在学习黎曼积分时，我们已经知道，任何分段连续函数，都可以用一个阶梯函数逼近。
因此，我们先考虑阶梯函数的情形。
设$f$为一阶梯函数，我们把整个区间的积分转化为在每个阶梯上的积分，则有：
$$
\newcommand{d}{\mathrm{d}}
\newcommand{TT}{\mathbb{T}}
\newcommand{ZZ}{\mathbb{Z}}
\newcommand{CC}{\mathbb{C}}
\newcommand{RR}{\mathbb{R}}
\newcommand{NN}{\mathbb{N}}
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

此节研究的是一个与傅里叶级数密切相关的幂级数的一致收敛，而不是傅里叶级数本身的一致收敛。
{: .remark}

设$\sum c_n r^n$为一幂级数，其中$c_n$有界，因此该幂级数的收敛半径大于等于一。
若$(c_n)$绝对收敛，则$\sum c_n r^n$在$[0,1]$上正规收敛，从而在$[0,1]$上连续。
我们有：
$$
\lim_{r \to 1-} \sum_{n=0}^{\infty} c_n r^n = \sum_{n=0}^{\infty} c_n
$$
若$(c_n)$收敛，但不绝对收敛，利用分部求和公式，上述等式仍成立。

如果等式左边存在极限，那么我们称$\sum c_n$**阿贝尔收敛**至这个极限。
上一段的叙述说明，如果等式右边收敛，则左边的极限一定等于右边。
从而，如果一个数列收敛，那么它一定阿贝尔收敛，且收敛至同一个数。

级数$1-1+1-1+\cdots$在通常意义下不收敛，但阿贝尔收敛至$\frac{1}{2}$。
{: .exampl}

在上一章中，我们证明了，只有左右可导时函数的傅里叶级数才逐点收敛至原函数。
这一章中，我们将说明，只要原函数连续，那么其傅里叶级数在阿贝尔收敛的意义下一定收敛至原函数。

设：
$$
A_r (f)(x) = \sum_{n=-\infty}^{\infty} r^{|n|} c_n(f) e^{inx} = c_0(f) + 
\sum_{n=1}^{\infty} r^n \left( c_n(f) e^{inx} + c_{-n}(f) e^{-inx} \right)
$$
此章我们将研究这个函数与原函数的关系。

类比上一章中的狄利克雷核，我们定义泊松核为一组函数：
$$
\forall r \in [0, 1) \quad \forall x \in \RR \quad
P_r(x) = \sum_{n=-\infty}^{\infty} r^{|n|}e^{inx} = 1 + 2 \sum_{n=1}^{\infty}r^n \cos nx
$$
{: .definition}

我们也对它求个和：
$$
\begin{aligned}
P_r(x) 
&= \sum_{n=-\infty}^{\infty} r^{|n|}e^{inx} \\
&= 1 + \sum_{n=1}^{\infty} (r e^{ix})^n + \sum_{n=1}^{\infty} (r e^{-ix})^n \\
&= 1 + \frac{re^{ix}}{1-re^{ix}} + \frac{re^{-ix}}{1-re^{-ix}} \\
&= \frac{1-r^2}{1-2r\cos x + r^2}
\end{aligned}
$$

这一组函数有几个有趣的性质：

$\forall r \in \[0, 1)$
函数$P_r$是偶函数，周期为$2\pi$，恒正，满足$\int_0^{2\pi} P_r = 2\pi$，且
$\forall \delta \in (0, \pi)$，其在闭区间$[\delta, 2\pi - \delta]$上关于$r$一致收敛至零，即
$$
\forall \varepsilon > 0 \; \exists \rho \in [0, 1) \; \forall r \in [0, 1) \; \forall x \in [\delta, 2\pi-\delta] \quad
r \ge \rho \implies P_r(x) \le \varepsilon
$$
{: .proposition}

我们重点证明最后一个命题。
设$r \in \[\frac{1}{2}, 1)$，有：
$$
1 - 2r \cos x + r^2 = (1-r)^2 + 2r(1-\cos x) \ge 1 - \cos x
$$
从而有：
$$
\forall x \in [\delta, \pi] \quad 0 \le P_r(x) \le \frac{1-r^2}{1-\cos \delta} \le \frac{2(1-r)}{1-\cos \delta}
$$
设$\rho = 1 - \frac{1}{2} \min (\varepsilon(1-\cos\delta), 1)$，有：
$$
\forall r \in [\rho, 1) \quad \forall x \in [\delta, \pi] \quad 0 \le P_r(x) \le \varepsilon
$$
{: .proof}

这个函数关于$r$在几乎任何闭区间上收敛至零函数，但是其积分始终为一固定常数。
这一独特性质允许我们利用它来证明下述定理。

设$f \in \mathcal C (\TT)$，$f$的傅里叶级数阿贝尔收敛至$f$，且该收敛是一致收敛，即：
$$
\forall \varepsilon > 0 \quad \exists \rho \in [0,1) \quad r \in [0, 1) \quad r \in \RR \quad
r \ge \rho \implies \left| A_r(f)(x) - f(x) \right| \le \varepsilon
$$
{: .proposition}

$$
A_r (f)(x) - f(x) = \frac{1}{2\pi} \int_0^{2\pi} P_r(t) f(x-t) \d t - f(x) = \frac{1}{2\pi} \int_0^{2\pi} P_r(t) (f(x-t)-f(x)) \d t
$$
我们知道，$g(t) = f(x-t)-f(x)$在$[0, 2\pi]$这一紧密集上连续，从而一致连续，
因此对任何$x \in \RR, \delta > 0$，总存在一个$\varepsilon$，满足$\forall t \in \[x - \delta, x+\delta\], \left\| f(x-t) - f(x) \right\| \le \varepsilon$。
我们可以把$[0, 2\pi]$上的积分利用$\delta$拆成两个部分：
$$
\begin{aligned}
\left| A_r(f)(x) - f(x) \right|
&\le \frac{1}{2\pi} \int_0^{2\pi} P_r(t) \left| f(x-t)-f(x) \right| \d t \\
&= \frac{1}{2\pi} \int_{-\delta}^{\delta} P_r(t) \left| f(x-t)-f(x) \right| \d t +
\frac{1}{2\pi} \int_{\delta}^{2\pi - \delta} P_r(t) \left| f(x-t)-f(x) \right| \d t \\
&\le \varepsilon \frac{1}{2\pi} \int_{-\delta}^{\delta} P_r(t) \d t + \frac{2 \sup |f|}{2 \pi} \int_{\delta}^{2\pi-\delta} P_r(t) \d t
\end{aligned}
$$
我们记$M = \sup\|f\|$。
又考虑到$P_r(t) > 0$，从而其在一个长度小于$2\pi$的区间上，积分一定小于$2\pi$，因此有：
$$
\left| A_r(f)(x) - f(x) \right|
\le \varepsilon + 2M \frac{1}{2\pi}\int_{\delta}^{2\pi-\delta} P_r(t) \d t
$$
我们再利用$P_r(t)$在任意闭区间$\[\delta, 2\pi - \delta\]$上一致收敛至零的结论，取$\rho$使$P_r(x) \le \varepsilon$。
根据一致收敛的定义，$\rho$一定存在。从而我们证明了：
$$
\left| A_r(f)(x) - f(x) \right|
\le 2 \varepsilon
$$
这和原命题等价。
{: .proof}

利用这个定理，我们可以证明维尔斯特拉斯逼近的三角多项式形式：

设$f \in \mathcal C(\TT)$，对所有$\varepsilon > 0$，都存在三角多项式$\Phi \in P(\TT)$，使：
$$
\left\Vert f - \Phi \right\Vert_\infty = \sup \left| f - \Phi \right| < \varepsilon
$$
{: .proposition}

由一致收敛，对所有$\varepsilon > 0$，都存在$r \in \[0, 1)$，使得：
$$
\forall x \in \RR \quad \left| A_r(f)(x) - f(x) \right| < \varepsilon
$$
又有级数
$$
\sum_{n=-\infty}^{\infty} r^{|n|} \hat f (x) e^{inx} = 
\hat f(0) + \sum_{n=1}^{\infty} r^n \left( \hat f (n) e^{inx} + \hat f(-n) e^{-inx} \right)
$$
正规收敛，因为$r < 1$，且$\hat f(n)$有界。
从而此级数一致收敛，因此对足够大的$N$，其部分和与和的差足够小：
$$
\forall x \in \RR \quad
\left| A_r(f)(x) - \sum_{n = -N}^{N}r^{|n|} \hat f(n) e^{inx} \right| < \varepsilon
$$
应用三角不等式即可得证。
{: .proof}
