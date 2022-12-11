---
layout: post
title: "多元函数的微分"
categories: 
---

$$
\newcommand{d}{\mathrm{d}}
\newcommand{RR}{\mathbb{R}}
$$

本文中我们将考虑如何把一元函数的导数拓展到更高维。

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

### 偏导数

### 高阶偏导

### 雅可比矩阵与行列式

## 泰勒展开
