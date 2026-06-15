---
title: "哈密顿力学导论"
---

本文中我们将简单介绍哈密顿力学的基础内容。
我们从拉格朗日力学出发，推导出哈密顿方程，研究其性质，并最后给出求解的一些方法。

## 从拉格朗日到哈密顿

我们将以拉格朗日力学为基础，推导出哈密顿方程。
首先我们复习一下拉格朗日力学相关的内容。

### 拉格朗日方程

在之前的笔记中，我们证明过力学系统的拉格朗日方程。
拉格朗日力学的基础建立在广义坐标$\mathbf q$、广义速度$\dot{\mathbf q}$和拉格朗日量$\mathcal L$上。

设系统的广义坐标为$\mathbf q \in X \subset \mathbb R^n$、广义速度为$\dot{\mathbf q}$，其拉格朗日量定义为
$$\mathcal L(\mathbf q(t), \dot{\mathbf q}(t), t) = \mathcal T(\mathbf q, \dot{\mathbf q}, t) - \mathcal V(\mathbf q, \dot{\mathbf q}, t),$$
其中$\mathcal T$和$\mathcal V$分别是系统的动能和势能。
且$\mathcal P$是从时间$t\_0$到$t\_1$，系统从$\mathbf q\_0$到$\mathbf q\_1$的一条路径，即
$$\mathcal P: [t_0, t_1] \to X, \quad \mathcal P(t_0) = \mathbf q_0,\; \mathcal P(t_1) = \mathbf q_1.$$
那么作用量泛函$\mathcal S$：
$$\mathcal S: \mathcal P \to \mathbb R, \; \mathcal S(\mathcal P) = \int_{t_0}^{t_1} L (\mathbf q, \dot{\mathbf q}, t) \; \mathrm d t,$$
在路径上取驻点，当且仅当该路径上所有点$\mathbf q$均满足欧拉-拉格朗日方程：
$$\frac{\mathrm d}{\mathrm d t} \frac{\partial \mathcal L}{\partial \dot q_i} - \frac{\partial \mathcal L}{\partial q_i} = 0, \; \forall i \in [\![ 1, n ]\!].$$
{: .theorem}

根据最小作用量原理，这意味着能够用拉格朗日量描述的力学系统，其沿时间运动的轨迹一定满足欧拉-拉格朗日方程：
$$\frac{\mathrm d}{\mathrm d t} \frac{\partial \mathcal L}{\partial \dot{\mathbf q}} - \frac{\partial \mathcal L}{\partial \mathbf q} = \mathbf 0.$$
这一点就足够推导出哈密顿力学的基础，即哈密顿方程了。

### 勒让德变换

拉格朗日力学虽好，但有计算复杂这一缺点。
在写出拉格朗日方程时，我们需要求解两次导数，构造二阶微分方程。
此外，二阶微分方程的数值和解析求解都比一阶微分方程复杂，因此，如果可以消去一阶导数，就能比较好地简化拉格朗日方法。

在数学中，正好存在一种这样的方法：
勒让德变换（Legendre transform）。
这种变换可以将关于变量$x$的函数变换为等价的关于其导数$\dot x$的函数。
我们首先介绍其数学定义，然后研究其性质。

设$f$为凸集合$X \subset \mathbb R^n$上的凸函数，则其勒让德变换$f^\star$定义为
$$
f^\star: X^\star \to \mathbb R, \; f^\star(x^\star) = \sup_{x \in X} \left( x^\star \cdot x - f(x) \right).
$$
该函数的定义域为
$$X^\star = \left\{ x^\star\in\mathbb R^n, \; \sup_{x\in X} \left( x^\star \cdot x - f(x) \right) < \infty \right\},$$
即函数$f^\star$非无穷大的集合。
{: .definition}

我们现在只考虑一维情况，这个函数的几何意义是，对任何斜率为$x^\star$而通过原点的直线，函数$y = f(x)$和直线$y = x^\star x$之间距离最大的点，就是函数$f^\star(x^\star)$的值。

