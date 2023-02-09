---
layout: single
title: "傅里叶级数——基本性质"
categories: analysis
date: 2022-12-02 20:30:00 +0800
--- 

傅里叶级数是数学中一个重要的级数，其可以以三角函数逼近满足一定条件的周期函数。
对傅里叶级数的分析构成数学分析中的一个重要分支——调和分析。

## 绪论

众所周知，傅里叶级数及其相关研究是在周期函数之上进行的。
为此，我们引入一些记号来表示这些函数。

- 我们知道，在$\mathbb R$上模$2\pi$同余是一个等价关系，我们定义$\mathbb T$为这个等价关系定义的等价类的集合。
  + 记$x$的等价类$\tilde x = x + 2 \pi \mathbb R$；
  + 如果要保证映射$\mathbb R \to \mathbb T, x \mapsto \tilde x$为满射，则可自然定义出一个加运算，这个加运算就是同余意义下的加法；
  + 这个集合加上同余意义下的加法运算后构成一个阿贝尔群，且和复数域上的单位圆群$(\mathbb U, \cdot)$同构。
- 记$\mathcal C^k (\mathbb T)$为所有从$\mathbb R$到$\mathbb C$的*周期*为$2 \pi$的*k阶可导且导数连续*的函数的集合。
  + 任何一个属于此集合的函数$f: \mathbb R \to \mathbb C$都和另一个函数$\tilde f : \mathbb T \to \mathbb C$等同。
  + 这个集合是一个$\mathbb C$的向量空间。
- 如果一个分块连续函数满足$\forall x, \, f(x) = \frac{f(x-) + f(x+)}{2}$，则称这个函数是正规化的。
  记正则化的周期为$2 \pi$的从$\mathbb R$到$\mathbb C$的函数为$\mathcal C_m (\mathbb T)$。
  + 这个集合也是$\mathbb C$的向量空间。
- 综合以上记号，我们用$\mathcal C^1_m (\mathbb T)$表示一阶可导且导数分块连续的正规分块连续函数。
  + 我们知道，对分块可导函数，其断点处的值并不影响函数的性质。
    从而，我们要求$f^\prime(x) = \frac{f^\prime(x-) + f^\prime(x+)}{2}$。
{: .definition}

在这些定义的帮助之下，我们可以得出几个和积分有关的显然的性质：

设$f \in \mathcal C_m (\mathbb T)$，则$\forall a \in \mathbb R$有：
$$
\int_a^{a + 2\pi} f = \int_0^{2\pi} f
$$
设$f,g \in \mathcal C (\mathbb T) \cap \mathcal C_m^1 (\mathbb T)$（即函数连续，导函数分块连续），则分部积分法仍成立：
$$
\int_0^{2\pi} f^\prime \cdot g = \left. f \cdot g \right|_0^{2\pi} - \int_0^{2\pi} f \cdot g^\prime
$$

## 傅里叶系数与傅里叶级数

为方便下面的研究，我们定义几个简单的函数：
$$
\begin{aligned}
e_n &: \; \mathbb R \to \mathbb C, \; x \mapsto e^{inx} \\
cos_n &: \; \mathbb R \to \mathbb C, \; x \mapsto \cos (nx) \\
sin_n &: \; \mathbb R \to \mathbb C, \; x \mapsto \sin (nx) \\
\end{aligned}
$$
这些函数都是$\mathcal C (\mathbb T)$中的光滑函数。

我们定义三角多项式为由 $(e\_n)\_{n \in \mathbb Z}$ 张成的向量空间$\mathcal P (\mathbb T)$中的元素。
我们称一个多项式的次数小于等于$n$，若其能表示为$(e\_k)\_{-n \le k \le n}$的线性组合，即其可写为：
$$
\sum_{k = -n}^{n} c_k e_k
$$
记次数小于等于n的三角多项式集合为$\mathcal P\_n (\mathbb T)$。
{: .definition}

