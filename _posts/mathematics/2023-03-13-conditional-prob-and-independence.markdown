---
title: "条件概率与独立事件"
categories: "概率论"
---

本章中，我们继续以有限概率空间为基础进行概率论的研究。

## 条件概率

本节中设$(\Omega, \mathcal P (\Omega), \mathbf P)$为一有限概率空间。
{: .remark}

在生活中，我们时常关心一件事发生后对其他事件的影响，表征在概率论中，就是如果已经确定一个事件已经发生，那么另一个事件发生的概率是否会发生变化。
我们使用条件概率作为工具来描述这种概率。

设$B \in \mathcal{P}(\Omega)$为一非零测事件，对$A \in \mathcal{P}(\Omega)$，称
$$
P(A|B) = \frac{P(A \cap B)}{P(B)}
$$
为*A在B发生的条件下发生的概率*，简称**条件概率**，有时也称*后验概率*。
{: .definition}

条件概率仅仅是一个数学定义，并不暗示两个事件之间存在任何现实或理论上的时间先后或因果关系。

某个非零测事件的条件概率构成了一个概率测度，形式化地说：

对于概率空间$(\Omega, \mathcal P (\Omega), \mathbf P)$中的一个非零测事件$B$，映射：
$$
\begin{aligned}
    \mathbf P^B: \quad
    \mathcal P (\Omega) \; & \to \; \mathbb R_+ \\
    A \; & \mapsto \; \mathbf P (A | B)
\end{aligned}
$$
构成一个概率测度。
{: .proposition}

不难验证这个映射满足概率测度的两个公理。

### 三个常用的条件概率公式

（复合概率公式）设概率空间$\Omega$上一组事件$(A\_1, A\_2, \dots, A_n)$满足其积事件非零测，即
$$
\mathbf P (A_1 A_2 \cdots A_n) \neq 0
$$
那么有
$$
\mathbf P(A_1 A_2 \cdots A_n) = \mathbf P(A_1) \mathbf P(A_2 | A_1) \cdots \mathbf P(A_n | A_1 A_2 \cdots A_{n-1})
$$
{: .proposition}

（全概率公式）设概率空间$\Omega$上一组*划分*$\\\{ B\_1, B\_2, \cdots , B\_n \\\}$中每个元素都是非零测的，$A$为一*任意*事件，那么有：
$$
\mathbf P(A) = \sum_{i=1}^n \mathbf P(B_i) \mathbf P(A | B_i)
$$
满足上述定义的这组划分称为**完备事件群**。
{: .proposition}

$$
\mathbf{P}(A) = \sum_{i = 1}^n \mathbf{P} (AB_i) = \sum_{i=1}^n \mathbf P(B_i) \mathbf P(A | B_i)
$$
{: .proof}

（贝叶斯公式）设$\Omega$上有一非零测事件$A$和一个完备事件群$\\\{ B\_1, B\_2, \cdots , B\_n \\\}$，有：
$$
\mathbf P(B_i | A) = \frac{\mathbf P (B_i) \mathbf P (A | B_i)}{\sum_{j=1}^n \mathbf P(B_j) \mathbf P(A | B_j)}
$$
使用全概率公式，可以写成：
$$
\mathbf{P} (B_i | A) = \frac{\mathbf{P}(B_i) \mathbf{P}(A | B_i)}{\mathbf{P}(A)}
$$
{: .proposition}

对任何一个非零测、非几乎必然的事件$B$，$\\\{ B, B^C \\\}$都是一个完备事件群，因此贝叶斯公式可以写成：
$$
\mathbf{P} (B|A) = \frac{\mathbf{P}(B) \mathbf{P}(A|B)}{\mathbf{P}(A)}
$$
这是贝叶斯公式的最常见形式。

### 边际概率与联合概率

设$X : \Omega \to E$为一随机变量，$B \in \mathcal P(\Omega)$为一非零测事件，那么由概率空间$(\Omega, \mathcal P(\Omega), \mathbf{P}(\cdot \| B))$定义的概率分布称为*在$B$发生条件下的条件概率空间*，记为$\mathbf{P}\_{X\|B}$，即：
$$
\forall x \in X(\Omega) \quad \mathbf{P}_{X|B}(\{x\}) = \mathbf P (X = x | B)
$$
再设$Y : \Omega \to F$为另一随机变量，则$V = (X,Y)$称为两个随机变量的**联合分布**；
$X,Y$称为$V$的**边际分布**。
{: .definition}

