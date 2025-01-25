---
title: "微分几何初步——流形上的微分形式"
categories: "分析"
---

本文将继续对微分形式的研究，将通过流形与外代数的形式对之前的“朴素”的微分形式的定义进行补充。

## 流形

通俗的讲，$n$维流形就是在任何点都足够平滑的$n$维曲面，在这样的曲面上，任何一个点的附近都可以视作是一个线性空间。

### 流形的定义

为了定义流形，我们首先给出嵌入的定义。

设$U \subset \mathbb R^n$为一开子集，若光滑映射
$$\psi \in C^{\infty}: U \to \mathbb R^N$$
是单射（从而在其值域上是双射），且逆映射$\psi^{-1}: \psi(U) \to U$连续，那么称$\psi$为*拓扑嵌入*（topological embedding）。
若其导数$D \psi$是单射，则称其为*浸入*（immersion）。
是浸入的拓扑嵌入称为*微分嵌入*（differential embedding）。
{: .definition}

我们主要研究微分嵌入。
回忆一般拓扑学中的内容，若连续映射$\psi$是双射且逆映射连续，那么这个映射是*同胚*（homeomorphism），同胚保持了其原像和像的拓扑学性质。
微分嵌入就是导数为单射的，从定义域到像上的同胚（但不一定是到陪域$\mathbb R^N$上的同胚）。
导数是单射意味着其雅可比矩阵必为列满秩，因此一定要求$\mathbb R^N$的维数大于$U$的维数，即$N \ge n$。

$\mathbb R^N$中的子集$M$是一个$n$维（微分）流形（manifold），若对其中的每一点$x \in M$，均存在一邻域$V\_x$（微分）同胚于$\mathbb R^n$。
即，存在一（微分）嵌入
$$\psi_x: U_x \subset \mathbb R^n \to \mathbb R^N$$
使得其将开集合$U\_x$映射至$x$点在$M$上的邻域中，即
$$\psi_x (U_x) = V_x \cap M.$$
其中$V\_x$是任意包括$x$的$\mathbb R^N$上的开集合。
{: .definition}

每个点上的嵌入$\psi$称为该点的局部参数化（local parametrization），其逆映射$\psi^{-1}$称为坐标卡（coordinate chart）或局部坐标系（local coordiante system）。
通过在所有$x\in M$点上选择映射，可以使得$\psi\_x(U\_x)$填满整个$M$集合，这样所有映射$\psi\_x$的集合称为地图册（altas）。

我们可以将$U$的定义放松到任何空间上，从而给出更一般的嵌入的定义，进而给出更抽象的流形的定义。
然而惠特尼嵌入定理（我们不会证明这个定理）说明，任何光滑的$m$维流形均可嵌入到$\mathbb R^{2m}$空间中，因此我们没有必要研究这些流形。

我们当然希望知道嵌入后的空间性质如何，而这可通过切空间进行研究。

流形$M$上点$x$处的切空间（tangent space）$T\_xM$，定义为$D \psi\_x$在$x$的原像附近的列空间，即
$$T_xM := D\psi_x(\psi^{-1}_x(x))(\mathbb R^n).$$
其中的元素称为切向量。切空间的集合称为切丛（tangent bundle）。
{: .definition}

显然，切空间是$\mathbb R^N$的子空间。

