---
title: "统计估计"
categories: "概率"
---

## 前置知识

### 条件期望与方差

本节中我们将考虑二元随机变量的条件期望和方差。

对随机变量$X$和事件$A$，称$X$在$A$条件下的期望为：
$$\mathbf E(X | A) = \sum_x x P(X = x | A)$$
对两个随机变量$X, Y$，其条件期望为：
$$
\begin{aligned}
\mathbf E(Y|X = x) &= \sum y P(Y = y | X = x) & (\text{离散}) \\
&= \int_{-\infty}^\infty y \cdot p_{Y|X}(y|x) \mathrm d y & (\text{连续})
\end{aligned}
$$
同理，条件方差定义为：
$$\mathbf V(Y|X=x) = \mathbf E [(Y - \mathbf E (Y | X=x))^2 | X =x ]$$
{: .definition}

和期望不同，条件期望是一个随机变量——它是一个将事件($A$或者$X = x$)映射到数域上的函数，因此条件期望也具有矩。

（全期望公式）设$X, Y$为两个随机变量，则条件期望的期望为：
$$\mathbf E(\mathbf E(Y|X)) = \mathbf E (Y)$$
{: .proposition}

此处只证明离散的情况，连续的情况同理可证。
$$
\begin{aligned}
\mathbf E(\mathbf E(Y|X)) &= \sum_x \mathbf E(Y | X = x)P (X = x) \\
&= \sum_x \left[ \sum_y y P(Y=y | X=x) \right] P(X = x) \\
&= \sum_y y \left[ \sum_x P(Y=y | X=x) P(X=x) \right] \\
&= \mathbf E(Y)
\end{aligned}
$$
注意到根据定义期望若存在则一定绝对收敛，因此可以交换求和符号的顺序。连续的情况下可以使用富比尼定理。
{: .proof}

（全方差公式）设$X, Y$为两个随机变量，则$Y$的方差与其条件方差和条件期望之间满足：
$$\mathbf V(Y) = \mathbf E[\mathbf V(Y|X)] + \mathbf V[\mathbf E(Y|X)]$$
{: .proposition}

$$
\def\E{\mathbf{E}}
\def\V{\mathbf{V}}
\begin{aligned}
\V(Y) &= \E(Y^2) - \E(Y)^2 \\
&= \E[\E(Y^2 | X)] - \E[\E(Y|X)]^2 \\
&= \E[\V(Y|X) + \E(Y|X)^2] - \E[\E(Y|X)]^2 \\
&= \E[\V(Y|X)] + \E[\E(Y|X)^2] - \E[\E(Y|X)]^2 \\
&= \E[\V(Y|X)] + \V[\E(Y|X)]
\end{aligned}
$$
{: .proof}

## 抽样与统计量

我们使用独立同分布的随机变量来对抽样进行建模。

我们认为进行抽样的**总体**（Population）是一个随机变量$X$，则该总体的一个**抽样**（Sample）可表示为一列有限个独立同分布的随机变量$(X\_1, \dots, X\_n)$，而这些随机变量的取值$(x\_1, \dots, x\_n)$称为**样本值**或**观测值**。
{: .definition}

**统计量**（Statistic）是一个抽样的函数：
$$T(X) = T(X_1, \dots, X_n)$$
因此统计量也是一个随机变量。
{: .definition}

最常见的统计量为样本的均值和方差。

### 样本均值

**样本均值**定义为：
$$\overline{X} = \overline{X}(X_1, \dots, X_n) = \frac{1}{n} \sum_{i=1}^n X_i$$
{: .definition}

记总体的均值（期望）为$m$，方差为$\sigma^2$，
作为一个随机变量，样本均值的期望为$\E(\overline X) = \E(X) = m$，其方差为：$\V(\overline{X}) = \frac{\V(X)}{n} = \frac{\sigma^2}{n}$。

随机变量$\overline X$依概率收敛至$\E(X)$，依分布收敛至$N(m, \sigma^2 / n)$。
{: .proposition}

第一条命题即大数定律；
第二条命题即中心极限定理。
{: .proof}

### 样本方差

**样本方差**定义为：
$$S^2 = \frac{1}{n} \sum_{i=1}^n (X_i - \overline X)^2 = \frac{1}{n} \left( \sum_{i=1}^n X_i^2 \right) - \overline X^2$$
{: .definition}

样本方差可由总体均值表示：
$$S^2 = \frac{1}{n} \sum_{i=1}^n (X_i - m)^2 - (\overline X - m)^2$$
{: .proposition}

有：
$$
\begin{aligned}
\frac{1}{n} \sum_{i=1}^n (X_i - m)^2 
&= \frac{1}{n} \sum_{i=1}^n (X_i - \overline X + \overline X - m)^2 \\
&= \frac{1}{n} \sum_{i=1}^n (X_i - \overline X)^2 + \frac{1}{n} \sum_{i=1}^n (\overline X - m)^2 \\
& + \frac{2}{n} (\overline X - m) \cancel{\sum_{i=1}^n (X_i - \overline X)} \\
&= \frac{1}{n} \sum_{i=1}^n (X_i - \overline X)^2 + \frac{1}{n} \sum_{i=1}^n (\overline X - m)^2
\end{aligned}
$$
{: .proof}

样本方差的期望不等于总体的方差：
$$\E(S^2) = \frac{n-1}{n} \sigma^2$$
定义
$${S^*}^2 = \frac{n}{n-1} S^2 = \frac{1}{n-1} \sum_{i=1}^n (X_i - \overline X)^2$$
为**无偏样本方差**，通常使用无偏样本方差来估计总体的方差。
{: .proposition}

$$
\begin{aligned}
\E (S^2) &= \E (\frac{1}{n} \sum_{i=1}^n (X_i - m)^2) - \E (\overline X - m)^2 \\
&= \frac{1}{n} \sum_{i=1}^n \V (X_i) - \V(\overline X) \\
&= \V(X) - \frac{1}{n} \V(X) =  \frac{n-1}{n} \V(X)
\end{aligned}
$$
{: .proof}

## 点估计

### 似然函数

### 最小方差无偏估计

### 极大似然估计

## 区间估计
