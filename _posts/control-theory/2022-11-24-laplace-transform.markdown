---
layout: single
title: "常用Laplace变换性质"
date: 2022-11-24 20:20:00 +0800
categories:
--- 

## Laplace变换的定义

研究未知的单输入单输出系统时，可以采取把时间分割为小段分别研究的办法。
假设系统的输入为 $e(t)$ ，则有以下等式成立：
$$
\begin{aligned}
e(t) &= T (\delta_T(t) e(0) + \delta_T(t - T) e(t) \cdots) \\
 &= \sum_{k=0}^{\infty} T \delta_T (t - kT) e(kT) \\
 &= \int_0^{\infty} \delta (t - \tau) e(\tau) \mathrm{d} \tau
\end{aligned}
$$

从而，输出可表示为：
$$
s(t) = \int_0^{\infty} h(t-\tau) e(\tau) \mathrm{d} \tau
$$
其中，$h(t)$为对应系统的冲激响应函数，即对狄拉克冲激的响应函数。
注意到我们均假设系统为因果系统，从而$t < 0$时所有函数均为0，积分域也限制在正实数上。

这个积分的形式就是卷积，这启示我们去寻找一个可以简化卷积运算的方法。

对于一般的系统（即在整个实数域上积分，而不是正实数域），我们假设输入信号为:
$$e(t) = \mathrm{exp}(pt) = e^{pt}$$
则输出信号可写为：
$$
\begin{aligned}
s(t) &= \int_{-\infty}^{\infty} h(\tau) ~ e(t-\tau) ~ \mathrm{d} \tau \\
&= \int_{-\infty}^{\infty} h(\tau) ~ \mathrm{exp}(p(t-\tau)) ~ \mathrm{d} \tau \\
&= \int_{-\infty}^{\infty} h(\tau) ~ \mathrm{exp}(p\tau) ~ \mathrm{d} \tau  ~ \mathrm{exp} (pt)
\end{aligned}
$$
可以注意到，积分内部与时间无关而只变量$p$有关，积分外部正好等于$e(t)$，从而将输出拆分成了一个与时间无关的函数乘输入的形式。

我们定义积分号中的函数为被拉普拉斯变换的函数，从而定义以下**拉普拉斯变换**：
$$
\mathcal{L} \left[ f(t) \right](p) = \int_{-\infty}^{\infty} f(t) ~ e^{-p\tau} \mathrm{d} \tau = F(p)
$$
注意到此变换中的积分域位于0的两边，因此这个变换也叫**双边**拉普拉斯变换。

实践中我们几乎总是只研究因果系统，因此$f(t < 0) = 0$。这个积分的左半边可以略去，从而写作
$$
F(p) = \int_{0^-}^{\infty} f(\tau) ~ e^{-p\tau} \mathrm{d} \tau
$$
这是拉普拉斯变换的最常见形式，也是我们接下来要研究的形式。

## Laplace变换的常见性质

### 卷积与传递函数
我们给出卷积的形式化定义：对于两个定义在实数域上的函数$f$、$g$，其卷积为
$$
(f * g)(t) = \int_{-\infty}^{\infty} f(t-\tau) ~ g(t) \mathrm{d} \tau
$$

拉普拉斯变换最重要的性质之一就是其可以实现卷积和乘法的转化，即：
$$
\mathcal{L} [ (f * g)(t) ] = \mathcal{L} [f(t)] \times \mathcal{L} [g(t)]
$$
注意等号左边的乘号为卷积，右边的乘号表示函数的值相乘。
这个性质不难由定义验证。

我们注意到在上一节中，系统的输出已经被转化为冲激响应和输入的卷积，因此有：
$$
S(p) = \mathcal{L} [s(t)] = \mathcal{L} [(h * e)(t)] = \mathcal{L} [h(t)] \times \mathcal{L} [e(t)] = H(p) \times E(p)
$$
从而，我们定义系统的传递函数$H(p)$
$$
H(p) = \frac{S(p)}{E(p)}
$$
注意传递函数是复数域（S-域、复频域）上的函数，而不再是实数域（时域）上的函数。

### 一般性质

拉普拉斯变换是双射的：一个实数域上的连续函数和复数域上的连续函数一一对应。（更严格的说，拉普拉斯变换要求该函数在正实数上可积。）

拉普拉斯变换是线性的：两个函数线性组合的拉普拉斯变换等于其拉普拉斯变换的对应线性组合。


### 微分、积分和平移

对于时域的求导与积分运算，拉普拉斯变换具有如下性质：
$$
\begin{aligned}
\mathcal{L} \left[ \dot f (t) \right]
&= \int_{0^-}^{\infty} \dot f(t) ~ e^{-pt} \mathrm{d} t\\
&= \left. f(t) e^{-pt} \right|_{0^-}^{\infty} + p \int_{0^-}^{\infty} f(t) ~ e^{-pt} \mathrm{d} t\\
&= pF(p) - f(0^-)
\end{aligned}
$$

