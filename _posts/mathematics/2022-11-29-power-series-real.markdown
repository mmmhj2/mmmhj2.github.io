---
layout: single
title: "实数域下的幂级数"
categories: analysis
date: 2022-11-29 23:30:00 +0800
--- 

接下来，我们研究把幂级数的研究限制在实数域上。

## 泰勒级数

此节中我们假设$I$为实数域上一个非空非单点区间。
{: .remark}

我们此前在复数域上已经说明了，在收敛圆盘$D(0,R)$内的一个紧密子集内，函数级数正规收敛。
从而我们知道，在实数域内，在开区间$(-R, R)$的任何一个子闭区间上，其也正规收敛。

我们假设有一收敛半径为$R \neq 0$的幂级数$\sum a_n x^n$，且$f$为其在$(-R, R)$上的和。
则$f$是无穷阶可导（光滑）的，且其导数可写为：
$$
\begin{aligned}
\forall k \in \mathbb N^* \quad \forall x \in (-R, R) \quad
f^{(k)}(x) &= \sum_{n=k}^{\infty} a_n n (n-1) (n-2) \cdots (n-k+1) x^{n-k} \\
\iff
\frac{f^{(k)}(x)}{k!} &= \sum_{n=k}^{\infty} a_n \binom{n}{k} x^{n-k}
\end{aligned}
$$
同理，$f$在$(-R, R)$上的积分为：
$$
F(x) = \int_0^x f(t) \mathrm d t = \sum_{n=0}^{\infty} \frac{a_n}{n+1} x^{n+1}
$$

类比复数域上可展开成幂级数的定义，我们给出实数域上的对应定义：

设$f: I \to \mathbb C$，$a$为$I$上一点。
我们称$f$是可在$x_0$处展开为幂级数的，若存在一个严格大于零的实数$r$
和一个收敛半径为$r$的幂级数$\sum a_n x^n$满足：
$$
\forall x \in (x_0 - r, x_0 + r) \cap I \quad f(x) = \sum_{n=0}^{\infty} a_n (x - x_0)^n
$$
如果$(x_0 \- r, x_0 \+ r) \subset I$，则进一步称其在整个区间上可展开。
{: .definition}

某个函数可展开为幂级数是比光滑更强的条件：
如果该函数可展开称幂级数，则其一定在此点光滑，并且其幂级数的系数可由以下命题确定。

设$f: I \to \mathbb C$可在$x_0$展开为幂级数，则$f$在$x_0$的一个邻域内光滑，且展开成的幂级数唯一确定：
$$
f(x) = \sum_{n=0}^{\infty}\frac{f^{(n)}(x_0)}{n!} (x - x_0)^n
$$
{: .proposition}

我们回忆一下泰勒级数的定义：

若函数$f: I \to \mathbb C$光滑，且$x_0 \in I$，则关于$x - x_0$的幂级数
$$
f(x) = \sum \frac{f^{(n)}(x_0)}{n!} (x - x_0)^n
$$
称为$f$在$x_0$点的**泰勒级数**。
{: .definition}

可以看出，如果函数可以幂级数展开，则其展开一定和泰勒级数相等。
但是，反之，一个函数可以写成泰勒级数的展开，并不表示其一定可以幂级数展开。
考虑以下反例：

$$
f(x) = \left\{
\begin{aligned}
&0 &\quad x = 0 \\
&e^{-\frac{1}{x^2}} &\quad  x \neq 0
\end{aligned}
\right.
$$
该函数在零点的泰勒级数为0，但是在此点不存在幂级数展开。
因为如果存在，则幂级数展开一定为0，但是在邻域内函数的值并不为零。
{: .exampl}

出现这一现象的根本原因在于：泰勒展开只是函数值的逼近，而幂级数是准确的函数值。

## 常见函数的幂级数展开

$$
\forall x \in \mathbb R \quad 
e^{cx} = \sum \frac{c^n}{n!} x^n
$$

这可由柯西问题：
$$
\left\{
\begin{aligned}
y^\prime &= cy \\
y(0) &= 1
\end{aligned}
\right.
$$
的级数解导出。
{: .proof}

从而有以下推论：$\forall x \in \mathbb R$
$$
\cosh(x) = \sum \frac{x^{2n}}{(2n)!} \quad
\sinh(x) = \sum \frac{x^{2n+1}}{(2n+1)!}
$$
$$
\cos(x) = \sum (-1)^n \frac{x^{2n}}{(2n)!} \quad
\sin(x) = \sum (-1)^n \frac{x^{2n+1}}{(2n+1)!} 
$$

对于对数，还有：
$$
\forall x \in (-1, 1] \quad \ln(1+x) = \sum_{n=1}^{\infty} (-1)^{n-1} \frac{x^n}{n}
$$
$$
\forall x \in [-1, 1) \quad \ln \frac{1}{1-x} = \sum_{n=1}^{\infty} \frac{x^n}{n}
$$

---

对于多项式型函数，有：
$$
\forall x \in (-1, 1) \quad
(1+x)^s = \sum_{n=0}^{\infty} \binom{s}{n} x^n
$$
这一定理也叫做广义二项式定理，其中$\binom{s}{n}$为广义二项式系数，$n=0$时值为1，否则为$\frac{s(s-1) \cdots (s-n+1)}{n!}$。

这可由柯西问题：
$$
\left\{
\begin{aligned}
y^\prime &= \frac{s}{1+x} y \\
y(0) &= 1
\end{aligned}
\right.
$$
的级数解导出。
{: .proof}

---

利用积分、求导等运算，我们还能给出以下幂级数展开：$\forall x \in \[-1,1\]$
$$
\begin{aligned}
\arctan(x) 
&= \sum_{n=0}^{\infty} (-1)^n \frac{x^{2n+1}}{2n+1} \\
\arcsin(x) 
&= \sum_{n=0}^{\infty} (-1)^n \binom{-1/2}{n} \frac{x^{2n+1}}{2n+1} \\
&= x \sum_{n=0}^{\infty} \frac{1}{2n+1} \binom{2n}{n} \left( \frac{x}{2} \right)^{2n}  
\end{aligned}
$$

我们注意到$ \arcsin^\prime(x) = \frac{1}{\sqrt{1-x^2}}$、$\arctan^\prime(x) = (1+x^2)^{-1}$。
对其导数使用多项式公式然后积分即可。
{: .proof}

$$
\mathrm{arcsinh}(x) = x \sum_{n=0}^{\infty} \frac{(-1)^n}{2n+1} \binom{2n}{n} \left( \frac{x}{2} \right)^{2n} 
$$

注意到$\mathrm{arcsinh}^\prime(x) = \[\ln(x + \sqrt{1+x^2})\]^\prime = \frac{1}{\sqrt{1+x^2}}$。
利用多项式公式然后积分即可。
{: .proof}

$$
\mathrm{arctanh}(x) = \sum_{n=0}^{\infty} \frac{x^{2n+1}}{2n+1}
$$

我们知道$\mathrm{arctanh}(x) = \frac{1}{2} \ln \frac{1+x}{1-x} = \frac{1}{2} (\ln (1+x) - \ln (1-x))$。
因此其幂级数恰好为$\ln (1+x)$的奇函数部分。
{: .proof}
