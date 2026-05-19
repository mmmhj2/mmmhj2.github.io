---
title: "格林函数与无限大电阻网格"
categories: ['微分方程', '控制理论']
---

本文将利用格林函数法求解一个臭名昭著的电学问题：无限大电阻网格问题。

## 格林函数法

首先介绍一下使用格林函数法（Green's Function method）求解各种微分方程的原理。

考虑某空间$V$上的微分方程：
$$Lu(x) = f(x), \; x \in V$$
其中$L$是*微分算子*。
若我们能够知道某一映射$G$，使其在微分算子的作用下总是得到狄拉克函数（$\delta$），即
$$LG(x, s) = \delta(x - s), \; x, s \in V,$$
那么这个微分方程的解就可通过映射$G$构造出来。
将上式左右同时乘$f$并积分，得到
$$\int LG(x, s) f(x) \; \mathrm d s = \int \delta(x - s) f(x) \; \mathrm d s = (f \star \delta)(x) = f(x).$$
从而
$$Lu(x) = \int LG(x, s) f(x) \; \mathrm d s.$$
利用$L$的线性，将其移出积分外，得到
$$L\left[ u(x) - \int G(x, s) f(x) \; \mathrm d s \right] = 0.$$
尽管$L$很可能具有非平凡的核空间，我们还是一定能找到一个解
$$u_G(x) = \int G(x, s) f(x) \; \mathrm d s.$$
此时，这个函数$G$就称为*格林函数*。
由于微分方程通常具有各种边界条件，因此找到的这个解通常就是唯一的解。

学习过自动控制原理或者信号与系统一类课程的同学可能能够发现，格林函数$G$非常类似微分方程$Lu = f$定义的系统的*冲激响应*。
格林函数法其实就是用冲激响应和卷积来重构系统对任何信号的响应，而要求系统是线性系统其实就是要求微分方程能用微分算符$L$表示出来。
更特别地，若微分算符$L$具有平移不变性，那么系统就是定常的，从而格林函数就能写为卷积核的形式：
$$G(x, s) = G(x - s),$$
此时它**就是**系统的冲激响应。

看起来这个方法非常优雅而易于使用，然而，寻找给定算符的格林函数并非轻而易举。
通常，若微分算符具有完备的特征向量，那么可借助这些特征向量将其转化为代数问题。
此外，我们还可借助傅里叶变换或拉普拉斯变换来求解格林函数，而这些方法均需要大量的计算，甚至还可能遇到非良定义的格林函数。

### 狄拉克函数

非正式地说，狄拉克德尔塔函数定义为
$$
\delta(x) = \begin{cases}
\infty & x = 0 \\
0 & x \neq 0
\end{cases},
\text{ 且 }
\int_{-\infty}^{+\infty} \delta (x) \, \mathrm d x = 1.
$$

显然，数学中并不存在一个这样的函数。
为严谨、形式化地讨论狄拉克函数的性质，必须首先给出其形式化定义。
针对一维空间上的狄拉克函数，有三种主流的定义可以采用。

设$\delta\_n(x)$为一列实函数，若对任何性质良好的函数$f$满足：
$$\lim_{n \to \infty} \int_{-\infty}^{+\infty} \delta_n(x) f(x) \, \mathrm d x = f(0),$$
那么称该函数列为狄拉克函数列，这个函数列的极限成为*狄拉克函数*。
常见的狄拉克函数列包括高斯函数和辛格函数：
$$\delta_{n,\text{gauss}}(x) = \sqrt{\frac{n}{\pi}} \exp(-n x^2), \; \delta_{n,\text{sinc}} = \frac{n}{\pi} \mathrm{sinc}(n \pi).$$
{: .definition}

---

可以发现，狄拉克函数并不能独立出现，而是一定要在其他函数的积分中一同出现。
注意到实函数空间中的内积常常定义为：
$$\langle f, g \rangle = \int_{\mathbb R} f(x) g(x) \, \mathrm d x,$$
这意味着狄拉克函数更像函数的“对偶”，而非函数本身。
我们可以据此给出狄拉克函数的代数定义。

