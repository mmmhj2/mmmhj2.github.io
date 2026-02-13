---
title: "张量分析无痛入门"
categories: "分析"
---

## 反变与协变

为了理解张量分析这一庞杂的主题，让我们首先从最简单的情境开始。
我们来考虑最简单的向量：平面向量。

我们首先回忆一些基本的代数知识：
1. 平面向量构成实数域上的二维线性空间$\mathbb R^2$，它们之间可以加减并作内积，得到一个实数；还可以通过数乘来乘一个实数。
2. 如果说平面向量构成一个代数，那么将平面向量映射为实数的线性映射也构成一个线性空间，这一空间称为其*对偶空间*，记为$\mathbb {R^2}^\*$，其中的元素称为对偶向量或协向量。
   - <small>例如，考虑映射$(x, y) \mapsto x$和映射$(x, y) \mapsto y$，它们均是将平面向量映射为实数的线性函数。这两个映射之间可以加减（$(x, y) \mapsto x \pm y$），也可以做数乘（$(x, y) \mapsto \lambda x, \lambda \in \mathbb R$），并且得到的依然是将平面向量映射为实数的线性函数。</small>
3. 平面向量与其对偶向量之间存在与双射，这两个空间同构。
   - <small>对任何有限维向量空间中基底，我们总是构造对偶空间的基底：
$$e_i: x_1 \mathbf e_1 + \cdots + x_n \mathbf e_n \mapsto x_i,$$
该函数“选择”出第$i$个坐标。容易验证这样的线性函数共有$n$个且均线性无关</small>。
   - <small>对于欧几里得空间，由于存在内积，因此具有一个特别的双射：
$$\circ^\top: \mathbb R^2 \to {\mathbb R^2}^*, x \mapsto (y \mapsto x \cdot y),$$
这个映射将一个向量映射到与这个向量做内积这个映射上。
特别地，这个同构与坐标选择无关，因此称为典范同构</small>。

现在让我们结束这些抽象的代数讨论，回到大家都喜欢的坐标表示上吧。
我们考虑平面向量空间的任意一组基底$\mathbf e\_1, \mathbf e\_2$，那么在该基底下任何向量均可写为
$$\mathbf x =  x_1 \mathbf e_1 + x_2 \mathbf e_2.$$
我们可以利用矩阵表示来将其写为“行向量”乘列向量的形式。
习惯上向量的坐标占据列向量的位置，因此：
$$\mathbf x =  \begin{bmatrix} \mathbf e_1 & \mathbf e_2 \end{bmatrix} \begin{bmatrix} x_1 \\ x_2 \end{bmatrix}.$$

### 反变向量

现在考虑另一基底
$$\mathbf e_1' = \mathbf e_1 T_{11} + \mathbf e_2 T_{21},\; \mathbf e_2' = \mathbf e_1 T_{12} + \mathbf e_2 T_{22},$$
或可写为
$$\begin{bmatrix} \mathbf e_1' & \mathbf e_2' \end{bmatrix} = \begin{bmatrix} \mathbf e_1 & \mathbf e_2 \end{bmatrix} \begin{bmatrix} T_{11} & T_{12} \\ T_{21} & T_{22} \end{bmatrix} = \begin{bmatrix} \mathbf e_1 & \mathbf e_2 \end{bmatrix} T,$$
这里$T$也被叫做过渡矩阵（transition matrix），这个公式叫做基变换公式。

当我们希望得到向量$\mathbf x$在另一个坐标系下的坐标时，有
$$\begin{bmatrix} \mathbf e_1' & \mathbf e_2' \end{bmatrix} \begin{bmatrix} x_1' \\ x_2' \end{bmatrix} = \begin{bmatrix} \mathbf e_1 & \mathbf e_2 \end{bmatrix} \begin{bmatrix} x_1 \\ x_2 \end{bmatrix} = \begin{bmatrix} \mathbf e_1 & \mathbf e_2 \end{bmatrix} T T^{-1} \begin{bmatrix} x_1 \\ x_2 \end{bmatrix},$$
因此
$$\begin{bmatrix} x_1' \\ x_2' \end{bmatrix} = T^{-1} \begin{bmatrix} x_1 \\ x_2 \end{bmatrix}.$$
这意味着对于坐标系变换这一操作而言，向量是*反变*（Contravariant）的。
向量的坐标变换所使用的矩阵是基底的坐标变换矩阵的*逆矩阵*。

### 对偶空间与协向量