向量空间$\mathcal P\_n (\mathbb T)$的维数为$2n+1$，其有两个基底：
$(e\_{-n},e\_{-n+1},\dots,e\_{0}, \dots, e\_{n})$和
$(\frac{1}{2}, \cos, \sin, \cos\_2, \sin\_2, \dots, \cos\_n, \sin\_n)$

我们利用正交性证明这个定理：
$$
\int_0^{2\pi} e_k e_l = \delta_{k, l} 2 \pi
$$
有：
$$
\begin{aligned}
c_{-n} e_{-n} + \cdots + c_n e_n &= 0 \\
c_{-n} e_{-n} e_k + \cdots + c_k e_k e_k + \cdots + c_n e_n e_k &= 0 \\
\int_0^{2\pi} c_{-n} e_{-n} e_k + \cdots + c_k e_k e_k + \cdots + c_n e_n e_k &= 0 \\
2 \pi c_k &= 0 \\
c_k &= 0 \quad \forall k = -n, \dots, n
\end{aligned}
$$
因此，我们证明了$(e\_{-n},e\_{-n+1},\dots,e\_{0}, \dots, e\_{n})$是其一个基底。
我们已经知道$(e\_{-n},e\_{-n+1},\dots,e\_{0}, \dots, e\_{n})$是其一个基底，利用欧拉公式把所有的$e^{inx}$展开，即有：
$$
\phi = \sum_{k=-n}^{n} c_k e_k = \frac{a_0}{2} + \sum_{k=1}^{n} (a_k \cos_k + b_k \sin_k)
$$
其中，如果假设$a_{-n}=a_n, \; b_{-n} = -b_n$，则有：
$$
\left\{
\begin{aligned}
a_n &= c_n + c_{-n} \\
b_n &= i (c_n - c_{-n}) \\
c_n &= \frac{1}{2} (a_n - i b_n)
\end{aligned}
\right.
$$
{: .proof}

上述证明中给出了两种表示三角多项式的方法，并给出了其系数的转化关系。
不难发现，第二种表示方式和级数的部分和极其相似，从而我们定义三角级数：

我们称形如：
$$
\frac{a_0}{2} + \sum_{n=1}^{\infty} (a_n \cos_n x + b_n \sin_n x)
$$
的函数级数为**三角级数**。
其部分和为：
$$
f_n(x) = \frac{a_0}{2} + \sum_{k=1}^{n} (a_k \cos_k x + b_k \sin_k x)
$$
{: .definition}

这个级数也可以写成指数函数的形式：
$$
\frac{a_0}{2} + \sum_{n=1}^{\infty} (a_n \cos_n+ b_n \sin_n) = \sum_{k = -\infty}^{\infty} c_k e_k
$$

---

完成这些初步的定义后，我们就可以研究和函数有关的傅里叶级数了。

对分段连续函数$f \in \mathcal C_m{\mathbb T}$，我们定义其**傅里叶系数**为：
$$
\begin{aligned}
a_n(f) &= \frac{1}{\pi} \int_0^{2\pi} f(x) \cos(nx) \mathrm d x \\
b_n(f) &= \frac{1}{\pi} \int_0^{2\pi} f(x) \sin(nx) \mathrm d x \\
c_n(f) &= \frac{1}{2\pi} \int_0^{2\pi} f(x) e^{-inx} \mathrm d x
\end{aligned}
$$
相应地，其**傅里叶级数**为这些系数组成的三角级数：
$$
\sum_{n = -\infty}^{\infty} c_n(f) e^{inx} = 
\frac{a_0}{2}(f) + \sum_{n=1}^{\infty} (a_n (f) \cos_n x + b_n (f) \sin_n x)
$$
如果假设$a_{-n}=a_n, \; b_{-n} = -b_n$，则仍满足以下关系：
$$
\left\{
\begin{aligned}
a_n &= c_n + c_{-n} \\
b_n &= i (c_n - c_{-n}) \\
c_n &= \frac{1}{2} (a_n - i b_n)
\end{aligned}
\right.
$$
{: .definition}

注意积分里的指数函数有负号，而级数里的没有。

这个级数的部分和记为：
$$
\begin{aligned}
S_n(f)(x) 
&= \frac{a_0}{2}(f) + \sum_{k=1}^{n} (a_k (f) \cos_k x + b_k (f) \sin_k x) \\
&= \sum_{k = -n}^{n} c_k(f) e^{ikx}
\end{aligned}
$$

### 傅里叶系数的性质

我们记$\hat f : \; \mathbb Z \to \mathbb C, \; n \mapsto c_n(f)$，
则映射$\mathcal C_m (\mathbb T) \to \mathbb C^{\mathbb Z}, \; f \mapsto \hat f$是线性的，且满足
$$
\forall f \in \mathcal C_m (\mathbb T) \quad \sup_{\mathbb Z} \left| \hat f \right| 
\le \frac{1}{2\pi} \int_0^{2\pi} \left| f \right| 
\le \sup_{\mathbb R} \left| f \right|
$$
这说明傅里叶系数的$c_n$上确界不能超过函数绝对值的上确界。
这一命题可直接由定义验证。

---

如果对函数施加一些变换，那么其傅里叶系数也会发生类似的变换。
这一性质可由以下命题描述：

- 设$x_0 \in \mathbb R$，且$g(x) = f(x - x_0)$，则$\hat g(n) = e^{-inx_0} \hat f(n)$；
- 设$n_0 \in \mathbb Z$，且$g(x) = e^{in_0x} f(x)$，则$\hat g(n) = \hat f (n - n_0)$；
- 设$g(x) = f(-x)$，则$\hat g(n) = \hat f(-n)$；
- 设$g(x) = \overline {f(x)}$，则$\hat g(n) = \overline{\hat f(-n)}$。
{: .proposition}

这些命题都很容易由定义验证。
{: .proof}

注意第一条和第二条与拉普拉斯变换高度相似。

第三条性质表明，偶函数的傅里叶系数也是偶函数，从而$b_n = i(c_n - c_{-n}) = 0$，其傅里叶级数只含有$a_n$；
同理，若该函数为奇函数，则傅里叶级数中只含有$b_n$。

由第四条性质，若原函数是实值函数，则$c_n$与$c_{-n}$共轭，且$a_n$与$b_n$都是实数。

---

对求导运算，有以下命题：

设$f \in \mathcal C (\mathbb T) \cap \mathcal C_m^1 (\mathbb T)$，则有$\hat {f^\prime} (n) = in \hat f(n)$。
{: .proposition}

对$c_n(f^\prime)$分部积分即可验证。
{: .proof}

同理，设$f \in \mathcal C (\mathbb T) \cap \mathcal C_m^p (\mathbb T)$，则有$\hat {f^{(p)}} (n) = (in)^p \hat f(n)$。

这一性质也和拉普拉斯变换非常相似。

--- 

对任意周期的函数，可以类比定义各自的傅里叶系数。
设$f: \; \mathbb R \to \mathbb C$为周期为$T$的分块连续正规函数，则可定义$g \in \mathcal C_m (\mathbb T), \; g(x) = f(\frac{T}{2\pi} x)$，通过$g$的傅里叶系数来定义$f$的：
$$
\forall n \in \mathbb Z \quad
c_n^T(f) = c_n(g) =
\frac{1}{2\pi} \int_0^{2\pi} g(x) e^{-inx} \mathrm d x =
\frac{1}{T} \int_0^T f(t) e^{-\frac{2\pi}{T} i n t} \mathrm d t
$$
从而其傅里叶级数为：
$$
\sum_{n=-\infty}^{\infty} c_n^T(f) e^{\frac{2\pi}{T} inx}
$$

特别地，$T = 1$时，其傅里叶级数为
$$
\sum_{n=-\infty}^{\infty} c_n^1(f) e^{\frac{2\pi}{T} inx} =
\frac{a_0^1(f)}{2} + \sum_{n=1}^{\infty}(a_n^1(f) \cos 2\pi nx + b_n^1(f) \sin 2\pi nx)
$$

