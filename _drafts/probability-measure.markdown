---
title: "更一般的概率测度"
categories: "概率论"
---

本章中我们将继续进行概率论的学习，但是不再研究有限的情况，而是向前一步，考虑离散（可数）的情况。

在此处，我们规定“可数”与“可列”是完全相同的，除非特殊指明，否则仅包括可与$\mathbb{N}$建立双射的集合，而不包括有限的集合。

## 概率空间

设$\Omega$为一任意非空集合，集合$\mathcal A$为$\mathcal P(\Omega)$（幂集）的子集，若其满足以下三条公理，则称其为$\Omega$上的**σ-代数**：
$$
\begin{array}{lc}
    & \Omega \in \mathcal A \\
    \forall A \in \mathcal A & A^C \in A \\
    \forall A_1, A_2, \dots \in \mathcal A & \bigcup_{n \in \mathbb N} A_n \in \mathcal A
\end{array}
$$
{: .definition}

这里我们不再要求其两两子集的并集对集合封闭，转而要求任意可数个子集的并集对集合封闭。

我们知道，一个集合的子集的集合只要包含全集，关于有限个并、交封闭，对补集封闭，就可以构成一个代数，这种代数称为*集合域*。
一个集合域不一定是一个σ-代数，但是一个σ-代数一定是一个集合域。
相对地，如果$\Omega$有限，那么所有集合域自然都是σ-代数。

一个集合$\Omega$和其上的一个σ-代数$\mathcal A$合称一个**可测空间**，这个σ-代数定义了一个可以被测度的$\Omega$的子集。
$\mathcal A$的一个元素称为**事件**。
{: .definition}

### 上极限与下极限

我们根据集合的*包含*这一偏序关系定义一列集合$(A\_n)$的下极限和上极限：
$$
\begin{aligned}
    \liminf_{n \to \infty} A_n &= \bigcup_{n=0}^\infty \bigcap_{m=n}^\infty A_m \\
    \limsup_{n \to \infty} A_n &= \bigcap_{n=0}^\infty \bigcup_{m=n}^\infty A_m
\end{aligned}
$$
{: .definition}

一列集合的下极限中包含所有出现了无限次且仅消失有限次的元素；而上极限中包含了所有出现了无限次的元素，无论其是否在无限个集合中消失。

回忆数列中定义的下极限和上极限，在数列中，下极限是极限点的下确界，也就是数列趋于无穷而忽略有限个点时，使数列的所有值大于等于它的最大实数。
我们用集合的“包含”这一偏序关系替代实数的“大于等于”，就能得到集合的下极限的定义，即忽略掉消失有限次的元素后，所有集合都包含它的最大集合。

在实数中，我们知道上极限大于等于下极限，从而集合的上极限一定包含下极限。

设$\mathcal C$为$\mathcal{P}(\Omega)$的一个集合，那么存在最小（在包含这一含义下）的σ-代数，使其包含$\mathcal C$。
这样的σ-代数记为$\sigma(\mathcal C)$。
{: .proposition}

注意到若$(A\_i)$是一个σ-代数，那么$(\cap A\_i)$也是一个σ-代数，因此所有包括$\mathcal C$的σ-代数的交就是$\sigma(\mathcal C)$。
{: .proof}

### 离散随机变量

设$(\Omega, \mathcal A)$为一可测空间，$E$为一集合，那么称映射$X: \Omega \to E$为$E$上的**离散随机变量**，若：
$$
\begin{aligned}
    \forall B \in \mathcal P(E), \quad &X^{-1}(B) \in \mathcal A \\
    &X(\Omega) \text{至多可数}
\end{aligned}
$$
{: .definition}

根据定义，有限的随机变量是离散的。

随机变量$X$是离散的，当且仅当$X(\Omega)$至多可数，且：
$$
\forall x \in E, \quad X^{-1}(\{x\}) = \{ X = x \} \in \mathcal A
$$
{: .proposition}

## 概率测度

设$(\Omega, \mathcal A)$为一可测空间，其上的一个**概率测度**定义为正实数映射：
$$
\mathbf P : \mathcal A \to \mathbb R_+
$$
满足：\
1）$$\mathbf{P} (\Omega) = 1$$
2）若$(A\_n)\_{n \in \mathbb N}$为一组不相交的集合，那么
$$
\mathbf{P}(\biguplus_{n \in \mathbb N} A_n) = \sum_{n \in \mathbb{N}} \mathbf{P}(A_n)
$$
这一性质称为*可数可加性*。
{: .definition}

从定义上讲，这个测度实际上就是有限个集合对可数情况的推广。
然而，实际情况是，寻找到这样一个测度往往是最困难的部分。

