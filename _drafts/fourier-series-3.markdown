---
layout: post
title: "傅里叶级数——均方收敛"
categories: analysis
---

$$
\newcommand{d}{\mathrm{d}}
\newcommand{TT}{\mathbb{T}}
\newcommand{ZZ}{\mathbb{Z}}
\newcommand{CC}{\mathbb{C}}
\newcommand{RR}{\mathbb{R}}
\newcommand{NN}{\mathbb{N}}
\newcommand{cC}{\mathcal{C}}
\newcommand{ccmtt}{\cC_{m}(\TT)}
\newcommand{cctt}{\cC(\TT)}
\newcommand\inner[2]{\left( #1 \middle\vert #2 \right)}
\newcommand{intperiod}{\int_0^{2\pi}}
$$

在研究傅里叶级数的均方收敛之前，我们为此前提到的$\ccmtt$空间附加一个内积运算，使其变成内积空间：
$$
f,g \in \ccmtt, \; \inner{f}{g} = \frac{1}{2\pi} \intperiod \overline f g
$$

回忆一下，内积变换必须满足：
- $\forall x, \; \inner{x}{\cdot}$为线性变换；
- $\forall x, y \; \inner{y}{x} = \overline{\inner{x}{y}}$；
- $\forall x \neq 0 \; \inner{x}{x} > 0$。
可以一一验证我们定义的内积满足以上三条公理。

这三条公理可以导出一个重要关系，即$\inner{x}{\cdot}$为线性的，而$\inner{\cdot}{x}$为半线性的。
所谓半线性，即$\inner{x+x^\prime}{y} = \inner{x}{y} + \inner{x^\prime}{y}$且$\inner{\lambda x}{y} = \overline \lambda \inner{x}{y}$。
在这个定义下，我们可以诱导出以下范数：
$$
\newcommand\normas[1]{\left\Vert #1 \right\Vert_2}
f \in \ccmtt, \; \normas{f} = \sqrt{\inner{f}{f}} = \left( \frac{1}{2\pi} \intperiod \left| f \right|^2 \right)^{\frac{1}{2}}
$$
这个范数称为均方收敛范数。在这个范数含义下的收敛叫做均方收敛。

不难发现，在这个内积和范数的定义下，$(e\_k)\_{k=-n, \dots, 0, \dots , n}$是n次三角多项式空间$\mathcal P\_n(\TT)$的一组标准正交基底。
更一般地，$(e\_k)\_{k \in \ZZ}$是三角多项式空间$\mathcal P(\TT)$的（无限维）标准正交基底。
这组基底满足 [希尔伯特基底](https://mathworld.wolfram.com/HilbertBasis.html) 的定义。

## 均方收敛

根据上文关于内积的定义，不难发现傅里叶系数可以写成内积的形式：
$$
\begin{aligned}
\hat f (n) &= \frac{1}{2\pi} \intperiod e^{-inx} f(x) \d x = \inner{e_n}{f} \\
S_n(f) &= \sum_{k=-n}^n \inner{e_i}{f} e_i
\end{aligned}
$$

更进一步地，简单计算可以发现$S_n(S_n(f)) = S_n(f)$，这说明$S_n$满足投影变换的形式，其像空间为三角多项式空间$\mathcal P(\TT)$。

对所有$f \in \ccmtt$，对所有$\phi \in \mathcal P_n (\TT)$，$\inner{f - S_n(f)}{\phi} = 0$。
{: .proposition}

$$
\begin{aligned}
\forall k = -n, \dots, 0, \dots, n \\
\inner{f - S_n(f)}{e_k} &= \inner{f}{e_k} - \inner{S_n(f)}{e_k} \\
&= \inner{f}{e_k} - \inner{\sum_{i=-n}^n \inner{e_i}{f} e_i}{e_k} \\
&= \inner{f}{e_k} - \sum_{i=-n}^n \inner{\inner{e_i}{f} e_i}{e_k} \\
&= \inner{f}{e_k} - \sum_{i=-n}^n \overline{\inner{e_i}{f}} \inner{e_i}{e_k} \\
&= \inner{f}{e_k} - \overline{\inner{e_k}{f}} = 0
\end{aligned}
$$
{: .proof}

这说明对所有函数$f$，$f-S_n(f)$“垂直于”三角多项式构成的“平面”，如下图所示。

![](/assets/perpendicular.svg)
{: .center-image}

类比于勾股定理，我们有：
$$
\left\Vert f - \phi \right\Vert_2^2 = \left\Vert f - S_n(f) \right\Vert_2^2 + \left\Vert S_n(f) - \phi \right\Vert_2^2
\implies
\left\Vert f - \phi \right\Vert_2 \ge \left\Vert f - S_n(f) \right\Vert_2
$$
这说明$S_n(f)$是在均方收敛范数意义下由三角多项式对原函数的最佳估计。

通过取$\phi = 0$，可得以下定理：

设$f \in \ccmtt$，数列$\left(\hat f(n)\right)_{n \in \ZZ}$平方可和，且满足：
$$
\sum_{n=-\infty}^{\infty} \left| \hat f(n) \right|^2 \le \frac{1}{2\pi} \intperiod \left| f(x) \right|^2 \d x
$$
这个不等式称为**贝塞尔不等式**。
{: .proposition}

取$\phi = 0$，可得$\normas{S_n(f)}^2 \le \normas{f}^2$。
又有
$$
\normas{S_n(f)}^2 = 
\inner{\sum_{k=-n}^n \hat f(k) e_k}{\sum_{l=-n}^n \hat f(l) e_k} = 
\sum_{1 \le k,l \le n} \overline{\hat f(k)} \hat f(l) \inner{e_k}{e_l} =
\sum_{k=-n}^n \left| \hat f(k) \right|^2
$$
从而命题得证。
{: .proof}

为了证明下面的定理，我们先证明一个引理：

三角多项式空间$\mathcal P (\TT)$在$\ccmtt$空间中是稠密的。
{: .proposition}

根据维尔斯特拉斯逼近定理的三角多项式形式，我们知道$\mathcal P (\TT)$空间在$\cctt$空间中在$\Vert \cdot \Vert_\infty$范数下是稠密的：
$$
\forall f \in \ccmtt ,\; \exists (\phi_n) \subset \mathcal P (\TT) ,\; \lim \Vert f - \phi_n \Vert_\infty = 0
$$
又简单计算可以验证：$\Vert f-\phi_n \Vert_2 \le \Vert f-\phi_n \Vert_\infty$，从而在均方收敛范数下也是稠密的。
接下来仅需验证$\cctt$空间在$\ccmtt$空间中是稠密的即可。
设$f \in \ccmtt$，其在划分$x_1, x_2, \dots, x_n$上分块连续。
构造以下函数$g_\delta$：
$$
g_\delta(x) =
\left\{
\begin{aligned}
& f(x) & x_{i-1} + \delta \le x \le x_i - \delta \\
& \frac{(x_i + \delta) - x}{2\delta} f(x_i - \delta) + \frac{x - (x_i - \delta)}{2\delta} f(x_i + \delta) 
& x_i - \delta < x < x_i + \delta
\end{aligned}
\right.
$$
这个函数相当于在每个连续的区间端点上用线段把两段函数值接起来。
计算可知这两个函数$f,g_\delta$之间的距离$\normas{f-g_\delta}$可任意小，从而$\cctt$空间在$\ccmtt$空间中是稠密的。
{: .proof}

利用上一命题可证明以下定理：

所有函数$f \in \ccmtt$的傅里叶级数在$L^2$意义下收敛（均方收敛）至原函数，即：
$$
\lim_{n \to \infty} \normas{f - S_n(f)} = 0
$$
{: .theorem}

均方收敛比一致收敛更弱。

设$\varepsilon > 0$，由引理可知，必然存在三角多项式$\phi \in \mathcal P(\TT)$，满足$\normas{f - \phi} < \varepsilon$。
设该三角多项式的次数为$n_0$，那么：
$$
\forall n \ge n_0 ,\; \phi \in \mathcal P_n(\TT)
\implies
\normas{f - S_n(f)} \le \normas{f - \phi} < \varepsilon
$$
{: .proof}

这一定理可导出以下等式：

对所有函数$f \in \ccmtt$，都有：
$$
\sum_{n \in \ZZ} \left| \hat f(n) \right|^2 = \frac{1}{2\pi} \intperiod \left| f(x) \right|^2 \d x
$$
这个等式称为**帕塞瓦尔恒等式**。
{: .proposition}

实际上，在更一般的希尔伯特空间中，帕塞瓦尔等式是贝塞尔不等式的特殊情况，是其在在内积空间完备且具有标准完全正交基下的特例。

继续使用勾股定理：
$$
\lim_{n \to \infty} \left( \normas{f} - \sum_{k=-n}^n \left| \hat f(k) \right|^2 \right) =
\lim_{n \to \infty} \left( \normas{f} - \normas{S_n(f)} \right) =
\lim_{n \to \infty} \left( \normas{f - S_n(f)} \right) = 0
$$
{: .proof}
