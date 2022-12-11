---
layout: post
title: "多元函数的微分"
categories: 
---

$$
\newcommand{d}{\mathrm{d}}
\newcommand{RR}{\mathbb{R}}
\newcommand{NN}{\mathbb{N}}
$$

本文中我们将考虑如何把一元函数的导数拓展到更高维。

我们在这篇文章中主要考虑有限维的实数向量空间。
相同的理论也可以应用在矩阵上。

## 微分映射

我们类比一元函数可导的定义来给出可微的定义。

设$a \in U \subset \RR^n$，$U$为一开集合。称映射$f: U \to \RR^p$在$a$点**可微(differentiable)**若存在一线性映射
$\varphi \in \mathcal{L} (\RR^n, \RR^p)$使得当$h \to 0$时，有
$$
f(a+h) = f(a) + \varphi(h) + \mathcal{o}(\Vert h \Vert)
$$
若$\varphi$存在，则其唯一，且称为$f$在$a$点的**微分**，记为$\d f_a$。
若函数在某个开集合$V$上所有点都可微，则称其在这个集合上可微。
记映射$\d f : V \to \mathcal{L} (\RR^n, \RR^p) , \; a \mapsto \d f_a$为函数的**微分映射**。
若这个映射连续，则称原映射$f \in \mathcal{C}^1$
{: .definition}

考虑在带有代数范数的矩阵空间上的乘法$f: \mathcal M_n(\RR)^2 \to \mathcal M_n(\RR), \; (X,Y) \mapsto X \times Y$，这个映射是可微的。
$$
\begin{aligned}
\forall (H, K) \in \mathcal M_n(\RR)^2 \\
f(X + H, Y + K)
&= (X+H) \times (Y+K) \\
&= XY + \underbrace{XK + HY}_{\text{线性的}} + HK
\end{aligned}
$$
我们知道$\Vert HK \Vert \le \Vert H \Vert \times \Vert K \Vert$，因为代数范数是次乘法的。
所以$\Vert HK \Vert \le \max(\Vert H \Vert, \Vert K \Vert)^2$，因此趋于零时满足上述定义。
其微分为$\d f_{(X,Y)}(K,H) = XK+HY$。
{: .exampl}

如果一个函数在某点可微，那么它一定在该点连续。

### 梯度

### 微分的性质

微分和一元函数的导数具有许多类似的性质。

设$f,g \in U \to \RR^p$，$U \in \RR^n$为一开集合，且$f,g$在$a \in U$处可微，则$\forall \lambda \in R$，
$f+g$和$\lambda f$都在$a$处可微，且$\d (f+g)_a = \d f_a+\d g_a$、$\d (\lambda f)_a = \lambda \d f_a$。
$f \cdot g$也在$a$处可微，且$\d (f \cdot g)_a = \d f_a \cdot g(a)+\d g_a \cdot f(a)$。
注意如果在非交换环（如矩阵空间）上，则乘法的顺序不能交换。
{: .proposition}

设$U \subset \RR^n , \; V \subset \RR^p$为两个开集合，$f: U \to \RR^p, \; g: V \to \RR^q, \; f(U) \subset V$。
若$f$在$a \in U$可微，$g$在$f(a) \in V$可微，那么$g \circ f$在$a$可微，且$\d (g \circ f)_a = \d g_{f(a)} \circ \d f_a$。
{: .proposition}

## 偏导数

### 方向导数

设$n,p \in \NN^\*$，$U \in \RR^n$为一开集合。$f:U \to \RR^p, \; a \in U, \; v \in \RR^n$。
若实值映射$\varphi: t \mapsto f(a+tv)$在$t=0$处**可导**，则称$f$在$a$处沿向量$v$可导。我们记：
$$
f_v^\prime(a) = \varphi^\prime(0) = \lim_{t \in 0, t \neq 0} \frac{f(a+tv) - f(a)}{t}
$$
{: .definition}

若函数$f$在$a$处**可微**，则其在$a$处沿任何向量都**可导**，且$f_v^\prime (a) = \d f_a(v)$。
其逆命题并不成立，这就是说，即使函数在该点沿任何向量可导，其不一定可微，实际上，它甚至不一定在该点处连续。
{: .proposition}

