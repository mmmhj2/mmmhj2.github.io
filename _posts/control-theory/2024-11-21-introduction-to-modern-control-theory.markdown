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
H(s) = \frac{1}{s^n + a_{n-1} s^{n-1} + \cdots + a_0}
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

## 能控、能观与稳定性
