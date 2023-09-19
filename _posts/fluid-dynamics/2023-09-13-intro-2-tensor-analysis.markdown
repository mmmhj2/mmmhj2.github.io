---
title: "张量分析导论"
categories: ["流体力学"]
---

## 张量

在物理学中，我们已经见到过三维空间下的标量、矢量和矩阵了。
从感性的认知中，我们不难从中总结出一些规律，并将它们推广：标量可视为变量、矢量可视为一维的数组、矩阵可视作二维的数组，那么是否存在更高维的数组呢？如果存在，它们的意义又是什么呢？

本节中我们将从经典物理和现代数学的角度给出张量的定义，并研究它们的一些应用。

### 张量的定义

#### 经典定义

$m$维空间下的$n$阶张量是一个$n$维的数组，数组的每一维大小均为$n$。
数组含有$m^n$个元素，其中每一个元素称为该张量的分量。
{: .definition}

以这种方式定义的张量必须额外具有对坐标系变换的不变性，这样从形式上讲不同坐标系下的同一个物理量在张量表示下才能相同。

#### 现代数学定义

$m$维空间下的$n$阶张量是一个从线性空间到数域（通常是实数域）的*多线性映射*：
$$T: \quad \underbrace{ V \times \cdots \times V }_{n\text{个}} \to \mathbb{R} $$
其中$\mathrm{dim} V = m$。
{: .definition}

我们以向量为例来理解这种定义。
向量本身通常视为$\mathbb{R}^3$空间中的一个元素，但是在内积空间中，其也可以视为一个算子：
$$
\begin{array}{cccc}
<u, \cdot>: \ & \mathbb{R}^3 & \to & \mathbb{R} \\
& v & \mapsto & <u, v>
\end{array}
$$
这两种方式是完全等价的，这是因为物理学中常常研究的$\mathbb{R}^3$空间与其对偶空间${\mathbb{R}^3}^*$同构。
出于以上原因，我们完全可以使用对偶空间中的元素来定义一个向量，因此一个向量也可以视为$\mathbb{R}^3 \to \mathbb{R}$这一映射的集合中的一个元素。

这种定义的优点在于，其中蕴涵了对坐标系变动的不变性。
以矩阵为例，如果将其简单地视作二维的数组，那么在不同基底下，本质相同的矩阵，即表示同一变换的矩阵，会有不同的表示。
如果直接将矩阵定义为二维数组，则丧失了这些关系，从而不得不引入相似矩阵来重新表述这种关系。
而如果将矩阵本身视作线性变换在某一基底下的表示，那么相似矩阵的几何意义就是显而易见的了。

由于$\mathbb{R}^3$空间与其对偶空间的同构，在张量的定义中，我们也可以使用任意多个$V^*$来替代$V$。
这种定义不影响其物理意义，但是给出了张量的更一般表述。

### 张量积

（张量积的形式定义）记$f,g$为二分别为$k$维与$m$维的多线性函数，则两函数的张量积表示为：
$$(f \otimes g)(x_1, \dots, x_{k+m}) = f(x_1, \dots, x_k) \times g(x_{k+1}, \dots, x_{k+m})$$
{: .definition}

以向量$a = (a\_1, a\_2, a\_3)$和$b = (b\_1, b\_2, b\_3)$为例计算其张量积：
将其化为线性映射的形式，注意到：
$$
\begin{aligned}
a(x_1, x_2, x_3) &= a_1 x_1 + a_2 x_2 + a_3 x_3 \\
b(y_1, y_2, y_3) &= b_1 y_1 + b_2 y_2 + b_3 y_3 \\
\implies (a \otimes b) (x_1, \dots, y_3) &= a_1 b_1 x_1 y_1 + a_1 b_2 x_1 y_2 \\
& + \dots + a_3 b_3 x_3 y_3
\end{aligned}
$$
注意到其确为双线性型，从而将其再转化回矩阵形式，可得：
$$
a \otimes b =
\begin{pmatrix}
a_1 b_1 & a_1 b_2 & a_1 b_3 \\
a_2 b_1 & a_2 b_2 & a_2 b_3 \\
a_3 b_1 & a_3 b_2 & a_3 b_3 \\
\end{pmatrix}
$$
{: .exampl}

因此我们可以给出以下符合直觉的定义：

记$U, V$为二$n,m$阶张量，其张量积为一$n+m$阶张量，其中每一分量为：
$$(U \otimes V)_{i_1 i_2 \cdots i_{n+m}} = U_{i_1 \cdots i_n} \times V_{i_{n+1} \cdots i_{n+m}}$$
{: .definition}

### 爱因斯坦求和约定

张量是一个高维的线性空间的元素，如果需要以每一个分量进行计算，则需要写成大量的求和的形式。
爱因斯坦求和约定使用以下规定简化了这种求和的书写。

- 在多项式的某一项中，若某一个因子的下标中存在恰好出现了两次的变量，则其是一个求和变量。求和变量按照上下文规定的范围进行取值，计算该项的值，然后相加。
- 若下标中存在非求和变量，则其为自由变量。等式两侧的自由变量的取值始终相同。

以向量的内积为例，其可以写成：
$$\vec u \cdot \vec v = \sum_{i = 1}^3 u_i v_i = u_i v_i$$

