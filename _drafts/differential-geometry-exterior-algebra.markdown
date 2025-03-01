---
title: "微分几何初步——外代数"
categories: "分析"
---

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
这个名字来自基底变换时张量在对应基底下的值的改变。
以向量为例，设两基底之间满足：
$$
\begin{bmatrix}\mathbf e_1' & \cdots & \mathbf e_n' \end{bmatrix} P = \begin{bmatrix}\mathbf e_1 & \dots & \mathbf e_n\end{bmatrix}
$$
那么反变张量（即列向量）的变基满足
$$\begin{bmatrix}v_1' \\ \vdots \\ v_n'\end{bmatrix} = P \begin{bmatrix} v_1 \\ \vdots \\ v_n \end{bmatrix},$$
而协变张量（即向量对应的数乘）满足
$$\begin{bmatrix} \mathbf v \cdot \mathbf e_1' & \cdots & \mathbf v \cdot \mathbf e_n' \end{bmatrix} P = \begin{bmatrix} \mathbf v \cdot \mathbf e_1 & \cdots & \mathbf v \cdot \mathbf e_n \end{bmatrix}.$$
若两组基底都是正交标准的，那么$P$是正交矩阵，而协变张量的公式则可写为
$$\begin{bmatrix}v_1' \\ \vdots \\ v_n'\end{bmatrix}^T = \begin{bmatrix} v_1 \\ \vdots \\ v_n \end{bmatrix}^T P^{-1}.$$
这意味着在正交标准基底下，总是有
$$v^* = \mathbf v^T.$$

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
多线性映射关于上文所述的相加和数乘构成向量空间，这一空间记为$T^k(V)$，交错的多线性映射也构成向量空间，记为$A^k(V)$。
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

$V^\*$上的*楔积*（wedge product）定义为
$$
\bigwedge(\mu_1, \dots, \mu_k) = \mu_1 \wedge \cdots \wedge \mu_k \in T^k (V)
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

### 外代数的定义

这一节中我们将简单说明一些代数知识，并给出张量积、外代数和楔积的形式定义。

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

接下来我们定义两个代数空间中的张量积。

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

正如上一节中提到的，我们可以使用两个线性空间的基底来构造它们的张量积。
设空间$U, V$的基底为$B\_U, B\_V$，那么其中每个元素可写为
$$x = \sum_{u \in B_U} x_u u, \; y = \sum_{v \in B_V} y_v v.$$
设$h$为任意的双线性形式，有
$$h(x,y) = \sum_{u,v} x_u y_v h(u, v).$$
这意味着任何双线性形式的值可由其在所有基底处的取值唯一确定。
现在定义$u \otimes v$，
$$(u \otimes v)(x, y) = x_u y_v,$$
而
$$(x \otimes y)(a,b) = \sum_{u, v} x_u y_v (u \otimes v)(a,b).$$
那么任何双线性形式均可写为
$$h(x,y) = \sum_{u,v} (u \otimes v)(x, y) \cdot h(u, v).$$
正如上文所述，双线性形式由其在所有基底处的取值唯一确定，因此上述分解是唯一的，满足张量积的定义，从而$(u \otimes v)$构成了$U \otimes V$的一组基底。
这里需要注意，根据基底$B\_U, B\_V$的选择不同，空间$U \otimes V$的基底（以及空间本身）也不同，但是这些空间之间总是同构的。

这个张量积的定义与上文（以及连续体力学中）所给出的张量积的定义是一致的。
在此前，我们定义过：设$f \in T^n,g \in T^m$为二多线性映射（即张量），那么它们的张量积$f \otimes g \in T^{n+m}$定义为
$$f \otimes g(x_1, \dots, x_{n+m}) = f(x_1, \dots, x_n) \times g(x_{n+1}, \dots, x_{n+m}).$$
不难发现上一段中根据基底分解的张量积定义与上一节中利用每个分量对张量积的定义有异曲同工之妙。

张量积的一个特别的例子是向量空间自己的张量积：例如，欧几里得空间的对偶空间（即线性函数空间）的$k$阶张量积，就是$k$线性函数的空间。

利用张量积，我们可以定义张量代数。

设$V$为域$F$上的代数，那么定义其$k$阶张量幂空间为
$$T^k (V) = V^{\otimes k} = \underbrace{V \otimes V \otimes \cdots \otimes V}_{k \, \text{次}},$$
且约定$T^0 (V) = F.$
该代数所有张量幂空间的直和称为该代数的*张量代数*（tensor algebra），即
$$T(V) = \bigoplus_{k=0}^\infty T^k (V) = F \oplus V \oplus (V \otimes V) \oplus \cdots.$$
{: .definition}

承接上文关于欧几里得空间的对偶空间的张量积的说明，欧几里得空间的张量代数就是所有多线性映射组成的代数，也就是力学中常见的张量组成的代数。

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

#### 外代数的性质

我们考虑该定义与此前给出的所有楔积的性质的一致性。
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
{: .proposition}

这个空间的维数与此前提过的$A^k(V)$一致，这提醒我们寻找它们之间的关系。

