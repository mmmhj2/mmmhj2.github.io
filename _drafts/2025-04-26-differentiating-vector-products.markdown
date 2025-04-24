---
title: "向量的外积、张量积和楔积"
published: false
---

在考虑两个欧几里得空间中的向量之间的“乘法运算”的时候，我们会遇到以下几种说法：
1. 内积
2. 外积
3. 张量积
4. 楔积

除了内积比较容易理解（并且实际上定义了欧几里得空间）之外，剩下三种乘积之间是否有什么关系？

## 外积与张量积

首先简单回忆一下外积和张量积：

## 楔积与外代数

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

### Hodge 星算子

设$V$为一$n$维欧几里得空间，其标准正交基底为$\{e\_{1,\dots, n}\}$，而内积记为$\langle \cdot, \cdot \rangle$，则作用在其外代数上的一元算子$\star$，若能满足
$$\alpha \wedge (\star \beta) = \langle \alpha, \beta \rangle (e_1 \wedge \cdots \wedge e_n),$$
则称其为霍奇星算子。
{: .definition}

显然
