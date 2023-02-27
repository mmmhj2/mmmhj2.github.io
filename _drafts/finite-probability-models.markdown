---
title: "有限概率模型"
categories: "概率论"
---

我们首先介绍概率论中最简单的一个模型：实验的结果集合有限的模型。

## 简单随机抽样

### 基本定义

#### 样本空间与事件

我们称一个所有可能的结果的个数是有限的实验为*简单实验*。
假设存在一个*有限*的集合$\Omega$，使得从该集合到所有实验的可能结果的集合存在一个满射，那么$\Omega$中所有元素$\omega$都可以对应一个实验结果。
这个集合$\Omega$称为**样本空间**。

样本空间的任何一个子集$A \in \mathcal{P}(\Omega)$称为一个**事件**。
所有事件的集合，即样本空间的幂集$\mathcal{P}(\Omega)$，称为**事件集合**。
{: .definition}

如果一次随机试验的结果$\omega \in A$，那么称事件$A$发生，否则称其未发生。

设$A, B$为两个事件，那么$A \cap B$称为两个事件的和事件（或并事件），表示两个事件中任何一个发生，通常直接记作$A+B$；
相对地，$A \cup B$称为两个事件的积事件（或交事件），表示两个事件均发生，通常直接记作$AB$。

特别地，事件$\Omega$称为*必然事件*，对任何一次试验，其必然发生；
事件$\emptyset$称为*不可能事件*，对任何一次试验，其必然不发生。
若两个事件的积事件为不可能事件（$AB = \emptyset$），那么称这两个事件为*不相容事件*；
如果两个事件的和事件为必然事件（$A+B = \Omega$），那么称这两个事件互为*对立事件*。

- 不放回有序抽样（共$n$个小球，抽$k$个）的事件集合为：
  $$
  \left\{ \left(x_1, \dots, x_k \right) \in {[\![ 1,n ]\!]}^k \middle| i \neq j \implies x_i \neq x_j \right\}
  $$
  ，其基数为$\frac{n!}{k!}$；
- 不放回无序抽样的事件集合的基数为$n^k$；
- 放回有序抽样的事件集合为：
  $$
  \left\{ \left(x_1, \dots, x_k \right) \in {[\![ 1,n ]\!]}^k \middle| i < j \implies x_i < x_j \right\}
  $$，其基数为$\binom{n}{k}$；
- 放回无序抽样的事件集合为：
  $$
  \left\{ \left(x_1, \dots, x_k \right) \in {[\![ 1,n ]\!]}^k \middle| i \le j \implies x_i \le x_j \right\}
  $$，其基数为$\binom{n+k-1}{k}$
{: .exampl}

#### 随机变量

为了为事件赋予数学性质，我们为每个事件分配一个随机变量。

（有限的）**随机变量**指一个从有限事件集合到任何数集的映射：
$$
X: \; \Omega \to E
$$
根据随机变量的取值，可以确定一个事件的集合：
$$
\{ X \in B \} \triangleq \{ \omega \in \Omega | X(\omega) \in B \} = X^{-1}(B)
$$
其中$B \subset E$表示一个随机变量的取值集合。
{: .definition}

### σ-代数

称$\mathcal A \subset \mathcal P (\Omega)$为$\Omega$上的一个**σ-代数**，若其满足以下三个公理：
1) $$\Omega \in \mathcal A$$
2) $$\forall A \in \mathcal A \quad A^C \in \mathcal A$$，即其元素关于补运算封闭；
3) $$\forall A_1, A_2 \in \mathcal A \quad A_1 \cup A_2 \in \mathcal A$$，即其元素关于（可数个）并运算封闭；
{: .definition}

根据公理一和二，空集合$\emptyset$也一定在任何一个σ-代数中。
我们可以用补集和并集来表示交集和差集，因此σ-代数上的可数个交集和差集也是封闭的。
具体而言，根据德摩根定律，有
$$
A \cap B = (A^C \cup B^C)^C
$$
还有
$$
A \backslash B = A \cap B^C
$$

$(P(\Omega), \Delta, \cap)$构成$\mathbb{Z}_2$域上的一个代数，其中$\Delta$表示集合的对称差，是向量加法，$\cap$是向量乘法。
σ-代数是这个代数的一个子代数。

#### σ-代数与划分和随机变量的对应

1. 设$\mathcal D = \{ A_1, \dots, A_n \}$为事件集合$\Omega$的一个划分，那么
$$
\sigma(\mathcal D) = \left\{ \bigcup_{i \in I} A_i, \; I \subseteq \{ 1, \dots, n \} \right\}
$$
是事件集合的上的一个σ-代数，而且是包含$\mathcal D$的最小的σ-代数，即所有其他包含$\mathcal D$的σ-代数都包含它；
2. 若$\mathcal A$为一个σ-代数，那么存在一个唯一的划分$\mathcal D$满足$\mathcal A = \sigma(\mathcal D)$，由这种方法构造的划分$\mathcal D$称为这个代数的*原子*（Atoms）。
{: .proposition}

