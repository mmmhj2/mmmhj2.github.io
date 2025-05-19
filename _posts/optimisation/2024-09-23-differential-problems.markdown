---
title: "带边界条件的微分问题"
categories: ["建模与优化"]
---

## 线性问题与二次函数

若希望让二次的势能最小，则有以下等价的问题：

在$V\_0 = \left\\\{ v\in\mathcal C^1([0,1]), v(0) = v(1) = 0 \right\\\}$中最小化二次势能函数：
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

设$V\_0$为一线性空间，$a$为其上正定的对称双线性型（内积），$L$为其上一个线性泛函，则求
$$J(v) = \frac{1}{2}a(v,v) - L(v)$$
的最小值点$u \in V\_0$，等价于求解
$$a(u,v) = L(v), \quad \forall v \in V_0$$
{: .proposition}

计算加托微分：
$$
\begin{aligned}
J(u + \lambda v) &= J(u) + \lambda(a(u,v) - L(v)) + \frac{\lambda^2}{2} a(v, v) \\
\implies
DJ(u) \cdot v &= \left.\frac{\mathrm d J(u + \lambda v)}{\mathrm d \lambda}\right|_{\lambda = 0} 
\\&= a(u, v) - L(v)
\end{aligned}
$$
显然，$J$是严格凸的，因为$a(v,v) > 0$。
从而当且仅当
$$DJ(u)\cdot v = a(u, v) - L(v) = 0$$
时，原式取得最小值。
{: .proof}

这些命题最终来自以下定理：

<small>（Lax–Milgram）</small>
设$\mathcal H$为一实希尔伯特空间，其内积记作$\langle\cdot,\cdot\rangle$、范数为$\Vert \cdot \Vert$。
其中存在一双线性形式$a(\cdot, \cdot)$，在$\mathcal H \times \mathcal H$上连续并在$\mathcal H$上强制（Coercive），即：
$$
\begin{aligned}
\exists c > 0, \forall (u, v) \in \mathcal H^2, &\quad \vert a(u, v) \vert \le c \Vert u \Vert \Vert v \Vert, \\
\exists \alpha > 0, \forall u \in \mathcal H, &\quad a(u, u) \ge \alpha \Vert u \Vert^2.
\end{aligned}
$$
并存在一连续线性映射$\mathcal L$，那么存在唯一的$u \in \mathcal H$，使得
$$a(u, v) = L v, \quad \forall v \in \mathcal H.$$
若$a$还是对称的，那么$u$还是唯一能使泛函
$$J(v) = \frac{1}{2} a(v, v) - Lv$$
取最小值的元素。
{: .theorem}

对欧几里得空间，其上所有双线性形式都是有界的：
$$\vert a(u, v) \vert \le \Vert A \Vert_\infty \vert u \vert \vert v \vert.$$
而只要该形式所有特征值的实部不为零，那么就一定是强迫的，因此正定的双线性形式一定是强迫的。

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

根据贝塞尔不等式，最精确的近似即为$u$在$V\_h$空间的投影：
$$
a(u - u_h, u - u_h) \le (u - \pi_h(u), u - \pi_h(u))
$$
其中$u\_h$为$u$的投影，$\pi$表示其他任意$u$的近似。

魏尔施特拉斯逼近定理说明了两个常用的有限维子空间：多项式空间与三角多项式空间。

设$V\_h$的基底为$w\_i(x)$，则原问题的近似可转化为$N$个线性方程组：
$$\sum_{j = 1}^N a(w_j, w_i) u_j = L(w_i), \quad i \in [\![0, N]\!] \iff AU = F$$
其中$u\_j$是$u\_h$在基底$w\_j$下的坐标，$A$是对称的正定矩阵，且
$$
\begin{aligned}
A_{i,j} &= a(w_j, w_i), \\
U &= (u_1, \dots, u_N)^\top, \\
F &= (L(w_1), \dots, L(w_N))^\top
\end{aligned}
$$
其中$A$称为*刚度矩阵*（Stiffness matrix）。
{: .proposition}

刚度矩阵通常是对称的，因此这个定义等价于
$$A_{i,j} = a(w_j, w_i) = a(w_i, w_j)$$
在非对称的情况，则一般使用前一种形式。

将原问题写为该基底下坐标形式即可得证。
{: .proof}

### 近似的计算

考虑最小化问题
$$J = \int_0^1 k u'v' + c u v + fv \, \mathrm d x$$
有
$$a(u, v) = \int_0^1 k u'v' + c u v,\, L(v) = \int_0^1 fv$$