对于对偶空间中的协向量，坐标变换又如何作用于它们呢？
一般来讲，为了确定坐标变换的效果，需要给出空间的基底，但对于这个特别的情况，我们可以直接利用矩阵来进行运算。

任何一个协向量$f$（即线性函数），我们用行向量来表示它在某一基底下的坐标表示。
由于
$$\begin{bmatrix} f_1 & f_2 \end{bmatrix} \begin{bmatrix} x_1 \\ x_2 \end{bmatrix} = \begin{bmatrix} f_1' & f_2' \end{bmatrix} \begin{bmatrix} x_1' \\ x_2' \end{bmatrix} = \begin{bmatrix} f_1' & f_2' \end{bmatrix} T^{-1} \begin{bmatrix} x_1 \\ x_2 \end{bmatrix},$$
有
$$\begin{bmatrix} f_1' & f_2' \end{bmatrix} = \begin{bmatrix} f_1 & f_2 \end{bmatrix} T.$$

因此，对偶空间中的协向量使用和基底变换相同的变换来完成坐标变换，所以协向量是*协变*（Covariant）的。

### 爱因斯坦求和约定

对于只有两个分量的情况，将每个分量展开还不太麻烦；
但对于维数更高的情况，我们不得不使用求和记号$\sum$。
而若需要操作大量向量和矩阵，那么即使使用求和符号也会带来很大的负担。
为此，爱因斯坦提出了以下求和约定：

1. 若向量是协变的，那么将其指标置于下标位置上；若向量是反变的，则将其指标置于上标位置上。习惯上协变位于反变之前。
2. 若式子中的某一指标由变量表示，且该变量恰好出现了两次：一次在上标位置、一次在下标位置，就意味着对该指标求和。求和的范围由语境确定，通常是向量所在空间的维数。
3. 求和的变量称为绑定变量，未被求和的变量称为自由变量，自由变量的用法与其他式子中的用法没有区别。

例如，向量在某基底下的坐标可写为
$$\mathbf x = \sum_{i = 1}^n \mathbf e_i x^i = \mathbf e_i x^i.$$
而对于矩阵，由于矩阵右乘列向量仍为列向量，而左乘行向量仍为行向量，有：
$$\mathbf x' = T^{-1} \mathbf x = {T^{-1}}_j^i \mathbf x^j.$$
这意味着$T\_j^i$表示矩阵第$i$行第$j$列的元素。
这就是说，矩阵具有两个“轴”，并且在一个轴上是协变的，而在另一个轴上是反变的。
这一点实际上对任何向量空间到自身的线性变换均成立。
考虑$f: \mathbb R^n \to \mathbb R^n$，令$y = f(x)$,有
$$\mathbf y' = T \mathbf y = T f(\mathbf x') = T f T^{-1} \mathbf x,$$
可以发现，$f$在坐标变换下确实同时被$T$和$T^{-1}$作用。

这里我们需要区分一下几何对象及其坐标表示。
将向量$x$写为列向量$\mathbf x$、将线性变换$f$写为矩阵$F$均是得到了某个几何对象的坐标表示。
几何对象的存在与坐标系的选择无关，而其坐标表示则恰恰相反，与坐标系（即基底）的选择密切相关。
之后提到张量的定义时，我们还会接触到这一区别。

利用爱因斯坦求和约定，我们可以非常容易地写出更高维情况下的反变与协变。

设$\mathbb R^n$空间中两基底$\mathbf e$和$\mathbf e'$满足
$$\mathbf e_i' = \mathbf e_j T^j_i,$$
那么其中向量的坐标表示是*反变*的，即满足
$$x_i' = x_j {T^{-1}}_i^j,$$
而其对偶空间中的协向量的坐标表示是*协变*的，即满足
$${f^i}' = T^i_j f^j.$$
{: .proposition}

在欧几里得空间这一非常特殊的内积空间之下，若我们再选择正交标准基底这一非常特别的基底，那么任何向量的对偶向量，就是其列向量的转置。
在这种情况下，我们可以不再区分协变和反变向量。

### 微分与对偶空间

关于对偶空间，有一则非常有趣的事实将其与微分联系起来：

表示空间$\mathbb R^n$中沿某一坐标轴方向的“微小变化”的“微元”$d x_i$，是该空间的对偶空间的一组基底。
{: .proposition}

我们不会在此做出太多的展开，因为这会涉及到大量微分几何相关的内容。
但是下面不甚严谨的说明可能有助于建立一些直觉。