考虑光滑函数$f: \mathbb R \to \mathbb R$，我们可以给出一个从$\mathbb R$到$\mathbb R^2$的映射
$$\psi: t \mapsto \begin{pmatrix} t \\ f(t) \end{pmatrix}.$$
容易验证这是一个嵌入，而这个嵌入给出了一个一维流形，即函数在直角坐标系下的图像，其导数为
$$D \psi: t \mapsto \begin{pmatrix} 1 \\ f'(t) \end{pmatrix}.$$
从而其在点$(x,f(x))$处的切空间为向量$(1, f'(t))$形成的直线。
{: .exampl}

关于切空间的定义，一个重要的问题是：该定义是否是良好的？
对某一个点，我们能找到无穷多的嵌入，这些嵌入在该点处的切空间是否是一样的？
我们马上证明，点处的切向量以及切空间实际上与嵌入的选择无关，而只与流形$M$有关。

设$M \subset \mathbb R^N$为一$n$维流形，设$x \in M, v \in \mathbb R^N$，则$v$是$x$的切向量，当且仅当存在一路径
$$c: (-\epsilon, \epsilon) \to \mathbb R^N, \quad \text{s.t.} \; c(0) = x, c'(0) = v.$$
即存在一经过$x$且在该点处微分为$v$的路径。
{: .theorem}

前推后的证明是比较容易的。
设$\psi$为$x \in \mathbb R^N$点处对应的嵌入，则存在唯一的$t \in \mathbb R^n$满足$\psi(t) = x$。
现在设$v$为该点处的某一切向量，则根据定义，存在$u \in \mathbb R^n$，满足
$$v = D\psi(t)(u).$$
现在设路径$c$为
$$c(p) = \psi(t + p u).$$
则该路径满足题设：
$$c(0) = \psi(t) = x, \; c'(0) = D \psi(t) (u) = v.$$
对逆命题，我们设嵌入$\psi: U \to V$的（左）逆为$\psi^{-1}$。
现在假设路径$c$满足题设，即
$$c: (-\epsilon, \epsilon) \to \mathbb R^N, \quad \text{s.t.} \; c(0) = x.$$
现在我们证明$c'(0)$在切空间中。
设$u = D\psi^{-1}(c(0))$，证明
$$D \psi(\psi^{-1}(x)) u = c'(0).$$
根据路径的连续性，对足够小的$h$，我们仍能保证$c(h)$在$x$的邻域内，从而仍在嵌入$\psi$的值域中。
从而有
$$c(h) = \psi(\psi^{-1}(c())).$$
现在求微分并利用链式法则，得到
$$c'(h) = D\psi(\psi^{-1}(c(h))) D\psi^{-1}(c(h))$$
令$h = 0$，得到
$$v = c'(0) = D \psi(t) D\psi^{-1}(c(0)) = D \psi(t) u.$$
{: .proof}

这里我们忽略了$\psi^{-1}$的微分的存在性问题。
实际上，利用反函数定理可以证明，通过将嵌入$\psi$限制在更小的一个开子集$\tilde \psi: \tilde U \to \tilde V$上，该映射一定存在光滑的左逆。

### 正则值定理

使用每一个点的嵌入来描述流形使得流形非常不直观且难于研究，因此，更多情况下会选择使用隐式表示进行研究。
和曲面的隐式表示一样，流形可由一组方程隐式地表示：
$$
\phi(\mathbf x) = \mathbf c \iff \begin{aligned}
\phi_1 (x_1,\dots,x_N) &= c_1 \\
\phi_2 (x_1,\dots,x_N) &= c_2 \\
\vdots & \\
\phi_m (x_1,\dots,x_N) &= c_m
\end{aligned}
$$
其中
$$\mathbf x = \begin{pmatrix}x_1\\\vdots\\x_N\end{pmatrix}, \mathbf c = \begin{pmatrix}c_1\\\vdots\\c_m\end{pmatrix}$$
对给定的向量$\mathbf c$，方程$\phi$的原像
$$\phi^{-1}(\mathbf c) = \{ \phi(\mathbf x) = \mathbf c, \mathbf x \in \mathbb R^N \}$$
称为该曲面的水平集（level set）或纤维（fibre）。

根据水平集中每个点附近的情况，向量$\mathbf c$可分为两类：

若对向量$\mathbf c$的水平集中的每一个元素$\mathbf x$，其雅可比矩阵$D \phi(\mathbf x): \mathbb R^N \to \mathbb R^m$均为满秩（秩为$m$，满射），那么称该向量为*正则值*（regular value）；否则称为*奇异值*（singular value）。
{: .definition}

一个方程组的每一个正则值，均可定义一个流形。
这个命题称为正则值定理（regular value theorem）或原像定理（preimage theorem）。

设$V \subset \mathbb R^N$为一开集合，且$\phi: V \to \mathbb R^m$为一光滑映射，则对于每一个正则值$\mathbf c$，若其水平集$M \subset V$非空，则其可构成一个$N - m$维流形。
该流形在某一点$x$处的切空间即为雅可比矩阵的核空间：
$$T_x M = \ker(D\phi(x)).$$
{: .theorem}

我们只简单介绍一下证明的思路。
由于雅可比矩阵$D \phi$满秩，其$m$列构成$\mathbb R^m$的一组基底。
通过另外选择一组$\mathbb R^n$的基底，即可组成空间$\mathbb R^N = \mathbb R^m \times \mathbb R^n$的基底。从而，对任何$\mathbf x \in M \subset \mathbb R^N$，我们均可以将其写为
$$\mathbf x = (\mathbf u_0, \mathbf v_0), \; \mathbf u_0 \in \mathbb R^m, \mathbf v_0 \in \mathbb R^n.$$
由于$\phi$在$\mathbb R^m$空间中可逆，根据隐函数定理，在$u\_0$和$v\_0$的邻域$U,V$内，定存在唯一的光滑函数$f: U \to V$，使
$$\mathbf v = f(\mathbf u) \ \text{且}\ \phi(\mathbf u, f(\mathbf u)) = \mathbf c.$$
从而，可以证明光滑函数的图像形成的图像$M \cap U \times V$是一个流形，该处的嵌入为
$$\psi_{\mathbf x}: U \to \mathbb R^N, \; \mathbf u \mapsto \mathbf x = (\mathbf u, f(\mathbf u)).$$
该嵌入对每一个$\mathbf x \in V$均成立，从而$M$构成一流形。
对于切空间，注意到
$$\phi(\psi_{\mathbf x}(\mathbf u)) = \mathbf u$$
从而
$$D (\phi(\psi_{\mathbf x}(\mathbf u_0))) = D \phi(\mathbf x) D \psi_{\mathbf x}(\mathbf u_0) = 0.$$
根据定义，切空间是$D \psi\_{\mathbf x}(\mathbf u\_0)$的列空间，从而对任何切向量$\mathbf v$，均存在向量$\mathbf a$，使得
$$\mathbf v = D\psi_{\mathbf x}(\mathbf u_0) \mathbf a.$$
注意到
$$D \phi(\mathbf x) \mathbf v = D \phi(\mathbf x) D\psi_{\mathbf x}(\mathbf u_0) \mathbf a,$$
从而
$$\mathbf v \in \ker D \phi(\mathbf x) \implies T_x M \subset \ker D \phi(\mathbf x).$$
最后，利用秩定理可证明二者维度相同，从而两空间相等。
{: .proof}

这个定理说明了为何梯度一定与切线方向垂直。

在应用这个定理时，正确地选择$\mathbb R^m$空间非常重要。
我们马上就能看到，对一些映射而言，在一些空间中$D \phi(x)$不是满射，但在其一个子空间中就可能是满射。

#### 例子：正交变换群

在这一小节中，我们将利用正则值定理证明任意维度的正交变换（以及特殊正交变换）都是流形。

考虑映射
$$\phi: \mathcal M_n(\mathbb R) \to \mathcal M_n(\mathbb R), \; A \mapsto A^T A,$$
显然正交矩阵群$\mathcal O\_n$为
$$\mathcal O_n = \phi^{-1}(I),$$
其中$I$是单位阵。
那么$I$是否是该映射的正规值呢？
答案是否定的。首先计算其（加托）导数：
$$
\begin{aligned}
D \phi(A) B &= \left. \frac{\mathrm d}{\mathrm d \lambda} \phi(A + \lambda B) \right|_{\lambda = 0} \\
&= A^T B + B^T A.
\end{aligned}
$$
这只能组成对称矩阵，因此该导数对任何$A \in \mathcal O\_n$都不是满射，从而单位阵是奇异值而非正规值。
然而，我们可以将映射限制到对称矩阵群中。
记
$$\tilde \phi: \mathcal M_n(\mathbb R) \to S_n, \; A \mapsto \phi(A),$$
其中$S\_n$是对称矩阵的集合，我们非常容易地可以证明$D\tilde \phi(A) B$对任何$A \in \mathcal O\_n$都是满射：
设$C \in S\_n$为一对称矩阵，取$B = \frac{1}{2} AC$，
容易证明
$$A^T B + B^T A = \frac{1}{2} (A^TAC + CA^TA) = C.$$
从而对$I$的原像中的每一个$A$，该映射均是满射，从而$I$是一个正则值。

现在，由于$\mathcal M\_n$是$n^2$维的，而$S\_n$是$\frac{1}{2} n(n+1)$维的，从而正则值定理说明原像$\mathcal O\_n$是一个$\frac{1}{2} n(n-1)$维的流形。
按照类似的论证，特殊正交群$\mathcal {SO}\_n$也是同一维数的流形。

以三维空间中的旋转$\mathcal {SO}\_3$为例，其维数为三，因此所有旋转均可用三个实数表示——欧拉角、轴角表示等均利用了这个原理。
然而，由于其拓扑结构与实数空间不同，所有只使用三个实数的表示方法均有奇异点。
可视化$\mathcal {SO}\_3$最简单的方式就是使用轴角表示，并将旋转向量的长度限制为$|\mathbf r| \le \pi$，这就形成了三维空间中一个半径为$\pi$的球。
然而，球上相对的两点——对跖点——总是表示相同的旋转，因此这实际上是一个“首尾相连”的球，这种球实际上是射影空间$\mathbb{RP}^3$的一种表示。

像这种既是流形又是群的结构称为*李群*（Lie group），特殊正交群——即旋转变换——组成了典型的李群。

### 流形上的微分形式

实数空间$\mathbb R^N$中的微分形式与函数的关系依赖于该函数$f$的偏微分或方向导数：
$$\frac{\partial f}{\partial x_i} = \lim_{t \to 0} \frac{f(\mathbf x + t \mathbf e_i) - f(\mathbf x)}{t}, \; i \in [\![1, N]\!].$$
然而定义在流形上的函数不一定具有偏微分的定义，因为$\mathbf x + t \mathbf e\_i$不一定在流形上。
幸运的是，利用嵌入或局部坐标卡，我们总是能在某点附近找到一个线性空间（切空间），使得该函数在这个切空间上具有定义。

设$M \subset \mathbb R^N$为一$n$为流形，若存在一系列（可能无穷多）的开集合$U\_i$以及其上对于的嵌入$\psi\_i$，使得
$$M = \bigcup_i \psi_i (U_i).$$
那么对函数$f: M \to \mathbb R$，可定义一系列新函数
$$f_i: U_i \to \mathbb R, \; \mathbf x \mapsto f(\psi_i(\mathbf x)).$$
这些函数称为函数$f$在$U\_i$上的代表元（representitive）。
显然，某个函数流形上的所有代表元和该函数本身是一一对应的。

若某两个开集合$U\_i$和$U\_j$之间有交集，那么这两个开集合上的代表元满足
$$f_j(\mathbf u) = f_i(\psi_i^{-1} \circ \psi_j (\mathbf u)) \iff f_j(\mathbf u) = (\psi_i^{-1} \circ \psi_j)^* f_i(\mathbf u).$$
从而，拉回映射$(\psi\_i^{-1} \circ \psi\_j)^*$可实现两个代表元之间的变换，称为坐标变换。

基于代表元定义在线性空间$\mathbb R^n$的开集合上这一点，我们可以利用线性空间给出流形上微分的定义。

流形$M$上的$k$阶微分形式$\alpha$是一系列满足以下变换关系的微分形式的集合：
$$\alpha_j = (\psi_i^{-1} \circ \psi_j)^* \alpha_i.$$
这些微分形式均定义在实数空间的子集$U\_j \subset \mathbb R^N$上。
{: .definition}

容易发现“满足该变换关系”实际上是一个等价关系，因此流形上的微分形式实际上是一个等价类。

同一等价类$\alpha$中的不同微分形式可用不同的坐标写出：
$$
\newcommand\dif{\mathop{} \! \mathrm d}
\alpha_i = \sum_I f_I \dif x_I, \quad \alpha_j = \sum_J g_J \dif x_J,
$$
而其中的每一个函数满足
$$g_j = \sum_I (\psi_i^{-1} \circ \psi_j)^* \Big(f_I \det\big(D(\psi_i^{-1} \circ \psi_j)_{I,J}\big) \Big).$$

微分形式在流形上的楔积和外微分定义为对等价类的每一个相同开集合上定义的每一个微分形式去楔积或外微分，即
$$
\begin{aligned}
\gamma = \alpha \wedge \beta &\iff \gamma_i = \alpha_i \wedge \beta_i,& \quad\forall i. \\
\gamma = \dif \alpha &\iff \gamma_i = \dif \alpha_i,& \quad\forall i.
\end{aligned}
$$
容易验证这个定义维持了等价关系。

## 外代数

在这一节中，我们将简单介绍微分形式的现代理论——外代数理论，并给出现代的微分形式的定义。

首先我们回忆有关对偶空间的内容，这与外代数密切相关。

设$V$为域$\mathbb F$上定义的向量空间，则由线性泛函
$$f: V \to \mathbb F$$
全体组成的集合，加上映射的加法与数乘，即
$$
(f+g)(x) = f(x) + g(x), \; (cf)(x) = c \cdot f(x)
$$
也是一个向量空间，称为原向量空间的*对偶空间*（dual space），记为$V^\*$。
对偶空间中的向量也称为*协向量*（covector）。
{: .definition}

在张量分析中，原向量空间中的向量称为反变张量（contravariant tensor），对偶空间中的向量称为协变张量（covariant tensor）。

我们现在只考虑有限维的实线性空间。
如果已知任何一组原向量空间中的基底，那么则可根据这组基底给出一组对偶空间中的基底。

设$(\mathbf b\_1, \cdots, \mathbf b\_n)$为原空间$V$的一组基底，那么该基底下所有的坐标函数
$$\pi_i: V \to \mathbb R, \; \sum_j c_j \mathbf b_j \mapsto c_i.$$
组成了一组对偶空间中的基底，称为*对偶基底*（dual basis）。
{: .proposition}

以三维欧氏空间为例，标准正交基
$$\mathbf e_1, \mathbf e_2, \mathbf e_3$$
对应的坐标函数组成的基底为行向量
$$\mathbf e_1^T, \mathbf e_2^T, \mathbf e_3^T.$$
可以验证这正是坐标函数。

### 多线性变换与外代数

接下来考虑多线性变换。

设泛函$\mu: V^k \to \mathbb R$对每个元素都是线性的，即
$$
\begin{multline}
\mu(x_1, \dots, a x_i + b x_i', \dots, x_k) = \\
a \mu(x_1, \dots, x_i, \dots, x_k) + b \mu(x_1, \dots, x_i', \dots, x_k)
\end{multline}
$$
那么称这个泛函是$k$-线性的，或统称*多线性*（multilinear）的。
若该泛函还对任何置换$\sigma \in S\_k$满足
$$\mu(x_{\sigma(1)}, \dots, x_{\sigma(k)}) = \mathrm{sgn}(\sigma) \mu(x_1, \dots, x_k),$$
那么称这个置换是*交错*的（alternating）或*反交换*的。
多线性映射关于上文所述的相加和数乘构成向量空间，这一空间记为$\wedge^k(V)$，交错的多线性映射也构成向量空间，记为$A^k(V)$。
{: .definition}

例如，欧氏空间上的内积是双线性的，但不是交换的；
而在任何空间$\mathbb R^{n\times n}$上定义的行列式
$$\det (\mathbf v_1, \dots, \mathbf v_n)$$
都是交换的$n$线性变换。

一个特别的例子是张量积（tensor product）：
设$\mu\_1, \dots, \mu\_k$为协向量（线性泛函），则其张量积定义为
$$\mu_1 \otimes \cdots \otimes \mu_k(\mathbf x_1, \dots, \mathbf x_k) = \mu_1(\mathbf x_1) \cdots \mu_k(\mathbf x_k).$$
这是一个$k$线性变换。

我们还可以利用楔积来从任意的线性泛函生成*交错的*多线性变换。

$V^*$上的*楔积*（wedge product）定义为
$$
\bigwedge(\mu_1, \dots, \mu_k) = \mu_1 \wedge \cdots \wedge \mu_k \in \wedge^k (V)
$$
其中
$$
\begin{array}{cccc}
\mu_1 \wedge \cdots \wedge \mu_k: & V^k & \to & \mathbb R \\
&\mathbf v_1, \dots, \mathbf v_k & \mapsto & \det(\mu_i(\mathbf v_j))
\end{array}
$$
即矩阵
$$
\begin{pmatrix}
\mu_1 (\mathbf v_1) & \cdots & \mu_1 (\mathbf v_k) \\
\vdots & \ddots & \vdots \\
\mu_k (\mathbf v_1) & \cdots & \mu_k (\mathbf v_k)
\end{pmatrix}
$$
的行列式。
{: .definition}

显然，楔积也具有反交换性，即
$$\bigwedge(\mu_{\sigma(1)}, \dots, \mu_{\sigma(k)}) = \mathrm{sgn}(\sigma) \bigwedge(\mu_1, \dots, \mu_k).$$

注意到对任何$n$线性映射$\mu$，复合一个坐标函数即可得到一个线性泛函，即
$$\mu_1(\mathbf x) = \mu(\mathbf x, 0, \dots, 0)$$
从而将多线性映射拆分成线性泛函组成的分量。
因此，楔积的定义可任意扩展到任意两个交错的多线性映射之间，即
$$\mu \wedge \lambda = \mu_1 \wedge \cdots \wedge \mu_i \wedge \lambda_1 \wedge \cdots \wedge \lambda_j,\; \mu \in A^i, \lambda \in A^j.$$
同理，张量积也可推广到任意两个多线性映射之间。
这种多个代数，装备上其中定义的楔积之后，即形成一个外代数（exterior algebra）。

这一段话总的来说蕴涵了下一个命题：

设$V$的对偶空间$V^*$中，某一组基底的对偶基底为
$$\{ \mathbf b_1, \dots, \mathbf b_n \} \xleftrightarrow{\text{对偶}} \{ \pi_1, \cdots \pi_n \}$$
那么所有递增的$k$下标序列的楔积
$$\mu_I = \mu_{i,1} \wedge \cdots \wedge \mu_{i,k}$$
组成了交错$k$线性空间的一组基底，从而该空间的维数为$\binom{n}{k}$。
{: .theorem}

这里仅说明证明思路。
假设$\beta \in A^k(V)$确能写为$\beta\_I$的线性组合，那么设
$$\beta = \sum_I c_I \beta_I,$$
并计算
$$\beta(\mathbf b_J) = \sum_I c_I \beta_I(\mathbf b_J) = c_J$$
这里$I,J$都是递增的下标序列。
从而我们知道若该命题成立，那么每个系数均只能为上式计算出的值。
接下来需证明其确实能生成整个空间。
设$\beta \in A^k(V)$为任意交错多线性映射，并设
$$\beta' = \sum_I \beta(\mathbf b_I) \beta_I,$$
计算可得
$$\beta'(b_I) - \beta(b_I) = 0 \implies \beta' = \beta.$$
从而其是生成整个空间的极大线性无关组，证毕。
{: .proof}

例如，$A^2(\mathbb R^3)$在标准正交基底下的一组基底为
$$\pi_1 \wedge \pi_2, \pi_1 \wedge \pi_3, \pi_2 \wedge \pi_3.$$

不难发现，所谓的交错$k$线性映射与微分形式之间由极高的相似性。
我们马上就利用这些知识来给出微分形式的形式定义。

### 微分形式的定义
