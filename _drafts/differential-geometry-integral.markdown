---
title: "微分几何初步——微分形式与积分"
categories: "分析"
---

本文主要介绍微分形式在积分中的应用，包括简单的一元积分以及更高阶的斯托克斯公式。
我们主要关心一般的良态的函数的积分，而尽量不去考虑诸如间断点等反常积分的问题，这样以一些数学上的严谨性为代价，可以极大地减少证明的困难和繁琐程度。

## 1-形式的积分

欲计算积分，我们首先需要给出积分的定义：

*路径*（path）或*参数曲线*（parametric curve）是从闭区间到向量空间$\mathbb R^n$的开子集$U$的光滑映射：
$$c: \quad [a,b] \to U.$$
其对应一阶微分形式$\alpha$的拉回记为
$$\newcommand{\dif}{\mathop{}\!\mathrm d}c^*(\alpha) = h \dif t,$$
其中$h$是$[a,b]$上的光滑函数。
{: .definition}

这里我们认为参数曲线一定是光滑的，且定义域一定是闭区间。

一阶微分形式$\alpha$在曲线$c$上的积分定义为
$$\int_c \alpha = \int_{[a,b]} c^*(\alpha) = \int_a^b h(t) \dif t.$$
最后的积分是实数域上的积分，通常指黎曼积分。
{: .definition}

我们可将$\alpha$展开成分量的形式，有
$$
\alpha = \sum_{i=1}^n f_i \dif x_i, \; c^*(\alpha) = \sum_{i=1}^n f_i(c(t)) c'(t) \dif t
$$
从而其积分为
$$
\int_c \alpha = \sum_{i=1}^n \int_a^b f_i(c(t)) c'(t) \dif t.
$$

### 重参数化与换元

在经典的积分中，我们可以使用换元的方法简化计算。
对于在曲线上的积分，则可使用重参数化这一技巧。

设$p: [a', b'] \to [a, b]$为一光滑双射，满足
$$p'(s) \neq 0, \quad \forall s \in [a', b'].$$
则曲线$c \circ p$和$c$的像完全相同。映射$p$称为曲线的*重参数化映射*（Reparametrization）
{: .definition}

需要注意的是，重参数化总是复合在原曲线之前，这和拉回有些类似。

根据界值定理，由于$p$导数不为零且连续，其导数必定恒正或恒负。
若其导数恒正，则称该重参数化保持了原曲线的方向，否则称其反转了方向。

符合直觉的是，函数在曲线的任何保持方向的重参数化上的积分的值相同。

函数在曲线上的积分仅曲线的参数化方向有关，即
$$\forall p: [a', b'] \to [a, b], \quad \int_{c \circ p} \alpha = \begin{cases} \int_c \alpha &p \text{保持方向}, \\ - \int_c \alpha & p\text{反转方向}. \end{cases}$$
{: .theorem}

注意到
$$\int_{c \circ p} \alpha = \int_{a'}^{b'} (c \circ p)^*(\alpha) = \int_{a'}^{b'} p^* (c^*(\alpha)).$$
令$c^*(\alpha) = h \dif t, t = p(s)$，有
$$p^*(c^*(\alpha)) = p^*(h) \dif p = p^*(h) \frac{\dif p}{\dif s} \dif s.$$
从而
$$\int_{c \circ p} \alpha = \int_{a'}^{b'}  h(p(s)) \frac{\dif p}{\dif s} \dif s.$$
又
$$\int_c \alpha = \int_a^b c^*(\alpha) = \int_a^b h \dif t,$$
根据积分换元公式：
$$\int_{p(U)} f(y) \dif y = \int_U f(p(x)) \left\vert \det D p \right\vert \dif x,$$
有
$$\int_c \alpha = \pm \int_{c \circ p} \alpha.$$
{: .proof}

通过这种方式定义的积分可以很容易地与物理上的场联系起来，例如，质点在力场$\mathbf F$中运动，力所做的功为
$$\int_c \mathbf F \cdot \dif \mathbf x = \int_c \alpha.$$
上一个定理便是说，力所做的功只与路径相关，而与速度无关。

特别地，若力场是保守场，即存在一势场$g$，使得$\nabla g = \mathbf F$，那么可以注意到
$$\alpha = \mathbf F \cdot \dif \mathbf x = \dif g.$$
这意味这微分形式$\alpha$是恰当的。
我们接下来先研究这一类积分。