现在的问题是给出性质足够好的凸函数$f(x)$，如何计算这个函数的勒让德变换？

设$f$为凸集合$X \subset \mathbb R^n$上的凸函数，则其勒让德变换为
$$f^\star(p_1, \dots, p_n) = p_1 x_1 + \cdots + p_n x_n - f(x_1, \dots, f_n),$$
其中
$$p_i = \frac{\partial f}{\partial x_i}.$$
{: .proposition}

我们只证明一维情况。
勒让德变换具有一个特别的性质，即函数的导数和其勒让德变换的导数互为反函数：
$$
(f')^{-1} = (f^\star)', \; ((f^\star)')^{-1} = f'.
$$
现在我们令
$$p(x) = f'(x),$$
并设
$$G(x) = p(x) \cdot x - f(x) - f^\star(p(x)),$$
然后计算其导数，得到
$$
\begin{aligned}
G'(x) &= p'(x) x + p(x) - f'(x) - (f^\star)'(p(x)) p'(x) \\
&= p'(x)x + p(x) - p(x) - (f')^{-1}(f'(x)) p'(x) \\
&= p'(x)x - x p'(x) = 0.
\end{aligned}
$$
最后计算：
$$G(0) = - f(0) - f^\star(f'(0)).$$
设
$$H(x) = f'(0) \cdot x - f(x),$$
则有
$$H'(x) = f'(0) - f'(x),$$
由于$f$是凸函数，其导数为单调函数，因此该函数的唯一极值点为$x = 0$，而且容易验证这个点处取最大值。
因此
$$f^\star(f'(0)) = \sup(H(x)) = H(0) = -f(0),$$
从而
$$G(0) = 0 \implies G = 0,$$
因此
$$f^\star(p(x)) = p(x) \cdot x - f(x).$$
由于$f$是凸函数，其导函数为单调函数，因此$p(x)$为单射。
交换主元，即有
$$f^\star(p) = p \cdot x(p) - f(x(p)).$$
这就完成了一维情况的证明。
对高维情况，可利用凸函数性质在直线上进行证明。
{: .proof}

若确定了待研究的函数$f$，则其中的变量$x\_i$和对应的勒让德变换变量$p\_i$称为*共轭变量*（Conjugate variable）。
这种说法通常出现在热力学之中，因为热力学可根据系综确定热力学势能，并将该势能视作待研究函数。

以内能为例，若设其为熵$S$和体积$V$的函数，那么有
$$\mathrm d U = \frac{\partial U}{\partial S} \mathrm d S + \frac{\partial U}{\partial V} \mathrm d V,$$
我们又知道
$$\mathrm d U = T \mathrm d S - p \mathrm d V,$$
因此，温度和熵以及压强和体积都是共轭变量。

### 哈密顿方程

通过勒让德变换，我们可以将所有关于广义坐标的函数变为关于广义速度的函数，仅需要利用勒让德变换将广义坐标替换为其共轭变量——广义动量即可。

设系统的广义坐标为$\mathbf q \in X \subset \mathbb R^n$、广义速度为$\dot{\mathbf q}$，其拉格朗日量为
$$\mathcal L(\mathbf q(t), \dot{\mathbf q}(t), t) = \mathcal T(\mathbf q, \dot{\mathbf q}, t) - \mathcal V(\mathbf q, \dot{\mathbf q}, t),$$
那么，设其哈密顿量为拉格朗日量关于广义动量的勒让德变换：
$$\mathcal H(\mathbf p(t), \mathbf q(t), t) = \sum_{i=1}^n p_i \dot q_i - \mathcal L(\mathbf q, \dot{\mathbf q}, t), \; p_i = \frac{\partial \mathcal L}{\partial \dot q_i}$$
则以下方程
$$
\frac{\mathrm d \mathbf p}{\mathrm d t} = - \frac{\partial \mathcal H}{\partial \mathbf q}, \; \frac{\mathrm d \mathbf q}{\mathrm d t} = \frac{\partial \mathcal H}{\partial \mathbf p}
$$
与欧拉-拉格朗日方程等价，称为哈密顿方程。
{: .theorem}

根据哈密顿量的定义，有
$$\mathcal H(\mathbf p, \mathbf q, t) + \mathcal L(\mathbf q, \dot{\mathbf q}, t) = \mathbf p \dot{\mathbf q}.$$
两边同时对$\mathbf p$求偏导，得到
$$
\frac{\partial \mathcal L}{\partial \mathbf p} + \frac{\partial \mathcal H}{\partial \mathbf p} = \frac{\partial \mathcal L}{\partial \dot{\mathbf q}}\frac{\partial \dot{\mathbf q}}{\partial \mathbf p} + \frac{\partial \mathcal H}{\partial \mathbf p} = \dot{\mathbf q} + \mathbf p \frac{\partial \dot{\mathbf q}}{\partial \mathbf p}.
$$
根据定义，
$$
\frac{\partial \mathcal L}{\partial \dot{\mathbf q}} = \mathbf p,
$$
从而
$$\frac{\partial \mathcal H}{\partial \mathbf p} = \dot{\mathbf q}.$$
两边对$\mathbf q$求偏导并代入欧拉-拉格朗日方程，即可得到另一个方程组。
{: .proof}

我们之前介绍拉格朗日方法时，哈密顿量就已经出现了，那个时候，我们将其称为广义能量。
在这个新的定义下，不难验证这个说法依然是成立的，哈密顿量就是系统的总能量。
在分析力学中我们指出，只要拉格朗日量不显含时间，那么系统的首次积分不变，总能量守恒，这一点在哈密顿力学中依然成立。

### 相空间

我们现在考虑哈密顿方程的解所在的空间，这个空间也叫做相空间（Phase space）。
相空间可认为是哈密顿方程允许的所有解所在的空间，也就是系统所有可能的状态所构成的空间。

我们一般考虑实数上的哈密顿方程，因此相空间是$\mathbb R^{2n}$的一个子集，或者，以更数学的方法说，是一个流形。
这个流形不同于其他流形的特点在于，其上的所有坐标都是成对出现的：一个广义位置坐标一定对应一个广义动量，而且广义动量和广义坐标的微分有关。
用数学语言来说，这就是说相空间是广义坐标构成的流形上的余切丛。
像这种具有成对的坐标结构的流形在数学上称为*辛流形*（Symplectic manifold）。
这里，Symplectic 是一个希腊语新造词，和复杂（Complex）同源。
辛流形这种成对的结构和复数的确比较相似。

辛流形上最重要的代数结构是辛形式。
我们不会涉及复杂的微分几何的内容，但是应当知道，辛流形上的辛形式，写作
$$
\omega = \sum_{i=1}^n \mathrm d p_i \wedge \mathrm d q_i,
$$
实际上表征了由哈密顿方程规定的整个系统，并且和哈密顿方程等价。
只要这个辛形式保持不变，系统就总是受到同一个哈密顿方程的规定。

可以认为，这个辛形式表示了辛空间中的动量和位置坐标两两围成的微小面积。
如果在某些变换下，这些面积保持不变，那么哈密顿方程也保持不变；
也就是说这种“保持面积”的变换实际上表示了同一哈密顿系统内的变换，这一点是我们马上要研究的哈密顿方程性质的数学基础，这种变换也叫做辛同胚（Symplectomorphism）。

## 哈密顿方程的性质

### 泊松括号

### 正则变换

#### 间接判据

### 刘维尔定理

## 哈密顿方程的解

### 例子：带电粒子的运动

### 数值解与辛积分

#### 半隐式欧拉法

#### Størmer-Verlet 积分
 