对任何函数，其像非零的集合称为支撑集合。
若某函数$f$是光滑的、且其支撑集合是紧密的，那么该函数可称为*测试函数*（Test function）或*隆起函数*（Bump function）。
这些函数组成的向量空间称为测试函数空间，其上的连续线性泛函（即将测试函数映射为实数的线性函数）称为*分布*（Distribution），也称广义函数。
分布构成的空间（加以合适的拓扑之后）称为分布空间。
{: .definition}

这里我们要求所有分布都是连续的，但分布的连续性的定义依赖于其所处的空间的拓扑，即上文所述的“合适的拓扑”。
这个合适的拓扑称为典范 LF 拓扑（cannonical LF topology），定义过于复杂而不能在此处讲解。
基本上来说，这个拓扑要求分布对函数的变化不能比函数本身的变化快太多。
对实数线上的分布$T$，这相当于要求对每个正整数$N$，均存在常数$C$和$M$，满足
$$\vert T(f) \vert \le C \sum_{i = 0}^M \sup_{x \in [-N, N]} \left\vert \frac{\mathrm d^i}{\mathrm d x^i} f(x) \right\vert.$$

对狄拉克函数，我们定义：
$$\delta(f) = f(0),$$
显然，对任何正整数$N$，取$C = 1, M = 0$，均有
$$f(0) \le \sup_{-N \le x \le N} f(x).$$
因此狄拉克函数确为一个分布。

---

另一种用函数操作积分的方法是测度，因此狄拉克函数也可以通过测度定义。

设$\delta$为实数线上任何σ-代数$\Sigma$（通常是博雷尔σ-代数）的测度，定义为
$$\delta(A) = \begin{cases}
1 & 0 \in A \\
0 & 0 \not \in A
\end{cases},$$
那么$(\mathbb R, \Sigma, \delta)$构成一个测度空间，这个测度称为*狄拉克测度*（Dirac measure）。
这个测度是一个概率测度。
{: .definition}

现在我们可以在这个测度上做勒贝格积分。
对任何勒贝格可积的**非负**函数$f$，根据勒贝格积分的定义之一，有：
$$\int_{\mathbb R} f \, \mathrm d \delta(x) = \int_0^{+\infty} F(t) \, \mathrm d t,$$
其中$F$定义为：
$$F(t) = \delta(\{ x \in \mathbb R : f(x) \ge t \}) = \begin{cases} 1 & f(0) \ge t \\ 0 & f(0) < t \end{cases}.$$
从而
$$\int_{\mathbb R} f \, \mathrm d \delta (x) = \int_0^{f(0)} 1 \, \mathrm d x = f(0).$$
若 $\delta$ 可导，那么必然存在某函数$D$，可将积分写为
$$\int_{\mathbb R} f  \, \mathrm d \delta (x) = \int_{\mathbb R} f D(x) \, \mathrm d x,$$
这里的$D$就是传统意义上的狄拉克函数。
由于$\delta$并非可导，因此这个函数并不存在，这种写法只是一种记号而已。

对任何可取负数的函数，则可定义：
$$f^+ = \frac{\vert f \vert + f}{2} \ge 0, \, f^- = \frac{\vert f \vert - f}{2} \ge 0.$$
注意到
$$f = f^+ - f^-,$$
因此对两个部分分别积分再相减即可。

既然狄拉克函数是概率测度，那么就具有累积概率分布。
其累计概率分布是 Heaviside 阶跃函数。

### 狄拉克函数的傅里叶变换

既然狄拉克函数不是函数，那么它能具有傅里叶变换吗？
答案是肯定的，这也能从几个方面来理解。

利用测度来进行理解最为容易。
根据定义：
$$\mathcal F[\delta](k) = \int_{-\infty}^{+\infty} \exp[- 2\pi i k x] \delta(x) \, \mathrm d x = \int_{\mathbb R} \exp[- 2\pi i k x] \, \mathrm d \delta(x) = \exp[0] = 1.$$