### 恰当形式的积分

恰当形式的积分容易给出。

设$\alpha = \dif g$为一$\mathbf R^n$或其开子集上的恰当1-形式，则其在任何曲线上的积分只与曲线的端点有关：
$$\int_c \alpha = \int_c \dif g = g(c(b)) - g(c(a)).$$
{: .theorem}

这说明了保守场上力所做的功与路径无关。

注意到
$$c^*(\alpha) = c^*(\dif g) = \dif c^*(g) = \dif g(c(t)).$$
利用$\mathbb R$上的微积分基本定理易证：
$$\int_c \alpha = \int_a^b \dif g(c(t)) = g(c(b)) - g(c(a)).$$
{: .proof}

一个显然的推论是1-恰当形式在闭合路径上的积分总是零。
这个推论的逆否命题可用来验证欧几里得空间开子集上的闭合1-形式是否是恰当的。
注意欧几里得空间上的闭合1-形式一定是恰当的，但是定义在其中一个开子集上的闭合形式则不一定是恰当的。

实际上，我们有以下命题：

设$\alpha$为$\mathbb R^n$的一个*连通*的开子集$U$上的1-形式，那么以下三个命题等价：<br/>
1）$\alpha$是恰当形式；<br/>
2）对所有闭合的路径$c$，有$\int_c \alpha = 0$ <br/>
3）对所有路径$c$，该形式在路径上的积分仅与端点有关。
{: .proposition}

命题一推命题二是显然的。
对命题二推命题三，考虑任意两条端点相同的积分路径，将其中一条反向再首尾相连即可形成闭合路径，然后应用命题二即可得到命题三。
最后证明命题三推命题一，这个证明比较复杂。
我们希望找到函数$g$，使得$\alpha = \dif g$。
首先在开子集$U$上任选一个点$\mathbf{x}\_0$作为基准点，设
$$c_{\mathbf x}: [0, 1] \to U, \; c_{\mathbf x}(0) = \mathbf{x}_0, \; c_{\mathbf x}(1) = \mathbf x,$$
表示从$\mathbf{x}\_0$到$\mathbf x$的任意一条路径，定义：
$$g(\mathbf x) = \int_{c_\mathbf x} \alpha.$$
我们将证明这个函数就是要寻找的函数。
设$\alpha = \sum_i f_i \dif x_i$，根据外微分的定义，我们需要说明$g$的偏微分的存在性，并证明
$$\forall i \in [\![1, n]\!], \; f_i = \frac{\partial g}{\partial x_i}.$$
根据定义，有
$$\frac{\partial g}{\partial x_i}(\mathbf x) = \lim_{h \to 0} \frac{g(\mathbf x + h \mathbf e_i) - g(\mathbf x)}{h} = \lim_{h \to 0} \frac{1}{h} \left( \int_{c_{\mathbf x + h \mathbf e_i}} \alpha - \int_{c_{\mathbf x}} \alpha \right).$$
现在我们来构造与$c\_{\mathbf x + h \mathbf e\_i}$起讫点相同的简单路径，我们简单构造一个分段的路径，使其在$t \in [-1, 0]$与$c_{\mathbf x}$完全相同，而在$t \in [0, 1]$从$\mathbf x$延直线前往$\mathbf x + h \mathbf e\_i$，记后一段路径为
$$l: [0, 1] \to U, \; t \mapsto \mathbf x + h t \mathbf e_i.$$
这样，偏微分化简为
$$\frac{\partial g}{\partial x_i}(\mathbf x) = \lim_{h \to 0} \frac{1}{h} \left( \int_{c_{\mathbf x + h \mathbf e_i}} \alpha - \int_{c_{\mathbf x}} \alpha \right) = \lim_{h \to 0} \frac{1}{h} \left( \int_0^1 l^*(\alpha) \right).$$
注意到$l$可以写作
$$l_j = x_j + h t \delta_{ij},$$
从而计算拉回：
$$
\begin{aligned}
l^*(\alpha) &= \sum_{j=1}^n f_j(l(t)) \dif l_j \\
&= \sum_{j=1}^n f_j(\mathbf x + ht\mathbf e_i) h \delta_{ij} \dif t \\
&= f_i(\mathbf x + ht\mathbf e_i) h \dif t.
\end{aligned}
$$
然后计算偏微分：
$$
\begin{aligned}
\frac{\partial g}{\partial x_i}(\mathbf x) &= \lim_{h \to 0} \frac{1}{h} \left( \int_0^1 l^*(\alpha) \right) \\
&= \lim_{h \to 0} \int_0^1 f_i(\mathbf x + ht\mathbf e_i) \dif t \\
&= \int_0^1 \lim_{h \to 0} f_i(\mathbf x + ht\mathbf e_i) \dif t & \text{(控制收敛)} \\
&= f_i(\mathbf x).
\end{aligned}
$$
这就完成了证明。
{: .proof}