考虑可微映射$f: \mathbb R^2 \to \mathbb R$，其全微分为：
$$d f = \frac{\partial f}{\partial x} d x + \frac{\partial f}{\partial y} d y.$$

现在的问题是，这个全微分到底是什么？
我们知道，这个全微分在某一点才有意义，表示的是原函数在某一点处变化最大的方向，即：
$$d f: \mathbb R^2 \to \mathbb R^2,\; (x,y) \mapsto df(x,y).$$
在欧几里得几何中，若我们需要确定“方向”，那么一定需要将一个向量与另一个向量做内积，因此“方向向量”实际上是对偶空间中的向量或者“协向量”。
因此，这个全微分实际上是从$\mathbb R^2$到其对偶空间的映射：
$$d f = (\partial_x f, \partial_y f) \in \mathbb R^2 \to \mathbb {R^2}^\star.$$
然后注意到
$$\partial_x f : \mathbb R^2 \to \mathbb R,\; (x,y) \mapsto \frac{\partial f(x, y)}{\partial x}, \; \partial_x f \in \mathbb {R^2}^\star.$$
可以说，$\partial\_x f$是“行向量”，而$d f$是“行向量”的“行向量”。
在这个意义下，全微分的表达式可以写为：
$$d f = (\partial_x f, \partial_y f) = \partial_x f \begin{pmatrix} 1 & 0 \end{pmatrix} + \partial_y f \begin{pmatrix} 0 & 1 \end{pmatrix},$$
即
$$d x = \begin{pmatrix} 1 & 0 \end{pmatrix}, d y = \begin{pmatrix} 0 & 1 \end{pmatrix},$$
这正是对偶空间的基底。

那么，既然“微元”$d x_i$是对偶空间的基底，它也应该是协变的，实际上也正是如此。
考虑：
$$
d f = \frac{\partial f}{\partial \tilde x^i} d \tilde x^i = \frac{\partial f}{\partial x^j} \frac{\partial x^j}{\partial \tilde x^i} d \tilde x^i = \frac{\partial f}{\partial x^j} d x^j,
$$
从而
$$\frac{\partial x^j}{\partial \tilde x^i} d \tilde x^i = T_i^j d \tilde x^i = d x^j.$$

## 张量的定义与运算

接下来我们给出张量的定义以及其上的运算。
我们首先从最简单、符合直觉的基于坐标的定义开始，然后给出关于坐标不变性的讨论，最后给出张量的代数定义作为补充。
完成定义之后，我们将简单介绍张量上定义的运算，以及张量及其运算构成的结构，即张量空间。

### 张量的定义

我们首先给出基于坐标分量的定义。

一个定义在$n$维实向量空间$V$上的、形状为$(p,q)$的张量$a$是一个$p+q$维的数组，其中含有$n^{p+q}$个元素。
这个数组关于坐标变换具有以下的不变性：
假设该向量空间坐标系通过过渡矩阵$T$进行了变换，那么新坐标系下，该张量的坐标表示$\tilde a$和原坐标系下的表示$a$满足：
$$
{\tilde a^{i_1 \cdots i_p}}_{j_1 \cdots j_q} = S^{i_1}_{u_1} \cdots S^{i_p}_{u_p} \cdot {a^{u_1 \cdots u_p}}_{v_1 \cdots v_q} \cdot T^{v_1}_{j_1} \cdots T^{v_q}_{j_q},
$$
其中$S$是$T$的逆矩阵。$i$被称作反变坐标，而$j$被称作协变坐标。
{: .definition}

根据上面的定义，我们可以将之前研究的一些代数对象重新归类：
 - $(0, 0)$形张量：标量；
 - $(1, 0)$形张量：矢量；
 - $(0, 1)$形张量：协向量、线性泛函；
 - $(2, 0)$形张量：二重向量；
 - $(1, 1)$形张量：线性变换；
 - $(0, 2)$形张量：双线性变换......

对于欧几里得空间，我们之前已经说明，由于协变坐标代表的对偶空间和反变坐标代表的空间同构，因此区分协变坐标和反变坐标没有意义。
这也是$(2, 0)$形张量、$(1, 1)$形张量和$(0, 2)$形张量具有相同坐标表示（即矩阵）的原因。

#### 张量的代数定义

