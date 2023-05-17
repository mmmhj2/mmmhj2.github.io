---
title: "离散概率空间"
categories: ["概率论", "分析"]
---

本章中我们将重新研究级数，即至多可数个实数或复数组成的序列之和，的性质，然后研究更一般的概率空间，即离散概率空间。

## 正可和实数族

在本节中，我们将仅仅研究正实数，作为之后研究的基础。

记$(a\_i)\_{i \in I}$为一族至多可数的正实数。

### 可和族的定义

我们称正实数族$(a\_i)\_{i \in I}$的和为$\overline{\mathbb R\_+}$中的一个广义实数（即正实数、零和正无穷），定义为：
$$\sum_{i \in I} a_i = \sup_{F \in \mathcal P_f(I)} \sum_{i \in F} a_i$$
其中$\mathcal P\_f(I)$表示$I$的一个有限子集。
若这个和小于正无穷，那么称这个实数族是**可和**的。
{: .definition}

设$I$为一可数集，$\varphi: \mathbb N \to I$为任意双射，那么$(a\_i)$可和，当且仅当
$$\sum_{n = 0}^\infty a_{\varphi(n)}$$
收敛。
无论是否收敛，两者（在广义实数上）一定相等。
{: .proposition}

有几点值得注意的地方。
首先，对于一个正项级数，其要么收敛，要么趋于正无穷，而不会出现没有极限的情况。
其次，对正项级数，可和和级数收敛似乎没有区别，但是在之后对更一般的复数的研究中，我们将会看到，和可和对应的概念实际上是*绝对收敛*。

### 分组求和

设$(a\_i)\_{i \in I}$为一族至多可数的正实数。
设$(I\_j)\_{j \in J}$为$I$的一个划分。
那么，$(a\_i)$可和，当且仅当对每个划分中的子集$I\_j$，$(a\_i)\_{i \in I\_j}$可和且$(\sum\_{i \in I\_j} a\_i)\_{j \in J}$可和。
此时有：
$$\sum_{i \in I} a_i = \sum_{j \in J} \left( \sum_{i \in I_j} a_i \right)$$
{: .theorem}

对有限个元素的情况，这个命题是显然的，因此我们只考虑可数的情况。\
首先考虑后推前。
记$K \in I$为一个*有限*的集合，且$K\_j = I \cap I\_j$，那么$K\_j$也构成$K$的一个划分。
由于$K$是有限的，我们直接有：
$$\sum_{k \in K} a_k = \sum_{j \in J} \left( \sum_{k \in K_j} a_k \right)$$
由于对每一个$j$，我们都有$K\_j \subset I\_j$，从而
$$\sum_{k \in K_j} a_k \le \sum_{i \in I_j} a_i$$
因此又由于$(\sum\_{i \in I\_j} a\_i)\_{j \in J}$可和，
$$\sum_{k \in K} a_k \le \sum_{j \in J} \left( \sum_{i \in I_j} a_i \right) < +\infty$$
从而根据定义，
$$\sum_{i \in I} a_i = \sup_{F \in \mathcal P_f(I)} \sum_{i \in F} a_i \le \sum_{j \in J} \left( \sum_{i \in I_j} a_i \right) < +\infty$$
然后考虑前推后。
设$j \in J$，$K \subset I\_j \subset I$，且$K$有限，那么有：
$$\sum_{i \in K} a_i \le \sum_{i \in I} a_i < +\infty$$
由于$K$是任意的有限集合，根据定义，$(a\_i)\_{i \in I\_j}$可和。
现在，若$(a\_i)\_{i \in I\_j}$可和，那么根据定义$\sum\_{i \in I\_j} a\_i$是其中所有有限集合之和的*上确界*，从而$\forall \varepsilon > 0$，存在$K\_j$，满足
$$\sum_{i \in K_j} a_i \le \sum_{i \in I_j} a_i - \frac{\varepsilon}{2^j}$$
出于方便考虑，我们直接设$J$是从1开始的相邻自然数构成的集合，设$N \in \mathbb N$，有：
$$\sum_{j=0}^N \sum_{i \in I_j} a_i \le \sum_{j=0}^N \left( \sum_{i \in K_j} + \frac{\varepsilon}{2^j} \right) \le \left( \sum_{i \in K} a_i \right) + \varepsilon \le \left( \sum_{i \in I} a_i \right) + \varepsilon$$
其中$K = \biguplus\_{j = 0}^N K\_j$是有限的。
因此，对任何有限的集合，这个和都是有界的，从而其收敛至一个实数，从而可和。\
在后推前的过程中，我们证明了：
$$\sum_{i \in I} a_i \le \sum_{j=0}^\infty \left( \sum_{i \in I_j} a_i \right)$$
在前推后的过程中，我们证明了：
$$\sum_{j=0}^N \sum_{i \in I_j} a_i \le \left( \sum_{i \in I} a_i \right) + \varepsilon$$
此式子取极限$N \to \infty, \varepsilon \to 0$即可得到：
$$\sum_{j=0}^\infty \sum_{i\in I_j} a_i \le \left( \sum_{i \in I} a_i \right)$$
从而等式得证。
{: .proof}