相对地，对以下式子：
$$C_{ij} = A_{ik} B_{kj}$$
注意到在等式右侧的项中，变量$k$存在两次，因此其一定是求和变量。
将其展开，可以写成：
$$C_{ij} = \sum_k A_{ik} B_{kj}$$
这其实是矩阵乘法。

同理，矩阵的迹可以写成：
$$\mathrm{Tr}(A) = \sum_i A_{ii} = A_{ii}$$

物理中常见对某一分量的偏导操作，这种操作也可以简写：
$$\nabla \vec u(x_1, x_2, x_3) = \sum_{i=1}^3 \frac{\partial \vec u_i}{\partial x_i} = \partial_{\textcolor{red}{i}} u_i = u_{i\textcolor{red}{,i}}$$

有时还能见到将指标写在上标位置的情况。
如果出现这种写法则上标意味着反协变向量的指标（行向量的推广），下标意味着协变向量的指标（列向量的推广）。
我们不使用这种写法。

### 张量的应用

#### 梯度张量

对于向量$\vec u$，其*梯度张量*定义为：
$$ \vec T = \vec \nabla \vec u = \begin{pmatrix}
\partial_1 u_1 & \cdots & \partial_1 u_n \\
\vdots & \ddots & \vdots \\
\partial_n u_1 & \cdots & \partial_n u_n
\end{pmatrix}$$
可视为梯度对向量场的推广，也可视为雅可比矩阵的转置。
{: .definition}

我们可以尝试利用梯度张量来化简一些运算：
$$
\begin{aligned}
\nabla \vec u \cdot \vec n &= \nabla (u_1 n_1 + u_2 n_2) = (\partial_1 (u_1 n_1 + u_2 n_2), \partial_2 (u_1 n_1 + u_2 n_2)) \\
&= (n_1 \partial_1 u_1 + n_2 \partial_1 u_2, n_1 \partial_2 u_1 + n_2 \partial_2 u_2) \\
&= n_i \vec T_{ij}
\end{aligned}
$$

特别地，在力学中常常见到$(\vec U \cdot \nabla)\vec V$的形式，此时该算子$(\vec U \cdot \nabla)$应被理解成$U\_i \partial\_i$的形式：
$$
(\vec U \cdot \nabla) \vec V = U_j \partial_j V_i = 
\begin{pmatrix}
U_x \frac{\partial V_x}{\partial x} + U_y \frac{\partial V_x}{\partial y} + U_z \frac{\partial V_x}{\partial z} \\
U_x \frac{\partial V_y}{\partial x} + U_y \frac{\partial V_y}{\partial y} + U_z \frac{\partial V_y}{\partial z} \\
U_x \frac{\partial V_z}{\partial x} + U_y \frac{\partial V_z}{\partial y} + U_z \frac{\partial V_z}{\partial z} \\
\end{pmatrix}
$$
也可以理解成$\vec U$乘$\vec V$的梯度张量的形式：
$$
(\vec U \cdot \nabla) \vec V = 
\begin{pmatrix}
U_x & U_y & U_z
\end{pmatrix}
\cdot
\begin{pmatrix}
\partial_x V_x & \partial_x V_y & \partial_x V_z \\
\partial_y V_x & \partial_y V_y & \partial_y V_z \\
\partial_z V_x & \partial_z V_y & \partial_z V_z \\
\end{pmatrix}
$$
甚至理解成$\vec V$的雅可比矩阵乘$\vec U$的形式。

同理，我们也可以使用类似的符号来将散度定理简化并一般化：
$$
\begin{aligned}
\iiint_V \nabla \cdot \vec u \mathrm d v &= \iint_S \vec u \cdot \mathrm d \vec S \\
\iiint_V \partial_i \vec u_i \mathrm d v &= \iint_S u_i n_i \mathrm d S
\end{aligned}
$$

#### 克罗内克符号

克罗内克符号是一个二阶张量，定义为：
$$
\delta_{ij} = \left\{
    \begin{aligned}
    1, & i = j \\
    0, & i \neq j
    \end{aligned}
\right.
$$
{: .definition}

克罗内克符号常在爱因斯坦求和约定中出现，作为转化求和指标的工具：
$$u_i u_j \delta_{ij} = \sum_i \sum_j u_i u_j \delta_{ij} = \sum_i u_i u_i = u_i u_i$$

#### 列维-奇维塔符号

记$S(i\_1, \dots, i\_n)$表示置换
$$
\begin{pmatrix}
1 & 2 & \cdots & n \\
i_1 & i_2 & \cdots & i_n
\end{pmatrix}
$$
的符号（偶置换为+1，奇置换为-1，非置换为0），则$n$阶列维-奇维塔符号是以下张量：
$$\epsilon_{i_1i_2 \cdots i_n} = S(i_1, i_2, \dots, i_n)$$
{: .definition}

利用该符号和行列式的定义，可将行列式写为：
$$\det A = \sum_{\sigma \in S_n} \mathrm{sgn}(\sigma) \prod A_{i, \sigma(i)} = \epsilon_{i_1 \cdots i_n} A_{1 i_1} \cdots A_{n i_n}$$