之前我们讨论过，一个代数对象和其坐标表示是一体两面的。
矩阵这种坐标表示具有简单、统一、具体、易于计算的优点，但是会将其表示的代数对象的一些性质隐藏起来。
例如，线性变换和双线性变换都是关于坐标无关的代数对象，但是在不同的坐标系和基底选择之下，相同的代数对象会具有不同的坐标表示。
为了从坐标表示复原“具有相同代数对象”这一关系，我们不得不引入新的等价关系：对线性变换，这个关系叫做相似（similarity）；对双线性变换则是合同（congruence）。

那么对张量，我们也应当提问：其坐标无关的本质代数定义是什么？

一个定义在$n$维实向量空间$V$上的、形状为$(p,q)$的张量是一个变换：
$$a:  \underbrace{V \times \cdots \times  V}_{p \text{ 个}} \times \underbrace{V^* \times \cdots \times V^*}_{q \text{ 个}}\to \mathbb R,$$
这个变换必须满足多线性，即对$p+q$维输入向量中的每一个向量均满足线性。
{: .definition}

数学上我们有时更加关心协向量空间，这时定义中的$V$和$V^\*$会调转过来。
这种协向量或线性映射优先的表示方法的好处是可以完全无视坐标系和基底的选择，且协变向量会和向量空间本身统一起来。

为从代数定义中复原基于分量的定义，只需要在每一维输入向量中插入该空间的基向量即可，即
$${a^{i_1 \cdots i_p}}_{j_1 \cdots j_q} = a(\mathbf e_{i_1}, \dots, \mathbf e_{i_p}, \mathbf f^{j_1}, \dots, \mathbf f^{j_q}),$$
其中$\mathbf e, \mathbf f$分别是向量空间及其对偶空间的基向量。

接下来的文章中我们将主要使用更简单的基于分量的定义，除非在某些情况下基于代数的定义更符合直觉。
我们约定，当我们不带指标地指明一个张量$a$的时候，我们指的是这个“坐标不变”的代数对象；
而当我们带指标地指明一个张量的时候，我们说的是它在某个坐标系下的分量表示，这就是说$a^{ij}$和$a\_{ij}$都是矩阵。
有些时候我们会把坐标系直接写出，除非若上下文已经确定了坐标系，这样就不再写出了。

### 张量的运算

张量的加法和数乘都是容易定义的。

设$a, b$为二形状为$(p,q)$的张量，则其加法定义为：
$${(a+b)^{i_1 \cdots i_p}}_{j_1 \cdots j_q} = {a^{i_1 \cdots i_p}}_{j_1 \cdots j_q} + {b^{i_1 \cdots i_p}}_{j_1 \cdots j_q},$$
即两个张量逐元素相加。
设$k$为数域上一常数，则其数乘定义为
$${(ka)^{i_1 \cdots i_p}}_{j_1 \cdots j_q} = k {a^{i_1 \cdots i_p}}_{j_1 \cdots j_q},$$
即逐元素相乘。
{: .definition}

接下来是两个比较特别的运算：缩合和张量积。

设$a$为形状为$(n,m)$的张量，则其关于反变坐标$i\_{p}$和协变坐标$j\_{q}$的缩合（contraction）是一个$(n-1, m-1)$张量$b$：
$$
{b^{i_1 \cdots i_{p-1} i_{p+1} \cdots i_n}}_{j_1 \cdots j_{q-1} j_{q+1} \cdots j_m} = \sum_{k=1}^n {a^{i_1 \cdots i_{p-1} k i_{p+1} \cdots i_n}}_{j_1 \cdots j_{q-1} k j_{q+1} \cdots j_m}
$$
{: .definition}

通过研究$b$在不同坐标系下的变化，可以证明其确为$(n-1, m-1)$阶的张量。

设$a,b$分别为二形状为$(p,q)$和$(n,m)$的张量，则二者的张量积是一个$(p+n, q+m)$的张量，定义为
$$
{ { { (a \otimes b)^{i_1 \cdots i_p}}_{j_1 \cdots j_q}}^{i_{p+1} \cdots i_{p+n}}}_{j_{q+1} \cdots j_{q+m}} = {a^{i_1 \cdots i_p}}_{j_1 \cdots j_q} \cdot {b^{i_{p+1} \cdots i_{p+n}}}_{j_{q+1} \cdots j_{q+m}}.
$$
张量积不遵循交换律，但具有双线性，即关于两个张量均具有线性。
{: .definition}