这个命题意味着，以任何方式重排数列求和的顺序，只要不重不漏地计算每一个元素，那么求出的和总是相等。

值得注意的是，如果我们把不可和看作可和但和为正无穷的一种特殊情况，那么此定理无论和是否有限都可以使用。
这就为正实数族可和的判定提供了一个强有力的工具。

（富比尼公式）设$(a\_{i,j})\_{i \in I, j \in J}$为一至多可数的正实数族，那么，$(a\_{i,j})$可和，当且仅当：
$\forall i \in I, \, (a\_{i,j})\_{j \in J}$可和，且
$(\sum_{j \in J} a\_{i,j})\_{i \in I}$可和。
{: .proposition}

此命题显然是上一个命题的特殊情况。
{: .proof}

这个命题意味着我们可以任意交换下标的求和顺序，而不影响求和的结果。

### 积实数族

设$(a\_i),(b\_j)$为两个至多可数的正实数族，那么其积实数族定义为：
$$(a_i b_j)_{i \in I, j \in J}$$
{: .definition}

设$(a\_i),(b\_j)$为两个可和的正实数族，那么其积实数族满足：
$$\sum_{i \in I, j \in J} a_i b_j = \left( \sum_{i \in I} a_i \right) \left( \sum_{j \in J} b_j \right)$$
{: .proposition}

直接使用富比尼公式即可。
{: .proof}

## 可和实数或复数族

接下来我们把研究的内容转向更一般的实数和复数上。
我们定义：
$$x^+ = \max(x, 0), \quad x^- = \max(-x,0)$$
从而有：
$$x = x^+ - x^-, \quad |x| = x^+ + x^-$$

### 可和性的定义

设$(x\_i)\_{i \in I}$为一族可数的实数列，我们称其**可和**，若$(x\_i^+)$和$(x\_i^-)$分别可和。
此时，我们定义：
$$\sum_{i \in I} x_i = \sum_{i \in I} x_i^+ - \sum_{i \in I} x_i^-$$
设$(z\_i)\_{i \in I}$为一族可数的复数列，我们称其**可和**，若$(\Re z\_i)$和$(\Im z\_i)$分别可和。
此时，我们定义：
$$\sum_{i \in I} z_i = \sum_{i \in I} \Re z_i + \mathrm i \sum_{i \in I} \Im z_i$$
{: .definition}

注意对更一般的实数和复数来讲，可和和级数收敛并不是等价的，我们马上就会研究到这一点。

### 可和与绝对收敛

设$(z\_i)\_{i \in I}$为一族可和的复数列，$\mathbb N \to I, n \mapsto i\_n$为一双射。
那么$(z\_i)$可和，当且仅当级数$\sum\_{i=0}^\infty z\_{i\_n}$*绝对收敛*。
此时有：
$$\sum_{i \in I} z_i = \sum_{n = 0}^\infty z_{i_n}$$
{: .proposition}

