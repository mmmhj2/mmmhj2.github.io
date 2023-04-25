---
title: "可和实数族"
categories: ["概率论", "分析"]
---

本章中我们将重新研究级数，即至多可数个实数或复数组成的序列之和，的性质，为研究更一般的概率空间做好准备。

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
$$x^+ = \max(x, 0), \quad x^- = \min(-x,0)$$
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

### 分组求和

设$(z\_i)\_{i \in I}$为一族*可和*的可数复数，且$(I\_j)\_{j \in J}$为$I$的一个划分，那么对任意$j \in J$，$(z\_i)\_{i \in I\_j}$可和，且$(\sum\_{i \in I\_j} z\_i)\_{j \in J}$可和。
并且有：
$$\sum_{i \in I} z_i = \sum_{j \in J} \left( \sum_{i \in I_j} z_i \right)$$
{: .proposition}