这个证明的重要性在于给出了计算恰当微分形式的不定积分的方法，即任选从参考点到目标点的路径并进行积分，即可给出原函数$g(\mathbf x)$。

## 高阶微分形式的积分

接下来我们将研究更高阶的微分形式的积分，并最终导出广义斯托克斯公式，从而给出高斯散度公式和斯托克斯旋度公式。

首先，我们需要将区间和曲线的定义扩展到更高维。

设$S$为$\mathbb R^k$上的一个紧密（有界闭）集合，若其具有以下形式：
$$S = [a_1, b_1] \times [a_2, b_2] \times \cdots \times [a_k, b_k]$$
则称其为一个$k$维超矩形（hyperrectangle）。
该空间上的一个路径曲面定义为从矩形到开集合$U \subset \mathbb R^n$的光滑映射$c$
$$c: S \to U.$$
{: .definition}

在定义中我们没有限制$k$与$n$的大小关系，因此矩形的维数和曲面所在空间的维数其实没有任何关系。
但是我们希望研究微分形式的积分，而微分形式的阶数不能高于空间的维数，所以我们一般认为$k \le n$。

根据定义，路径$c$对$k$-形式$\alpha$的拉回是$S$上的$k$-形式，可写为：
$$c^*(\alpha) = h(\mathbf t) \dif t_1 \dif t_2 \cdots \dif t_k$$
其中$h$是从$S$到$\mathbb R$的一个映射。
利用这个拉回，我们可定义其积分。

$k$-形式$\alpha$在路径$c$上的积分定义为
$$\int_c \alpha = \int_S c^*(\alpha) = \int_{a_k}^{b_k} \cdots \int_{a_2}^{b_2} \int_{a_1}^{b_1} h(\mathbf t) \dif t_1 \dif t_2 \cdots \dif t_k.$$
{: .definition}

这个积分的定义可以自然地扩展到任何紧密集合上，而不一定需要是矩形。

一个特别的情况是0阶微分形式，即光滑函数，的积分。
若我们认为零维欧氏空间是仅含零的平凡空间，那么其上的任何一条路径都仅含一个点
$$c(0) = \mathbf x.$$
这样的积分为
$$\int_c f = f(\mathbf x)$$
即只有单个的函数值。

### 重参数化

高维曲线的重参数化与一维的差距不大。

设$S, S'$为二相同维的矩形，则二阶可微的双射$p: S' \times S$可称为重参数化映射，若对$S'$上任意一点，皆有
$$\det J(p) \neq 0.$$
若$\det J(p) > 0$，则称其保持方向不变，否则称其反转了方向。
{: .definition}

函数在路径上的积分仅曲线的参数化方向有关，即
$$\forall p: S' \to S, \quad \int_{c \circ p} \alpha = \begin{cases} \int_c \alpha &p \text{保持方向}, \\ - \int_c \alpha & p\text{反转方向}. \end{cases}$$
{: .proposition}

这个命题有助于我们理解交换积分次序的符号问题。
我们知道，交换积分的次序不会改变积分的结果，即
$$\int_J \int_I f(x,y) \dif x \dif y = \int_I \int_J f(x,y) \dif y \dif x.$$
而这似乎与我们所学的有所矛盾，因为交换微分形式的次序会反转符号
$$f \dif x \dif y = - f \dif y \dif x.$$
这里要注意积分的路径实际上进行了一次重参数化，
在左侧的积分路径$c$定义在$I \times J$上，而在右侧的路径$c' = c\circ p$定义在$J \times I$上。
注意到重参数化映射
$$p: J \times I \to I \times J, \; (y, x) \mapsto (x, y).$$
反转了方向，因此产生了一个负号并消去了交换微分次序产生的负号。
更一般地，可以证明交换次序产生的重参数化映射是否反转方向，正好由这个置换的符号决定，从而这两个负号一定能抵消。