我们首先验证实数的情况，然后推广到复数上。
设$(x\_i) = (z\_i)$为一实数列，那么：
$$
\begin{aligned}
    (x_i) \text{可和}
    &\iff (x_i^+), (x_i^-) \text{可和} \\
    &\iff \sum_{i \in I} x_i^+, \sum_{i \in I} x_i^- \text{收敛} \\
    &\iff \sum_{n = 0}^\infty x_{i_n}^+, \sum_{n = 0}^\infty x_{i_n}^- \text{收敛} \\
    &\iff \sum_{n = 0}^\infty |x_{i_n}| \text{收敛} & (|x| = x^+ + x^-) \\
    &\iff \sum_{n = 0}^\infty x_{i_n} \text{绝对收敛}
\end{aligned}
$$
并且有：
$$\sum_{i \in I} x_i = \sum_{i \in I} x_i^+ - \sum_{i \in I} x_i^- = \sum_{n=0}^\infty x_{i_n}^+ - \sum_{n=0}^\infty x_{i_n}^- = \sum_{n=0}^\infty (x_{i_n}^+ - x_{i_n}^-) = \sum_{n=0}^\infty x_{i_n}$$
复数的证明和实数完全相同，只需要把等式$\| x \| = x^+ + x^-$替换为$\| z \| \le \|\Re z\| + \|\Im z\|$即可。
{: .proof}

从而我们有：
$(z\_i)\_{i \in I}$可和，当且仅当$(\| z\_i \|)\_{i \in I}$可和。
{: .proposition}

下标为$I$可和实数列集合$\mathcal l^1(I)$构成一个数列空间$\mathbb R^I$的一个线性子空间，且从实数列到其和的映射是*线性*的。
{: .proposition}

根据前述命题，直接使用级数的结论即可。
{: .proof}

### 分组求和

设$(z\_i)\_{i \in I}$为一族*可和*的可数复数，且$(I\_j)\_{j \in J}$为$I$的一个划分，那么对任意$j \in J$，$(z\_i)\_{i \in I\_j}$可和，且$(\sum\_{i \in I\_j} z\_i)\_{j \in J}$可和。
并且有：
$$\sum_{i \in I} z_i = \sum_{j \in J} \left( \sum_{i \in I_j} z_i \right)$$
{: .proposition}

以实数列为例。有：
$$
\begin{multline}
    \sum_{i \in I} x_i = \sum_{i \in I} x_i^+ - \sum_{i \in I} x_i^- \\
    = \sum_{j \in J} \left( \sum_{i \in I_j} x_i^+ \right) - \sum_{j \in J} \left( \sum_{i \in I_j} x_i^- \right)
    = \sum_{j \in J} \left( \sum_{i \in I_j} x_i^+ - \sum_{i \in I_j} x_i^- \right) \\
    = \sum_{j \in J} \left( \sum_{i \in I_j} x_i \right)
\end{multline}
$$
{: .proof}

同理，我们仍有：

（富比尼定理）设$(x\_{i,j})\_{(i,j) \in I \times J}$为一可和实数列，那么：
$$\sum_{(i,j) \in I \times J} x_{i,j} = \sum_{i \in I} \left( \sum_{j \in J} x_{i,j} \right) = \sum_{j \in J} \left( \sum_{i \in I} x_{i,j} \right) $$
{: .proposition}

对两个实数列之积，我们有：

设两实数列$(x\_i)\_{i \in I}$、$(y\_j)\_{j \in J}$可和，其积数列$(x\_i y\_j)\_{(i,j) \in I \times J}$可和，且：
$$\sum_{(i,j) \in I \times J} x_i y_j$ = \left( \sum_{i \in I} x_i \right) \left( \sum_{j \in J} y_j \right)$$
{: .proposition}

这些命题都很容易用分组求和的方式证明。

## 离散概率空间

### 离散概率空间的定义

设$\Omega$为一至多可数的集合，装备有一个σ-代数$\mathcal P(\Omega)$，二者合称**离散可测空间**。
若$\Omega$还带有一个概率测度$\mathbf P$，那么称其为一个**离散概率（测度）空间**。
{: .definition}