设$A$为$V$上一至$W$代数的线性映射，要求$W$中的乘法有单位元且满足结合律，而$A$满足
$$A(x) A(x) = 0, \forall x \in V,$$
那么存在唯一的线性映射
$$f: \bigwedge (V) \to W,$$
使得
$$A(x) = f(x), \forall x \in V.$$
即，任何一个定义在$V$上的单位结合代数，若其中的乘法满足反对称性，那么一定存在唯一的$f$使得其中含有$f(\bigwedge(V))$。
{: .proposition}

这被称为外代数的泛性质（universal property）。

利用这条性质，我们将$W$替换为$T(V)$，从而$A(x)$就是任何交错的（或反对称）的张量，满足$A(x) \otimes A(x) = 0$。
这意味着外代数中的每一个向量都和一个反对称的张量一一对应。

我们不会证明这个命题，因为其涉及到范畴论的内容，但是，我们可以给出外代数的一个等价的构造，从而说明这个问题。

注意到$T^k V$是由可分解的张量
$$v_1 \otimes v_2 \otimes \cdots \otimes v_k$$
张成的，对可分解的张量，设$\mathcal{A}$和$\mathrm{Alt}$为：
$$
\begin{aligned}
\mathcal A^k (v_1 \otimes \cdots \otimes v_k) &= \sum_{\sigma \in S_k} \mathrm{sgn}(\sigma) v_{\sigma(1)} \otimes \cdots \otimes v_{\sigma(k)} \\
\mathrm{Alt}^k(v_1 \otimes \cdots \otimes v_k) &= \frac{1}{k!} \mathcal A^k(v_1 \otimes \cdots \otimes v_k)
\end{aligned}
$$
注意这个定义与此前提到的行列式非常相似。

根据定义，映射$\mathrm{Alt}^k$的像空间是$k$线性反对称映射组成的空间$A^k(V)$。
利用$\mathrm{Alt}$，定义该空间中的乘法为：
$$\alpha \wedge \beta = \mathrm{Alt}(\alpha \otimes \beta).$$
对任何一系列张量，$\mathcal A^k (v\_1 \otimes \cdots \otimes v\_k)$根据定义一定是反对称的，从而该乘法也是反对称的，不难发现这种定义和此前提到的楔积的定义的思路具有很高的相似性
。
注意到变换$\mathcal{A}^k$的核空间正好为理想$I$与$T^k(V)$的交集，这就相当于从$T(V)$中除去了理想$I$，从而说明了这两种定义的等价性。
这种等价性意味着这两个代数是同构的，从而每个外代数中的向量唯一对应了一个反对称的张量，且这个向量的阶数一定和张量的阶数相同。

### 外代数上微分形式的定义

利用外代数，我们可以给出微分形式的定义：

设$U$为$\mathbb R^n$上一开集合，其对偶空间${\mathbb{R}^n}^\*$的一组基底记为
$$\pi_1 = \dif x_1, \dots, \pi_n = \dif x_n.$$
则其上的$1$阶微分形式是从$U$到其对偶空间的光滑映射：
$$
\begin{array}{cccc}
\alpha: & U & \to & {\mathbb R^n}^* \\
& (x_1, \cdots, x_n) & \mapsto & (f_1, \cdots, f_n)
\end{array}
$$
从而可写为
$$\alpha = \sum_{i=1}^n f_i \dif x_i.$$
更一般地，其上的$k$阶微分形式是从$U$到$k$阶外代数$\bigwedge^k({\mathbb R^n}^\*)$的光滑映射，记为：
$$\alpha = \sum_I f_I \dif x_I.$$
记其在$\mathbf x \in U$处的取值为
$$\alpha_\mathbf x = \sum_I f_I(\mathbf x) \dif x_I.$$
$k$阶微分形式构成的空间记为$\Omega^k(U)$。
{: .definition}

由于$\mathbb R^n$实际上是一个具有内积的欧几里得空间，它和其对偶空间典范同构，从而其外代数也是典范同构的，微分形式$\alpha$也可等价地定义在$\bigwedge({\mathbb{R}^n})^\*$上，即
$$\alpha : U \to(\bigwedge({\mathbb{R}^n}) \to \mathbb R).$$
因此，该空间的维数与$\bigwedge^{k} (\mathbb R^n)$的维数相等，均为$\binom{n}{k}$，这与我们此前朴素的研究相符。
更进一步的，由于外代数与反对称张量的同构，$\alpha$可作为一个协变的反对称张量场出现：
$$\alpha : U \to A^k(\mathbb R^n).$$
此外，考虑到张量空间是由可分解张量张成的，而在$\mathbb R^n$中线性独立的可分解张量不能超过$n$个，因此，若一个张量可被分解为更多的张量，那么其中一定由线性相关的部分，从而一定在理想$I$中，因此高于$n$阶的微分形式一定为零。

令$U,V$分别为$\mathbb R^n, \mathbb R^m$上两个开集合，$\phi$为从$U$至$V$的光滑映射。设$\alpha \in \Omega^k(V)$为一微分形式，则该微分形式的拉回定义为
$$\phi^* (\alpha)_\mathbf x (\mathbf v_1, \dots, \mathbf v_k) = \alpha_{\phi(\mathbf x)} (D\phi(\mathbf x) \mathbf v_1, \dots, D\phi(\mathbf x)\mathbf v_k).$$
其中
$$\phi^* (\alpha) \in \Omega^k(U).$$
{: .definition}


