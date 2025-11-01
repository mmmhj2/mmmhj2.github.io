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

## 无限大电阻网格问题

![XKCD 356: Nerd Sniping](https://imgs.xkcd.com/comics/nerd_sniping.png)
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
回忆一下，对离散情况，狄拉克函数定义为
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
考虑我们给出的电阻的表达式，由于电流为1安培，因此若设原点为零势能点，这也是该处的电势：
$$R_{n,n} = \frac{2}{\pi} \left( 1 + \frac{1}{3} + \cdots + \frac{1}{2n - 1} \right).$$
不难发现该表达式以$\mathcal{O}(1/n)$的速度增长，而电流的增长速度则为：
$$\frac{1}{n-1} - \frac{1}{n} = \frac{1}{n^2 - n} \to \mathcal{O}(\frac{1}{n^2}),$$
且收敛至零。根据拉普拉斯方程解的唯一性定理，只要存在这样的边界条件，那么解就是唯一的。
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
