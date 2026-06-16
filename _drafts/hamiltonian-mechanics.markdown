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

我们之前提到过拉格朗日量的非唯一性，但是是从拉格朗日方程的角度看的。
我们知道在拉格朗日量上添加一个只与时间相关的函数，其微分方程保持不变。
从作用量积分的角度来看，如果添加一个关于时间的微分，例如
$$
\tilde L(\mathbf q, \dot{\mathbf q}, t) = L(\mathbf q, \dot{\mathbf q}, t) - \frac{\mathrm d F(\mathbf q(t), t)}{\mathrm d t},
$$
那么新的作用量积分为
$$
\begin{aligned}
\tilde{\mathcal S} 
&= \int_{t_0}^{t_1} L(\mathbf q, \dot{\mathbf q}, t) - \frac{\mathrm d F(\mathbf q(t), t)}{\mathrm d t} \; \mathrm d t \\
&= \mathcal S - \Big[ F(\mathbf q(t), t) \Big]_{t_0}^{t_1} \\
&= \mathcal S - F(\mathbf q_1, t_1) + F(\mathbf q_0, t_0).
\end{aligned}
$$
这个积分和原积分只相差一个常数，因此还是等价的。
这一点也能从欧拉-拉格朗日方程导出，但是从作用量积分来看更加显然。

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

我们一般考虑实数上的哈密顿方程，因此相空间$M$是$\mathbb R^{2n}$的一个子集，或者，以更数学的方法说，是一个流形。
这个流形不同于其他流形的特点在于，其上的所有坐标都是成对出现的：一个广义位置坐标一定对应一个广义动量，而且广义动量和广义坐标的微分有关。
用数学语言来说，这就是说相空间是广义坐标构成的流形上的余切丛。
像这种具有成对的坐标结构的流形在数学上称为*辛流形*（Symplectic manifold）。
这里，Symplectic 是一个希腊语新造词，和复杂（Complex）同源。
辛流形这种成对的结构和复数的确比较相似。

相空间或辛流形可以帮助我们简化哈密顿方程。
我们设向量
$$
\eta = (\mathbf q, \mathbf p)^\top = \begin{pmatrix} q_1 \\ \vdots \\ q_n \\ p_1 \\ \vdots \\ p_n \end{pmatrix} \in M,
$$
矩阵
$$
J = \begin{pmatrix}
\mathbf 0_{n \times n} & \mathbf 1_{n \times n} \\ - \mathbf 1_{n \times n} & \mathbf 0_{n\times n}
\end{pmatrix} \in \mathcal M_{2n},
$$
那么哈密顿方程可以写为
$$
\dot \eta = J \frac{\partial \mathcal H}{\partial \eta}.
$$
矩阵$J$叫做辛矩阵（Symplectic matrix），满足
$$J^\top = J^{-1} = -J, \; \det J = 1.$$

我们可以更进一步地将偏微分$\partial \eta$替换为辛流形上的微分，从而构造坐标无关的哈密顿方程。
这种形式的哈密顿方程是辛几何研究的重点内容之一。

辛流形上最重要的代数结构是辛形式。
我们不会涉及复杂的微分几何的内容，但是应当知道，辛流形上的辛形式，写作
$$
\omega = \sum_{i=1}^n \mathrm d p_i \wedge \mathrm d q_i,
$$
实际上表征了由哈密顿方程规定的整个系统，并且和哈密顿方程等价。
只要这个辛形式保持不变，系统就总是受到同一个哈密顿方程的规定。

对于这个辛形式有两种理解方法。
在代数上，这是个2-形式，这意味着它实际上是一个反对称的二阶张量，也就是反对称的双线性形式；
在几何上，辛空间中的微小动量变化$\mathrm d p$和位置坐标变化$\mathrm d q$两两围成的微小面积。
如果在某些变换下，这些面积保持不变，那么哈密顿方程也保持不变；
也就是说这种“保持面积”的变换实际上表示了同一哈密顿系统内的变换，这一点是我们马上要研究的哈密顿方程性质的数学基础，这种变换也叫做辛同胚（Symplectomorphism）。

## 哈密顿方程的性质

本节我们将以正则变换为基础研究哈密顿方程和哈密顿系统的各项性质。

### 正则变换

在研究微分方程时，我们有时希望对其中的坐标进行变换，这样也许可以使得复杂的坐标和方程变得更加简单。
如果存在这样的变换，那么这个变换应当能够保留哈密顿方程的形式。
一方面，保留哈密顿方程的“形式”能够保证我们研究的还是同一个系统，即使哈密顿量不同；
另一方面，如果在这种变换下存在保留不变的结构，那么意味着存在守恒量，这也是物理研究的重点。

