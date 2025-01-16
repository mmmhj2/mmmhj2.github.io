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

根据界值定理，由于$p$导数不为零且连续，其导数必定恒正或恒负。
若其导数恒正，则称该重参数化保持了原曲线的方向，否则称其反转了方向。

符合直觉的是，函数在曲线的任何保持方向的重参数化上的积分的值相同。

函数在曲线上的积分仅曲线的参数化方向无关，即
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

### 广义斯托克斯公式
