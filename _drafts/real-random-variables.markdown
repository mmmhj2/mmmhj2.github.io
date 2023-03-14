---
title: "实值随机变量"
categories: "概率论"
---

本文继续研究有限概率空间，重点关注其中实值随机变量的特点。

在此文中，我们总是考虑不含零测事件的样本空间。
对可数（无论有限还是无限）的集合，我们都可以将零测事件排除出去，然后研究新的样本空间。
但是对更一般的空间，这个假设不一定是易于满足的。
比如，对于无限次进行的抛硬币游戏，任何可能的结果都是零测的，但是其仍然是良好定义的样本空间。

无论如何，既然我们目前仅研究有限的概率空间，我们总是将零测事件排除出去。

我们记集合$\mathcal L(\Omega)$表示所有从$\Omega$到实数的映射的集合，因此也是随机变量的集合。
这个集合是$\mathbb R$的一个$\| \Omega \|$维的线性空间，其规范基底为：$(\mathbb 1\_{\omega})\_{\omega \in \Omega}$，所有随机变量都可以写成：
$$
X = \sum_{\omega \in \Omega} X(\omega) \mathbb 1_{\omega}
$$

## 数学期望

设$X \in \mathcal L(\Omega)$，那么$X$的**数学期望**（简称**期望**）或**均值**定义为：
$$
\mathbf E(X) = \sum_{x \in X(\Omega)} x \mathbf P(X = x)
$$
{: .definition}

数学期望只与随机变量的分布，即其密度函数$x \to \mathbf P(X = x)$，有关，即使两个随机变量根本不在同一概率空间上，只要其分布相同，那么它们的期望就是相等的。

- 伯努利分布的期望为：
$$
\mathbf{E}(\mathbb 1_A) = \mathbf{P}(A)
$$
- 二项分布$X \sim \mathcal B(n,p)$的期望为：
$$
\mathbf{E}(X) = np
$$
{: .exampl}

### 期望的性质

（期望恒正）若$X(\omega) \ge 0$，那么$\mathbf E (X) \ge 0$；若$\mathbf E(X) = 0$，$X = 0$。
{: .proposition}

设$\omega \in \Omega$，记$\mathbf p(\omega) = \mathbf{P}(\\\{\omega\\\})$，设$X \in \mathcal L(\Omega)$，那么有：
$$
\mathbf E(X) = \sum_{\omega \in \Omega} X(\omega) \mathbf p (\omega)
$$
{: .lemma}

我们知道，$X$的原子构成$\Omega$的一个划分，因此在这个划分上求和相当于在整个样本空间上求和：
$$
\begin{aligned}
    \sum_{x \in X(\Omega)} x \mathbf P(X = x) &= \sum x \left( \sum_{\omega \in \{X = x\}} \mathbf p(\omega) \right) \\
    &= \sum_{x \in X(\Omega)} \sum_{\omega \in \{ X = x \}} X(\omega) \mathbf p(\omega) \\
    &= \sum_{\omega \in \Omega} X(\omega) \mathbf p(\omega)
\end{aligned}
$$
{: .proof}

（期望的线性）映射$\mathbf E: \mathcal L(\Omega) \to \mathbb R, \; X \mapsto \mathbf E(X)$是一个线性函数。
{: .proposition}

$$
\begin{aligned}
    \mathbf E(X + \mu Y) &= \sum_{\omega \in \Omega} (X + \mu Y)(\omega) \mathbf p(\omega) \\
    &= \sum_{\omega \in \Omega} X(\omega) \mathbf p(\omega) + \mu \sum_{\omega \in \Omega} Y(\omega) \mathbf p(\omega) \\
    &= \mathbf E(X) + \mu \mathbf E(Y)
\end{aligned}
$$
{: .proof}

设两个随机变量$X, Y$满足$X \le Y$，那么$\mathbf E(X) \le \mathbf E(Y)$。
{: .proposition}

这个命题的证明较为显然。

设$X: \Omega \to E$为一随机变量，$\phi: E \to \mathbb R$为一实值函数，那么：
$$
E(\phi(X)) = \sum_{x \in X(\Omega)} \phi(x) \mathbf P(X = x)
$$
{: .proposition}

我们知道：
$$
\phi(X) = \sum_{x \in X(\Omega)} \phi(x) \mathbb 1_{\{X = x\}}
$$
从而直接使用线性：
$$
\begin{aligned}
    E(\phi(X)) &= E(\sum \phi(x) \mathbb 1_{\{X = x\}}) \\
    &= \sum \phi(x) E(\mathbb 1_{\{X = x\}}) \\
    &= \sum \phi(x) \mathbf P(X = x)
\end{aligned}
$$
{: .proof}

若$X,Y$为二**独立**的随机变量，那么：
$$
E(XY) = E(X) \cdot E(Y)
$$
{: .proposition}

设$\phi: \mathbb R^2 \to \mathbb R, \; (x,y) \mapsto xy$，$V = (X,Y)$，那么$XY = V \circ \phi$。
从而直接使用上述定理：
$$
\begin{aligned}
    \mathbf E(XY) &= \sum_{(x,y) \in V(\Omega)} xy \mathbf P(X=x, Y=y) \\
    &= \sum_{x \in X(\Omega), y \in Y(\Omega)} xy \mathbf P(X = x) \mathbf P(Y = y)\\
    &= \left( \sum_{x \in X(\Omega)} x \mathbf P(X = x) \right) \left( \sum_{y \in Y(\Omega)} y \mathbf P(Y=y) \right) \\
    &= \mathbf E(X) \cdot \mathbf E(Y)
\end{aligned}
$$
{: .proof}

## 二阶矩

设$r \in \mathbb N^\*$，$X: \Omega \to \mathbb R$为一随机变量，那么$X$的**$r$阶矩**表示$\mathbf E(X^r)$。
{: .definition}

根据期望的性质，我们知道这个值也只取决于随机变量的分布。
更进一步地，我们有：
$$
\mathbf E(X^r) = \sum_{x \in X(\Omega)} x^r \mathbf P(X = x)
$$

### 方差与标准差

设$X \in \mathcal L(\Omega)$，我们称$X$的方差为：
$$
\mathbf V(X) = \mathbf E((X - \mathbf E(X))^2)
$$
相对地，其标准差为：
$$
\sigma_X = \sqrt(\mathbf V(X))
$$
{: .definition}

标准差或方差表征了数据距离其平均值$\mathbf E(X)$的分散程度。

以下几个公式可以用来非常方便地计算方差：

1. 随机变量$X$的方差为
   $$
   \mathbf V(X) = \mathbf E(X^2) - (\mathbf E(X))^2
   $$
2. 随机变量的方差是二次齐次的：
   $$
   \forall a, b \in \mathbb R \quad \mathbf V(aX+b) = a^2 \mathbf V(X)
   $$
3. 随机变量的方差为零，当且仅当其为常数。
{: .proposition}

这些命题都可以非常容易地用计算验证。