通常，我们将$\\\{ V = (x,y) \\\}$简记为$\\\{ X = x, Y = y \\\}$，而避免引入新的变量。
只要$X,Y$这两个映射不是常数，那么$V(\Omega)$就是$X(\Omega) \times Y(\Omega)$的真子集。

通常来说，只要知道联合分布，就能得出每一个边际分布，但是知道所有边际分布并不足以得出整个联合分布，考虑以下例子：

设$\\\{ A, B, C, D\\\}$为$\Omega$的一个划分，满足$\mathbf{P}(A) = \mathbf{P}(D)$，$\mathbf{P}(B) = \mathbf{P}(C)$，那么有$\mathbf{P}(A \cup B) = \mathbf{P}(A \cup C) = \frac{1}{2}$。
从而对每一个随机变量$X = \mathbb{1}\_{A \cup B}$和$Y = \mathbb{1}\_{A \cup C}$，有
$$
\mathbf{P}(X = 0) = \mathbf{P}(X=1) = \frac{1}{2}, \;
\mathbf{P}(Y = 0) = \mathbf{P}(Y=1) = \frac{1}{2}
$$
但是其联合分布$V = (X,Y)$取决于$\mathbf{P}(A)$的值：
$$
\begin{aligned}
    \mathbf{P}(X = 1, Y = 1) &= \mathbf{P}(A) \\ 
    \mathbf{P}(X = 0, Y = 0) &= \mathbf{P}(D) = \mathbf{P}(A) \\
    \mathbf{P}(X = 1, Y = 0) &= \mathbf{P}(B) =  0.5 - \mathbf{P}(A) \\
    \mathbf{P}(X = 0, Y = 1) &= \mathbf{P}(C) = 0.5 - \mathbf{P}(A)
\end{aligned}
$$
{: .exampl}

总的来看，我们有以下命题：

- $V$的边际分布完全由联合分布$\mathbf{P}\_V$决定；
- $X,Y$的联合分布由所有$y \in Y(\Omega), \mathbf{P}(y) > 0$处的条件分布$\mathbf{P}\_{X \| Y = y}$和分布$\mathbf{P}_Y$决定。
{: .proposition}

- 对所有$x \in X(\Omega)$，固定一个$y \in Y(\Omega)$，从而事件$\\\{ X = x, Y = y \\\}$是两两无交集的，因为其随机变量的取值不同。
  同时我们有
  $$
  \{X = x\} = \biguplus_{y \in Y(\Omega)} \{X = x, Y = y\}
  $$
  其中$\biguplus$表示不相交集合的并。
  因此
  $$
  \begin{aligned}
    \forall x \in X(\Omega) \quad 
    \mathbf{P}(X=x) &= \sum_{y \in Y(\Omega)} \mathbf{P}(X = x, Y = y) \\
    &= \sum_{y \in Y(\Omega)} \mathbf{P}_V(\{(x,y)\})
  \end{aligned}
  $$
  同理可确定$\mathbf{P}\_Y$
- 设$(x,y) \in V(\Omega)$，若$\mathbf{P}(Y=y) = 0$，那么$\mathbf{P}(X = x, Y = y) = 0$；否则，有
  $$
  \begin{aligned}
    \mathbf{P}(X=x,Y=y) & = \mathbf{P}(Y=y)\mathbf{P}(X=x|Y=y) \\
    & = \mathbf{P}_Y(\{y\}) \mathbf{P}_{X|Y=y}(\{x\})
  \end{aligned}
  $$
{: .proof}

## 独立性

我们之前的研究启发我们寻找一种特殊的关系，使得联合分布可以由其所有边际分布决定，而非边际分布的条件分布。
如果能够找到这种关系，就能在联合分布和边际分布之间建立一一对应，从而具有非常多优秀的性质。
这种关系就是*独立性*。

### 两个随机变量的独立性

我们称两个事件是**独立**的，若满足
$$
\mathbf P(AB) = \mathbf P(A) \cdot \mathbf P(B)
$$
{: .definition}

根据条件概率的定义，独立且非零测或几乎必然的事件$A$也可以写为：$\mathbf P(A\|B) = \mathbf P(A)$。

若$A,B$是两个独立事件，那么$A^C, B$、$A, B^C$和$A^C, B^C$也是独立事件。
{: .proposition}