更一般地，有：
$$
\begin{aligned}
\mathcal{L} \left[ f^{(n)}(t) \right] 
&= p^n F(p) - p^{n-1}f(0^-) - p^{n-2}f^\prime(0^-) - \cdots - f^{(n-1)}(0^-) \\
&= p^n F(p) - \sum_{k=0}^{n-1} p^k f^{(n-k-1)}(0^-)
\end{aligned}
$$

如果系统在0时刻的初值均为0，则有：
$$
\mathcal{L} \left[ f^{(n)}(t) \right] = p^n F(p)
$$

为研究积分运算，我们引入一个新的函数，Heaviside阶跃函数，定义为：
$$
u(t) = \left\{
\begin{aligned}
1 \quad & t \ge 0 \\
0 \quad & t \lt 0
\end{aligned}
\right.
$$
容易验证$\mathcal{L}[u(t)] = \frac{1}{p}$，且有$(f * u)(t) = \int^t_0 f(\tau) \mathrm{d} \tau$。从而：
$$
\begin{aligned}
\mathcal{L} \left[ \int_0^t f(\tau) \mathrm{d} \tau \right]
&= \mathcal{L} [(f * u)(t)] \\
&= \mathcal{L} [f(t)] \times \mathcal{L} [u(t)] \\
&= \frac{F(p)}{p}
\end{aligned}
$$

对于平移，有：
$$
\begin{aligned}
\mathcal{L} [f(t - \tau)] 
&= \int_{0^-}^{\infty} f(t - \tau) e^{-pt} \mathrm{d} t \\
&= \int_{-\tau}^{\infty} f(t) e^{-p(t+\tau)} \mathrm{d} t \\
&= \int_{-\tau}^{0^-} \cdots \mathrm{d} t + \int_{0^-}^{\infty} f(t) e^{-p(t+\tau)} \mathrm{d} t \quad \text{因果系统在小于零处值为零} \\
&= e^{-\tau p} \int_{0^-}^{\infty} f(t) e^{-pt} \mathrm{d} t \\
&= e^{-\tau p} \mathcal{L} [f(t)]
\end{aligned}
$$

在复频域下，也有类似的性质，但证明较为复杂，此处只给出结论。
$$
\begin{aligned}
	F^\prime (p) &= - \mathcal{L} [t \times f(t)] 	\\
	\int_{p}^{\infty} F(u) \mathrm{d} u &= \mathcal{L} \left[ \frac{f(t)}{t} \right] \\
	F(p+a) &= \mathcal{L} \left[ f(t) e^{-at} \right]
\end{aligned}
$$

不难注意到时域和频域下的变换具有高度的对称性。

---

总结：
$$
\begin{aligned} -F^\prime (p) 
&= \mathcal{L} [t \times f(t)] 	\\
\int_{p}^{\infty} F(u) \mathrm{d} u 
&= \mathcal{L} \left[ \frac{f(t)}{t} \right] \\
F(p+a) 
&= \mathcal{L} \left[ f(t) e^{-at} \right] \\
\mathcal{L} \left[ \dot f (t) \right]
&= pF(p) \\ 
\mathcal{L} \left[ \int_0^t f(\tau) \mathrm{d} \tau \right]
&= \frac{F(p)}{p} \\
\mathcal{L} [f(t - \tau)] 
&= e^{-\tau p} \mathcal{L} [f(t)] \\
\end{aligned}
$$

### 极限性质

此处不加证明地给出两个极限处的性质。

$$
\begin{aligned}

\lim_{t \to 0^+} f(t) &= \lim_{p \to +\infty} p F(p) \\
\lim_{t \to +\infty} f(t) &= \lim_{p \to 0} p F(p)

\end{aligned}
$$


## 常见函数的拉普拉斯变换表

| $f(t)$ | $F(p)$ |
|--------|--------|
| $\delta(t)$ | $1$ |
| $u(t)$ | $1/p$ |
| $t u(t) = \mathrm{ReLU}(t)$ | $1/p^2$ |
| $t^n u(t) $ | $n! / p^n$ |
| $e^{-at} u(t) $ | $1 / (p+a)$ |
| $t^n e^{-at} u(t)$ | $n! / (p+a)^{n+1}$ |
| $\cos(\omega t) u(t)$ | $p / (p^2 + \omega^2)$ |
| $\sin(\omega t) u(t)$ | $\omega / (p^2 + \omega^2)$ | 
| $\cosh(\alpha t) u(t)$ | $p / (p^2 - \alpha^2) $ |
| $\sinh(\alpha t) u(t)$ | $\alpha / (p^2 - \alpha^2)$ | 