通过研究$a \otimes b$关于坐标系的变化，仍然可以证明其张量积是张量。
但更简单的思路是从代数定义出发。
两个张量的张量积可视作函数的乘积：
$$a\otimes b(x_1, \dots, x_{p+q}, y_1, \dots, y_{n+m}) = a(x_1, \dots, x_{p+q}) \cdot b(y_1, \dots, y_{n+m}),$$
显然，函数的多线性依然得到保持，因此结果还是张量，而且双线性也是显然的。
容易发现，由于交换$a,b$的位置会打乱参数的排序，因此张量积不具有交换性。

#### 张量空间与指标顺序

假设$\mathbf e, \mathbf f$分别是向量空间及其对偶空间的基向量，那么，用张量的语言，他们分别是$(1, 0)$阶张量和$(0, 1)$阶张量。
利用张量积，我们可以将张量“拆分”成这些基底张量的线性组合，即：
$$
a = {a^{i_1 \cdots i_p}}_{j_1 \cdots j_q} \cdot \mathbf{e}_{i_1} \otimes \cdots \otimes \mathbf{e}_{i_p} \otimes \mathbf{f}^{j_1} \otimes \cdots \otimes \mathbf{f}^{j_q}.
$$
这正是我们从代数定义复原分量定义时采用的策略。
对数学家而言，这也是定义张量空间的方法：首先定义张量积，然后在向量空间及其对偶空间中利用张量积构造出张量空间。

这种表示方法在说明张量本质的同时也揭露了表示法上的一个小问题：
$$a = {a^i}_j \mathbf e_i \otimes \mathbf f^j \quad b = {b_i}^j \mathbf f^i \otimes \mathbf e_i,$$
这两个张量属于同一张量吗？
按照我们的代数定义，反变指数必须出现在协变指标之前，因此张量$b$是非良定义的。
然而，有时我们可能确实需要变换指标的位置，尤其是需要实现协变和反变指标之间的变换。
这需要借助度量张量来完成。

## 度量张量

这一节我们将简单介绍度量张量的概念，并给出用度量张量操作指标的方法。
最后我们会提出度量张量的其他用处，譬如计算弧长、确定球坐标或柱坐标下的微分算符等。

### 度量张量的定义

我们知道，内积空间中的各种度量，诸如长度、角度等，都和内积密切相关，因此为了研究度量，我们首先研究内积。
我们知道，内积是特殊的双线性变换——特别地，实内积空间的内积一定是正定的对称双线性变换。
我们又知道，双线性变换是一个张量，因此任何内积实际上都是一个张量，这个张量便是度量张量。

内积空间$(V, \langle \cdot, \cdot \rangle)$上的度量张量（metric tensor）$g$是一个$(0, 2)$阶的张量，定义为：
$$\langle u, v \rangle = g_{ij} u^i v^j.$$
{: .definition}

通过将基向量代入$u,v$，容易验证$g$是唯一的。

考虑坐标变换$\tilde u = S u$，其中$S = T^{-1}$为过渡矩阵的逆矩阵，有
$$\tilde g_{ip} \tilde u^i \tilde v^p = \tilde g_{ip} u^i S_i^j  v^p S_p^q = (\tilde g_{ip} S_i^j S_p^q) u^i v^p \implies \tilde g_{ip} = g_{jq} T_j^i T_q^p,$$
这正符合$(0,2)$阶张量的矩阵表示的特征。

为了用于计算，我们更关心这个张量的矩阵表示。
显然，这也可以通过代入基向量完成。
有：
$$g_{ij} = \langle \mathbf e_i, \mathbf e_j \rangle.$$
对于欧几里得空间下的标准正交基底，这意味着
$$g_{ij} = \delta_{ij}.$$
这个矩阵正是基向量的格拉姆矩阵（Gram matrix），记为$G$。
而某一基向量下的内积则可写为：
$$\langle u, v \rangle = \tilde u^\top \tilde G \tilde v = u^\top (S^\top G S) v, \implies \tilde G = S^\top G S.$$

上述公式相当有用。
譬如，考虑任何可微的坐标系变换$y = f(x)$，根据链式法则，有
$$d y^i = \frac{\partial y^i}{\partial x^j} d x^j$$
记得我们上面说明过对偶空间中的基底实际上是一个“微元”，有
$$g = g_{ij,y} d y^i d y^j = g_{ij,y} \frac{\partial y^i}{\partial x^n} d x^n \frac{\partial y^j}{\partial x^m} d x^m,$$
即
$$g_{ij,y} \frac{\partial y^i}{\partial x^n} \frac{\partial y^j}{\partial x^m} = g_{nm,x},$$
注意到
$$J_{ij} f = \frac{\partial f_i}{\partial x^j} = \frac{\partial y^i}{\partial x^j},$$
有
$$g_{ij,y} J_{in} J_{jm} = g_{nm, x},$$
即
$$J^T G_y J = G_x.$$
这个矩阵关系在之后的计算中非常有用。