设有两组广义坐标$(\mathbf p, \mathbf q)$、$(\mathbf P, \mathbf Q)$和哈密顿量$\mathcal H(\mathbf p, \mathbf q, t)$、$\mathcal K(\mathbf P, \mathbf Q, t)$，
其中$\mathbf P$和$\mathbf Q$是由可逆变换得到的：
$$\mathbf P = \mathbf P(\mathbf p, \mathbf q, t),\; \mathbf Q = \mathbf Q(\mathbf p, \mathbf q, t),$$
若它们的哈密顿量满足
$$
\mathbf p \cdot \dot{\mathbf q} - \mathcal H(\mathbf p, \mathbf q, t) = \mathbf P \cdot \dot{\mathbf Q} - \mathcal K(\mathbf P, \mathbf Q, t) + \frac{\mathrm d F}{\mathrm d t},
$$
其中$F$是某一函数，那么这两个广义坐标之间的变换称为*正则变换*（Canonical transformation），$F$称为生成函数。
{: .definition}

一般地说，从$\mathbf p, \mathbf q$到$\mathbf P, \mathbf Q$的变换可以是显含时间的，但是我们当下一般只考虑更简单的，不显含时间的变换。
这种正则变换叫做限制正则变换（Restricted canonical transformation）。

假如这两组广义坐标描述了相同的系统，那么它们一定能由等价的拉格朗日量导出。
这就是说，我们有：
$$
\alpha \mathcal L(\mathbf q, \dot{\mathbf q}, t) - \frac{\mathrm d F}{\mathrm d t} = \tilde{\mathcal L}(\mathbf Q, \dot{\mathbf Q}, t).
$$
应用勒让德变换，得到
$$
\alpha \left(\mathbf p \cdot \dot{\mathbf q} - \mathcal H(\mathbf p, \mathbf q, t)\right) - \frac{\mathrm d F}{\mathrm d t}  = \mathbf P \cdot \dot{\mathbf Q} - \mathcal K(\mathbf P, \mathbf Q, t).
$$
我们总是假设$\alpha = 1$，因为可以通过缩放变换坐标来改变此常数。
对$\alpha \neq 1$的情况，一般称为拓展正则变换（Extended canonical transformation）。



最基本的生成函数具有以下四种形式之一：
$$
F_1(\mathbf q, \mathbf Q, t), \; F_2(\mathbf q, \mathbf P, t) - \mathbf Q \mathbf P, \; F_3(\mathbf p, \mathbf Q, t) + \mathbf q\mathbf p, \; F_4(\mathbf p, \mathbf P, t) + \mathbf q\mathbf p - \mathbf Q\mathbf P.
$$
其他生成函数一般都可以写成这四种生成函数的组合。
我们以$F\_2$为例介绍从生成函数计算变换的步骤。
注意到
$$
\begin{aligned}
& \mathbf p \dot{\mathbf q} - \mathcal H(\mathbf p, \mathbf q, t) \\
=\; & \mathbf P \dot{\mathbf Q} - \mathcal K(\mathbf P, \mathbf Q, t) + \frac{\mathrm d F}{\mathrm d t} \\
=\; & \mathbf P \dot{\mathbf Q} - \mathcal K(\mathbf P, \mathbf Q, t) + \frac{\partial F}{\partial t} + \frac{\partial F}{\partial \mathbf q} \dot {\mathbf q} + \frac{\partial F}{\partial \mathbf P} \dot{\mathbf P} - \mathbf Q \dot{\mathbf P} - \dot{\mathbf Q} \mathbf P \\
= \; & \! - \mathbf Q \dot{\mathbf P}  - \mathcal K(\mathbf P, \mathbf Q, t) + \frac{\partial F}{\partial t} + \frac{\partial F}{\partial \mathbf q} \dot {\mathbf q} + \frac{\partial F}{\partial \mathbf P} \dot{\mathbf P}.
\end{aligned}.
$$
由于$\mathbf q, \mathbf P$是独立变量，将系数对应，可得
$$
\mathbf p = \frac{\partial F}{\partial \mathbf q}, \; \mathbf Q = \frac{\partial F}{\partial \mathbf P}, \; \mathcal K = \mathcal H + \frac{\partial F}{\partial t}.
$$

举个例子，我们设
$$
F_2(q, P, t) = q P,
$$
那么有
$$
p = P, q = Q, \mathcal K = \mathcal H,
$$
这个生成函数生成了恒等变换。

### 泊松括号

既然正则变换保持哈密顿方程的形式不变，那么也应当具有一些其他的不变量，泊松括号就是重要的不变量之一。