这个命题很容易由计算验证。

两个σ-代数$\mathcal A, \mathcal B$是**独立**的，若
$$
\forall A \in \mathcal A, B \in \mathcal B, \quad \mathbf P(A \cup B) = \mathbf P(A) \cdot \mathbf P(B)
$$
两个随机变量$X,Y$是**独立**的，若其对应的σ-代数$\sigma(X), \sigma(Y)$是独立的。
{: .definition}

两个随机变量独立等价于
$$
\begin{aligned}
    \forall (A,B) \in \mathcal{P}(X(\Omega)) \times \mathcal{P}(Y(\Omega)) \\
    P(X \in A, Y \in B) = \mathbf P(X \in A) \cdot \mathbf P(Y \in B)
\end{aligned}
$$
即对于任何一组随机变量的取值，同时取两个值的概率等于分别取两个值的概率之积。

两个事件$A,B$独立当且仅当其对应的指示函数随机变量独立。

两个随机变量$X : \Omega \to E$、$Y : \Omega \to F$独立，当且仅当
$$
\begin{aligned}
    \forall x, y \in X(\Omega) \times Y(\Omega) \\
    P(X = x, Y = y) = \mathbf P(X = x) \cdot \mathbf P(Y = y)
\end{aligned}
$$
{: .propsition}

首先考虑前推后。
我们总是假设试验集合是有限的，因此所有集合都可以拆分成有限个非空集合的并，$\forall A, B \in \mathcal P (\Omega)$：
$$
\begin{aligned}
    \{ X \in A \} &= \biguplus_{x \in A} \{ X = x \} \\
    \{ Y \in B \} &= \biguplus_{y \in B} \{ Y = y \} \\
    \{ X \in A, Y \in B \} &= \biguplus \{ X = x, Y = y \}
\end{aligned}
$$
因此
$$
\begin{aligned}
    P(X \in A, Y \in B) &= \sum \mathbf P(X = x, Y = y) \\
    &= \sum \mathbf P(X = x) \mathbf P(Y = y) \\
    &= \sum \mathbf P(X = x) \sum \mathbf P(Y = y) \\
    &= P(X \in A) \mathbf P(Y \in B)
\end{aligned}
$$
后推前是显然的，只需要使用等价的定义即可。
{: .proof}

设$X:\Omega \to \mathbb R$，$Y:\Omega \to \mathbb R$为两个独立的实随机变量，那么随机变量$X+Y$的分布为：
$$
\forall z \in \mathbb R \quad \mathbf P(X+Y=z) = \sum_{x+y=z} \mathbf P(X=x) \mathbf P(Y=y)
$$
{: .proposition}

$$
\begin{aligned}
    \{Z = z\} &= \{\omega \in \Omega | X(\omega) + Y(\omega) = z\} \\
    &= \biguplus_{x+y=z} \{\omega \in \Omega | X(\omega) = x, Y(\omega) = y \} \\
    &= \biguplus_{x+y=z} \{X = x, Y = y\} \\
    &= \sum_{x+y=z} \mathbf P(X=x, Y=y) \\
    &= \sum_{x+y=z} \mathbf P(X=x) \mathbf P(Y=y)
\end{aligned}
$$
{: .proof}

显然，这个求和具有*卷积*（在离散情况下也称柯西积）的形式，因此我们有：
$$
\mathbf P_{X+Y} = \mathbf P_X * \mathbf P_Y
$$
或者对于概率质量函数，可以写为$\mathbf p\_{x+y} = \mathbf p\_x * \mathbf p\_y$

设$X: \Omega \to E$，$Y: \Omega \to F$为两个独立的随机变量，$\phi: E \to E^\prime$，$\psi: F \to F^\prime$为两映射，那么$\phi(X)$和$\psi(Y)$也是独立的。
{: .proposition}

