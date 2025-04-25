---
title: "向量的外积、张量积和楔积"
categories: ["代数"]
tags: ["张量分析"]
---

在考虑两个欧几里得空间中的向量之间的“乘法运算”的时候，我们会遇到以下几种说法：
1. 内积；
2. 外积（Exterior product）
3. 叉积（Cross product）；
4. 张量积（Tensor product, outer product）；
5. 楔积（Wedge product）。

除了内积比较容易理解（并且实际上定义了欧几里得空间）之外，剩下几种乘积之间是否有什么关系？

## 外积与张量积

首先简单回忆一下外积和张量积：

两个三维向量的外积定义为
$$
a\times b = 
\begin{pmatrix}
a_x \\ a_y \\ a_z
\end{pmatrix}
\times
\begin{pmatrix}
b_x \\ b_y \\ b_z
\end{pmatrix} = 
\begin{pmatrix}
a_y b_z - a_z b_y \\
a_z b_x - a_x b_z \\
a_x b_y - a_y b_x
\end{pmatrix}.
$$

而两个任意维度的向量的张量积是一个矩阵，定义为
$$
a \otimes b = 
\begin{pmatrix}
a_1 \\ \vdots \\ a_n
\end{pmatrix} \otimes
\begin{pmatrix}
b_1 \\ \vdots \\ b_m
\end{pmatrix} = 
\begin{pmatrix}
a_1 b_1 & \cdots & a_1 b_m \\
\vdots & \ddots & \vdots \\
a_n b_1 & \cdots & a_n b_m
\end{pmatrix}.
$$

张量积的形式定义如下：

设$U,V, W$为任意三个向量空间，其中$U,V$定义在域$F$上。
若存在一双线性映射$B$，定义为
$$
\begin{array}{cccc}
B: & U \times V & \to & W \\
& (u, v) & \mapsto & w
\end{array}
$$
且满足
$$
\begin{multline}
\forall h \in U \times V \to F, \quad \exists! \tilde h \in W \to F, \\
\text{s.t.} \quad h(u, v) = \tilde h(B(u,v)),
\end{multline}
$$
其中$h$是双线性形式，$\tilde h$是线性形式，
那么就称$W$为向量空间$U,V$的张量积，记为$U \otimes V$。$B(u,v)$则记为$u \otimes v$
{: .definition}

由于欧几里得空间装备了内积，其与其对偶空间典范同构，因此一个向量其实就是一个线性形式（即协向量），而一个矩阵就是一个双线性形式。
于是上面这个非常“吓人”的定义实际上是说：
$$a \otimes b = ab^T \iff y^T \cdot (a \otimes b) \cdot x = (a^Ty) \times (b^T x).$$
在左边，我们给出了向量的张量积的一般形式，在右边，我们则将张量积重新拆分为两个线性形式。

## 楔积与外代数

在这一节中，我们将仔细研究楔积以及外代数。

### 理想

首先回忆一下理想的定义。

环$(R, +, \times)$上关于群$(R, +)$的一个子群$(I, +)$，若其本身对群中所有元素关于乘法封闭，则称为一个*理想*（ideal）。特别地，若
$$\forall r \in R, \forall i \in I, r \times i \in I,$$
则称其为右理想；若
$$\forall r \in R, \forall i \in I, i \times r \in I,$$
则称其为左理想；若同时满足，则称其为双边理想。
{: .definition}

我们现在只研究双边理想。显然，对于交换环以及域，所有理想都是双边理想。

设$I$为一双边理想，则环$R$中的二元关系
$$x \sim y \iff x - y \in I$$
是一个等价关系，称为环的*同余关系*（congruence relation），也记作
$$x \equiv y \pmod{I}.$$
这个等价关系定义的所有等价类的集合也能构成一个环，称为该环的*商环*（quotient ring），记作$R/I$。
{: .definition}

理想起到了类似整数中“因数”的作用。
例如，考虑整数中偶数构成的双边理想，由于偶数可由2乘任何整数生成，这个理想是主理想（principal ideal），记为$2 \mathbb Z$，那么整数环关于该同余关系的商环只有两个元素：
$$\mathbb Z/2\mathbb Z = \{ \{0,2,4,6,\dots\}, \{1,3,5,7,\cdots\} \} = \{0, 1\}.$$
这里我们习惯上使用$0$和$1$这两个代表元来指涉整个等价类。

### 张量代数

利用张量积，我们可以定义张量代数。