泊松括号是反交换的双线性形式，定义为
$$
\{ u, v \}_{\mathbf p, \mathbf q} = \sum_{i = 1}^n \left( \frac{\partial u}{\partial q_i} \frac{\partial v}{\partial p_i} - \frac{\partial u}{\partial p_i} \frac{\partial v}{\partial q_i}\right).
$$
泊松括号满足：
$$
\begin{aligned}
\{ u, v \} &= \{ -u, -v \} & \text{（反交换性）} \\
\{ au+bv, w \} &= a\{u, w\} + b\{v, w\} & \text{（双线性）} \\
\{ u, av + bw \} &= a\{u, v\} + b\{u, w\} \\
\{ uv, w \} &= \{u, w\}v + u\{v, w\} & \text{（乘法法则）} \\
\end{aligned}
$$
并且还满足雅可比恒等式：
$$
\{ u, \{ v, w \} \} + \{v, \{ w, u\}\} + \{w, \{u, v\}\} = 0.
$$
{: .definition}

特别地，有
$$\{ q_i, q_j \}_{\mathbf p, \mathbf q} = \{p_i, p_j\}_{\mathbf p, \mathbf q} = 0, \; \{q_i, p_j\}_{\mathbf p, \mathbf q} = \delta_{ij}.$$
此外，泊松括号和哈密顿方程的形式密切相关，注意到
$$\frac{\mathrm d q}{\mathrm d t} = \{q, \mathcal H \}, \; \frac{\mathrm d p}{\mathrm d t} = \{ p, \mathcal H \}.$$

因此，如果哈密顿方程的形式在正则变换下保持不变，泊松括号也应当保持不变。

设有两组广义坐标$(\mathbf p, \mathbf q)$、$(\mathbf P, \mathbf Q)$，满足
$$\mathbf P = \mathbf P(\mathbf p, \mathbf q),\; \mathbf Q = \mathbf Q(\mathbf p, \mathbf q).$$
若变换是限制正则变换，则泊松括号保持不变，即
$$
\{ u, v \}_{\mathbf p, \mathbf q} = \{ u, v \}_{\mathbf P, \mathbf Q} = \{ u, v \}.
$$
因此，泊松括号是正则不变的（Canonical invariant）。
{: .theorem}

这个定理对含时间的正则变换也有效，但是我们只处理限制正则变换的情况。
在此之前，我们需要先证明正则变换的辛条件。

#### 正则变换的辛条件

$$\{ Q_i, Q_j \}_{\mathbf p, \mathbf q} = \{P_i, P_j\}_{\mathbf p, \mathbf q} = 0, \; \{Q_i, P_j\}_{\mathbf p, \mathbf q} = \delta_{ij}.$$

#### 正则变换是辛同胚

#### 刘维尔定理
<!--
### 正则变换与时间

假设$f(\mathbf p(t), \mathbf q(t), t)$是与哈密顿系统状态有关的函数，那么这个函数对时间的变化可写为
$$
\begin{aligned}
\frac{\mathrm d f}{\mathrm d t} &= \frac{\partial f}{\partial \mathbf q} \frac{\partial \mathbf q}{\partial t} + \frac{\partial f}{\partial \mathbf p} \frac{\partial \mathbf p}{\partial t} + \frac{\partial f}{\partial t} \\
&= \frac{\partial f}{\partial \mathbf q} \frac{\partial \mathcal H}{\partial \mathbf p} - \frac{\partial f}{\partial \mathbf p} \frac{\partial \mathcal H}{\partial \mathbf q} + \frac{\partial f}{\partial t} \\
&= \{f, \mathcal H \} + \frac{\partial f}{\partial t}.
\end{aligned}
$$
如果$f$不显含时间，那么有
$$\frac{\mathrm d f}{\mathrm d t} = \{ f, \mathcal H \}.$$
这意味着$f$实际上是一个*流*（Flow）。

如果这个函数是一个守恒量，那么有
$$
0 = \{f, \mathcal H \} + \frac{\partial f}{\partial t},
$$
如果它还不显含时间，则有
$$\{ f, \mathcal H \} = 0.$$

我们不妨假设广义坐标随时间的变化足够光滑，对其在零时间附近做幂级数展开，可得
$$
\begin{aligned}
q(t) &= q(0) + t \frac{\mathrm d q}{\mathrm d t} + \frac{t^2}{2!} \frac{\mathrm d^2 q}{\mathrm d t^2} + \cdots \\
&= q_0 + t \{q_0, \mathcal H\} + \frac{t^2}{2} \{ \{q_0, \mathcal H \}, \mathcal H \} + \cdots \\
&= \exp \left[ - t \{ \mathcal H, \cdot \} \right] q_0.
\end{aligned}
$$
-->

## 哈密顿方程的解

### 例子：带电粒子的运动

### 数值解与辛积分器

我们注意到，哈密顿系统随时间的演化一定是正则变换，因为这相当于对时间的平移。
无论广义坐标如何变化，其一定还是遵守哈密顿方程，因此根据正则变换的物理定义，这一定是正则变换。