以自然数集合$\mathbb{N}$为例，我们甚至不能在数学上定义“等概率地随机取一个自然数”。
我们设取到每一个自然数的概率为$p$，那么根据可数可加性，不难发现：
$$
\mathbf{P} (\mathbb{N}) = \sum_{n \in \mathbb N} p = 1
$$
而常数$p$不可能存在。

尽管如此，我们仍然假设这个测度存在，并研究它的性质。

### 概率测度的基本性质

1. $$\mathbf P (\emptyset) = 0$$
2. $$\forall A, B \in \mathcal A, A \subset B \iff \mathbf P (A) \le \mathbf P(B)$$
3. $$\forall A_1, \dots, A_n \in \mathcal A, \mathbf{P}(A_1 + \cdots A_n) \le \mathbf{P}(A_1) + \cdots + \mathbf{P}(A_n)$$
4. $$\forall A \in \mathcal A, \mathbf{P}(A) \in [0,1]$$
{: .proposition}

这些命题的证明都比较基本，此处不再赘述。
值得注意的是，由于无穷的存在，我们最好区分有穷个集合（如第3条）和无穷个集合组成的集合列。

### 集合列的概率测度

设$(A\_n)$为一列递增（包含的含义下）的集合列，那么：
$$
\lim_{n \to \infty} \mathbf{P}(A_n) = \mathbf{P}(\bigcup_{n=0}^\infty A_n)
$$
反之，若其为递减的，那么：
$$
\lim_{n \to \infty} \mathbf{P}(A_n) = \mathbf{P}(\bigcap_{n=0}^\infty A_n)
$$
{: .proposition}

这两个命题可以将极限从概率的内侧移到外侧，因此也被称为概率的单调连续性。

有：
$$
\cup_{n=p}^\infty A_n = A_p \cup (A_{p+1} \backslash A_p) \cup \cdots
$$
从而
$$
\begin{aligned}
    \mathbf{P}(\bigcup_{n=0}^\infty A_n) &= \mathbf{P}(\bigcup_{n=p}^\infty A_n) &\text{序列递增} \\
    &= \mathbf{P} (A_p) + \sum_{n=p}^\infty \mathbf{P}(A_{n+1} \backslash A_n) \\
\end{aligned}
$$
又因为$\sum \mathbf{P}(A\_\{n+1\} \backslash A\_n) = \mathbf{P} (\lim A\_n)$等于常数而收敛，从而其部分和的极限等于零。
上式右侧取$p \to \infty$，可得：
$$
\mathbf{P}(\bigcup_{n=0}^\infty A_n) = \lim_{p \to \infty} \mathbf{P} (A_p)
$$
从而原命题得证。
另一个命题取补集即可。
{: .proof}

设$A \in \mathcal A$为一时间，称其为可忽略的，或零测的，若$\mathbf{P}(A) = 0$；
称其为几乎必然的，若$\mathbf{P}(A) = 1$。
{: .definition}

设$A$为一列递增集合的并集，那么其几乎必然发生，当且仅当$\lim \mathbf{P} (A\_n) = 1$，即最大的集合几乎必然发生；
若其为一列递减集合的交集，那么其为零测，当且仅当$\lim \mathbf{P} (A\_n) = 0$，即最小的集合零测。
{: .proposition}

这个命题很容易由上个命题推得。

设$(A\_n)$为一列事件，那么
$$
\mathbf{P} (\bigcup_{n \in \mathbb N} A_n) \le \sum_{n \in \mathbb N} \mathbf{P}(A_n)
$$
{: .proposition}

这个命题就是此前的性质的无穷形式。

设$U_n = \cup\_{k=0}^n A\_k$，那么这列集合是递增的，且$\cup\_{n \in \mathbb N} U\_n = \cup\_{n \in \mathbb N} A\_n$。
有：
$$
\mathbf{P} (\bigcup_{n \in \mathbb N} A_n) = \lim_{n \to \infty} \mathbf{P} (U_n)
$$
从而有：
$$
\begin{aligned}
    \mathbf{P}(B_n) &= \mathbf{P}(\bigcup_{k=0}^n A_k) \le \sum_{k=0}^n \mathbf{P}(A_k) &\text{（有限个事件）} \\
    \mathbf{P}(B_{n+1}) &= \mathbf{P}(B_n \cup B_{n+1}) \\
    &= \mathbf{P}(B_n) + \mathbf{P}(A_{n+1}) - \mathbf{P}(B_n \cap A_{n+1}) \\
    &\le \sum_{k=0}^{n+1} \mathbf{P}(A_k)
\end{aligned}
$$
然后由归纳法即可得证。
{: .proof}

零测事件的并集仍是零测事件。
{: .proposition}