设$V$为域$F$上的代数，那么定义其$k$阶张量幂空间为
$$T^k (V) = V^{\otimes k} = \underbrace{V \otimes V \otimes \cdots \otimes V}_{k \, \text{次}},$$
且约定$T^0 (V) = F.$
该代数所有张量幂空间的直和称为该代数的*张量代数*（tensor algebra），即
$$T(V) = \bigoplus_{k=0}^\infty T^k (V) = F \oplus V \oplus (V \otimes V) \oplus \cdots.$$
{: .definition}

对欧几里得空间而言，所谓一阶张量就是向量（准确的说，是协向量），而二阶张量就是矩阵（准确的说，是线性变换）。

### 外代数与楔积

最后，根据理想和张量代数，我们定义外代数：

设$V$为域$F$上的代数，令集合$I$为
$$I = \left< x \otimes x  : x \in V \right>$$
即由形如$x \otimes x$的元素生成的张量代数$TV$的双边理想。
称代数$V$关于理想$I$的商代数为该代数的*外代数*（exterior algebra），即
$$\bigwedge(V) = T(V) / I$$
在其上定义楔积：
$$\alpha \wedge \beta = \alpha \otimes \beta \pmod{I}.$$
{: .definition}

选择这个特别的理想，是为了满足楔积的*反交换性*：
注意到由于$x \otimes x \in I$，因此
$$x \wedge x = 0,$$
从而
$$0 = (x + y) \wedge (x+y) = x \wedge y + y \wedge x,$$
即
$$x \wedge y = - y \wedge x.$$

根据这个理想，我们还可给出楔积的另一条性质：
由于理想$I$能写为
$$I = \left\{ \sum_i A_i (x_i \otimes x_i) B_i : x_i \in V, \; A_i, B_i \in TV \right\}$$
且$A\_i, B\_i$根据定义能够拆分为分量的张量积，从而$I$实际上是由形如
$$x_1 \otimes \cdots \otimes x_i \otimes x_i \otimes \cdots \otimes x_m$$
的张量张成的子空间。
这意味着楔积为零，当且仅当两边线性相关，这称为楔积的*非平凡性*。

此外，楔积还继承了张量积的*双线性*和*结合性*（由于我们对张量积的定义，我们没有证明结合性，这是比较容易证明的）。
这四条性质是楔积的基本性质。

### 外代数的基本性质

首先考虑外代数本身的结构。

$k$阶楔积构成了该代数的一个子代数，记为$\bigwedge^k(V)$，该代数由形如
$$x_1 \wedge x_2 \wedge \cdots \wedge x_k, \; x_i \in V$$
的元素张成。
若外代数中的某一个元素能够写为以上多个$V$中向量的楔积的形式，那么称其为可分解的。

利用这种分解，可给出每个空间的基底并计算其维度。

设$V$为一$n$维空间，记其基底为$\mathbf e\_i$，则其上$k$阶楔积组成的外代数的维数为$\binom{n}{k}$，而其一组基底为$\mathbf e\_i$的$k$阶楔积：
$$\mathbf e_I = \{ \mathbf e_{i_1} \wedge \mathbf e_{i_2} \wedge \cdots \wedge \mathbf e_{i_k} :  0 < i_1 < i_2 < \cdots < i_k \le n \}$$
{: .proposition}

设$V$为域$F$上一$n$维空间，则其外代数可写为$k$阶楔积的子空间的直和：
$$\bigwedge (V) = \bigwedge {\mskip -6mu}^0(V) \oplus \bigwedge {\mskip -6mu}^1(V) \oplus \bigwedge {\mskip -6mu}^2(V) \oplus \cdots \oplus \bigwedge{\mskip -6mu}^k(V),$$
其中
$$\bigwedge {\mskip -6mu}^0(V) = F, \bigwedge {\mskip -6mu}^1(V) = V.$$
这样，$k$阶楔积子空间中的元素称为k阶向量或k重向量（k-vectors）。
{: .proposition}

## 楔积与外积的一致性

### 三维空间中的二重向量

我们首先研究三维空间中的二重向量，即两个向量的楔积的性质。
我们已经知道，二重向量其实是两个向量的张量积，因此必然和某一个二阶张量或矩阵相关。
然而，二重向量并不能和任何一个矩阵相关。

