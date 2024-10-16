---
title: "计算微分"
categories: ["建模与优化"]
---

## 导论：经典函数的微分

本节主要复习此前学习的微分的概念。

### 多元函数的微分

设
$$F(\vec x) = F(x_1, \dots, x_n) \in \mathcal C^1(\mathbb R^n)$$
则其在坐标$i$上的偏微分（偏导数）表示其值沿坐标基底$\vec e_i$方向的变化速率：
$$\frac{\partial F}{\partial x_i} = \frac{\partial F(x_1, \dots, x_i, \dots x_n)}{\partial x_i}$$
该函数的梯度记为
$$
\nabla F = \begin{bmatrix}
\frac{\partial F}{\partial x_1} \\
\vdots \\
\frac{\partial F}{\partial x_n}
\end{bmatrix}
$$
{: .definition}

多元函数$F(\vec x)$在某一向量$\vec h \in \mathbb R^n$方向上的方向导数为
$$
\left< \nabla F, \vec h \right> = \left. \frac{\mathrm d F(\vec x + \lambda \vec h)}{\mathrm d \lambda} \right\vert_{\lambda = 0}
$$
该函数是一个关于$\vec h$的线性函数，其变换仅与$x$有关，记为$DL(x)$：
$$\left< \nabla F, \vec h \right> = DL(x) \cdot \vec h$$
{: .definition}

## 广义微分

### 弗雷歇微分

设$V,W$为二赋范空间，则映射$f: V \to W$是在$x \in V$处是弗雷歇可微的（Fréchet differentiable），若存在映射$Df: V \to B(V,W)$，其中$B$表示有界线性算子空间，满足：
$$f( x + h) = f( x) + Df( x) \cdot  h + \epsilon( h) \Vert \vec h \Vert, \quad \forall h \in V$$
且
$$\lim_{h \to 0} \Vert \epsilon(h) \Vert = 0$$
或者，写成极限的形式：
$$\lim_{h \to 0} \frac{\Vert f(x + h) - f(x) - Df(x) \cdot h \Vert_W}{\Vert h \Vert_V} = 0$$
特别地，若$W = \mathbb R$，则$Df(x)$是一个线性函数；
若$V = W = \mathbb R$，则
$$Df(x): h \mapsto f'(x) h$$
若$Df$关于$x$连续，则记$f \in \mathcal C^1$。
{: .definition}

显然，若函数弗雷歇可微，那么其一定是连续的。

注意$Df$是一个从向量$x$到$x$处导数的线性映射，而$Df(x)$本身也是一个映射，将方向$h$映射至$h$方向上的导数值，并且由于是有界的，还一定是连续的。
由于难以表示，一般不直接写出$Df$或$Df(x)$，而是写成
$$Df(x) \cdot h = \cdots$$
的形式，除非$Df(x) \cdot h = 0$，此时可直接将其写为$Df(x) = 0$。

计算函数
$$
\begin{array}{cccc}
    F: & \mathbb R^n & \to & \mathbb R \\
       & x & \mapsto & \frac{1}{2} \left< A x, x \right> - \left< b, x \right>
\end{array}
$$
的弗雷歇微分，其中$A \in S\_n, b \in \mathbb R\_n$ <br/>
$$
\begin{aligned}
F(x + h) &= \frac{1}{2} \left< A (x+h), (x+h) \right> - \left< b, (x+h) \right> \\
&= \frac{1}{2} \left( \left< Ax, x\right> + \left< Ah, h\right> + 2\left< Ax, h\right> \right) - \left< b, x \right> - \left< b, h \right> \\
&= F(x) + \left< Ax-b, h \right> + \frac{1}{2} \left< Ah, h \right>
\end{aligned}
$$
由于有限维空间范数的等价性，可任意选择范数进行验证，令
$$\epsilon(h) = \frac{\Vert \frac{1}{2} \left< Ah, h \right> \Vert}{\Vert h \Vert}$$
可验证
$$\lim_{h \to 0} \epsilon(h) = 0$$
从而该函数弗雷歇可微，其弗雷歇导数为
$$Df(x) \cdot h = \left< Ax-b, h \right>$$
{: .exampl}