我们已经知道对任何可微的坐标系变换，新的坐标系下的度量张量均可计算得出，而这个新的坐标系下的内积甚至不需要是良定义的，譬如在极坐标等坐标系下。
这就是说，度量张量并不需要一定在内积空间中定义，而是可以定义在任何具有微分性质、且能在某个局部上映射到欧几里得空间的结构上。
这种结构就是微分流形，度量张量可以定义在任何微分流形上，只要其作为双线性形式满足以下公理：
- 对称性，即$g(x, y) = g(x, y)$；
- 非退化性，即
$$\forall x \neq 0, \exists y,\; \text{s.t. } g(x, y) \neq 0.$$

根据西尔韦斯特惯性定律，这个对称的双线性形式具有不变的惯性指数，而且由于是非退化的，因此不会有零惯性指数。
如果张量度量的惯性指数均为正，那么这个流形称为黎曼流形（Riemannian manifold），典型的黎曼流形包括笛卡尔坐标系下、球坐标系下或其他各种坐标系下的欧几里得空间。
否则，这个流形称为伪黎曼流形（pseudo-Riemannian manifold），典型的伪黎曼流形包括广义相对论使用的闵可夫斯基空间。

### 度量张量与指标操作

如同内积能够通过典范同构实现向量空间及其对偶空间的同构一样，度量张量也可以用来实现这一同构。
这一性质特别有用，因为这个同构意味着我们可以自由地移动指标的位置。

通过度量张量将向量变为其协向量的映射称为降变换（Flat）：
$$\cdot^\flat: V \to V^*, \; u \mapsto g(u, \cdot).$$
由于$g$是非退化的，这个变换是双射。
用张量的记法，我们将$u^i$的对偶向量记为
$$u_j = g_{ij} u^i,$$
此时度量张量的具体意义需要根据语境确定。
将降变换与$(p+1, q)$阶的张量复合，可将其变为$(p, q+1)$阶的张量，即
$$g_{uv} {a^{i_1 \cdots u \cdots i_p}}_{j_1 \cdots j_q} = {a^{i_1\cdots i_p}}_{v j_1 \cdots j_q}.$$
约定下降的指标总是出现在第一个位置。
{: .definition}

反过来，为了让张量的指标上升，我们需要一个$(2,0)$阶的张量。
作为降变换的逆变换，应当满足
$$g^{ij} u_j = u^i.$$
这就是说
$$g^{ij} g_{ij} u^i = u^i \implies g^{ij} g_{ij} = \delta_i^j.$$
如果我们考虑张量的矩阵表示，这意味着
$$G' G = I,$$
也就是说$g^{ij}$度量张量的“逆张量”。

降变换的逆变换称为升变换（Sharp）：
$$\cdot^\sharp: V^* \to V, \; g(u, \cdot) \mapsto u.$$
将升变换与$(p, q+1)$阶的张量复合，可将其变为$(p+1, q)$阶的张量，即
$$g^{uv} {a^{i_1 \cdots i_p}}_{j_1 \cdots u \cdots j_q} = {a^{v i_1\cdots i_p}}_{j_1 \cdots j_q}.$$
同样约定上升的指标总是出现在第一个位置。
{: .definition}

这两个变换统称为音乐同构（Musical isomorphism）。

对一般的内积空间，我们甚至不需要度量张量即可交换指标的位置。
只要内积是良定义的，那么对偶变换：
$$u^*: V \to V^*, \; u \mapsto \langle u, \cdot \rangle,$$
在不引入任何“外部因素”的情况下即可将向量变为其协向量。
然而，对于不存在内积、只存在度量的空间，譬如极坐标系下的欧几里得空间，由于没有良定义的内积，因此操作指标势必引入度量张量。
度量张量正是在这些坐标系下才能发挥最大的作用。

### 例子：计算弧长