设$S \in \mathcal S^3$为一对称矩阵，那么其一定可对角化，即存在一组基底$\{e\_1', e\_2', e\_3'\}$，使其在该基底下的表示为一个对角矩阵。
在这种情况下，这个矩阵可以写为：
$$S = a_1 e_1' \otimes e_1' + a_2 e_2'\otimes e_2' + a_3 e_3'\otimes e_3' = 0 \pmod{I}.$$
这意味着对称矩阵总是二重向量空间中的零向量。
考虑到矩阵总是可以分解为一对反对称矩阵与对称矩阵的和，这意味着一个二重向量实际上只对应一个反对称矩阵。

设$\mathbf a$为三维空间中的二重向量，即
$$\mathbf a = a_{12} e_1 \wedge e_2 + a_{23} e_2 \wedge e_3 + a_{31} e_3 \wedge e_1,$$
那么我们可以很自然地构造一个反对称矩阵：
$$
A = \begin{pmatrix}
0 & -a_{12} & a_{31} \\
a_{12} & 0 & -a_{23} \\
-a_{31} & a_{23} & 0
\end{pmatrix}
$$
其中第$i$列第$j$行的元素恰好对应$e\_i \wedge e\_j$。

眼尖的读者可能已经发现，这个反对称矩阵实际上和三维空间中的外积已经存在非常高的一致性：
设向量
$$\omega = \begin{pmatrix} \omega_x \\ \omega_y \\ \omega_z \end{pmatrix},$$
该向量对应的旋转矩阵为
$$
\Omega = \begin{pmatrix}
0 & -\omega_z & \omega_y \\
\omega_z & 0 & -\omega_x \\
-\omega_y & \omega_x & 0
\end{pmatrix},
$$
那么对任何向量$a \in \mathbb R^3$，有：
$$\Omega a = \omega \times a.$$
这意味着为了将三维空间中的外积与楔积联系起来，我们只需要找到一个$\bigwedge (R^3)$上可逆的变换$f$，满足：
$$f(e_1) = e_2 \wedge e_3, f(e_2) = e_3 \wedge e_1, f(e_3) = e_1 \wedge e_2.$$
这样，就有
$$f(a \times b) = a \wedge b.$$

### 霍奇星算子

我们马上就能找到一个这样的算子。

设$V$为一$n$维欧几里得空间，其标准正交基底为$\{e\_{1,\dots, n}\}$，而内积记为$\langle \cdot, \cdot \rangle$。
该内积可利用格拉姆行列式推广到其外代数上：
考虑两个简单的k重向量
$$\alpha = \alpha_1 \wedge \cdots \wedge \alpha_k, \beta = \beta_1 \wedge \cdots \wedge \beta_k,$$
其内积定义为
$$\langle \alpha, \beta \rangle = \det (\langle \alpha_i, \beta_j \rangle)_{i,j} = \det \begin{pmatrix} 
\langle \alpha_1, \beta_1 \rangle & \cdots & \langle \alpha_1, \beta_k \rangle \\
\vdots & \ddots & \vdots \\
\langle \alpha_k, \beta_1 \rangle & \cdots & \langle \alpha_k, \beta_k \rangle
\end{pmatrix}.$$
该定义可根据线性推广到所有k重向量上。

作用在其$n$维欧几里得空间的外代数上的一元变换$\star$，若对任何k重向量$\alpha, \beta$，能满足
$$\alpha \wedge (\star \beta) = \langle \alpha, \beta \rangle (e_1 \wedge \cdots \wedge e_n),$$
则称其为霍奇星算子。
显然，这个变换是线性的，因此可称为算子。
{: .definition}

显然，这个算子将$k$重向量映射为$(n-k)$重向量。
从定义可以看出，霍奇星算子其实是一个“保持内积”的变换。

在欧几里得空间中，一个算子可由其在所有正交标准基底下的变换关系完整的表示出来。
在三维欧几里得空间中，不难验证霍奇星算子满足：
$$
\begin{array}{cc}
\star 1 = e_1 \wedge e_2 \wedge e_3, & \star (e_1 \wedge e_2 \wedge e_3) = 1, \\
\star e_1 = e_2 \wedge e_3, & \star (e_2 \wedge e_3) = e_1, \\
\star e_2 = e_1 \wedge e_3, & \star (e_1 \wedge e_3) = e_2, \\
\star e_3 = e_1 \wedge e_2, & \star (e_1 \wedge e_2) = e_3, \\
\end{array}
$$
利用霍奇星，我们马上可以得到：
$$\star (a \times b) = a \wedge b, \; \star (a \wedge b) = a \times b.$$
由于霍奇星算子的“保内积”特性，这两个向量的“大小”是不变的，这就是两个向量的外积的大小等于其围成的平行四边形的面积的根本原因。

现在我们可以解释为什么尽管楔积可定义在任何维度的向量空间中，外积依然只能定义在三维空间中了。
设$V$为一$n$维向量空间，其中两个（一重）向量的楔积一定是二重向量，但是二重向量的霍奇星对偶却是$n-2$维的。
为了使其霍奇星对偶能与一重向量空间同构，这两个空间的维数必然相等，即
$$\binom{n}{1} = \binom{n}{n-2}$$
而这个方程只有一个解：$n=3$。