对于$x \in E$，我们简单地用$\\\{X = x\\\}$表示$\\\{ X \in \\\{x\\\} \\\} = X^{-1}(\\\{x\\\})$。

1. 设$X : \Omega \to E$为一个随机变量，那么集合
   $$
   \sigma(X) \triangleq \left\{ X^{-1}(B); B \in \mathcal{P}(E) \right\}
   $$
   是$\Omega$上的一个σ-代数，其原子为$\\\{X = x\\\}, x \in X(\Omega)$，即每一个相同随机变量的取值对应的事件的集合构成一个原子。
2. 若$\mathcal A$是$\Omega$上的一个σ-代数，那么存在随机变量$X$使$\sigma(X) = A$。
{: .proposition}

我们称$\sigma(X)$为由$X$生成的σ-代数；
这个σ-代数的原子直接称为$X$的原子。

以指示函数为例：
$$
\mathbb{1}_A : \Omega \to \{0, 1\}, \quad \omega \mapsto 
\left\{
\begin{aligned}
    1, \quad & \omega \in A, \\
    0, \quad & \omega \not \in A
\end{aligned}
\right.
$$
一个集合$A$的指示函数生成的σ-代数为：
$$
\sigma(\mathbb{1}_A) = \{ \Omega, A, A^C, \emptyset \}
$$
{: .exampl}

#### 可测度性

若随机变量$X$和σ-代数$\mathcal A$满足$\sigma(X) \subset \mathcal A$，则称该随机变量是$\mathcal A$**可测**的。
{: .definition}

通俗地讲，如果一个随机变量在某个σ-代数上可测，那么这个σ-代数的划分比随机变量更加*精细*，能够反映比随机变量更多的细节。

设$E,F$为两个集合，$X: \Omega \to E$、$Y: \Omega \to F$为两个随机变量，存在一个映射$\phi: E \to F$，满足$Y = \phi \circ X$，当且仅当$Y$是$\sigma(X)$可测的。
{: .proposition}

这就是说，若所有可以用$Y$观测到的事件都可以用$X$观测到，从而根据一个事件的$X$的值可以确定$Y$的值，那么Y就是$\sigma(X)$可测的。

若存在函数$\phi$，满足$Y = \phi \circ X$，列出$Y$的所有原子：
$$
\{ Y = y \} = \biguplus_{x \in X(\Omega), \phi(x) = y} \{ X = x \}
$$
不难发现$\sigma(Y)$的所有原子包含在$\sigma(X)$中，从而$\sigma(Y) \subset \sigma(X)$。
反之，若$\sigma(Y) \subset \sigma(X)$，那么所有$\sigma(X)$的原子被*唯一*地包含在$\sigma(Y)$的原子中。
因此，存在*唯一*的$y \in Y(\Omega)$满足
$$
X(\omega) = x \implies Y(\omega) = y
$$
根据此关系构造函数$\phi(x) = y$即可得到$\phi$。
{: .proof}

## 概率测度

设$\Omega$为一有限集合，$\mathcal{A}$是其上一个σ-代数，我们称所有实值函数$\mathbf{P}: \mathcal A \to \mathbb{R}\_+$为**概率测度**或**概率分布**，若其满足以下公理：
$$
\begin{aligned}
    &\mathbf{P}(\Omega) = 1 \\
    \forall A, B \in \mathcal A \quad
    & A \cap B = \emptyset \implies \mathbf{P}(A+B) = \mathbf{P}(A) + \mathbf{P}(B)
\end{aligned}
$$
{: .definition}

第二条公理也称作*可加性*或*加和性*。

有限集合$\Omega$和其上的概率测度$\mathbf{P}$构成一个**有限概率空间**，记作$(\Omega, \mathcal A, \mathbf{P})$。$(\Omega, \mathcal P (\Omega), \mathbf{P})$可以简称为$\Omega$。
{: .definition}

设$A \in \mathcal A$，若$\mathbf{P}(A) = p$，那么我们称事件$A$发生的概率为$p$。
如果事件发生的概率为零，那么这个事件称为*几乎不可能事件*、*可忽略事件*或*零测事件*；
如果事件发生的概率为一，那么这个事件称为*几乎必然事件*。
对有限且没有除$\emptyset$之外的零概率事件的概率测度，*几乎必然*和*必然*基本没有区别，因为概率为一的事件只有$\Omega$一个。
但对无限集合，这种两者的区别就变得非常重要了。

根据定义，以下性质是显然的。
$$
\begin{aligned}
    & \mathbf{P}(\emptyset) = 0 \\
    \forall A \in \mathcal{A} \quad 
    & \mathbf{P}(A) \in [0,1] \\
    & \mathbf{P}(A^C) = 1 - \mathbf{P}(A) \\
    \forall A, B \in \mathcal{A} \quad
    & A \subset B \implies \mathbf{P}(A) \le \mathbf{P}(B) \\
    & \mathbf{P}(B \backslash A) = \mathbf{P}(B) - \mathbf{P}(A)
\end{aligned}
$$
设$A\_1, \dots, A\_n \in \mathcal A$为两两不相容事件，那么有：
$$
\mathbf{P}(A_1 + \dots + A_n) = \sum_{i = 1}^n \mathbf{P}(A_i)
$$
{: .proposition}

我们注意到最后一个命题中的不相容事件可以是来自$\Omega$中的任意个事件，由于$\Omega$本身是有限的，因此这些集合也是有限个的。
对于无限的集合，我们要求这些集合是可列（或可数）的。

最常见的概率分布为*均匀概率分布*，这个概率分布中，单个元素组成的事件$\\\{\omega_i\\\}$是等概率的，其分布可以写为：
$$
\left( \frac{1}{N}, \frac{1}{N}, \dots, \frac{1}{N} \right), \; N = \left| \Omega \right|
$$
任何一个事件$A$的概率等于：
$$
\forall A \in \mathcal P (\Omega) \quad \mathbf{P}(A) = \frac{| A |}{| \Omega |}
$$
{: .exampl}


### 概率质量函数

对于有限的样本空间$\Omega = \\\{ \omega\_1, \dots, \omega\_N \\\}$，我们设事件集合为$\mathcal A = \mathcal P(\Omega)$，可以为每个元素附加一个实数，构成一组向量$(p\_1, \dots, p\_N) \in \mathbb{R}^N$，只要满足$p\_1 + \cdots + p\_n = 1$，就能构造出一个概率测度：
$$
\forall A \in \mathcal{P}(\Omega) \quad \mathbf{P}(A) = \sum_{\omega_i \in A} p_i = \sum_{i=1}^N \mathbb{1}_A (\omega_i) p_i
$$

相对应的，对每个有限样本空间的概率测度$\mathbf{P}$，都可以构造一个映射
$$
\begin{aligned}
    \mathbf p: \quad 
    \Omega \; &\to \; \mathbb{R}_+ \\
    \omega_i \; &\mapsto \; p_i
\end{aligned}
$$
这个映射称为*概率质量函数*。
对于有限的事件集合，概率质量函数实际上就是每个单个元素组成的事件$\\\{\omega_i\\\}$发生的概率，因此我们不对这两个术语加以区分。

### 随机变量的概率测度

仅仅针对单个事件进行观察往往是不足够的，因为许多时候我们并不能确定一个事件是否发生，甚至难以找出某个试验的事件空间。
为此，我们引入了随机变量来将事件映射为数，从而处理事件的数学性质。
按照相同的思路，我们也需要为随机变量定义概率测度和分布，才能处理涉及随机变量的概率问题。

设$(\Omega, \mathcal P(\Omega), \mathbf{P})$为一有限概率空间，$X : \Omega \to E$为一随机变量，称$X(\Omega)$上的概率测度$\mathbf{P}_X$为$X$的**分布**，若其满足：
$$
\forall B \in \mathcal P (X(\Omega)) \quad \mathbf{P}_X(B) = \mathbf{P}(X \in B)
$$
，其中$\mathbf{P}(X \in B)$表示事件$\\\{X \in B\\\}$发生的概率。
该分布的概率质量函数为：
$$
\mathbf{p}_X: X(\Omega) \to \mathbb{R}_+ , \quad X \mapsto \mathbf{P}(X = x)
$$
，其中$\mathbf{P}(X = x)$表示事件$\\\{X = x\\\}$发生的概率。
{: .definition}

这就是说，当我们关心一个随机变量的取值$x$的概率的时候，我们实际上指的是随机变量等于$x$的那些事件的和事件发生的概率。

设样本空间$\Omega = \\\{ 0, 1\\\}$，那么其所有概率测度只由事件$\\\{ 1 \\\}$发生的概率$p \in (0, 1)$确定。
这种测度或分布称为**伯努利分布**或**两点分布**，是最基本的分布之一。
相对地，若概率空间$(\Omega, \mathcal P (\Omega), \mathbf P)$上的随机变量$X$只有有且只有零一两个取值，且其分布是伯努利分布，那么这个变量称为*伯努利变量*。
{: .exampl}

在伯努利分布中，通常事件$\\\{1\\\}$发生称为成功，事件$\\\{0\\\}$发生称为失败。

设$n \in \mathbb{N}^\*, p \in (0,1)$，样本空间$\Omega = [\\\![ 0, n ]\\\!]$，若其概率质量函数为：
$$
\Omega \to \mathbb{R}_+, \quad k \mapsto \binom{n}{k} p^k (1-p)^{n-k}
$$
，那么称这个分布为**二项分布**。
相对地，若概率空间$(\Omega, \mathcal P (\Omega), \mathbf P)$上的随机变量$X$只有有且只有$[\\\![ 0, n ]\\\!]$这$n+1$个取值，且其分布为二项分布，那么这个变量称为*二项分布变量*，记为$X \sim \mathcal B (n,p)$。
{: .exampl}

二项分布实际上就是$n$次独立的概率为$p$的伯努利实验的成功次数的分布。