为完成近似的计算，我们首先需要选择子空间与基底。
以空间$V_0$为例，我们可以选择$[0,1]$上的分段线性函数作为子空间[^continous]。
我们将$[0,1]$离散化为$h$份等长的线段，则其基底可选用
$$
w_i(x_j) = \delta_{ij}, \,x_j = \frac{j}{h+1}
$$
这个函数是仅在$\frac{i}{h+1}$处取一，在其他点处取零的分段线性函数，图像是一个三角形。

[^continous]: 这些函数不是二阶连续的，因此严格意义上不构成子空间。

然后计算矩阵$A$：
$$A_{ij} = \int_0^1 k w_j' w_i' + c w_j w_i \, \mathrm d x$$
注意到$|i-j|>1$时，$A\_{ij} = 0$，从而这个矩阵是三对角阵。
考虑
$$
\begin{aligned}
A_{ii} &= \int_{x_{i-1}}^{x_i} k w_i'^2 + cw_i^2 \,\mathrm d x+ \int_{x_i}^{x_{i+1}} k w_i'^2 + cw_i^2 \,\mathrm d x
\end{aligned}
$$
我们可使用梯形公式或辛普森公式进行近似：
$$
\begin{aligned}
\int_a^b f(x) \, \mathrm d x &\approx (b - a)\frac{f(a) + f(b)}{2} & \text{Trapezoidal} \\
&\approx (b-a) \frac{f(a) + 4f(\frac{a+b}{2}) + f(b)}{6} & \text{Simpson's}
\end{aligned}
$$
从而可得
$$
\begin{aligned}
A &= A_1 + A_2, \\
A_1 &= \frac{1}{h^2}\begin{bmatrix} 2 & -1 & 0 & \cdots \\
-1 & 2 & 0 & \cdots \\
\vdots & \vdots & \vdots & \ddots
\end{bmatrix}, \\
A_2 &= \frac{h}{6} \begin{bmatrix}
4 & 1 & 0 & \cdots \\
1 & 4 & 0 & \cdots \\
\vdots & \vdots & \vdots & \ddots
\end{bmatrix}
\end{aligned}
$$
$F$矩阵容易得到，从而可求出原问题弱形式的近似解。

另一方面，对于原问题的强形式，可使用有限差分法进行近似。
对于任何一维函数$v$的导数：
$$
\begin{aligned}
v'(x) &\approx \frac{v(x+h) - v(x)}{h} \approx \frac{v(x) - v(x-h)}{h} \\
v''(x) &\approx \frac{v(x-h) - 2v(x) + v(x+h)}{h^2}
\end{aligned}
$$
根据我们选择的离散化条件，可将其写为
$$
v_i'' \approx \frac{v_{i-1} - 2 v_i + v_{i+1}}{h^2}
$$
从而原方程
$$- k u''+ c u = f$$
即被转化为代数方程
$$- k u_i'' + c u_i = f_i$$

## 高维椭圆问题

本节中，我们记$\Omega \subset \mathbb R^n$为一个开凸集合，$\Gamma$或$\partial \Omega$表示其边界。
$\vec n$是边界上指向外的法向量，而$\int\_\Omega u(x) \, \mathrm d \Omega$表示$\Omega$上的积分。

设$u$为$\Omega$上的函数，则记其关于法向量的导数为
$$
\frac{\partial u}{\partial n} = \left< \nabla u, \vec n \right>
$$
即其梯度与法向量之内积。

对一般的二阶偏微分方程问题，我们可根据其特征方程对其进行分类：

一般的二维二阶偏微分方程为
$$-a \frac{\partial^2 u}{\partial x^2} -2b \frac{\partial^2 u}{\partial x \partial y} -c \frac{\partial^2 u}{\partial y^2} +d \frac{\partial u}{\partial x} +e \frac{\partial u}{\partial y} + fu = 0$$
而其特征方程具有以下形式
$$ax^2 + 2bxy + cy^2 = \text{const.}$$
设矩阵
$$A = \begin{pmatrix} a&b \\ b&c \end{pmatrix}$$
微分方程根据其行列式分类：若$\det A > 0$，则该方程为*椭圆方程*（elliptic equation）；若$\det A = 0$，该方程为*抛物方程*（parabolic equation）；若$\det A < 0$，该方程为*双曲方程*（hyperbolic equation）。
{: .definition}

一般来说，椭圆方程常在势能最小的静力学和稳态方程中出现（如拉普拉斯方程和泊松方程）；
抛物方程通常在表示能量耗散的问题中出现（如傅里叶热传导方程）；
而双曲方程通常在能量守恒的情况中出现（如波动方程）。
因此，我们主要研究椭圆方程。

### 向量分析的常用命题

对于一向量场$\vec \Phi$与标量场$u$，其散度有如下关系
$$\nabla \cdot (u \vec \Phi) = \left< \nabla u, \vec \Phi \right> + u \nabla \cdot \vec \Phi$$
{: .proposition}

<small>(格林公式/斯托克斯公式)</small>
对向量场$\vec \Phi$与标量场$u,v$，有
$$\int_\Omega \left< \Phi, \nabla v \right> \, \mathrm d \Omega = \int_\Omega - (\nabla \cdot \Phi) v \,\mathrm d \Omega + \int_\Gamma \Phi_n v \,\mathrm d \Gamma$$
其中
$$\Phi_n = \left<\vec \Phi, \vec n \right>$$
特别地，若$\vec \Phi = \nabla u$，则
$$\int_\Omega \left< \nabla u, \nabla v \right> \, \mathrm d \Omega = \int_\Omega - (\Delta u) \cdot v \,\mathrm d \Omega + \int_\Gamma \frac{\partial u}{\partial n} v \,\mathrm d \Gamma
$$
{: .proposition}

这是广义斯托克斯公式
$$\int_{\partial \Omega} w = \int_{\Omega} \mathrm d w$$
的推广，此处$\mathrm d w$是一个*微分形式*。
我们不会过于深入微分几何的领域，但是仍在此处提供一个简单的等价性的证明。

我们尝试使用广义斯托克斯公式证明该公式在三维空间中的最一般形式：
$$\int_\Omega \frac{\partial u}{\partial x_i} v + u \frac{\partial v}{\partial x_i} \, \mathrm d \Omega = \int_{\partial \Omega} u v n_i \mathrm d S$$
可使用这个公式推出上述所有命题。
将其写为向量形式：
$$\int_\Omega (\nabla u) v + u (\nabla v) \, \mathrm d \Omega = \int_{\partial \Omega} uv \, \mathrm d S$$
令$f = uv$，有：
$$\int_\Omega \nabla f \, \mathrm d \Omega = \int_{\partial \Omega} f \, \mathrm d S$$
接下来证明
$$\mathrm d(f \mathrm d S) = \nabla f \mathrm d \Omega$$
重写左侧：
$$
\begin{aligned}
\mathrm d(f \mathrm d S) &= \mathrm d(f \wedge \mathrm d S) \\
&= \mathrm d f \wedge \mathrm d S + \cancel{f \wedge \mathrm d (\mathrm d S)} \\
&= (\partial_x f \mathrm d x + \partial_y f \mathrm d y + \partial_y f \mathrm d y) \\
& \wedge (\mathrm d x \wedge \mathrm d y + \mathrm d y \wedge \mathrm d z + \mathrm d z \wedge \mathrm d x) \\
&= (\partial_x f + \partial_y f + \partial_z f) \cdot (\mathrm d x \wedge \mathrm d y \wedge \mathrm d z) \\
&= \nabla f \, \mathrm d \Omega
\end{aligned}
$$
从而得证。
{: .proof}

### 椭圆问题

这一节中我们主要关心以下椭圆型偏微分方程：
$$
u \in C(\Omega), u(x) > 0, \quad
\left\{
\begin{aligned}
    - \Delta u + c u = f \\
    u_\Gamma = 0
\end{aligned}
\right.
$$
这种含有微分方程的形式称为问题的强形式。

强形式问题
$$
\left\{
\begin{aligned}
    - \Delta u + c u = f \\
    u_\Gamma = 0
\end{aligned}
\right.
$$
等价的弱形式为
$$\int_\Omega \nabla u \cdot \nabla v + \int_\Omega cuv = \int_\Omega fv, \quad\forall v \in V_0$$
其中
$$V_0 = \{ v \in C(\Omega), v(\Gamma) = 0 \}$$
{: .proposition}

利用分部积分法（或斯托克斯公式），可将其转化为弱形式。
首先两边同时乘$v$（要求边界处为零，即$v(\Gamma) = 0$）并积分，得到
$$
\int_\Omega \Delta uv + c uv =  \int_\Omega fv
$$
然后利用斯托克斯公式，得到
$$
\int_\Omega \nabla u \cdot \nabla v - \cancel{\int_\Gamma \frac{\partial u}{\partial n} v}^{v(\Gamma) = 0} + \int_\Omega cuv = \int_\Omega fv
$$
从而可得到问题的弱形式。
从弱形式反向应用斯托克斯公式即可得到强形式。
{: .proof}

除了强弱形式之外，通过再一次进行积分，可将弱形式转化为最优化问题，即求某个函数的导数等于零的问题。

令
$$a(u,v) = \int_0^1 \nabla u \cdot \nabla v + cuv,\, L(v) = \int_0^1 fv$$
则其弱形式可写为
$$a(u, v) = L(v),\, \forall v \in V_0$$
而优化问题可写为
$$\min J(v) = \frac{1}{2} a(v, v) - L(v)$$
这几个形式和此前提到的一致。

这三个问题（优化问题、弱形式和强形式）分别对应力学中的最小势能原理、虚功原理与平衡方程。

这些问题解的存在性可利用里斯定理在索伯列夫空间中证明。

### 椭圆问题的有限元法

我们也可以利用伽辽金法来计算该问题的数值解。
考虑椭圆问题
$$
\left\{
\begin{aligned} - k \Delta u + c u = f \\ - \frac{\partial u}{\partial n} = 0
\end{aligned}
\right.
$$
其弱形式为
$$a(u, v) = L(v), \quad \forall v \in C^1(\Omega)$$
其中
$$a(u,v) = \int_0^1 k \nabla u \cdot \nabla v,\, L(v) = \int_0^1 fv$$
此处注意由于边界条件的变换，$v$的集合也发生了变化。

选择有限维子空间$V\_h$及其基底$w\_i$，即可将问题的弱形式写为矩阵形式：
$$KU = F,$$
其中
$$K_{i,j} = a(w_j, w_i)$$
这个矩阵就是刚度矩阵。

这个子空间的选择通常与离散化的方式有关，最通用的情况是分段多项式组成的空间，可用于三角形网格化的情况，这个空间是索伯列夫空间$H^1$的子空间。
使用这个空间的方法称为**有限元方法**。
通常选择基底$w\_i$，使其仅在格点$i$处取值非零，在其他格点处取值为零，从而仅在格点周围的三角形（记作$\mathrm{Supp}(w\_i)$）之中具有贡献，因此对不相邻的两个格点$i,j$，有
$$
\mathrm{Supp}(w_i) \cap \mathrm{Supp}(w_j) = \varnothing
$$

在有三个格点$(x\_i, y\_i)$的网格上给出一组分段线性函数组成的基底$w\_i$，并计算双线性型
$$a(u, v) = \int_\Omega k \nabla w_j \cdot \nabla w_i \, \mathrm d \Omega$$
的刚度矩阵。<br/>
首先求解基底，我们需要
$$w_i(x_j, y_j) = a_i x_j + b_i y_j + c_i = \delta_{i,j}, \, \forall i \in [\![1,3]\!]$$
从而令
$$
P = \begin{bmatrix}
x_1 & y_1 & 1 \\
x_2 & y_2 & 1 \\
x_3 & y_3 & 1
\end{bmatrix}, 
M = \begin{bmatrix}
a_1 & a_2 & a_3 \\
b_1 & b_2 & b_3 \\
c_1 & c_2 & c_3 \\
\end{bmatrix}
$$
且要求
$$PM = [\delta_{ij}] = \mathbf I $$
从而
$$ M = P^{-1} $$
这就求出了基底函数。
接下来求解刚度矩阵，考虑到单个三角形中节点两两相邻，我们有
$$K_{ij} = k \int_\Omega \nabla w_i \cdot \nabla w_j \, \mathrm d \Omega$$
而$w\_i$均为线性函数，其导数为常数，从而
$$K_{ij} = k (x_i x_j + y_i y_j)\int_\Omega \, \mathrm d \Omega$$
三角形的面积恰好可由$P$给出，从而
$$K_{ij} = k (x_i x_j + y_i y_j) \frac{\det(P)}{2}$$
{: .exampl}

对于由多个三角形组成的网格，在单个三角形单元上计算的刚度矩阵通常称为*单元刚度矩阵*（Element stiffness matrix），记为$K^e$。
完整网格上的刚度矩阵则通常由这些矩阵组装起来得到。