我们考察函数$f(x,y) = \left\\{ \begin{aligned} \frac{y^2}{x} &, x \neq 0 \\\\ y &, x = 0 \end{aligned} \right.$：
其在$(0,0)$沿任意向量$(u,v)$的导数：
$$
\frac{f(t(u,v)) - f(0,0)}{t} = \frac{1}{t} \times f(tu, tv) = \left\{
\begin{aligned}
&\frac{u^2}{v} &, u \neq 0 \\
&v &, u = 0
\end{aligned}
\right.
$$
因此其任何方向的导数都是存在的。
但是其并不在$(0,0)$处连续。
对多元函数而言，其连续意味着任何足够接近该点（距离足够小）的向量的函数值都可以足够接近这个点的函数值。
然而：
$$
f(h^4,h) = \frac{h^2}{h^4} = \frac{1}{h^2} \to + \infty \qquad h \to 0
$$
这说明存在一个向量不满足上述条件，因此这个函数在该点并不连续，从而也不可微。
{: .exampl}

### 偏导数

设$f: U \subset \RR^n \to \RR^p$，$U$为一开集。设$a \in U$为其上一点，$(e_1, e_2, \dots, e_n)$为$\RR^n$的标准基底。
若对于$i = 1, 2, \dots, n$，$f$在$a$点沿$e_i$可导，则我们称$f$在$a$点有第$i$**偏导数**，记
$$
\frac{\partial f}{\partial x_i}(a) = f_{e_i}^\prime(a) = \lim_{t \to 0, t \neq 0} \frac{f(a+t e_i) - f(a)}{t}
$$
{: .definition}

注意和方向导数一样，所有偏导数存在并不意味着可微，甚至不意味着函数连续。

为介绍可微和可导的关系，我们先引入对偶基底的概念：

设$(e_1, e_2, \dots, e_n)$为空间$E$的一组基底，则所有空间中的向量都可以写成基底的线性组合：
$$
x = \sum_{i=1}^{n} x_i e_i = \sum_{i=1}^{n} e^*_i(x) e_i 
$$
由线性函数$(e^\*\_1, e^\*\_2, \dots, e^\*\_n)$组成的基底就是对偶基底。
更严格的说，这是线性函数$e^\*\_i(e\_j) = \delta\_{i,j}$组成的基底。
这个基底张成的空间称作对偶空间，对偶空间内含有原空间上的所有线性函数（像为标量）。
{: .definition}

若函数$f: U \subset \RR^n \to \RR^p$，$U$为开集合，在某一点$a \in U$处可微，那么所有偏导数$\frac{\partial f}{\partial x_i}(a)$存在，且
$$
\d f_a = \sum_{i=1}^n \frac{\partial f}{\partial x_i} (a) \d x_i
$$
其中$\d x_i$为标准基底的对偶基底。
这说明：
$$
\d f_a (h) = \sum_{i=1}^n \frac{\partial f}{\partial x_i} (a) h_i
$$
{: .proposition}

设$f: U \subset \RR^n \to \RR^p$，$U$为开集合。
若其在$a \in U$点所有偏导数存在，且其偏导数**连续**，那么$f$在$a$处可微，且
$$
\d f_a = \sum_{i=1}^n \frac{\partial f}{\partial x_i} (a) \d x_i
$$
但是逆命题并不一定成立：
虽然可微表示其所有偏导数存在，但是偏导数不一定连续。
{: .theorem}

考察函数$f(x) = \left\\{ \begin{aligned} & x^2 \sin \left( \frac{1}{x} \right) &, x \neq 0 \\\\ & 0 &, x = 0 \end{aligned} \right.$。
这是个一元函数，所以可微和可导相同，微分和偏导相同。
先利用定义求其在零处的导数：
$$
\lim_{x \to 0, x \neq 0} \frac{f(x) - f(0)}{x} = \lim x \sin \left( \frac{1}{x} \right) = 0
$$
因此其在零处可导可微。
但是其偏导数在非零处为$f^\prime(x) = 2 x \sin \left( \frac{1}{x} \right) - \cos \left( \frac{1}{x} \right)$，其在零点没有极限，从而不连续。
{: .exampl}

### 高阶偏导

我们以归纳的方式定义高阶偏导：
$$
\frac{\partial^p f}{\partial x_{i_p} \partial x_{i_{p-1}} \cdots \partial x_{i_1}}
= \frac{\partial}{\partial x_{i_p}} \frac{\partial^{p-1} f}{\partial x_{i_{p-1}} \cdots \partial x_{i_1}}
$$
若映射$f: U \subset \RR^n \to \RR^p$满足$p$阶偏导数存在且连续（从而可微），那么称$f \in \mathcal C^p$。
{: .definition}

设$f: U \subset \RR^2 \to \RR$，$U$为开集。
若$f$的二阶偏导数$\frac{\partial^2 f}{\partial x \partial y}$和$\frac{\partial^2 f}{\partial y \partial x}$在$U$上存在，
且其在$a$点处连续，那么有：
$$
\frac{\partial^2 f}{\partial x \partial y} (a) = \frac{\partial^2 f}{\partial y \partial x}(a)
$$
这一定理称为Schwarz定理。
{: .theorem}

这一定理也可以拓展到高阶情形。
若$f \in \mathcal C^p$，则其$p$阶偏导数和求导顺序无关。

### 雅可比矩阵与行列式

设$f: U \subset \RR^n \to \RR^m$，$U$为一开集合。
若$f$在某点$a \in U$可微。
设$\RR^n$和$\RR^m$的标准基底为$(e_1, \dots , e_n)$、$(e_1^\prime, \dots , e_m^\prime)$。
则$f$可写为$f = \sum_{i=1}^{m} f_i e^\prime_i$，$f_i: U \to \RR$。有：
$$
\forall j = 1, \dots , n \quad
\d f_a(e_j) = \sum_{i=1}^n \d (f_i)_a (e_j) e_i^\prime = \sum_{i=1}^n \frac{\partial f_i}{\partial x_j} (a) e_i^\prime
$$
那么$\d f_a$在标准基底下的矩阵可写为一个$m$行$n$列的矩阵：
$$
J_a = \begin{pmatrix}
\frac{\partial f_1}{\partial x_1} & \frac{\partial f_1}{\partial x_2} & \cdots & \frac{\partial f_1}{\partial x_n} \\
\frac{\partial f_2}{\partial x_1} & \frac{\partial f_2}{\partial x_2} & \cdots & \frac{\partial f_2}{\partial x_n} \\
\vdots & \vdots & \ddots & \vdots \\
\frac{\partial f_m}{\partial x_1} & \frac{\partial f_m}{\partial x_2} & \cdots & \frac{\partial f_m}{\partial x_n} \\
\end{pmatrix}
$$
这个矩阵称为**雅可比矩阵**，如果这个矩阵是方阵，其行列式称为**雅可比行列式**。
{: .definition}

## 泰勒展开
