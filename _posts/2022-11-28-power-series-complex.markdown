---
layout: post
title: "复数域下的幂级数"
categories: analysis
date: 2022-11-28 13:20:00 +0800
--- 

此文中，我们定义复数域下的开圆盘$D$和闭圆盘$\overline{D}$：
$$
D(z_0,r) = \{ z \in \mathbb C | \left| z - z_0 \right| < r \},
\overline{D}(z_0, r) = \{ z \in \mathbb C | \left| z - z_0 \right| \leq r \}
$$

首先，我们给出幂级数的定义，再研究其性质。

将所有形如$\sum a_n z^n$的级数称为**幂级数**。
其中$(a_n)_{n \in \mathbb N} \in \mathbb C^N$称为幂级数的**系数**
{: .definition}

## 收敛半径

定义幂级数的收敛半径：

设$R \in \mathbb R_+ \cup \\{ +\infty \\}$，若对于幂级数$\sum a_n z^n$满足：
$$
R = \mathrm{sup} \{ r \in R_+ | \exists M > 0, \forall n, \left| a_n \right| r^n \leq M \}
$$
则称$R$为该幂级数的**收敛半径**。
圆盘$D(0, R)$称为该幂级数的收敛盘。
{: .definition}

即收敛半径是使级数的每一项都有界的实数的上确界。

若两个幂级数满足$a_n = O(b_n)$，则$R_a \ge R_b$；若满足$a_n \sim b_n$，则$R_a = R_b$。

这个数之所以被称作收敛半径，是因为以下重要性质：

若$z < R$，则该级数绝对收敛；若$z > R$，则该级数极大发散；若$z = R$，则该级数可能收敛，可能发散。
{: .proposition}

对收敛半径还有以下性质：

级数$\sum a_n z^n$在$D(0,R)$中的任何一个紧密集上正常连续（$\left\| a_n z^n \right\| \leq c_n, \sum c_n < \infty$），从而一致连续。
{: .proposition}

可以推知：$f(z) = \sum u_n = \sum a_n z^n$在$D(0, R)$上连续。
注意$D(0,R)$并不是紧密的，因此$f(z)$并不一定在其上有界。
实际上，若$f(z)$在$D(0,a)$上连续但是无界，那么$a$一定是其收敛半径。

我们假设$1 / 0 = \infty$，$1 / \infty = 0$，从而达朗贝尔审敛法也可应用在求收敛半径上。

设$\sum a_n z^n$为一自某项起非零的幂级数，则其收敛半径可由以下方式求得：
$$
l = \lim_{n \to \infty} \frac{|a_n+1|}{|a_n|}
$$
若$l$存在，则收敛半径$R = 1/l$
{: .proposition}

此外，幂级数的收敛半径还有以下性质：
- 两幂级数各项分别相加，新幂级数的收敛半径大于等于两者中较小的；
  + 特别地，若两级数的收敛半径不同，新幂级数的收敛半径等于两者中较小的；
- 两幂级数的柯西积（卷积）的收敛半径大于等于两者中较小的；
- 幂级数的导数列$\sum n a_n z^{n-1}$的收敛半径等于原数列的。

假设一幂级数的收敛半径非零，则根据在零的邻域之内其和$f(z)$的值，可以计算出整个幂级数的系数。
$$
\forall r \in (0, R), a_n = \frac{1}{2 \pi r^n} \int_0^{2\pi} f(r e^{i \theta}) e^{-in\theta} \mathrm d \theta
$$
这可导出以下性质：若幂级数的收敛半径非零，且其和$f(z)$在一个含零的开集内取值为零，则其各项系数一定为零，$f(z) = 0$。

## 常见函数的幂级数表示

为研究函数的幂级数表示，我们首先需要知道哪些函数可以写成幂级数的形式，为此，我们定义：

设一定义在开集$U \in \mathbb C$的复值函数$f$和其定义域内一点$z_0$。
若存在一实数$r > 0$和一收敛半径大于等于$r$的幂级数$\sum a_n z^n$满足：
$$
\forall z \in D(z_0, r) \cup U, f(z) = \sum_{n=0}^{\infty} a_n (z-z_0)^n
$$
则称$f$是在$z_0$处可幂级数展开的。
{: .definition}

可以看出，这个展开的形式和泰勒展开比较相似。
实际上，我们可以证明（在实数域上）如果存在幂级数展开，则泰勒展开一定和幂级数展开相同，但泰勒展开不一定和幂级数展开相同。

根据上一节末尾所讲的内容，函数的幂级数展开（如果存在）是唯一确定的。