这个命题看上去是对性质的简单推广，实际上却使用较为复杂的技巧来用有穷的情况推知无穷的情况。
在数学上，一切涉及无穷的概念都必须得到严格的讨论，因为其结果往往是反直觉的。

### 博雷尔-坎泰利法则

称一列事件$(A\_n)$为**独立的**，若对所有的$k \in \mathbb N$，$A\_1, \dots, A\_k$是独立的，即：
$$
\forall k, \quad \mathbf{P} (A_1 \cap \cdots \cap A_k) = \mathbf P (A_1) \times \cdots \times \mathbf P (A_k)  
$$
{: .definition}

（博雷尔-坎泰利零一律）若一列事件$(A\_n)$为独立的，那么：
$$
\mathbf P (\limsup A_n) = \begin{cases}
    1 & \text{若} \sum_{n \in \mathbb N} \mathbf P (A_n) \text{收敛} \\
    0 & \text{若} \sum_{n \in \mathbb N} \mathbf P (A_n) \text{发散}
\end{cases}
$$
{: .theorem}

我们马上介绍两个用于证明此法则的引理。

#### 第一引理

（博雷尔-坎泰利第一引理）设$(A\_n)$为一列事件，那么若所有事件发生的概率的总和是有限的，则无穷多个事件同时发生的概率为零，或同时发生的事件的数量几乎一定有限。
即，若$\sum\_{n \in \mathbb N} \mathbf P(A\_n)$收敛，那么
$$
\mathbf{P} (\limsup_{n \to \infty} A_n) = 0
$$
{: .proposition}

记$U\_n = \bigcup\_{k = n}^\infty A\_k$，显然$(U\_n)$递减。
我们知道：
$$
\mathbf{P} (U_n) \le \sum_{k = n}^\infty \mathbf P (A_k)
$$
由于$\sum\_{n \in \mathbb N} \mathbf P(A\_n)$收敛，其部分和趋于零，两边同时取极限，可得：
$$
\lim_{n \to \infty} \mathbf{P} (U_n) \le 0 \implies \lim_{n \to \infty} \mathbf{P} (U_n) = 0
$$
根据定义：
$$
\mathbf{P} (\limsup A_n) = \mathbf{P} (\bigcap_{n \in \mathbb N} U_n) = \lim_{n \to \infty} \mathbf{P} (U_n) = 0
$$
{: .proof}

理解这个命题的物理意义的关键在于理解上极限的物理意义，即
若事件$\omega$在一列集合的上极限中，那么事件一定在集合列中出现了无穷次。
$$
\begin{aligned}
    \omega \in \limsup A_n &\iff \forall n \; \exists k \ge n \quad \omega \in A_k \\
    &\iff \text{存在子列} (A_{\nu(n)}) \text{满足} \omega \in A_{\nu(n)} \\
    &\iff \{ n \in \mathbb{N} | \omega \in A_n \} \text{无穷大}
\end{aligned}
$$

这个引理中，我们不要求这列事件是独立的。

#### 第二引理

（博雷尔-坎泰利第二引理）设$(A\_n)$为一列*独立*事件，且$\sum\_{n \in \mathbb N} \mathbf P(A\_n)$发散，那么
$$
\mathbf{P} (\limsup_{n \to \infty} A_n) = 1
$$
{: .proposition}

记$U\_n = \bigcup\_{k = n}^\infty A\_k$，则$U\_n^C = \bigcap_{k=n}^\infty A\_n^c$。
设$p \ge n$，有：
$$
\begin{aligned}
    \mathbf{P} (\bigcap_{k=n}^\infty A_k^C) &= \prod_{k=n}^\infty \mathbf{P} (A_n^C) & (\text{独立性}) \\
    &= \prod_{k=n}^\infty \big(1 - \mathbf{P}(A_n) \big) \\
    &\le \prod_{k=n}^\infty \exp \left[ - \mathbf{P}(A_n) \right] & (1+x \le e^x) \\
    &\le \exp \lbrack - \sum_{k=n}^\infty \mathbf{P}(A_n) \rbrack
\end{aligned}
$$
由于$\sum\_{n \in \mathbb N} \mathbf P(A\_n)$是一个发散的*正项级数*，因此其部分和趋于无穷，从而两边取极限，可得：
$$
\lim_{p \to \infty} \mathbf{P} (\bigcap_{k=n}^\infty A_k^C) = 0
$$
从而有：
$$
\begin{aligned}
    \mathbf{P} (\limsup A_n) &= \lim_{n \to \infty} \mathbf{P}(U_n) \\
    &= 1 - \lim_{n \to \infty} \mathbf{P}(U_n^C) \\
    &= 1 - \lim_{n \to \infty} \mathbf{P} (\bigcap_{k=n}^\infty A_k^C) \\
    &= 1
\end{aligned}
$$
{: .proof}