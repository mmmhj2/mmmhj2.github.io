---
title: "离散概率空间与测度"
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
