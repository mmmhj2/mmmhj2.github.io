---
title: "凸函数优化"
categories: ["建模与优化"]
---

## 凸函数

首先回忆突集合的定义。

向量空间$V$的子集$C$称为*凸集合*（Convex），若其中任意两点连线均在该集合中，即：
$$\forall x, y \in C, \forall \lambda \in [0,1],\quad \lambda x + (1 - \lambda) y \in C$$
{: .definition}

### 一元凸函数

若某一元函数$F: \mathbb R \to \mathbb R$对定义域上的所有$x,y$满足
$$F(\lambda x + (1-\lambda) y) \le \lambda F(x) + (1 - \lambda) F(y), \ \forall \lambda \in [0,1]$$
则称该函数是凸函数（Convex function）；若满足
$$F(\lambda x + (1-\lambda) y) < \lambda F(x) + (1 - \lambda) F(y), \ \forall \lambda \in ]0, 1[$$
则称其为严格凸函数。
{: .definition}

若函数$F \in \mathcal C^1$，则其是凸函数当且仅当$F'$单增；是严格凸函数当$F'$严格单增。
若$F \in \mathcal C^2$，则其是凸函数当且仅当$F'' \ge 0$；是严格凸函数当$F'' > 0$。
{: .proposition}

注意上述两个命题的后半部分的逆命题非真：
严格凸函数的一阶导可以存在驻点，二阶导数可能为零。

凸函数$F \in \mathcal C^1$在$x$处取最小值，当且仅当$F'(x) = 0$；
若$F$是严格凸函数，则该最小值是唯一的。
{: .proposition}

### 多元凸函数

设函数$F: V \to \mathbb R$定义在向量空间$V$上，若对所有$x, y \in V$，有
$$F(\lambda x + (1-\lambda) y) \le \lambda F(x) + (1 - \lambda) F(y), \ \forall \lambda \in [0,1]$$
则称该函数是凸函数（Convex）；若满足
$$F(\lambda x + (1-\lambda) y) < \lambda F(x) + (1 - \lambda) F(y), \ \forall \lambda \in ]0, 1[$$
则称其为严格凸函数。
{: .definition}

从图像上看，这意味着向量空间$V$中端点在函数$F$上的任何两点之间的线段均在函数图像的上方，即：

一个函数在$V$上是（严格）凸的，当且仅当其在$V$中的任意线段上是（严格）凸的。
{: .proposition}

这意味着对任何函数$f(x)$，我们总是可以通过研究$g\_h(\lambda) = f(x + \lambda h)$来研究$f$的凸性。
若$g$对所有$h$都是凸的，那么$f$就是凸的。
因此，我们只需要研究函数的高阶加托导数即可。

特别地，对二次型函数，我们有：

向量空间$V$上的二次型函数
$$J(u) = \frac{1}{2} a(u, u) + L(u)$$
是严格凸的，当且仅当$a$是对称的正定双线性型；
是凸的，当且仅当$a$是对称的半正定双线性型。
{: .proposition}

注意到函数
$$J(u + \lambda v) = \frac{\lambda^2}{2} a(v, v) + \lambda (a(u,v) + L(v)) + \frac{1}{2} a(u, u) - L(u)$$
是关于$\lambda$的二次多项式，其凸性仅由二次项系数$\frac{a(v,v)}{2}$决定。
{: .proof}

一维情况的许多结论也可直接推广：

（Kachurovskii）设$V$为一希尔伯特空间，则可微函数$F: V \to \mathbb R$是其上的凸函数，当且仅当其一阶导单调：
$$\forall x, y \in V, \quad \left< \nabla F(x) - \nabla F(y), x - y \right> \ge 0$$
或者，写成弗雷歇微分的形式：
$$(DF(x) - DF(y)) \cdot (x-y) \ge 0$$
{: .proposition}

注意在希尔伯特空间中，我们不再区别单调增和单调减，而只使用单调，这相当于一维情况的单调增。

在欧几里得空间中，二阶可微函数$F$是凸函数，当且仅当其黑塞矩阵$\mathbf HF$半正定；
若其黑塞矩阵正定，则其为严格凸函数。
{: .proposition}

注意，和一维情况一样，后半部分的逆命题非真。

关于凸函数，有几个保凸的运算可用于进行判定：

凸函数的非负线性组合是凸函数；特别地，（严格）凸函数加常数是（严格）凸函数：
$$f_i \text{ convex}, w_i \ge 0, g(x) = \sum w_i f_i(x) \implies g \text{ convex}.$$
凸函数的最大值组成的函数是凸函数：
$$f_i \text{ convex}, g(x) = \max\{f_1(x), \dots, f_n(x)\} \implies g \text{ convex}.$$
凸函数与单调不减函数的复合是凸函数：
$$g \text{ non-decreasing}, f \text{ convex} \implies g(f (x)) \text{ convex}$$
{: .proposition}

特别地，由于三角不等式，任何范数都是凸函数。

## 凸优化

### 极小值

设$F$为向量空间$V$上一可微的凸函数，则其微分为零的点就是极（最）小值点：
$$DF(\overline x) = 0 \iff F(\overline x) \le F(y), \quad \forall y \in V$$
凸函数的极小值点就是最小值点；严格凸函数*至多仅有一个*最小值点。
{: .proposition}

凸函数不一定存在最小值，其存在性可由以下命题判定：

有限维空间上的连续强凸函数一定具有至少一个最小值点。
若函数是严格凸的，则该最小值是唯一的。
强函数（Coercive function）指在无穷处极限为无穷的函数：
$$\lim_{\Vert x \Vert \to \infty} f(x) = +\infty$$
{: .proposition}

上一个命题*不能*推广至无限维空间。

#### 极值与根

<div class="exampl"><p>
设$F: \mathbb R^n \to \mathbb R$为
$$F(x) = \frac{1}{2} \left< Ax, x \right> - \left< b, x\right> = \sum_{i, j} A_{i, j} x_i x_j - \sum_i b_i x_i$$
其中$A \in M_n$是一个对称的正定矩阵。
设
$$f(x) = \nabla F(x) = Ax - b$$
证明函数$F$的最小值点正是方程组$Ax = b$的解。 
</p>
<p>
首先证明凸性，设$g(\lambda) = F(x + \lambda h)$，求加托导数。
有
$$\begin{aligned}
g(\lambda) &= \frac{1}{2} \left< A(x+\lambda h), x+h \right> - \left< b, x + \lambda h\right> \\ 
&= \frac{1}{2} \left<Ax,x\right> - \left<b, x\right> + \lambda\left<Ax-b, h\right> + \frac{\lambda^2}{2}\left<Ah,h\right>
\end{aligned}$$
这是一个关于$\lambda$的二次函数，若$A$正定，则其导数严格单增，从而$F$严格凸。
因此原$F$严格凸，其最小值点在梯度（弗雷彻微分）为零处取得。
</p>
</div>

这个例子展示了利用凸优化将求根的问题转化为优化问题的方法。
对于线性函数而言，这一转化是不必要的，因为线性方程组的解具有非常好的性质。
而对于非线性方程，情形则更加复杂，例如下一个例子。

<div class="exampl">
<p>
利用函数
$$F(x) = \frac{1}{2} \left< Ax,x \right> + \frac{1}{4} \Vert x \Vert_4^4 - \left< b,x \right>$$
证明
$$f(x) = Ax + x^3 + b$$
至少有一个零点，其中$b,x \in \mathbb R^n$，$A \in M_n$是对称的正定矩阵。
</p>
<p>
首先注意到
$$\nabla F(x) = f$$
从而我们可利用函数$F$的凸性证明$f$零点的存在性。
设$g(\lambda) = F(x + \lambda h)$，其中$h \in \mathbb R^n$，则
$$
\begin{aligned}
g(\lambda) &= \frac{1}{2}\left< A(x+\lambda h),x + \lambda h \right> \\
&+ \frac{1}{4} \sum_i (x_i + \lambda h_i)^4 - \left< b, x+\lambda h \right> \\
g'(\lambda) &= \left< Ah, x + \lambda h\right> + \sum_i (x_i + \lambda h_i)^3 h_i - \left< b, h \right> \\
g''(\lambda) &= \left<Ah, h \right> + 3 \sum_i (x_i + \lambda h_i)^2 h_i^2
\end{aligned}
$$
由于$A$正定，二阶导的前一项严格大于零，而后一项是二次项，因此大于或等于零，从而原式严格大于零，因此该函数是凸函数。接下来证明其是一个强函数。
设$\lambda_1$是$A$的最小特征值，由于$A$是对称且正定的，该特征值一定存在且大于零，则$\left<Ax, x\right> \ge \lambda_1 \Vert x \Vert_2^2$。
再利用柯西不等式，可得
$$\left< b,x \right> \le \Vert b \Vert_2 \Vert x \Vert_2$$
从而
$$
\begin{aligned}
F(x) &\ge \frac{\lambda_1}{2} \Vert x \Vert_2^2 + \frac{1}{4} \Vert x \Vert_4^4 - \Vert b \Vert_2 \Vert x \Vert_2 \\
& \ge \frac{\lambda_1}{2} \Vert x \Vert_2^2 - \Vert b \Vert_2 \Vert x \Vert_2
\end{aligned}
$$
显然，放缩后的函数是强函数，从而原函数是强函数。
这就证明了原函数$F$至少有最小值点，从而$f$至少有一个零点。
</p>
</div>