利用分布来理解则更加复杂但是接近本质。
前面我们定义的测试函数实际上是*速降函数*（Schwartz functions）的特例。
之前我们知道，傅里叶变换一般作用在可积函数空间$L^p$上，而速降函数空间$\mathcal S$则是特殊的可积函数，这些函数不仅可积，而且在无穷远处以非常快的速度衰减。

作为特别的可积函数，速降函数自然也有傅里叶变换，但非常特别的是，速降函数的傅里叶变换依然是速降函数，即傅里叶变换是速降函数空间上的自同构。
注意傅里叶变换并不是测试函数空间上的自同构，这是因为原函数越集中，其傅里叶变换就越分散，测试函数的傅里叶变换是解析的，因此支撑集合在整个复数域上（同理，任何非零解析函数都不可能是测试函数）。
当然，虽然其非零，但是仍然降低得很快，因此依然在速降函数空间中。

另一方面，作为特别的测试函数，速降函数也有自己的对偶空间，从而拥有对应的分布。
它的对偶空间中的元素称为*缓增分布*（Tempered distribution）。
根据对偶性，既然傅里叶变换是速降函数的自同构，那么也一定是缓增分布的自同构。
这个自同构应该满足什么性质呢？

设$f, g$为任意两个可积函数，$\hat f, \hat g$为其傅里叶变换，注意到
$$\int_{\mathbb R} f \hat g \, \mathrm d x= \int_{\mathbb R} \hat f g \, \mathrm d x,$$
因此，根据定义，若某个分布$T$具有傅里叶变换$\hat T$，那么其应该满足：
$$T (\hat f) = \hat T(f), \quad \forall f \in \mathcal S.$$
应用在狄拉克分布上，注意到
$$\forall f \in \mathcal S, \; \delta(\hat f) = \hat f(0) = \int_{\mathbb R} f(x) \, \mathrm d x,$$
因此$\hat \delta = 1$，这也是一个缓增分布。

---

狄拉克函数能进行傅里叶变换这个性质非常重要，因为寻找格林函数时经常需要对原方程做傅里叶变换。
此外，注意傅里叶变换是速降函数空间和缓增分布空间上的自同构这一性质。
这相当于天然地要求在利用傅里叶变换求解微分方程时，可能的解一定在速降函数空间上，即方程在无穷远处一定要下降至零。

## 无限大电阻网格问题