高阶弗雷歇导数一般以迭代的形式定义，即对$Df$再次进行相同的操作，得到的映射为
$$D^2 f: V \to B(V, B(V, W))$$
相较于高阶加托导数，高阶弗雷歇导数的用处更少，因此我们不在此仔细介绍它。

### 加托导数

称映射$F: V \to W$在$x$处加托可微（Gateaux differentiable），若对于$x$，存在一线性映射$DF(x): V \to W$，满足
$$\left. \frac{\mathrm d}{\mathrm d \lambda} F(x + \lambda h) \right|_{\lambda = 0} = DF(x) \cdot h, \quad \forall h \in V$$
更高阶的加托导数定义为：
$$D^n F(x) \cdot h = \left. \frac{\mathrm d^n}{\mathrm d \lambda^n} F(x + \lambda h) \right|_{\lambda = 0} $$
{: .definition}

有些对于加托可微的定义只要求$DF(x)$存在，我们对其额外施加一个线性的约束，以避免病态的情况。
算子空间的加托导数和变分法的关系密切，实际上，函数的加托导数就是它的变分。

注意高阶的加托导数定义与弗雷歇导数不同。

若映射$F$弗雷歇可微，则一定加托可微。
其逆命题非真。
{: .proposition}

前推后是显然的。
若映射$F$在$x$处弗雷歇可微，则
$$
\begin{aligned}
\left. \frac{\mathrm d}{\mathrm d \lambda} F(x + \lambda h) \right|_{\lambda = 0} &= \left. \frac{\mathrm d}{\mathrm d \lambda} F(x) + DF(x) \cdot (\lambda h) + \epsilon(\lambda h) \Vert \lambda h \Vert \right|_{\lambda = 0} \\
&= DF(x) \cdot h
\end{aligned}
$$
从而其加托导数正是$DF(x)$。
后推前的反例可考虑
$$
f(x,y) = \begin{cases}
    \frac{x^3y}{x^6+y^3} &, (x, y) \neq (0, 0)\\
    0 & ,\text{否则}
\end{cases}
$$
该函数在$(0,0)$处的加托导数为零函数，而不具有弗雷歇微分，因为函数在原点处不连续：
$$f(t, t^3) = \begin{cases}
    \frac{t^6}{t^6 + t^9} &, t \neq 0 \\
    0 &, \text{否则}
\end{cases}$$
从而
$$\lim_{t \to 0} f(t, t^3) = \lim_{t \to 0} \frac{1}{1+t^3} = 1 \neq f(0, 0)$$
{: .proof}

设$V = C([0,1])$，计算函数
$$F(v) = \int_0^1 \frac{v^4(x)}{4} \mathrm d x$$
的加托导数。<br/>
有
$$F(v + \lambda h) = \int_0^1 \frac{(v + \lambda h)^4}{4} \,\mathrm d x$$
从而
$$
\begin{aligned}
\left. \frac{\mathrm d}{\mathrm d \lambda} F(v + \lambda h) \right|_{\lambda = 0}
&= \int_0^1 \left. \frac{\mathrm d}{\mathrm d \lambda} \frac{(v + \lambda h)^4}{4} \right|_{\lambda = 0} \,\mathrm d x \\
&= \int_0^1 v^3 h \,\mathrm d x
\end{aligned}
$$
从而
$$DL(x) \cdot h = \int_0^1 v^3 h \,\mathrm d x$$
{: .exampl}

弗雷彻导数和加托导数的特点在于其可应用于无穷维的空间中，如上一例所示。
在无穷维赋范空间中，范数的选择对空间的性质有很大的影响；这与欧几里得空间不同，在欧几里得空间中，由于范数的等价性，任意选择范数均不会对结论产生影响。

弗雷歇导数和加托导数都遵守一般的微分映射的规则：

弗雷歇导数和加托导数都具有线性。
且对*良态*的函数满足链式法则：
$$D(G \circ F(x)) \cdot h = D G(F(x)) \cdot (DF(x) \cdot h)$$
{: .proposition}

下一命题直接给出任意二次型的加托导数，可直接用于许多计算。