设$\gamma(t)$为一定义在$[0, 1]$上的可微曲线，曲线所处的黎曼空间的度量张量为$g$，则该曲线的弧长为
$$L = \int_0^1 \sqrt{g_{ij} \dot \gamma^i(t) \dot \gamma^j(t)} \, \mathrm d t = \int_0^1 \sqrt{g(\dot \gamma(t), \dot \gamma(t))} \; \mathrm d t.$$
{: .proposition}

我们来计算圆的周长。
在极坐标系下，圆的参数方程为
$$\gamma(t) = \begin{cases}r(t) = r \\ \theta(t) = 2\pi t\end{cases}.$$
对于极坐标系，我们要计算度量张量的矩阵表示。
我们考虑$(r, \theta) \mapsto (x, y)$这一变换，其雅可比矩阵为
$$
J = \begin{bmatrix} \partial_r x & \partial_\theta x \\ \partial_r y & \partial_\theta y \end{bmatrix} = \begin{bmatrix} \cos \theta & -r \sin \theta \\ \sin \theta & r \cos\theta \end{bmatrix}.
$$
我们已经知道，在笛卡尔坐标系下的度量张量为
$$g'_{ij} = \begin{bmatrix}1 & 0 \\ 0 & 1 \end{bmatrix},$$
因此极坐标系下的度量张量为
$$g_{ij} = J^T g'_{ij} J = \begin{bmatrix}1 & 0 \\ 0 & r^2 \end{bmatrix}.$$
然后计算一下微分：
$$
\dot \gamma(t) = \begin{bmatrix} 0 \\ 2\pi
\end{bmatrix}.
$$
最后代入积分，得到
$$C = \int_0^1 \sqrt{4 \pi^2 r^2} \, \mathrm d t = 2 \pi r.$$

## 张量的微分

度量张量真正的威力在于其和微分的结合使用，这节中我们将简单介绍一些这方面的内容。

### 协变导数

我们考虑下面这个代数对象：
$$\nabla_j v^i = \frac{\partial v^i}{\partial x^j},$$
这个代数对象很好地刻画了矢量场$v$的“微分”。
比如，对于散度，我们可以直接写：
$$\nabla \cdot v = \nabla_i v^i = \frac{\partial v^i}{\partial x^i}.$$
这自然产生了下一个问题，即这个代数对象关于坐标系如何变化？
如果这个变化符合一定的规律，那么这个规律能否由协变和反变表示？
这就是说，代数对象$\nabla\_j v^i$是不是张量？

矢量场的微分，若定义为
$$\nabla_j' v^i = \frac{\partial v^i}{\partial x^j},$$
不是张量。但是若定义为
$$\nabla_j v^i = \frac{\partial v^i}{\partial x^j} + {\Gamma^i}_{kj} v^k,$$
其中
$${\Gamma^i}_{kj} = \frac{1}{2} g^{il}\left( \frac{\partial g_{lk}}{\partial x^j} + \frac{\partial g_{lj}}{\partial x^k} - \frac{\partial g_{kj}}{\partial x^l} \right),$$
则是$(1,1)$阶的张量。
这个导数称为*协变导数*（covariant derivative）；$\Gamma$称为*克里斯托费尔符号*（Christoffel symbols）。
注意，克里斯托费尔符号虽然用张量指标表示，但本身**不是**张量。
{: .proposition}

对于直角坐标系下的欧几里得空间，显然克里斯托费尔符号均为零，因此协变导数的矩阵表示和雅可比矩阵相同。

对任何$(p,q)$阶的张量，协变导数是$(p, q+1)$阶的张量，可写为：
$$
\begin{aligned}
\nabla_\gamma a^{i_1 \cdots i_p}_{j_1 \cdots j_q} &= \frac{\partial a^{i_1 \cdots i_p}_{j_1 \cdots j_q}}{\partial x^\gamma} \\
& + \Gamma^{i_1}_{k \gamma} a^{k i_2 \cdots i_p}_{j_1 \cdots j_q} + \cdots + \Gamma^{i_p}_{k \gamma} a^{i_1 \cdots i_{p-1} k}_{j_1 \cdots j_q} \\
& - \Gamma^{j_1}_{k \gamma} a^{i_1 \cdots i_p}_{k j_2 \cdots j_q} - \cdots - \Gamma^{j_q}_{k \gamma} a^{i_1 \cdots i_p}_{j_1 \cdots j_{q-1} k}.
\end{aligned}
$$

