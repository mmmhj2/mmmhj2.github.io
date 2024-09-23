---
title: "带边界条件的微分问题"
categories: ["建模与优化"]
---

## 例子：梁的静力学问题

## 线性问题与二次函数

和例子类似，若希望让二次的势能最小，则有以下等价的问题：

在$V\_0 = \left\{ v\in\mathcal C^1([0,1]), v(0) = v(1) = 0 \right\}$中最小化二次势能函数：
$$J(v) = \int_0^1 \frac{k}{2} v'^2 + \frac{c}{2} v^2 - fv \, \mathrm d x, \quad k, c > 0$$
等价于求解以下变分方程：
$$0 = \int_0^1 k u'v' + cuv - fv \, \mathrm d x ,\quad\forall v \in V_0$$
等价于求解以下微分方程：
$$
\left\{
    \begin{aligned}
    - k u'' + c u = f \\
    u(0) = u(1) = 0
    \end{aligned}
\right.
$$
变分方程也称为这个问题的弱形式，即力学中使用的虚功原理；而微分方程则称为强形式。
{: .proposition}

一与二的等价可利用加托导数容易得到。
二与三的等价则借助分部积分法：
$$\int_0^1 k u'v' + cuv - fv \, \mathrm d x = \cancel{k\left[u'v\right]_0^1} + \int_0^1 (- k u'' + cu - f)v \, \mathrm d x$$
{: .proof}

下一个命题则是该命题的更一般的版本。

设$V\_0$为一线性空间，$a$为其上正定的对称二次型，$L$为其上一个线性泛函，则求
$$J(v) = \frac{1}{2}a(v,v) - L(v)$$
的最小值点$u \in V\_0$，等价于求解
$$a(u,v) = L(v), \quad \forall v \in V_0$$
{: .proposition}

计算加托微分：
$$J(u + \lambda v) = J(u) + \lambda(a(u,v) - L(v)) + \frac{\lambda^2}{2} a(v, v)$$
显然，$J$是严格凸的，因为$a(v,v) > 0$。
从而
$$DJ(u)\cdot v = a(u, v) - L(v) = 0$$
时，原式取得最小值。
{: .proof}

## 伽辽金法

### 近似的定义

设$V\_h$是$V\_0$的一个$N$维的*有限维*子空间，则最小值问题
$$
u_h \in V_h, \quad\forall v \in V_h, \quad J(u_h) \le J(v)
$$
与其等价的弱形式
$$
u_h \in V_h, \quad\forall v \in V_h, \quad a(u_h, v) = L(v)
$$
是原问题
$$
u \in V_0, \quad\forall v \in V_0, \quad J(u) \le J(v)
$$
的近似。
{: .definition}

魏尔施特拉斯逼近定理说明了两个常用的有限维子空间：多项式空间与三角多项式空间。

设$V\_h$的基底为$w\_i(x)$，则原问题的近似可转化为$N$个线性方程组：
$$\sum_{j = 1}^N a(w_j, w_i) u_j = L(w_i), \quad i \in [\![0, N]\!] \iff AU = F$$
其中$u\_j$是$u\_h$在基底$w\_j$下的坐标，$A$是对称的正定矩阵，且
$$A_{i,j} = a(w_i, w_j), U = (u_1, \dots, u_N)^\top, F = (L(w_1), \dots, L(w_N))^\top$$
{: .proposition}

将原问题写为该基底下坐标形式即可得证。
{: .proof}