对任何$k$维矩形，我们均可对其每一维的自变量应用一个重参数化映射
$$
\begin{array}{cccc}
p: & [0, 1]^k & \to & [a_1, b_1] \times \cdots \times [a_k, b_k] \\
& \begin{pmatrix}x_1 \\ \vdots \\ x_k\end{pmatrix} & \mapsto & \begin{pmatrix} (b_1 - a_1) x_1 + a_1 \\ \vdots \\ (b_k - a_k) x_k + a_k\end{pmatrix}
\end{array}
$$
从而将其定义域限制在单位立方体上。
容易证明这个映射是保持方向的，因此积分的值不变。
之后我们将不失一般性地只研究这种在单位立方体上的积分。

### 链与链上的积分

当前，我们将积分路径的定义域限制在单位立方体上。
很多时候，我们可能需要在多个这样的立方体上积分，为此，我们引入链的概念。

$k$维单位立方体的线性组合构成一个群
$$C_k = \left\{ \sum_i a_i c_i; \; k_i \in \mathbb Z \right\},$$
其中$c\_i$即为单位立方体，也称奇异k维立方（singular $k$-cube），因为该映射不一定是双射。
这个群中的元素称为$k$维链（$k$-chain），$a\_i$称为该链的系数。
{: .definition}

在链
$$c = \sum_{p=1}^q a_p c_p$$
上的积分，定义为在链的各个部分上积分之和
$$\int_c \alpha = \sum_{p=1}^q a_p \int_{c_p} \alpha.$$
{: .definition}

注意我们并不计算链这个映射的值，即我们不在路径$c$上积分，而是在链的各个组成部分上积分。
以零阶积分为例，考虑链
$$c = \mathbf x_1(t) + \mathbf x_2(t) + \mathbf x_3(t),$$
其中$\mathbf x\_i(t)$表示映射到点$\mathbf x\_i$的路径：
$$\mathbf x_i(t) = \mathbf x_i.$$
在这个链上的积分为
$$\int_c f = f(\mathbf x_1) + f(\mathbf x_2) + f(\mathbf x_3),$$
而不是
$$\int_c f \neq f(\mathbf x_1 + \mathbf x_2 + \mathbf x_3).$$

我们可以将积分的路径视为点、面积或体积微元，而链则表示了这些微元组合成的图形，即整个积分域。

对一维的积分，微积分基本定理说明我们需要关心函数在端点处的值。
对一条链上的积分，按照类似的思路，我们希望考虑其边界。

### 链的边界

$k$维路径$c$的边界$\partial c$是以下$2k$个$k-1$-维超立方体组成的链：
$$
\begin{aligned}
c_{i, 0}(\mathbf t) &= c(t_1, \dots, t_{i-1}, 0, t_i, \dots, t_k), \\
c_{i, 1}(\mathbf t) &= c(t_1, \dots, t_{i-1}, 1, t_i, \dots, t_k), & i \in [\![1, k]\!].
\end{aligned}
$$
一般定义一条链$c$的边界为
$$\partial c = \sum_{i = 1}^k (-1)^i (c_{i,0} - c_{i,1}).$$
约定零维路径的边界为$0$。
$k$维链的边界定义为组成链的路径的边界的线性组合：
$$\partial c = \sum_i a_i \partial c_i.$$
这样，边界算子$\partial$可视为$C\_k$到$C\_{k-1}$的线性算子。
{: .definition}

这样，一维的路径——曲线——的边界有两个部分（端点），二维的路径——平面——的边界有四个部分（边）。

链和外微分有一些相似之处，例如：

边界的边界为零，即
$$\partial(\partial c) = 0.$$
{: .proposition}

接下来我们将研究一类对积分来讲特殊的链。

若$k$维立方体$c(t\_1, \dots, t\_k)$与某一参数$t\_i$无关，那么称这个立方体是*退化*（degenerate）的。
若$k$维链中所有立方体都是退化的，那么称这条链是退化的。
{: .definition}

关于退化的链的边界，有一条比较显然的定理。

$k$维退化链$c$的边界$\partial c$是退化的$k-1$维链。
{: .proposition}