特别地，设$D=D(z_0, r) \in \mathbb C, r > 0$，则在$D$上可幂级数展开的函数构成了复数域上连续函数代数的一个子代数。

下面给出一些常见函数的幂级数展开：
$$
\begin{aligned}
e^z &= \sum_0^\infty \frac{z^n}{n!} \\
\cosh (z) &= \frac{1}{2} (e^z + e^{-z}) = \sum_0^\infty \frac{z^{2n}}{(2n)!} \\
\sinh (z) &= \frac{1}{2} (e^z - e^{-z}) = \sum_0^\infty \frac{z^{2n+1}}{(2n+1)!} \\
\cos (z) &= \frac{1}{2} (e^{iz} + e^{-iz}) = \sum_0^\infty (-1)^n \frac{z^{2n}}{(2n)!} \\
\sin (z) &= \frac{1}{2} (e^{iz} + e^{-iz}) = \sum_0^\infty (-1)^n \frac{z^{2n+1}}{(2n+1)!} \\
\end{aligned}
$$
有：
$$
\cosh iz = \cos z , \sinh iz = i \sin z , \cos iz = \cosh z , \sin iz = i \sinh z
$$

对分式型函数，有：
$$
\forall z \in D(0,1) \quad \frac{1}{(1-z)^{n+1}} = \sum_{k=0}^\infty
\binom {n+k}{k}
z^k
$$

## 例子

我们考虑几个经典幂级数的收敛半径的计算问题。

### 利用级数方法求解

我们可以固定幂级数的变元$z$，然后用级数中常用的达朗贝尔审敛（比值审敛）和柯西审敛（根值审敛）法来判断幂级数的收敛半径。

求$\sum \binom{2n}{n} z^{3n}$的收敛半径：
$$
\frac{\binom{2n+2}{n+1} |z|^{3n+3}}{\binom{2n}{n} |z|^{3n}} = \frac{(2n+2)(2n+1)}{(n+1)^2} |z|^3 \to 4|z|^3
$$
$4\|z\|^3 < 1$时，级数绝对收敛；$4\|z\|^3 > 1$时，级数极大发散。从而其收敛半径等于$\frac{1}{4^{1/3}}$
{: .exampl}

### 利用幂级数的运算求解

求$\sum (3 + (-1)^n)^n z^n$的收敛半径：
我们把此幂级数按奇数项和偶数项分为两个级数：
$$
\sum (3 + (-1)^n)^n z^n = 1 + (4z)^2 + (4z)^4 + \dots + (2z) + (2z)^3 + (2z)^5 + \dots
$$
其中，前一个级数的收敛半径为$\frac{1}{4}$，后一个级数的收敛半径为$\frac{1}{2}$，从而整个级数的收敛半径等于其中较小者$\frac{1}{4}$。
{: .exampl}

### 由定义求解

有些时候各种技巧都无用武之地，我们只能考虑用定义求解。

设$a_n$表示$\sqrt{2}$的小数部分第n位，试求幂级数$\sum a_n z^n$的收敛半径：
当$r \le 1$时，显然$a_n r^n \le 9$，因此级数每一项都有界，从而收敛半径大于等于1。
现在，我们假设$a_n z^n$有界，尝试寻找最大的$r$。
由于$\sqrt{2}$是个无理数，其不可能由无限个零结尾，
因此我们假设$a_{\nu(n)}$为非零数组成的子列。
有$a_{\nu(n)} r^{\nu(n)} \ge r^{\nu(n)}$。
从而只有$r \le 1$时$a_{\nu(n)} r^{\nu(n)}$才可能有界。
因此其收敛半径为1。
{: .exampl}

### 与其他级数比较

如果已知一个类似级数的收敛半径，则可以将二者比较来求解。

已知$\sum c_n z^n$的收敛半径为$R$，求$\sum n^p c_n z^n$的收敛半径：
设$0 \le r < R$，取$r < r^\prime < R$，则
$$
n^p c_n r^n = \underbrace{n^p (r / r^\prime)^n}_{\to 0} \cdot \underbrace{c_n r^{\prime n}}_{\le M} \to 0
$$
从而$R^\prime \ge R$；
设$0 \le r < R^\prime$，取$r < r^\prime < R^\prime$，则
$$
c_n r^n = \underbrace{n^{-p} (r / r^\prime)^n}_{\to 0} \cdot \underbrace{n^p c_n r^{\prime n}}_{\le M} \to 0
$$
从而$R \ge R^\prime$，因此$R = R^\prime$
{: .exampl}
