---
title: "动力系统的稳定性"
categories: ["微分方程", "数学建模"]
---

本文中我们将研究动力系统的稳定性。

## 动力系统

### 动力系统的基本定义

*动力系统*是在给定状态空间$S$与时间集合$T$上的一个映射：
$$ D: \; S \times T \, \to \, S $$
对给定的当前状态$s$和时间$t$，该映射给出下一个状态$D(s,t)$。
{: .definition}

若时间集合是可数的（这通常意味着整数或自然数集合），那么这个系统称为*离散*的；否则（这通常意味着实数集合），这个系统称为*连续*的。
如果映射是决定性的，即对于每个输入给出确定的输出，那么这个系统称为*确定的*；否则称为*随机的*。

通常，动力系统可用微分或差分系统来描述。
这个系统的解，即其状态的集合，称为这个系统的轨迹或轨道。

即使对于非常简单的动力系统，求出系统的解析解也往往是非常困难的。
因此，我们通常要么使用数值方法，要么定性地对系统进行研究。
而定性研究的最重要部分之一就是平衡点及其稳定性。

#### 动力系统的描述

对连续动力系统，我们通常使用自治的微分方程进行描述：
$$
\left\{
    \begin{array}{c}
        \frac{\mathrm d x_1}{\mathrm d t} = \frac{P_1 (u_1, \dots, u_m, x_1, \dots, x_n)}{Q_1 (u_1, \dots, u_m, x_1, \dots, x_n)} \\
        \cdots \, \cdots \\
        \frac{\mathrm d x_n}{\mathrm d t} = \frac{P_n (u_1, \dots, u_m, x_1, \dots, x_n)}{Q_n (u_1, \dots, u_m, x_1, \dots, x_n)} \\
        \Omega(u_1, \dots, u_m, x_1, \dots, x_n)
    \end{array}
\right.
$$
我们假设$P\_i$是多项式，$Q\_i$是不为零的多项式，系数均为有理数。
$\Omega$代表了一系列等式或不等式，表示对系统的约束。
变量$u\_m$表示系统的参量，与时间无关，而$x\_n$则是关于时间的函数。

对离散系统，我们则使用差分方程组：
$$
\left\{
    \begin{array}{c}
        x_1(t+1) = \phi_1 (u_1, \dots, u_m, x_1(t), \dots, x_n(t)) \\
        \cdots \, \cdots \\
        x_n(t+1) = \phi_n (u_1, \dots, u_m, x_1(t), \dots, x_n(t)) \\
        \Omega(u_1, \dots, u_m, x_1, \dots, x_n)
    \end{array}
\right.
$$

我们用黑粗体表示向量，从而定义：
$$\mathbf{u} = (u_1, \dots, u_m), \; \mathbf{x} = (x_1, \dots, x_n)$$
对离散系统，我们还设：
$$\boldsymbol{\phi} = (\phi_1, \dots, \phi_n)$$

### 平衡点

通常，系统的状态会随时间变化而变化。
然而，有些时候，系统存在一些状态不会进一步改变，这些状态就称为平衡点。
更正式地说，我们定义：

给定一组参量$\mathbf{u} = \mathbf{\overline{u}}$。
对连续系统，点$\mathbf{\overline{x}}$称为系统的*平衡点*（或不动点、奇点），若其满足所有约束$\Omega$，且：
$$P_1(\mathbf{\overline{u}}, \mathbf{\overline{x}}) = \cdots = P_n(\mathbf{\overline{u}}, \mathbf{\overline{x}}) = 0, \; Q_1(\mathbf{\overline{u}}, \mathbf{\overline{x}}) \, \cdots \, Q_n(\mathbf{\overline{u}}, \mathbf{\overline{x}}) \neq 0$$
对离散系统，若点$\mathbf{\overline{x}}$满足约束且是函数$\boldsymbol{\phi}$的不动点即可。
{: .definition}

稳定性总是和平衡点成对出现，我们只关心某个平衡点处的稳定性。

## 连续系统的李雅普诺夫稳定性

对任何给定的参量$\mathbf{u} = \mathbf{\overline{u}}$，平衡点$\mathbf{\overline{x}}$是*（李雅普诺夫）稳定*的，若：
$$
\begin{multline}
    \forall \varepsilon > 0, \, t_0 > 0, \; \exists \delta > 0 \; \text{s.t.} \; \forall t > t_0 \\
     \Vert \mathbf{x}(t_0) - \mathbf{\overline{x}} \Vert < \delta \implies \Vert \mathbf{x}(t) - \mathbf{\overline{x}} \Vert < \varepsilon
\end{multline}
$$
更进一步地，其为*渐进稳定的*，若其是稳定的，且：
$$\exists \delta^\prime > 0 \; \text{s.t.} \; \Vert \mathbf{x}(t_0) - \mathbf{\overline{x}} \Vert < \delta^\prime \implies \lim_{t \to \infty} \mathbf{x}(t) = \mathbf{\overline{x}} $$
{: .definition}

这就是说，平衡点是稳定的，若系统的状态足够接近平衡点（距离小于$\delta$）时，就会被这个点“吸引”，从而在之后的时间中任意地接近它（距离小于$\varepsilon$）。
对渐进稳定，还要求状态趋向这个平衡点，而不只是足够接近它。

值得注意的是，稳定性并不要求从任何状态开始都接近这个平衡点，而仅仅要求平衡点“吸引”附近的状态。
这意味着系统的状态完全可以不靠近任何一个平衡点。
这样的稳定性只在平衡点局部有意义，因此称为*局部稳定性*，也是我们主要关注的稳定性。

如果从任何初始状态开始，而不局限于一个平衡点周围进行稳定性研究，那么这种被研究的稳定性称为*全局稳定性*。
下面介绍的方法都不足以判定全局稳定性，这种稳定性通常利用相轨线等需要单独分析。

### 李雅普诺夫第一方法

李雅普诺夫第一方法主要研究系统的一阶导数，因此也称线性化方法。
对上述具有$n$个状态变量的系统，其雅可比矩阵为：
$$
\mathbf{J}(\mathbf u, \mathbf x) = 
\begin{pmatrix}
    \nabla \frac{P_1}{Q_1} \\
    \vdots \\
    \nabla \frac{P_n}{Q_n}
\end{pmatrix}
=
\begin{pmatrix}
    \frac{\partial \frac{P_1}{Q_1}}{\partial x_1} & \cdots & \frac{\partial \frac{P_1}{Q_1}}{\partial x_n} \\
    \vdots & \ddots & \vdots \\
    \frac{\partial \frac{P_n}{Q_n}}{\partial x_1} & \cdots & \frac{\partial \frac{P_n}{Q_n}}{\partial x_n}
\end{pmatrix}
$$
从而其在平衡点$\mathbf{\overline{x}}$附近的导数向量可以写为：
$$\left( \frac{\mathrm d \mathbf x}{\mathrm d t} \right)^\top = \mathrm{J}(\mathbf{\overline{u}}, \mathbf{\overline{x}}) (\mathbf x - \mathbf{\overline{x}})^\top + \mathbf G$$
其中
$$\mathbf G = \mathcal{o}(\Vert \mathbf{x} - \mathbf{\overline{x}}\Vert)$$
是余项，表示更高阶的导数，正如泰勒展开中那样。

那么，系统的局部稳定性由以下定理指出：

1. 若平衡点处雅可比矩阵的所有特征值的实部小于零，那么这个平衡点是渐近稳定的；
2. 若平衡点处雅可比矩阵的特征值的实部至少有一个大于零，那么这个平衡点是不稳定的；
3. 若不满足以上两条之一，即系统的所有特征值的实部小于等于零，但存在实部为零的特征值，则这个平衡点是一个*分叉点*（Bifurcation point），该方法不能确定平衡点的稳定性。
    - 特别地，如果系统的所有特征值实部均为零，那么这个平衡点被称为*双曲平衡点*（Hyperbolic equilibrium point）
{: .theorem}

然而，解析地确定一个系统的平衡点往往是非常困难的，更不必说计算其雅可比矩阵了。
为此，可以使用李雅普诺夫第二方法简化运算。

### 李雅普诺夫第二方法

李雅普诺夫第二方法通过构造一个平衡点邻域附近的连续可微函数来实现对稳定性的判定。

设$\mathcal B$为平衡点$\overline {\mathbf x}$附近的一个邻域，$V: \mathcal B \to \mathbb R$为一任意连续可微函数。
若$V$是正定的，即：
$$V(\overline {\mathbf u}, \overline {\mathbf x}) = 0 \;  \text{且} \; \forall \mathbf x \in \mathcal B \backslash \{ \overline{\mathbf x}\}, V(\overline{\mathbf u}, \mathbf x) > 0$$
则系统在该平衡点处的稳定性可以由以下方法判定：\
若$V$的时间导数是*半负定*的，即：
$$ \frac{\mathrm d}{\mathrm d t} V(\overline {\mathbf u}, \mathbf x)|_{\mathbf x = \overline {\mathbf x}} = 0 \;  \text{且} \; \forall \mathbf x \in \mathcal B \backslash \{ \overline{\mathbf x}\}, \frac{\mathrm d}{\mathrm d t} V(\overline{\mathbf u}, \mathbf x) \le 0$$
则该系统是李雅普诺夫稳定的； \
若$V$的时间导数是*负定*的，则该系统是渐进稳定的。
{: .theorem}

满足定理要求的这种函数称为**李雅普诺夫函数**。

如果系统的状态$\mathbf x$是实数，即$\mathbf x \in \mathbb R^n$，那么若存在$\mathbb R^n$上一个满足定理要求的李雅普诺夫函数，这个定理即可用来判定系统的全局稳定性。

李雅普诺夫函数若存在，那么该系统就一定是稳定的。
然而构造李雅普诺夫函数并非易事，且很难通过该定理证明一个平衡点是不稳定的，因为不能通过人力找到一个符合条件的李雅普诺夫函数并不意味着这种函数不存在。

## 局部稳定性分析

我们此处介绍一些李雅普诺夫第一方法的简单推广，用来协助判定简单的系统的稳定性。
通过这些方法，我们可以将求解矩阵特征值的问题化简为简单的代数问题。

### 二维系统

我们通过分类讨论来解决二阶系统的稳定性。
所有二阶系统的雅可比矩阵均可写为：
$$\mathbf J(\overline{\mathbf u}, \overline{\mathbf x}) =
\begin{pmatrix}
a & b \\
c & d 
\end{pmatrix}$$
这个矩阵的特征值为特征多项式：
$$\lambda^2 +p\lambda + q, \; p = -(a+d), q = ad-bc$$
的零点。
设$\Delta$为该多项式的判别式，则稳定性可按如下方法判定：

- 若$p > 0, q > 0$，则该系统是稳定的。
    - 若$\Delta \ge 0$，该点称为**稳定节点**；
    - 若$\Delta < 0$，该点称为**稳定焦点**。
- 若$p < 0, q > 0$，则该系统是不稳定的。
    - 若$\Delta \ge 0$，该点称为**不稳节点**；
    - 若$\Delta < 0$，该点称为**不稳焦点**。
- 若$q < 0$，则该系统是不稳定的，该点称为**不稳鞍点**。
- 若两者之中至少一个等于零，则该方法不能判定系统的稳定性。
    - 特别地，若两者至少一个等于零，且另一个大于等于零，那么该点称为**分叉点**。


### 高阶系统：劳斯-赫尔维茨判据

本节中我们将介绍使用赫尔维茨矩阵判定系统的稳定性。
这个稳定性判据和线性时不变系统的劳斯表判据是等价的。

设平衡点处的雅可比矩阵的特征多项式为：
$$a_n \lambda^n + a_{n-1} \lambda^{n-1} + \cdots + a_0$$
则定义赫尔维茨矩阵为一个n行n列的矩阵：
$$H = \begin{pmatrix}
a_{n-1} & a_{n-3} & a_{n-5} & \cdots & a_{n-(2n-1)} \\
a_n     & a_{n-2} & a_{n-4} & \cdots & a_{n-(2n-2)} \\
0       & a_{n-1} & a_{n-3} & \cdots & a_{n-(2n-3)} \\
0       & a_{n}   & a_{n-2} & \cdots & a_{n-(2n-4)} \\
\vdots  & \vdots  & \ddots  & \ddots & \vdots \\
0       & 0       & 0       & 0      & a_{n-1} \\
0       & 0       & 0       & 0      & a_{n} \\
\end{pmatrix}$$
其中下标小于零的数认为为零。
{: .definition}

那么系统的稳定性可由以下定理判定：

系统在平衡点处稳定当且仅当其赫尔维茨矩阵的顺序主子式均大于零。
{: .theorem}