在对哈密顿问题求数值解时，如果积分过程依然足够接近正则变换，那么就能保证尽管存在微小的误差，数值系统不会偏离物理系统太远，尤其是能够保证哈密顿量的基本守恒。
这种性质对于大尺度的物理仿真相当重要，因此这种利用正则变换的积分器得到的相当多的应用。
我们知道，正则变换在数学上也叫辛同胚，因此这种积分器也叫做*辛积分器*（Symplectic integrator）。

这一节中，我们主要研究可分哈密顿量的辛积分器。
所谓可分哈密顿量，是指由广义坐标和广义动量函数线性组合形成的哈密顿量，譬如
$$
\mathcal H(\mathbf p, \mathbf q) = T(\mathbf p) + V(\mathbf q),
$$
其中$T,V$分别为动能和势能。

利用泊松括号，我们知道：
$$\dot \eta = (\dot{\mathbf q},\dot{\mathbf p}) = \{ \eta, \mathcal H \},$$
这意味着广义坐标和广义动量是一个*流*（Flow）：
$$\psi(\eta_0, t) = \eta(t) = \exp [ t \left\{ \cdot, \mathcal H \right\} ] \eta_0,$$
这里$\exp$是“矩阵指数”：
$$
\exp [ t \left\{ \cdot, \mathcal H \right\} ] \eta_0 = \eta_0 + t \{ \eta_0, \mathcal H \} + \frac{t^2}{2} \{ \{\eta_0, \mathcal H\}, \mathcal H \} + \cdots
$$

对于可分的哈密顿量，利用泊松括号的线性，有
$$
\eta(t) = \exp [ t (\left\{ \cdot, T \right\} + \left\{ \cdot, V \right\}) ] \eta_0.
$$

我们可以进一步将$t$拆开，以便数值计算。
设$\tau, \nu$为一系列实数，$k$为一自然数，满足
$$
\sum_{i=1}^k \tau_i = \sum_{i=1}^k \nu_i = 1,
$$
则有
$$
\exp [ t (\left\{ \cdot, T \right\} + \left\{ \cdot, V \right\}) ] 
= e^{t \tau_k \left\{ \cdot, T \right\}} e^{t \nu_k \left\{ \cdot, V \right\}} \cdots e^{t \tau_1 \left\{ \cdot, T \right\}} e^{t \nu_1 \left\{ \cdot, V \right\}} + \mathcal O(t^{k+1}),
$$
这一步应用了 Baker–Campbell–Hausdorff 公式。

注意，以上乘积中的每一项：
$$ \exp[t \tau_i \left\{ \cdot, T \right\}] \text{ 和 } \exp[t \nu_i \left\{ \cdot, V \right\}], $$
均是辛同胚，这容易用上文介绍过的方法验证，因此这些变换的复合依然是辛同胚，从而，等式的左右两侧都是辛同胚。

现在我们直接将这个算符指数进行线性化。
注意到
$$\{ \{\eta, T\}, T \} = \{ \{\eta, V\}, V\} = 0, \; \forall \eta,$$
有
$$
\exp[t \tau_i \left\{ \cdot, T \right\}] \eta = \eta + t\tau_i \{\eta, T \}, \;
\exp[t \nu_i \left\{ \cdot, V \right\}] \eta = \eta + t\nu_i \{\eta, V\}.
$$
从而
$$
\exp[t \tau_i \left\{ \cdot, T \right\}] \eta = \begin{pmatrix} \mathbf q + t \tau_i \partial_{\mathbf p} T \\ \mathbf p \end{pmatrix}, \;
\exp[t \nu_i \left\{ \cdot, V \right\}] \eta = \begin{pmatrix} \mathbf q \\ \mathbf p - t \nu_i \partial_{\mathbf q} V \end{pmatrix}.
$$
如果这里的偏微分没有解析形式，那么实现上可以使用差分处理，但是这会引入额外的误差，并且可能使得该积分器不再是辛积分器。

在对典型的质点而言，我们有
$$
\frac{\partial V}{\partial q} = - F, \; \frac{\partial T}{\partial p} = \frac{p}{m},
$$
其中$m$是质量。
此时，一个积分子步可写为
$$
p_i = p_{i-1} + t \nu_i F ,\; q_i = q_{i-1} + t\tau_i \frac{p_i}{m}.
$$
或者等价地：
$$
v_i = v_{i-1} + t \nu_i a, \; x_i = x_{i-1} + t \tau_i v_i.
$$
这种积分方式在数值积分中非常常见，比如半隐式欧拉法（$k=1$）。
对更高阶的积分方法，需要使用 BCH 公式将上面的连乘展开，然后用待定系数法使高次项的系数归零，从而计算积分系数，就像普通的数值积分里利用泰勒展开消去高阶项一样。
Verlet 积分（$k=2$）就是典型的例子。
