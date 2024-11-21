---
title: "现代控制理论概观"
categories: ["控制理论"]
---

本文将聚焦于大规模使用线性代数来研究线性系统的现代控制理论。

## 状态空间与矩阵

在之前的研究中，我们通常通过传递函数来研究线性系统的性质。
然而，传递函数往往是复杂的非线性函数，且只能研究单输入、单输出系统，这为我们研究其性质带来诸多不利。
随着以线性代数为代表的应用数学的进一步发展，我们现在可使用向量空间中的诸多工具来研究系统。

### 状态与状态方程

对一个系统，若其全部状态都可由最小的一组系统中的变量来表示，则这组变量称为该系统的*状态变量*（State variables）。
状态变量的集合构成一个线性空间，称为系统的*状态空间*（State space），力学中也称相空间（Phase space）。
{: .definition}

对$n$阶的线性系统，状态空间通常为$n$维；
若线性系统的传递函数约分后分母为$m$次，则状态空间为$m$维。

线性系统在$n$维状态空间中可由以下两个方程组成的动力系统完全描述：
$$
\left\{
\begin{aligned}
\dot x(t) & = A(t) x(t) + B(t) u(t) \\
y(t) &= C(t) x(t) + D(t) u(t)
\end{aligned}
\right.
$$
其中$x \in \mathbb R^n$是状态空间中系统的状态向量，$u \in \mathbb R^m$是系统的输入向量，也称控制向量，$y \in \mathbb R^p$是系统的输出向量。
这两个方程统称*状态方程*（State equations），第一个方程可单独称为*状态方程*，第二个方程称为*输出方程*。
这种表示方式称为系统的*状态空间表示*（State-space representation）。
{: .definition}

矩阵$A,B,C,D$分别称为状态矩阵（state matrix，也称系统矩阵，system matrix）、输入矩阵（input matrix）、输出矩阵（output matrix）和前馈矩阵（feedforward matrix）。

![](/assets/system/Typical_State_Space_model.svg){: .center-image}

上图展示了典型的状态空间表示的系统的方块图。

若系统是离散时的，那么状态方程将由微分方程变为差分方程。
若系统是时不变的，那么四个矩阵将均与时间无关，此时状态方程可写为
$$
\left\{
\begin{aligned}
\dot x(t) & = A x(t) + B u(t) \\
y(t) &= C x(t)+ D u(t)
\end{aligned}
\right.
$$
我们一般研究这种形式的状态方程。

注意，对同一系统，状态变量的选择并不是唯一的，而即使状态变量的选择固定了，状态方程的矩阵也不是唯一的。
例如，简单地对矩阵和向量进行初等变换，即可得到等价的新的状态变量和矩阵。

### 状态空间表示的转化

本节中我们将研究线性系统的状态空间表示与其他表示方式的转化。

#### 微分方程

首先考虑由微分方程定义的系统
$$
\begin{multline}
x^{(n)} + a_{n-1} x^{(n-1)} + \cdots + a_1 \dot x + a_0 x = u \\
\iff x^{(n)} = - a_{n-1} x^{(n-1)} - \cdots - a_1 \dot x - a_0 x + u
\end{multline}
$$
该系统的传递方程为
$$
H(p) = \frac{1}{p^n + a_{n-1} p^{n-1} + \cdots + a_0}
$$

利用微分方程递降的技巧，我们可取状态向量为
$$
\mathbf x = \begin{bmatrix}
x & \dot x & \cdots & x^{(n-1)}
\end{bmatrix}^T
$$
于是整个微分方程可写为
$$
\mathbf {\dot x} = \begin{bmatrix}
0 & 1 & 0 & \cdots & 0 \\
0 & 0 & 1 & \cdots & 0 \\
\vdots & \vdots & \vdots & \ddots & \vdots \\
-a_0 & -a_1 & -a_2 & \cdots & a_{n-1}
\end{bmatrix} \mathbf x + u \begin{bmatrix} 0 \\ \vdots \\ 0 \\ 1 \end{bmatrix}
$$
这就是系统的状态方程。
该系统的输出为$x$，因此输出方程为
$$
y = \begin{bmatrix} 1 & 0 & \cdots & 0 \end{bmatrix} \mathbf x
$$

#### 一般的传递函数

考虑一般的传递函数
$$
H(p) = \frac{N(p)}{D(p)} = \frac{b_m p^m + b_{m-1} p^{m-1} + \cdots + b_1 p + b_0}{p^n + a_{n-1} p^{n-1} + \cdots + a_1 p + a_0},
$$
对因果系统，要求$m \le n$。
我们将该传递函数拆成两个部分：
$$
H_1(p) = \frac{1}{D(p)},\; H_2(p) = N(p),
$$
从而在时域上，令整个系统的输入和输出为$e(t)$和$s(t)$，有，
$$
\begin{aligned}
e(t) &= s_1^{(n)}(t) + a_{n-1} s_1^{(n-1)}(t) + \cdots + a_1 s_1 + a_0 \\
s(t) &= b_m s_1^{(m)}(t) + b_{m-1} s_1^{(m-1)}(t) + \cdots + b_1 s_1 + b_0
\end{aligned}
$$
其中$s\_1$是第一个系统$H\_1$的输出。

我们取$s\_1$及其高阶导数为状态变量，即
$$
\mathbf x = \begin{bmatrix}
s_1 & \dot s_1 & \cdots & s_1^{(n-1)}
\end{bmatrix}^T
$$
则状态方程与上一节介绍的微分方程的矩阵是完全一致的，即
$$
\mathbf {\dot x} = \begin{bmatrix}
0 & 1 & 0 & \cdots & 0 \\
0 & 0 & 1 & \cdots & 0 \\
\vdots & \vdots & \vdots & \ddots & \vdots \\
-a_0 & -a_1 & -a_2 & \cdots & a_{n-1}
\end{bmatrix} \mathbf x + e \begin{bmatrix} 0 \\ \vdots \\ 0 \\ 1 \end{bmatrix},
$$
但输出方程有所不同，有
$$
y = \begin{bmatrix}b_0 & b_1 & \cdots & b_m & 0 & \cdots\end{bmatrix} \mathbf x.
$$

一个传递函数可对应无穷多的状态空间表示，而此处给出的状态空间表示称为*可控正则型*（Controllable canonical form），在研究可控性时尤其有用。
一个状态空间表示的系统对应的传递函数，叫做该系统的一个*实现*（Realization）。

##### 裂项的传递函数

若传递函数是已经裂项的，即具有
$$
H(p) = \sum_{i=1}^n\frac{a_i}{p - \lambda_i}
$$
的形式，那么整个系统可视为多个一阶系统的求和，此时系统的状态可由所有一阶系统的输出组成，而状态空间表示可简单地写为
$$
\left\{
    \begin{aligned}
        \dot{\mathbf x} &= \begin{bmatrix} \lambda_1 & 0 & \cdots & 0 \\
        0 & \lambda_2 & \cdots & 0 \\
        \vdots & \vdots & \ddots & \vdots \\
        0 & 0 & \cdots & \lambda_{n}
        \end{bmatrix} \mathbf x + e \begin{bmatrix} 1 \\ 1 \\ \vdots \\ 1
        \end{bmatrix} \\
        y &= \begin{bmatrix} a_1 & a_2 & \cdots & a_n \end{bmatrix} \mathbf x
    \end{aligned}
\right..
$$

##### 分解的传递函数

若传递函数已经被因式分解了，即具有
$$
H(p) = \frac{1}{\prod_{i=1}^n (p - \lambda_i)}
$$
的形式，那么原系统可看作$n$个一阶系统的级联。
此时我们将这些一阶系统的输出视为状态变量，则系统的状态空间表示为
$$
\left\{
    \begin{aligned}
        \dot{\mathbf x} &= \begin{bmatrix} \lambda_n & 1 & \cdots & 0 \\
        0 & \lambda_{n-1} & \cdots & 0 \\
        \vdots & \vdots & \ddots & \vdots \\
        0 & 0 & \cdots & \lambda_1
        \end{bmatrix} \mathbf x + e \begin{bmatrix} 0 \\ \vdots \\ 0 \\ 1
        \end{bmatrix} \\
        y &= \begin{bmatrix} 1 & 0 & \cdots & 0 \end{bmatrix} \mathbf x
    \end{aligned}
\right..
$$

### 状态空间表示的时域响应

欲求解状态空间表示的系统的时域响应，则需要求解由状态方程表示的微分方程组。

首先考虑没有输入的情况。
[之前的文章]({% post_url structure-mechanics/2024-03-30-rayleigh-ritz-method %}#附录常系数微分方程组的解)中，我们介绍过，微分方程
$$
\mathbf {\dot x} = A \mathbf x
$$
的解与基解矩阵
$$
\exp [At] = \sum_{k=0}^{\infty} \frac{A^k t^k}{k!}
$$
密切相关，这个矩阵也叫做系统的*状态转移矩阵*（State transition matrix）。
若该矩阵能够求出，则方程的解可写为
$$
x(t) = \exp [A(t - t_0)] x(t_0),
$$
而这就是系统对空输入的时域响应。

对非空输入的时域响应，我们可使用以下命题。

设系统的输入为$u(t)$，其在某一时刻$t\_0$的状态$x(t\_0)$已知，则在状态空间表示中系统的时域响应为
$$x(t) = \exp[A(t - t_0)] x(t_0) + \int_{t_0}^t \exp[A(t - \tau)] B u(t) \, \mathrm d \tau$$
输出为
$$
\begin{multline}
y(t) = Cx(t) + Du(t) \\ 
= C\exp[A(t - t_0)] x(t_0) + \\ C\int_{t_0}^t \exp[A(t - \tau)] B u(t) \, \mathrm d \tau + Du(t)
\end{multline}
$$
{: .proposition}

考虑状态方程
$$\dot x(t) = A x(t) + B u(t)$$
移项，两边同时乘$\exp[-At]$，得到
$$\exp[-At] \dot x(t) - \exp[-At] A x(t) = \exp[-At]Bu(t)$$
注意到
$$\exp[-At] \dot x(t) - \exp[-At] A x(t) = \frac{\mathrm d}{\mathrm d t}\exp[-At] x(t)$$
从而原方程可改写为
$$\frac{\mathrm d}{\mathrm d t}\exp[-At] x(t) = \exp[-At]Bu(t)$$
两边同时积分，原式即得证。
{: .proof}

### 系统矩阵的特征值

## 能控性与能观性