我们有$\sigma(\phi(X)) \subset \sigma(X)$，$\sigma(\psi(Y)) \subset \sigma(Y)$，参见
[此节](/概率论/2023/02/27/finite-probability-models.html#%E5%8F%AF%E6%B5%8B%E5%BA%A6%E6%80%A7)
，因此若$\sigma(X)$和$\sigma(Y)$是独立的，那么$\sigma(\phi(X))$和$\sigma(\psi(Y))$是独立的，从而$\phi(X)$和$\psi(Y)$是独立的。
{: .proof}

### 有限个随机变量的独立性

我们可以将独立的概念推广到有限多个的情况。

称有限个事件$A\_1, \cdots, A\_n \in \mathcal P(\Omega)$是独立的，若
$$
\forall I \subset [\![ 1, n ]\!] \quad \mathbf P(\cap_{i \in I} A_i) = \prod_{i \in I} \mathbf P(A_i)
$$
{: .definition}

这种独立也叫*相互独立*，区别于*两两独立*，两两独立的一组事件不一定是相互独立的。

设一组有限个独立事件$A\_1, \cdots, A\_n \in \mathcal P(\Omega)$独立，且$B\_i$是$A\_i$或$A\_i^C$之中的一个，那么$B\_1, \cdots, B\_n$也是独立的。
{: .proposition}

σ-代数$\mathcal A\_1, \cdots, \mathcal A_n$是独立的，若
$$
\begin{aligned}
    \forall A_1 \in \mathcal A_1, \cdots \forall A_n \in \mathcal A_n \\
    P(A_1 A_2 \cdots A_n) = \mathbf P(A_1) \mathbf P(A_2) \cdots \mathbf P(A_n)
\end{aligned}
$$
{: .definition}

设$\mathcal A\_i = \\\{ \emptyset, A\_i, A\_i^C, \Omega \\\}$，那么事件$A\_i$独立当且仅当$\mathcal A\_i$独立。
{: .proposition}

我们称随机变量$X\_1, \cdots, X\_n$为独立的，若σ-代数$\sigma(X\_1), \cdots, \sigma(X\_n)$是独立的。
{: .definition}

同理，我们也可以将有限多个事件的独立性转化为其对应的指示函数的独立性。

若$X\_1, \cdots, X\_n$是一组独立的随机变量，那么这些随机变量组成的集合的任意子集中的随机变量都是独立的。
{: .proposition}

$X\_1, \cdots, X\_n, Y\_1, \cdots, Y\_m$是一组独立的随机变量，当且仅当$X\_1, \cdots, X\_n$是独立的、$Y\_1, \cdots, Y\_m$是独立的且$X = (X\_1, \cdots, X\_n)$和$Y = (Y\_1, \cdots, Y\_m)$是独立的。
{: .proposition}

首先，若$X\_1, \cdots, X\_n, Y\_1, \cdots, Y\_m$是一组独立的随机变量，那么$X\_1, \cdots, X\_n$是独立的且$Y\_1, \cdots, Y\_m$是独立的，因此只用验证$X,Y$是独立的。
设$x = (x\_1, \cdots, x\_n), y = (y\_1, \cdots, y\_m)$，那么：
$$
\begin{aligned}
    \mathbf P (X = x, Y = y) &= \mathbf P (X_1 = x_1, \cdots, Y_m = y_m) \\
    &= \mathbf P (X_1 = x_1) \cdots \mathbf P (X_n = x_n) P(Y_1 = y_1) \cdots P(Y_m = y_m) \\
    &= \mathbf P (X_1 = x_1, \cdots, X_n = x_n) \mathbf{P} (Y_1 = y_1, \cdots, Y_m = y_m) \\
    &= \mathbf{P}(X = x) \mathbf{P}(Y=y)
\end{aligned}
$$
因此这两个随机变量是独立的。
反之，有：
$$
\begin{aligned}
    \mathbf P (X_1 = x_1, \cdots, Y_m = y_m) &= \mathbf{P}(X = x, Y = y) \\
    &= \mathbf{P}(X = x) \mathbf{P}(Y = y) \\
    &= \mathbf P (X_1 = x_1, \cdots, X_n = x_n) \mathbf{P} (Y_1 = y_1, \cdots, Y_m = y_m) \\
    &= \mathbf{P}(X_1 = x_1) \cdots \mathbf{P}(Y_m = y_m)
\end{aligned}
$$
因此这些随机变量都是独立的。
{: .proof}

### 有限次试验的独立性

设$(E\_1, \mathcal{P}(E\_1), \mathbf{P}\_1), \dots, (E\_n, \mathcal{P}(E\_n), \mathbf{P}\_n)$为一组有限概率空间，设
$\Omega = E\_1 \times \cdots \times E\_n$，那么其上存在唯一的概率测度$\mathbf P$满足：
$$
\begin{aligned}
    \forall A_1 \in \mathcal{P}(E_1), \; \cdots \;, A_n \in \mathcal{P}(E_n) \\
    \mathbf P(A_1 \times \cdots \times A_n) = \mathbf P_1 (A_1) \times \cdots \times \mathbf P_n (A_n)
\end{aligned}
$$
测度$\mathbf P$称为**积概率测度**，记作
$$
\mathbf P = \mathbf P_1 \otimes \cdots \otimes \mathbf P_n
$$
{: .proposition}

设$\mathbf p_i$表示$\mathbf P_i$对应的概率质量函数，那么容易验证：
$$
\mathbf p(\omega) = \prod_{i=1}^n \mathbf p_i (\omega)
$$
是一个良定义的概率质量函数，因为其值大于等于零且满足加和性。
其对应的概率分布就是$\mathbf P$。
由于这个分布由所有质量函数唯一确定，因此它是唯一的。
{: .proof}

对于积概率测度$\mathbf P = \mathbf P\_1 \otimes \cdots \otimes \mathbf P\_n$，
根据笛卡尔积选择的*典范满射*$X\_1:\; \Omega \to E\_1,\; (\omega\_1, \cdots, \omega\_n) \mapsto \omega\_1$，……，$X\_n :\; \Omega \to E\_n,\; (\omega\_1, \cdots, \omega\_n) \mapsto \omega\_n$是概率分布分别为$\mathbf P\_1$，……，$\mathbf P\_n$的随机变量，
且它们是独立的。
{: .proposition}

出于简单起见，只考虑$n = 2$的情况。
设$A\_1 \in E\_1$，$A\_2 \in E\_2$，那么有：
$$
\begin{aligned}
    \mathbf{P}_{X_1}(A_1) &= \mathbf{P}(X_1 \in A_1, X_2 \in E_2) \\
    &= \mathbf{P}_1(X_1 \in A_1) \mathbf{P}_2(X_2 \in E_2) \\ 
    &= \mathbf{P}_1(A_1)
\end{aligned}
$$
同理$\mathbf P\_{X\_2}(A\_2) = \mathbf{P}\_2(A\_2)$。
然后验证独立性：
$$
\begin{aligned}
    \mathbf P (X_1 \in A_1, X_2 \in A_2) &= \mathbf P (A_1 A_2) \\
    &= \mathbf P_1 (A_1) \mathbf P_2 (A_2) \\
    &= \mathbf P (X_1 \in A_1) \times \mathbf P (X_2 \in A_2)
\end{aligned}
$$
从而这两个随机变量是独立的。
{: .proof}

#### 伯努利试验与二项分布

根据以上定义和定理，我们不难为连续进行的$n$次*独立*伯努利试验构造一个概率空间。
设第$k$次伯努利试验成功（随机变量取值为$1$）的概率为$p\_k$，那么有：
$$
\mathbf P(X_1 = 1) = p_1 , \; \cdots, \mathbf P(X_n = 1) = p_n
$$
从而我们可以构造样本空间$\Omega = {[\\\![ 0, 1 ]\\\!]}^n$，其对于的概率测度恰好为积概率测度，对质量函数，有：
$$
\forall \omega \in \Omega \quad \mathbf p(\omega) = \prod_{k=1}^n \mathbf p_k^{X_k(\omega)} (1 - \mathbf p_k)^{1 - X_k(\omega)}
$$
其中$X\_k$表示$\omega$的第$k$个分量，取值要么为零（表示失败），要么为一（表示成功）。

如果试验的概率等于$p$，那么有：
$$
\mathbf p(\omega) = \prod_{k=1}^n p^{X_k(\omega)} (1 - p)^{1 - X_k(\omega)} = p^{S(\omega)} (1-p)^{n-S(\omega)}
$$
其中$S$表示$\omega$中一的个数。
$S$是从$\Omega$到自然数的一个映射，因此也是一个随机变量。

更进一步地，如果我们需要求出$S(\omega) = k$的事件个数，那么我们只需要算出哪些试验成功，哪些失败即可，这可以通过二项式系数实现：
$$
\mathbf P(S = k) = \sum_{S(\omega) = k} \mathbf p (\omega) = \binom{n}{k} p^k (1-p)^{n-k}
$$
这恰好是二项分布的形式。

因此我们有：

设$X\_1, \dots, X\_n$为$n$个独立的、等概率的伯努利分布随机变量，那么$\sum X\_i$是一个服从二项分布的随机变量。
{: .theorem}