不失一般性地，我们只考虑超立方体的情况。
假设链$c(t\_1, \dots, t\_k)$与参数$t\_i$无关，考虑其边界：
$$\partial c = \sum_{j=1}^k (-1)^j (c_{j,0}-c_{j,1}).$$
而由于链与$t\_i$无关，有
$$c_{i, 0}(t'_1, \dots, t'_{k-1}) = c_{i, 1}(t'_1, \dots, t'_{k-1})$$
从而
$$\partial c = \sum_{j\neq i} (-1)^j (c_{j,0}-c_{j,1}).$$
而所有这些链中，都存在一个无关的参数，即占据原映射$c$参数$t\_i$位置的那个参数：
当$j < i$时，这个参数是$t'\_{i-1}$；而当$j > i$是，这个参数是$t'\_i$。
从而，所有立方体都是退化的，因此该链是退化的。
{: .proof}

退化立方体的几何意义是维数不足$k$的曲线，例如，退化的一维链就是空间中的一个点。
而如同1-形式在单一点上的积分为零一样，退化的链的积分也总是零。

设$c$为一$k$维退化链，$k$-形式$\alpha$在其上的积分定为零，即
$$\int_c \alpha = 0.$$
{: .proposition}

我们只考虑立方体的情况，链的情况可由线性直接得出。
设立方体$c$与参数$t\_i$无关，取二映射：
$$
\begin{array}{cccc}
f: & [0,1]^k & \to & [0,1]^{k-1} \\
& (t_1, \dots, t_k) & \mapsto & (t_1, \cdots, t_{i-1}, t_{i+1}, \cdots, t_k) \\
g: & [0,1]^{k-1} & \to & U \\
& (t_1, \cdots, t_{k-1}) & \mapsto & c(t_1, \cdots, t_{i-1}, 0, t_{i}, \cdots, t_{k-1})
\end{array}
$$
由于$c$与参数$t\_i$无关，有$c = g(f(\mathbf t))$。
从而
$$\int_c \alpha = \int_{[0,1]^k} c^*(\alpha) = \int_{[0,1]^k} f^* g^*(\alpha).$$
现在，注意到$g^\*(\alpha)$是$k$阶微分形式，但是其所处的空间只有$k-1$维，因此该微分形式为零，从而原积分为零。
{: .proof}

这意味着如果某一条链由退化的链和非退化的链两个部分组成，那么退化的链的部分不会对积分的结果产生任何影响，从而可以简化计算。

若$k$维链$c$的边界$\partial c$是$k-1$维的退化链，那么称$c$为$k$维*环*（cycle）。若$c$由两个部分组成：
$$c = \partial b + a$$
其中$b$是$k+1$维链，$a$是$k$维的退化链，那么称$c$为*边界*（boundary）。
{: .definition}

这一定义有助于我们研究链及其边界上的积分。
例如，在环的边界上的积分总是零。
从直观上理解，根据边界算子的定义，若曲线的边界的所有部分都与某一项无关，那么说明该链上有一些曲线被消去了，而链被消去说明它们在空间上重合而系数相反，这就形成了环。
另一方面，由于在退化链上的积分为零，在边界上的积分总是能化简为
$$\int_c \alpha = \int_{\partial b + a} \alpha = \int_{\partial b} \alpha.$$
因此，在$k$维边界$c$上的积分总是等价于在某个$k-1$维的链的边界$\partial b$上的积分。

例如，考虑$\mathbb R^3$上的单位球面
$$c(t_1, t_2) = (\cos 2\pi t_1 \sin \pi t_2, \cos 2\pi t_1 \sin \pi t_2, \cos \pi t_2), \; t_1, t_2 \in [0,1].$$
其边界为
$$
\begin{aligned}
\partial c(t) &= -c(0, t) + c(1, t) + c(t, 0) - c(t, 1) \\
& = -(\sin \pi t, \sin \pi t, \cos \pi t) \\
& \ + (\sin \pi t, \sin \pi t, \cos \pi t) \\
& \ + (0, 0, 1) - (0, 0, -1) \\
&= (0, 0, 1) - (0, 0, -1)
\end{aligned}
$$
即球的南极和北极两个点。
注意我们不能将最后两项合成为
$$(0,0,1) - (0,0,-1) \neq (0, 0, 2).$$
显然$\partial c$是退化的，因此$c$是一个环。

实际上，边界和环之间关系密切。

若$c$为一边界，那么$c$一定是环，即$\partial c$一定是退化的。
{: .proposition}

从而，在边界的边界上的积分是零。