设$V$为一任意维度的向量空间，其上一泛函定义为
$$J(u) = \frac{1}{2} a(u, u) + L(u)$$
其中$a$为对称二次型，$L$为线性函数，则其加托导数为
$$DJ(u) \cdot v = a(u, v) + L(v)$$
{: .proposition}

考虑
$$J(u + \lambda v) = J(u) + \lambda(a(u, v) + L(v)) + \frac{\lambda^2}{2} a(v, v)$$
从而
$$\left. \frac{\mathrm d}{\mathrm d \lambda} J(u + \lambda v) \right|_{\lambda = 0} = a(u, v) + L(v)$$
{: .proof}

### 有限维情形

#### 梯度矩阵

设$F(x\_1, \dots, x\_n): V \to \mathbb R$为一可微的函数，则记关于$x\_i$的偏导数为
$$\frac{\partial F}{\partial x_i} = DF(x) \cdot e_i = \frac{\mathrm d F(x + \lambda e_i)}{\mathrm d \lambda}$$
而其梯度为
$$\nabla F = \begin{bmatrix} \frac{\partial F}{\partial x_1} \\ \vdots \\ \frac{\partial F}{\partial x_n} \end{bmatrix}$$
{: .definition}

这是利用此前介绍的可应用于无穷维空间的微分定义重新定义了偏导数与梯度。

#### 雅可比矩阵

设$V = \mathbb R^n, W = \mathbb R^m$，$f: V \to W$为一弗雷彻可微映射，则$DF(x)$为$V \to W$的线性映射，其矩阵即为$x$处的雅可比矩阵（Jacobian）：
$$\mathbf J f(x) = \begin{bmatrix}
    \frac{\partial f_1}{\partial x_1} & \cdots & \frac{\partial f_1}{\partial x_n} \\
    \vdots & \ddots & \vdots \\
    \frac{\partial f_m}{\partial x_1} & \cdots & \frac{\partial f_m}{\partial x_n} \\
\end{bmatrix}$$
{: .definition}

有限维空间中的弗雷彻微分就是传统意义上的多元函数微分，而雅可比矩阵就是其矩阵表示。

#### 黑塞矩阵

设$F: V \to \mathbb R$二阶弗雷彻可微，则其黑塞矩阵（Hessian）定义为
$$\mathbf H F(x) = \mathbf J (\nabla F(x)) = \begin{bmatrix}
\frac{\partial^2 F}{\partial x_1 \partial x_1} & \cdots & \frac{\partial^2 F}{\partial x_1 \partial x_n} \\
\vdots & \ddots & \vdots \\
\frac{\partial^2 F}{\partial x_n \partial x_1} & \cdots & \frac{\partial^2 F}{\partial x_n \partial x_n}
\end{bmatrix}$$
若$F$是性质良好的函数，则$\mathbf H F(x)$是对称的。
{: .definition}

黑塞矩阵可用于表示二阶方向导数：
$$\left. \frac{\mathrm d^2 }{\mathrm d \lambda^2} F(x + \lambda h) \right|_{\lambda = 0}= \left< \mathbf H(x) h, h \right>$$

二次型函数
$$F(x) = \frac{1}{2} \left< Ax, x \right> - \left< b, x\right>$$
的梯度为
$$\nabla F(x) = A x - b$$
黑塞矩阵为
$$\mathbf H F(x) = \mathbf J (A x - b) = A$$
最后一步可利用矩阵计算，也可利用弗雷彻微分的定义计算：
令$f(x) = \nabla F(x) = A x - b$，则
$$f(x + h) = Ax - b + A h = f(x) + A h$$
从而
$$DL(x) \cdot h = A h$$
{: .exampl}

## 微分与优化

接下来我们通过一个例子将微分与优化联系起来。

### 寻找最小值

数学上，所有优化问题都可以具有寻找最小值的形式，因此，研究寻找最小值是需要重点研究的问题。

设$F$为定义在$V$上的函数，则将其限制在通过$\overline x \in V$点的直线上而产生的函数记为
$$g(\lambda) = F(\overline x + \lambda h), \quad h \in V, h \neq 0$$
{: .definition}