记$\Omega$为一至多可数的集合。
设$\mathbf P$为一个概率测度，那么定义映射$\mathbf p$：
$$\forall \omega \in \Omega, \; \mathbf p(\omega) = \mathbf P(\{ \omega \})$$
，称为该测度的*概率质量函数*。
该映射在$\Omega$上可和，即$(\mathbf p(\omega))$可和，且：
$$\forall A \subset \Omega, \; \mathbf P(A) = \sum_{\omega \in A} \mathbf p(\omega)$$
另一方面，若$\mathbf p: \Omega \to \mathbb R\_+$为一可和的映射，且其和为一，那么一定存在由以下关系定义的一个概率测度：
$$\forall A \subset \Omega, \; \mathbf P(A) = \sum_{\omega \in A} \mathbf p(\omega)$$
且该测度满足：
$$\forall \omega \in \Omega, \; \mathbf p(\omega) = \mathbf P(\{ \omega \})$$
{: .proposition}

很容易根据定义验证其性质。
{: .proof}

这个命题说明，给出离散概率空间上的任何一个概率测度，和给出其概率质量函数等价。
因此，一个测度的概率质量函数也称为这个测度的*分布律*。

设$(E, \mathcal P (E))$为一任意可测空间，其上的一个概率测度$\mu$是*离散的*，若存在一个至多可数的集合$S$使
$$\mu(E \backslash S) = 0$$
即该测度只在至多可数的点上非零。
利用$S$组成的概率测度空间$(S, \mathcal S, \mu)$是一个离散概率空间。
离散测度所有概率非零的事件组成的集合$S$称为这个概率测度的*支集*（Support）。
{: .definition}