根据定义，设
$$c = \partial b + a,$$
其中$a$是退化的链。有
$$\partial c = \partial (\partial b) + \partial a = \partial a$$
而由于退化链的边界还是退化链，因此$c$也是退化的。
{: .proof}

环与边界的关系和闭合与恰当微分的关系有些类似：边界一定是环，但环不一定是边界。

### 广义斯托克斯公式

这一节中，我们将证明以下命题：

<small>（广义斯托克斯公式, generalized Stokes' theorem）</small>
设$\alpha$为$\mathbf R^n$的开子集$U$上的$k-1$阶微分形式，$c$为其上的$k$维链，那么
$$\int_c \dif \alpha = \int_{\partial c} \alpha.$$
{: .theorem}

我们仍只考虑$c$定义在立方体上的情况。
根据在链上积分的定义和拉回形式的性质，有
$$\int_c \dif \alpha = \int_{[0,1]^k} c^* (\dif \alpha) = \int_{[0,1]^k} \dif (c^*(\alpha)).$$
由于$c^*(\alpha)$是定义在$[0, 1]^k$上的$k-1$-形式，其可写为
$$c^*(\alpha) = \sum_{i=1}^k g_i \dif x_1 \cdots \dif x_{i-1} \dif x_{i+1} \cdots \dif x_k,$$
其中$g\_i$是$[0,1]^k$上的函数。
计算其外微分，有
$$
\begin{aligned}
\dif c^*(\alpha) &= \sum_{i=1}^k \dif g_i \dif x_1 \cdots \dif x_{i-1} \dif x_{i+1} \cdots \dif x_k \\
&= \sum_{i=1}^k \sum_{j=1}^k \frac{\partial g_i}{\partial x_j} \dif x_j \dif x_1 \cdots \dif x_{i-1} \dif x_{i+1} \cdots \dif x_k \\
&= \sum_{i=1}^k (-1)^{i+1} \frac{\partial g_i}{\partial x_i} \dif x_1 \cdots \dif x_k.
\end{aligned}
$$
这是由于微分形式的反交换性。
从而
$$
\begin{aligned}
\int_c \dif \alpha &= \int_{[0,1]^k} \dif (c^*(\alpha)) \\
&= \int_{[0,1]^k} \sum_{i=1}^k (-1)^{i+1} \frac{\partial g_i}{\partial x_i} \dif x_1 \cdots \dif x_k \\
&= \sum_{i=1}^k (-1)^{i+1} \int_{[0,1]^k}\frac{\partial g_i}{\partial x_i} \dif x_1 \cdots \dif x_k.
\end{aligned}
$$
现在考察求和符号内部的积分。
我们之前已经说明过可以任意交换积分顺序而保持符号不变，因此
$$
\begin{aligned}
&\int_{[0,1]^k}\frac{\partial g_i}{\partial x_i} \dif x_1 \cdots \dif x_k \\
= &\int_{[0,1]^k}\frac{\partial g_i}{\partial x_i} \dif x_i \dif x_1 \cdots \dif x_{i-1} \dif x_{i+1} \dif x_k \\
= &\int_{[0,1]^{k-1}} g_i(x_1, \dots, 1, \dots, x_k) \dif x_1 \cdots \dif x_{i-1} \dif x_{i+1} \dif x_k \\
& - g_i(x_1, \dots, 0, \dots, x_k) \dif x_1 \cdots \dif x_{i-1} \dif x_{i+1} \dif x_k
\end{aligned}
$$
最后一步利用了一维的微积分基本定理。
现在注意到
$$c^*_{i, 0}(\alpha) = g(x_1, \dots, 0, \dots, x_k) \dif x_1 \cdots \dif x_{i-1} \dif x_{i+1} \dif x_k,$$
因此
$$\int_{[0,1]^k}\frac{\partial g_i}{\partial x_i} \dif x_1 \cdots \dif x_k = \int_{[0,1]^{k-1}} c^*_{i,1}(\alpha) - c^*_{i,0}(\alpha).$$
代回原式，得到
$$
\begin{aligned}
\int_c \dif \alpha &= \sum_{i=1}^k (-1)^{i+1} \int_{[0,1]^{k-1}} c^*_{i,1}(\alpha) - c^*_{i,0}(\alpha) \\
&= \int_{[0,1]^{k-1}} (\partial c)^*(\alpha) = \int_{\partial c} \alpha
\end{aligned}
$$
{: .proof}
