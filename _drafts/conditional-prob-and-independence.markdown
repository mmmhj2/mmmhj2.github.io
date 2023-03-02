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