克里斯托费尔符号实际上被定义为满足
$$\nabla_i \mathbf e_j = \Gamma^k_{ij} \mathbf e_k$$
的唯一常数。
这个常数表征了基底向量对求导的行为。
此处空间有限，因此我们不讨论其推导，只需要知道在$\Gamma$的帮助下，定义的协变导数具有两个性质：
- 对称性（symmetric），也叫无挠性（torsion free）：
$$\nabla_i \nabla_j f = \nabla_j \nabla_i f \implies \Gamma^{k}_{ij} = \Gamma^{k}_{ji}.$$
这条性质保证了拉普拉斯符号是良定义的。
- 保度量性（metric perserving）或度量相容（metric compatible）：
$$\nabla_k g_{ij} = 0.$$
这条性质则保证了度量不受求导操作的影响。

并且还满足所有微分算符的性质，即线性和莱布尼兹法法则：
$$\nabla_\gamma (a \otimes b) = a \otimes (\nabla_\gamma b) + (\nabla_\gamma a)\otimes b$$

协变导数在数学上也叫列维-奇维塔联络（Levi-Civita connections）。
求导这种操作被称为联络，是因为它们能将两个坐标系连续地联结在一起，就像力学中使用的自然坐标系（Frenet frame）一样。

### 例子：球坐标系下的散度

我们希望计算球坐标系下的散度。
根据上文的协变导数，协变导数意义下的散度定义为
$$\nabla \cdot u = \nabla_i u^i = \frac{\partial u^i}{\partial x^i} + {\Gamma^i}_{ki} u^k.$$
我们需要计算$\Gamma^{i}\_{ki}$，即克氏符号的缩合。
首先注意到$i$和$l$都是求和变量，因此可以消去最初和最后两项：
$$
{\Gamma^i}_{ki} = \frac{1}{2} g^{il}\left( \frac{\partial g_{lk}}{\partial x^i} + \frac{\partial g_{li}}{\partial x^k} - \frac{\partial g_{ki}}{\partial x^l} \right)
= \frac{1}{2} g^{il} \frac{\partial g_{li}}{\partial x^k}.
$$
然后，对所有可对角化的矩阵$A = \ln B$（包括度量张量），我们有：
$$\det(\exp A) = \exp(\mathrm{Tr}(A)) \iff \ln \det B = \mathrm{Tr}(\ln B),$$
两边同时求偏微分，得到
$$\frac{1}{\det B} \partial_t \det B = \mathrm{Tr}(B^{-1} \partial_t \ln B).$$
代回克氏符号，注意到
$$g^{il} \frac{\partial g_{li}}{\partial x^k} = \mathrm{Tr}\left( g_{il}^{-1} \partial_k  g_{il} \right),$$
即可得到
$${\Gamma^i}_{ki} = \frac{1}{2 \det g} \partial_k \det g = \frac{1}{\sqrt{\det g}}\partial_k \sqrt{\det g}.$$
代回散度表达式，得到
$$\nabla_i u^i = \frac{\partial u^i}{\partial x^i} + \frac{1}{\sqrt{\det g}} \frac{\partial \sqrt{\det g}}{\partial x^i}  u^i = \frac{1}{\sqrt{\det g}} \frac{\partial \sqrt{\det g} \cdot u^i}{\partial x^i}$$

对于球坐标系$(r, \theta, \phi)$，其度量张量及其行列式为
$$g_{ij} = \begin{bmatrix} 1 & 0 & 0 \\ 0 & r^2 & 0 \\ 0 & 0 & r^2 \sin^2 \theta \end{bmatrix}, \det g_{ij} = r^4\sin^2 \theta,$$
从而
$$
\begin{aligned}
\nabla_i u^i &= \frac{1}{r^2 \sin \theta} \left( \frac{\partial}{\partial r} r^2 \sin \theta u_r + \frac{\partial }{\partial \theta} r^2 \sin \theta u_\theta+ \frac{\partial }{\partial \phi} r^2 \sin \theta u_\phi\right) \\
&= \frac{1}{r^2} \frac{\partial r^2 u_r}{\partial r} + \frac{r^2}{\sin \theta} \frac{\partial \sin \theta u_\theta}{\partial \theta} + \frac{1}{r^2 \sin \theta} \frac{\partial u_\phi}{\partial \phi}.
\end{aligned}
$$

这一结果表明了协变导数和经典物理学中不同坐标系中导数的统一，这使得我们在书写偏微分方程时不再需要注意任何坐标系的问题。
更进一步地，由于协变导数可以定义在非欧几里得的度量空间上，这一数学工具在广义相对论中得到了大量的应用。