[![XKCD 356: Nerd Sniping](https://imgs.xkcd.com/comics/nerd_sniping.png "XKCD 356: Nerd Sniping, reproduced according to Creative Commons Attribution-NonCommercial 2.5 License")](https://xkcd.com/356/)
{: .align-center}

现在我们来利用格林函数求解可能是最为臭名昭著的电学问题之一：无限大电阻网格问题。
> 考虑一无限大的一欧姆理想电阻组成的正方形网格（如上图所示），请求出网格上任意两点之间的电阻大小。

### 朴素的方法

若该题出现在任何研究生水平以下的问题中，那么标准解法大概率是本节提到的“朴素”的方法。

现在我们只考虑两个相邻的节点。
首先考虑从一个节点注入$1$安培电流，那么根据网格的对称性，所有四个方向上都会流出$\frac{1}{4}$安培的电流。
现在再考虑从另一个节点抽取$1$安培电流，根据网格的对称性，所有四个方向上都会流入$\frac{1}{4}$安培的电流。
对于集总参数电路，流入的电流总是等于流出的电流，因此整个电路中不会有其他电流了。

考虑直接连接两个节点之间的电阻，其上流过的电流一共为
$$I_1 = \frac{1}{4} + \frac{1}{4} = \frac{1}{2} \, \text{A},$$
从而从其他路线上流过的电流为
$$I_2 = 1 - \frac{1}{2} = \frac{1}{2} \, \text{A}.$$
这意味着整个电路等效为两个相同的电阻并联，总电阻为
$$R = R_0 // R_0 = \frac{1}{1 + 1} = \frac{1}{2} \, \Omega.$$

为什么这两个电流可以叠加？背后的数学原理又是什么？
回忆一下，对离散情况，狄拉克函数（即克罗内克函数）定义为
$$\delta_n = \begin{cases} 1 & n = 0 \\ 0 & n \neq 0 \end{cases}, $$
因此，我们所求的，从节点注入或抽取电流的情况，其实正是系统的**格林函数**！

### 格林函数法

为使用格林函数法，我们首先要给出系统的微分方程。
对离散系统，这实际上是一个差分方程。
假设节点$\vec x = (x,y) \in \mathbb Z^2$处的电势为$V\_{x,y}$，那么对加入和吸取电流的两个节点之外的所有节点，有
$$4 V_{x,y} - V_{x+1, y} - V_{x, y+1} - V_{x-1, y} - V_{x, y-1} = 0.$$
假设从原点加入1安培电流，而从某一点$\vec a$抽取1安培电流，那么整个差分方程可写为
$$4 V_{x,y} - V_{x+1, y} - V_{x, y+1} - V_{x-1, y} - V_{x, y-1} = \delta_{\vec x} - \delta_{\vec x - \vec a},\; x, y \in \mathbb Z^2$$
其中的狄拉克函数定义为
$$\delta_{\vec x} = \begin{cases} 1 & \vec x = \vec 0 \\ 0 & \vec x \neq \vec 0 \end{cases}.$$
不难发现这正是离散空间中的拉普拉斯方程。

根据以上分析，我们的格林函数$G\_{x,y}$应当满足
$$4 G_{x,y} - G_{x+1, y} - G_{x, y+1} - G_{x-1, y} - G_{x, y-1} = \delta_{\vec x}.$$
现在有两种思路来求解该格林函数：[特征值方法](https://www.mathpages.com/home/kmath668/kmath668.htm)或[傅里叶变换方法](https://physics.stackexchange.com/a/401210)。

我们这里采用傅里叶变换方法。
考虑函数$G$的傅里叶逆变换：
$$G_{\vec x} = \frac{1}{4\pi^2 }\int_{[0, 2\pi]^2} \exp \left( i \vec \xi \cdot \vec x \right) g(\vec \xi) \,\mathrm d \vec \xi.$$
注意由于时域$\mathbb Z^2$是离散的，因此频域表示$g$一定具有周期性，从而积分域被控制在$[0, 2\pi]$上而非整个$\mathbb R^2$上，类似固体力学中对布里渊区的处理。
代回差分方程中，得到
$$\delta_{\vec x} = \frac{1}{4\pi^2} \int_{[0, 2\pi]^2} g(\vec \xi) e^{i \vec \xi \cdot \vec x} \left( 4 - e^{i \xi_x} - e^{i \xi_y} - e^{-i \xi_x} - e^{-i \xi_y} \right) \, \mathrm d \vec \xi.$$
注意到
$$\delta_{\vec x} = \frac{1}{4\pi^2} \int_{[0, 2\pi]^2} e^{i \vec \xi \cdot \vec x} \, \mathrm d \vec \xi,$$
有
$$g(\vec \xi) = \frac{1}{4 - e^{i \xi_x} - e^{i \xi_y} - e^{-i \xi_x} - e^{-i \xi_y}},$$
从而
$$G'_{\vec x} = \frac{1}{4\pi^2 }\int_{[0, 2\pi]^2} \frac{\exp \left( i \vec \xi \cdot \vec x \right)}{4 - e^{i \xi_x} - e^{i \xi_y} - e^{-i \xi_x} - e^{-i \xi_y}} \,\mathrm d \vec \xi.$$
取实部，得到
$$G_{\vec x} = \frac{1}{4\pi^2} \int_{[0, 2\pi]^2} \frac{\cos \vec \xi \cdot \vec x}{4 - 2\cos\xi_x - 2\cos \xi_y} \,\mathrm d \vec \xi.$$


利用这个格林函数就能计算任意点的电势了：
$$V_{\vec x} = \sum_{i,j \in \mathbb Z} G_{i, j} (\delta_{\vec x} - \delta_{\vec x - \vec a}) = G_{\vec x} - G_{\vec x - \vec a},$$

从而等效电阻为
$$
\begin{aligned}
R &= \frac{V_{\vec 0} - V_{\vec a}}{1 \,\text{A}} = 2(G_{\vec 0} - G_{\vec a}) \\
& = 2 \times \frac{1}{4\pi^2} \int_{[0, 2\pi]^2} \frac{1 - \cos \vec \xi \cdot \vec a }{4 - 2\cos\xi_x - 2\cos \xi_y} \,\mathrm d \vec \xi, \\
&= \frac{1}{4\pi^2} \int_{[0, 2\pi]^2} \frac{1 - \cos \vec \xi \cdot \vec a }{2 - \cos\xi_x - \cos \xi_y} \,\mathrm d \vec \xi.
\end{aligned}
$$

这个积分并非易于计算，但我们可借助计算机来简单验证一下之前的答案：
```python
>>> from sympy import *
>>> x,y = symbols('x y')
>>> integrand = (1 - cos(x)) / (2 - cos(x) - cos(y)) # a = (1, 0)
>>> ans = integrate(integrand, (x, 0, 2*pi), (y, 0, 2*pi))
>>> ans = (1 / (4 * pi**2)) * ans
>>> ans.evalf()
0.500000000000000
```


直接计算该积分比较困难，可参考[这篇文章](https://physics.stackexchange.com/a/401210)。
思路为先计算对角线上的元素，得到
$$R_{n,n} = \frac{2}{\pi} \left( 1 + \frac{1}{3} + \cdots + \frac{1}{2n - 1} \right).$$
然后利用对称性和递推关系
$$R_{x+1,y} + R_{x,y+1} + R_{x-1,y} + R_{x,y-1} - 4R_{x,y} = \delta_{x,y}$$
推出其他格点上的值。

#### 几个技术细节

最后讨论一下该解法的技术细节。

首先，我们的确求出了一个解，但是这个解是唯一的解吗？
注意到原题目对边界条件没有任何要求，因此该解*并不是*唯一的解——实际上，若对网格无穷远处的电势和电流不做任何限制，那么该问题具有*无穷多个*解。
但是，利用格林函数给出的这个解在无穷远处收敛。
根据拉普拉斯方程解的唯一性定理，只要存在这样的边界条件，那么解就是唯一的。
因此，我们使用格林函数求出的解恰好就是唯一一个能使无穷远处电流极小的。

然后，考虑一下格林函数
$$G_{\vec x} = \frac{1}{2\pi^2} \int_{[0, 2\pi]^2} \frac{\cos \vec \xi \cdot \vec x}{2 - \cos\xi_x - \cos \xi_y} \,\mathrm d \vec \xi.$$
注意，被积分式在原点处分母为零。
注意到在原点的邻域内，有
$$\frac{\cos \vec \xi \cdot \vec x}{2 - \cos\xi_x - \cos \xi_y} = \frac{1 - \frac{(\vec \xi \cdot \vec x)^2}{2} + o(\vert \xi \vert^4)}{\frac{\xi_x^2}{2} + \frac{\xi_y^2}{2} + o(\vert \xi \vert^4)} \approx \frac{2}{\vert \vec \xi\vert^2}$$
这意味着整个积分在原点附近发散，而且更进一步地在任何格点处都会发散。
显然，这个问题并不影响计算的结果，但是为了数学上的严谨性，可对该积分进行“重整化”。
物理中有一套复杂的方法来进行这种重整化，但是注意到积分式上下的收敛情况不同只是因为常数$1$引起的，我们重新构造一个格林函数：
$$G'_{\vec x} = \frac{1}{2\pi^2} \int_{[0, 2\pi]^2} \frac{\cos \vec \xi \cdot \vec x \textcolor{red}{ - 1}}{2 - \cos\xi_x - \cos \xi_y} \,\mathrm d \vec \xi$$
即可解决此问题。
这个常数在计算时会被消去，因此不会对前面的分析产生任何影响。