任何一个可测空间上的*狄拉克测度*：
$$
\forall A \in \mathbf P(E) \quad \delta_x (A) = \left\{
    \begin{aligned}
        1 \; & x \in A \\
        0 \; & x \notin A
    \end{aligned}
\right.
$$
都是离散概率测度。
{: .exampl}

### 几个常见离散分布

#### 泊松分布

设$\lambda > 0$，则参数为$\lambda$的**泊松分布**为$\mathbb N$上一概率测度，其概率质量函数为：
$$\forall k \in \mathbb N, \quad \mathbf p(k) = e^{-\lambda} \frac{\lambda^k}{k!}$$
服从这种分布的随机变量称为泊松变量，记为$X \sim \mathcal P(\lambda)$。
{: .definition}

泊松分布的来源由下一个命题展示：

设$(p\_n)\_{n \in \mathbb N^*}$为一个值在$(0,1)$之中的数列，满足：
$$p_n \sim_{n \to \infty} \frac{\lambda}{n}, \lambda > 0$$
那么：
$$\forall k \in \mathbb N, \; \lim_{n \to \infty} \binom{n}{k} p_n^k (1-p_n)^{n-k} = e^{-\lambda} \frac{\lambda^k}{k!}$$
{: .proposition}

简单计算几个等价无穷：
$$
\begin{aligned}
    \binom{n}{k} &= \frac{n(n-1)\cdots(n-k+1)}{k!} = \left( 1 - \frac{1}{n} \right) \cdots \left( 1 - \frac{k-1}{n} \right) \frac{n^k}{k!} \sim \frac{n^k}{k!} \\
    p_n^k &= \left( \frac{\lambda}{n} + o(\frac{1}{n}) \right)^k \sim \frac{\lambda^k}{n^k} \\
    (1-p_n)^{n-k} &= \exp [(n-k) \ln (1 - \frac{\lambda}{n} + o(\frac{1}{n}))] = e^{(n-k)(-\frac{\lambda}{n} + o(\frac{1}{n}))} \sim e^{-\lambda}
\end{aligned}
$$
{: .proof}

这个命题说明了，泊松分布实际上是二项分布的一种极限，是小概率事件（概率为$p$）无穷次独立重复试验后发生次数的分布。

#### 几何分布

设$p \in (0,1)$，参数为$p$的**几何分布**为$\mathbb N^*$上一概率分布，其概率质量函数为：
$$\forall k \in \mathbb N^*, \quad \mathbf{p}(k) = p (1-p)^{k-1}$$
服从几何分布的随机变量称为几何变量，记为$X \sim \mathcal G(p)$。
{: .definition}

下面一个命题说明了几何分布的由来：

设$p \in (0,1)$，$(X\_n)\_{n \in \mathbb N^*}$为一列成功概率相同的独立伯努利变量，约定空集的最小值为$\infty$，那么映射
$$U(\omega) = \min \{ n \in \mathbb N^* | X_n(\omega) = 1 \}$$
规定了一个随机变量，事件$\{U = \infty \}$是零测的，而除去无穷后定义的随机变量服从几何分布。
{: .proposition}

$$
\begin{aligned}
    \mathbf P(U = 1) &= \mathbf P(X_1 = 1) = p \\
    \mathbf P(U = k) &= \mathbf P(X_k = 1) \prod_{i=1}^{k-1} \mathbf{P}(X_i = 0) = p (1-p)^{k-1} \\
\end{aligned}
$$
对于无穷处的情况，我们知道：
$$\{U = \infty\} = \bigcap_{k=1}^\infty \{ X_k = 0 \} \subset \bigcap_{k=1}^n \{ x_k = 0 \}, \; \forall n \in \mathbb N^*$$
从而
$$\mathbf{P}(U = k) \le \prod_{i=1}^n \mathbf{P}(X_i = 0) = (1-p)^n \to 0$$
{: .proof}

这个命题说明，几何分布相当于重复多次同概率的独立伯努利试验，第一次取得成功的次数的分布。

（无记忆性）设$U: \Omega \to \mathbb N^*$为一离散随机变量，在$\mathbb N^*$上的任意一点处概率大于零。
该变量服从几何分布，当且仅当其满足*无记忆性*：
$$\forall n \in \mathbb N, \; \forall k \in \mathbb N^*, \quad \mathbf{P}(U = n+k | U > n) = \mathbf{P}(U = k)$$
这条性质等价于：
$$\forall n \in \mathbb N, \quad \mathbf{P}(U = n+1 | U > n) = \mathbf{P}(U=1)$$
{: .proposition}

前推后是显然的，代入定义即可。
考虑后推前。
设该随机变量满足无记忆性的等价形式。
记$\mathbf{P}(U=1) = p$。
由于$\mathbf{P}(U=1) > 0, \mathbf P(U \neq 1) > \mathbf P(U = 0) > 0$，从而$0 < p < 1$。
对条件概率左边取反，可得
$$ 
\begin{multline}
    \mathbf{P}(U \neq n+1 | U>n) = \mathbf{P}(U > n+1 | U>n) = \mathbf{P}(U=1) \\
    \iff \mathbf{P}(U > n+1) = (1-p) \mathbf{P}(U>n)
\end{multline}
$$
从而$\mathbf{P}(U > n) = (1-p)^n$。
相邻两项相减即得几何分布。
{: .proof}

## 离散随机变量的矩

和有限的随机变量一样，我们也可以定义离散随机变量的矩——前提是它们存在。

### 离散随机变量的期望

设$(\Omega, \mathcal A, \mathbf P)$为一概率空间，$X: \Omega \to \mathbb R$为一离散随机变量。
若数列$(x \mathbf P(X = x))\_{x \in X(\Omega)}$可和（绝对收敛），那么称其具有**期望**，且其期望为：
$$\mathbf E X = \sum_{x \in X(\Omega)} x \mathbf P(X=x)$$
{: .definition}

（转移公式）设$X: \Omega \to E$为一离散随机变量，且$f: E \to \mathbb R$为一实值函数，则离散随机变量$f(X) = f \circ X$具有期望，当且仅当
$$(f(x) \mathbf P(X=x))_{x \in X(\Omega)}$$
可和（绝对收敛），此时：
$$\mathbf E f(x) = \sum_{x \in X(\Omega)} f(x) \mathbf P(X=x)$$
{: .proposition}

若$f(X)$具有期望，那么
$$(y \mathbf P(f(X)=y))\_{y \in f(X(\Omega))}$$
可和，从而：
$$
\begin{aligned}
    E(f(x)) &= \sum_{y \in f(X(\Omega))} y \mathbf P(f(X) = y) \\
    &= \sum_{y \in f(X(\Omega))} y \sum_{x \in X(\Omega), f(x) = y} \mathbf P(X=x) \\
    &= \sum_{y \in f(X(\Omega))} \sum_{x \in X(\Omega), f(x) = y} f(x) \mathbf P(X=x) \\
    &= \sum_{x \in X(\Omega)} f(x) \mathbf P(X=x)
\end{aligned}
$$
反之亦然，对$f(x)$取绝对值即可证明绝对收敛性。
{: .proof}

设$X,Y$为两实值离散随机变量，$V=(X,Y)$为其联合分布。
设$f:(x,y) \mapsto x$，$g: (x,y) \mapsto y$。
应用上文的定理，可得：
$$
\begin{aligned}
    \mathbf EX &= \mathbf E f(V) = \sum_{(x,y) \in V(\Omega)} x \mathbf P(X=x,Y=y) \\
    &= \sum_{x \in X(\Omega), y \in Y(\Omega)} x \mathbf P(X=x,Y=y) \\
    \mathbf EY &= \mathbf E g(V) = \sum_{(x,y) \in V(\Omega)} y \mathbf P(X=x,Y=y) \\
    &= \sum_{x \in X(\Omega), y \in Y(\Omega)} y \mathbf P(X=x,Y=y) \\
\end{aligned}
$$
注意到两个求和的方式不同，第一个求和是针对联合分布的，其中不含为零的项。
{: .exampl}

#### 期望的几个性质

若$X$几乎必然为正，既$\mathbb P(X \ge 0) = 1$，且具有期望，那么其期望大于等于零：
$$\mathbf EX \ge 0$$
且期望为零，当且仅当该随机变量几乎必然为零。
{: .proposition}

$$
\begin{aligned}
    \mathbf EX &= \sum_{x \in X(\Omega)} x \mathbf P(X=x) \\
    &= \sum_{x \in X(\Omega), x \ge 0} x \mathbf P(X=x) + \cancel{\sum_{x \in X(\Omega), x < 0} x \mathbf P(X=x)} \\
    &\ge 0
\end{aligned}
$$
左右相等的情况显然。
{: .proof}

离散随机变量$X$具有期望，当且仅当$\vert X \vert$具有期望，且：
$$\vert \mathrm EX \vert \le \mathrm E \vert X \vert$$
{: .proposition}

注意到可和等价于绝对收敛，因此显然。
{: .proof}

（比较审敛）设$X,Y$为二正实值离散随机变量，且$X \le Y$。
若$Y$具有期望，那么$X$也具有期望，且$\mathbf EX \le \mathbf EY$。
{: .proposition}

$$
\begin{aligned}
    \mathbf EX &= \sum_{x,y \in V(\Omega)} x \mathbf P(X=x,Y=y) \\
    &\le \sum_{x,y \in V(\Omega)} y \mathbf P(X=x,Y=y) = \mathbf EY \le \infty
\end{aligned}
$$
{: .proof}

（期望的线性）
记$\mathcal L\_d^1(\Omega)$为具有期望的离散实值随机变量的集合，则该集合是$\mathbb R^\Omega$的一个线性子空间。
且期望算子
$$\mathbf E: \mathcal L_d^1(\Omega) \to \mathbb R$$
是其上的一个线性算子。
{: .proposition}

略。
{: .proof}

设$X,Y \in \mathcal L\_d^1(\Omega)$。
若$X,Y$独立，则$XY$具有期望，且$\mathbf E(XY) = \mathbf EX \mathbf EY$
{: .proposition}

记$V=(X,Y)$，$h: (x,y) \mapsto xy$，则$\mathbf EXY = \mathbf E h(V)$。
从而$\mathbf EXY$存在当且仅当
$$(xy \mathbf P(X=x) \mathbf P(Y=y))_{x \in X(\Omega), y \in Y(\Omega)}$$
可和（绝对收敛）。
考虑到$(x \mathbf P(X=x))$和$(y \mathbf P(Y=y))$均可和，那么其积数列可和，且积数列等于两数列之积，从而$\mathbf EXY = \mathbf EX \mathbf EY$
{: .proof}

### 离散随机变量的高阶矩

称离散随机变量$X: \Omega \to \mathbb R$具有$r$阶矩（$r \in \mathbb N^*$），若$X^r$具有期望。
此时，称该随机变量的$r$阶矩为$\mathbf E(X^r)$。
{: .definition}

具有$r$阶矩的离散随机变量的集合记为$\mathcal L\_d^r (\Omega)$。
$\mathcal L\_d^r (\Omega)$是$\mathcal L\_d^{r-1} (\Omega)$的子空间。
这意味着具有方差的随机变量一定具有期望。
{: .proposition}