$F$在$\overline x$处取最小值，当且仅当对所有将其限制在通过$\overline x$点的直线上而产生的函数均在0处取最小值：
$$F(\overline x) \le F(x), \forall x \in V \iff g(0) \le g(\lambda), \forall \lambda \in \mathbb R, h \in V$$
{: .proposition}

若函数是加托可微的，则最小值的一个必要条件是：
$$F(\overline x) \le F(x), \forall x \in V \implies DF(\overline x) \cdot h = 0, \forall h$$
而若$V = \mathbb R^n$，则最小值的一个充分条件是：
$$g''(\lambda) = \left< \mathbf HF(\overline x + \lambda h) h, h \right> \ge 0, \forall \lambda, h$$
从而，我们要求所有点的黑塞矩阵半正定。

如果我们只需要找到极小值，则仅需要求黑塞矩阵在$\overline x$附近的一个球内半正定即可。

计算
$$\mathcal J(v) = \int_0^1 g(x, v, v') \,\mathrm d x$$
的加托导数，其中$g$定义在$v \in \mathcal C^1$，$v(0) = v(1) = 0$上，定义域记为$V\_0$。
利用此结论计算
$$\mathcal J(v) = \int_0^1 \frac{1}{2} v'(x)^2 + \frac{1}{4} v(x)^4 - f(x) v(x) \, \mathrm d x$$
的极值点，并证明其极值点是初值问题
$$- u'' + u^3 + f = 0, u(0) = u(1) = 0$$
的解。<br/>
注意$g$有三个独立的参数$x, v, v'$，可将其改写为$g(x, u\_0, u\_1)$
令$h \in V\_0$，则根据定义，其加托导数为
$$\begin{aligned}
D \mathcal J(v) \cdot h &= \frac{\mathrm d}{\mathrm d t} \left( \int_0^1 g(x, v + t h, v' + t h') \,\mathrm d x \right)_{t = 0} \\
&= \int_0^1 \left( \frac{\partial g(x, v+th, v' + th')}{\partial u_0} h + \frac{\partial g(x, v + th, v' + th')}{\partial u_1} h' \right)_{t = 0} \,\mathrm d x \\
&= \int_0^1 \frac{\partial g(x, v, v')}{\partial u_0} h +  \frac{\partial g(x, v, v')}{\partial u_1} h' \, \mathrm d x
\end{aligned}$$
这是一个关于$h$的线性函数，从而其加托导数存在。
现在令
$$g(x, u_0, u_1) = \frac{u_1^2(x)}{2}  + \frac{u_0^4(x)}{4} - f(x) u_0(x) $$
计算可得
$$
\begin{aligned}
\frac{\partial g}{\partial u_0} &= u_0^3 - f \\
\frac{\partial g}{\partial u_1} &= u_1 \\
\implies D\mathcal J(x) \cdot h &= \int_0^1 v^3 h - f h + v' h' \,\mathrm d x
\end{aligned}
$$
然后利用分部积分
$$\int_0^1 v' h' = \left[ v' h \right]_0^1 + \int_0^1 v'' h$$
由于$h(0) = h(1) = 0$，从而
$$ D\mathcal J(x) \cdot h = \int_0^1 v^3 h - f h + v'' h \,\mathrm d x $$
对于极值点，有
$$D \mathcal J(x) \cdot h = 0,\quad \forall h \in V_0 \iff D \mathcal J(x) = 0$$
利用$h$的任意性，可得
$$v^3 - f + v'' = 0$$
{: .exampl}

直接对
$$D \mathcal J(v) \cdot h = \int_0^1 \frac{\partial g(x, v, v')}{\partial u_0} h +  \frac{\partial g(x, v, v')}{\partial u_1} h' \, \mathrm d x$$
利用分部积分，可得
$$D \mathcal J(v) \cdot h = \int_0^1 \left(\frac{\partial g(x, v, v')}{\partial u_0}+  \frac{\mathrm d}{\mathrm d x}\frac{\partial g(x, v, v')}{\partial u_1}\right) h\, \mathrm d x$$
这实际上完成了[拉格朗日方程]({% post_url /2023-08-01-intro-to-analytic-mechanics %}#结论)或[哈密顿原理]({% post_url /structure-mechanics/2024-03-11-hamiltonian-principle %})的证明。
