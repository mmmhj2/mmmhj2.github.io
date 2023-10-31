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

我们认为进行抽样的**总体**（Population）是一个随机变量$X$，则该总体的一个**样本**（Sample）可表示为一列有限个独立同分布的随机变量$(X\_1, \dots, X\_n)$，而这些随机变量的取值$(x\_1, \dots, x\_n)$称为**样本值**或**观测值**。
{: .definition}

样本张成的集合称为样本空间（Sample space），也是一个概率空间。

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
从而
$$\E ({S^*}^2) = \frac{n}{n-1} \E(S^2) = \V(X)$$
{: .proof}

特别地，正态分布的样本方差满足卡方分布。

设$X \sim N(m, \sigma^2)$，则其样本的方差$S^2$满足：
$$\frac{n}{\sigma^2} S^2 = \frac{n-1}{\sigma^2} {S^*}^2 \sim \chi^2(n-1)$$
{: .proposition}

此处给出一个不严格的证明，严格的证明需要使用Cochran定理。
$$
\begin{aligned}
\frac{n}{\sigma^2} S^2 &= \sum_{i=1}^n (\frac{X_i - m}{\sigma})^2 - n(\frac{\overline X - m}{\sigma})^2 \\
&\sim \chi^2(n) - \chi^2(1) = \chi^2(n-1) 
\end{aligned}
$$
注意到样本均值和样本取值并不独立，因此该证明是不严密的。
{: .proof}

### 估计量

设总体的分布具有一个固定的参数$\theta$，则*估计量*（Estimator）是从样本空间到样本估计值的函数：
$$T_n: \quad (X_1, \dots, X_n) \ \mapsto \ \hat \theta $$
显然，估计量也是一个随机变量。
该估计量对于一个样本值的误差（Error）和偏差（Derivation）定义为：
$$e(x) = T(x) - \theta, \quad d(x) = T(x) - \E(T)$$
{: .definition}

在定义中，我们并没有给出估计量的任何要求，但是一个值得使用的估计量必然具有某些性质。
我们将研究三个重要的性质。

（相合估计量）设$\theta$为一参数，$T(X\_1, \dots, X\_n)$为其估计量。
若$n$趋于无穷大时，$T$*以某种方式*收敛至常量$\theta$，则称该估计为*相合的*（Consistent，或称一致的）。
若$T$依概率收敛，则称其弱相合；若几乎必然收敛，则称其为强相合。
{: .definition}

（无偏估计量）设$\theta$为一参数，$T(X\_1, \dots, X\_n)$为其估计量。若$T$的期望与$\theta$相等，则称其为*无偏*（Unbiased）的；若$T$的期望收敛至$\theta$，则称其为渐进无偏的。
{: .definition}

无偏性和相合性是对估计量在两个不同方面的描述，两者没有必然的联系。
考虑样本$(X\_1, \dots, X\_n)$，我们可以用$T(X) = x\_n$估计总体的期望。
这个估计是无偏的，因为估计量的期望就是$X\_n$的期望，从而就是总体的期望；
但是这个估计不是一致的，$T\_n$并不收敛。

（均方误差）
估计量$T$的*均方误差*（Mean squared error，MSE）定义为：
$$\mathrm{MSE}(T) = \E[(T - \theta)^2]$$
若一个统计量的均方误差小于另一个，则称该统计量比另一个*更优*。
{: .definition}

无偏估计量的均方误差等于其方差。
{: .proposition}

$$
\begin{aligned}
\E[(T - \theta)^2]
&= \E[(T - \E T + \E T - \theta)^2] \\
&= \E[(T - \E T)^2] + \E[(\E T - \theta)^2] - \cancel{2 \E[(T - \E T)(\E T - \theta)]} \\
&= \E[(T - \E T)^2] + \cancel{\E[(\E T - \theta)^2]} \\
&= \V(T)
\end{aligned} 
$$
{: .proof}

## 点估计

我们首先介绍点估计，即使用样本来给出估计量的一个值的方法。

既然已经给出了估计量的优秀这一偏序关系，我们自然希望寻找最优秀的统计量，因此我们首先关注*最小方差无偏估计*（Minimum Variance Unbiased Estimation，MVUE）。

首先，我们给出几个用于研究MVUE的定义。

### 似然函数

（似然函数）
设$\theta$为欲估计的参数，$(X\_1, \dots, X\_n)$是一个独立同分布的样本，其样本值为$x = (x\_1, \dots, x\_n)$，则其*似然函数*（Likelihood function）定义为
$$L(\theta | x) = p_\theta (x) = \prod_{i=1}^n p_\theta(x_i)$$
或
$$L(\theta | x) = P_\theta (X = x) = \prod_{i=1}^n P_\theta(X_i = x_i)$$
表示在$\theta$取值固定条件下的概率。
{: .definition}

（充分统计量）统计量$T$对参数$\theta$是*充分的*（Sufficient），若在给定统计量的条件下，抽样的条件概率分布与$\theta$无关。
Fisher-Neyman定理给出其一个等价定义：统计量是充分的，当且仅当其似然函数可以写成两个函数的积：
$$L(\theta | x) = g_\theta(t) h(x)$$
其中$h$与$\theta$无关，$g\_\theta(t)$是$T$的分布函数（概率密度函数）。
{: .definition}

设$\varphi$为一单射，$T$为一充分统计量，则$G = \varphi(T)$也是充分的。
{: .proposition}

通常为了验证一个统计量是充分的，我们可以用似然函数除以$T$的分布函数，然后验证结果与$\theta$无关。

（完备统计量）统计量$T$是*完备的*（Complete），若对任意函数$h$，
$$
\E [h(T) | \theta] = 0 \quad \forall \theta 
\implies
P(h(T) = 0 | \theta) = 1 \quad \forall \theta
$$
{: .definition}

该定义比较抽象，但是我们可以使用以下命题直接得出一个分布的完备统计量。

指数族分布的充分统计量是完备统计量。
{: .proposition}

我们之前介绍的所有分布，包括二项分布、正态分布等分布，都是指数族分布，因此其完备统计量可以很容易地由充分统计量构造出来。

### 最小方差无偏估计

我们介绍几个用于计算最小方差无偏估计的命题。

最小方差无偏估计几乎必然唯一。
{: .proposition}

（Rao-Blackwell）
若$T$为一$\theta$的无偏估计，$U$为$\theta$的充分统计量，则$T^* = \E (T | U)$也是$\theta$的一个无偏估计，且至少和$T$一样优秀。
{: .theorem}

首先证明无偏性：
$$\E (T^*) = \E[\E(T|U)] = \E[T] = \theta$$
两者都是无偏估计，因此其均方误差就是方差，我们只比较其方差即可。
$$
\begin{aligned}
\V (T^*) &= \V [\E(T|U)] \\
&= \V(T) - \E[\V(T|U)] \\
&\le \V(T)
\end{aligned}
$$
因此$T^*$的均方误差不大于$T$的。
{: .proof}

设$U$是$\theta$的一个充分统计量，则其最小方差无偏估计只与$U$有关。
{: .proposition}

（Lehmann–Scheffé）
设$U$为$\theta$的充分且完备的统计量，$T = \varphi(U)$是无偏的，即$\E T = \theta$，则$T$就是$\theta$的唯一最小方差无偏估计。
{: .theorem}

这个定理允许我们计算最小方差无偏估计。
只需要找到一个统计量，证明其充分性和完备性，然后将其变换为一个无偏统计量，就可以得到最小方差无偏估计。

### 极大似然估计

若存在$\theta$的一个估计$\hat \theta$使得其似然函数在$\hat \theta$处取得最大值，则称该估计为*极大似然估计*（Maximum Likelihood Estimation，MLE）：
$$\hat \theta = \arg \max_{\theta} L(\theta | x)$$
{: .definition}

求解任意函数的最大值通常非常困难，我们常常使用极大值代替。
此时，我们令
$$\frac{\mathrm d}{\mathrm d \theta} L(\theta | x) = 0$$
即可得到$\hat \theta(x)$，然后验证二阶导即可。

## 区间估计

在点估计中，我们根据样本给出了统计参数的估计值。
现在，我们希望利用区间估计，给出统计参数在一定概率下的可能的区间。

设$X$为样本，$\theta$为待估计的统计参数，*置信区间*（Confidence interval）是由随机变量$u(X), v(X)$确定的区间$(u(X), v(X))$，满足：
$$P(\theta \in (u(X), v(X))) = P(u(X) < \theta < v(X)) = 1 - \alpha = \gamma$$
其中$\gamma$为一常数，称为*置信度*（Confidence level）；$\alpha$称为风险。
{: .definition}

通常，进行区间估计可分三步进行：

1. 确定置信度$\gamma$；
2. 确定估计量$\hat \theta$，此时使用的估计量不必是最优的点估计量；
3. 寻找随机变量$U(\hat \theta)$，其中含有参数$\theta$且不含有其他不能由样本求出的变量，然后利用该变量的分布计算置信区间。

因为需要利用随机变量$U$的分布，该分布最好已知或易于计算，因此可能为了得出性质简单的分布而舍弃估计量的品质。
通常将随机变量转化为标准正态分布或几个相关的分布（如卡方分布等）。

习惯上讲，我们使用满足以下条件的区间作为置信区间：
$$P(u(X) < \theta) = \frac{\alpha}{2} = \frac{1-\gamma}{2}, \quad P(v(X) < \theta) = 1-\frac{\alpha}{2} = \frac{1+\gamma}{2}$$

我们简单介绍几个常见的区间估计。

### 正态分布的期望

#### 已知方差求期望

若总体的方差已知，则使用样本均值$\overline X$估计正态分布的期望，可以使用随机变量：
$$
\def\avgX{\overline{X}}
U(\avgX) = \frac{\avgX - m}{ \frac{\sigma}{\sqrt{n}} } \sim N(0,1)
$$
来进行区间估计。
{: .proposition}

容易证明$U(\avgX)$服从标准正态分布，接下来介绍如何使用该随机变量进行区间估计。
设所需的置信度为$\gamma$，而风险为$\alpha = 1 - \gamma$。
如上文所述，由于$U$是中心化的对称的随机变量，我们选择$u(X) = - v(X)$作为区间的界。
首先，我们需要求出$m$和$U(\avgX)$的关系，从而得出$u(X)$和$v(X)$。
$$
U(\avgX) = \frac{\avgX - m}{ \frac{\sigma}{\sqrt{n}} } \iff
\avgX - \frac{\sigma}{\sqrt{n}} U(\avgX) = m
$$
考虑到$U$和$m$之间存在这种双射关系，我们可以直接限制$U(\avgX)$，然后再计算$m$的区间。
由于$U$服从的标准正态分布是中心化且对称的，我们考虑对称的限制：
$$P(b < U(\avgX) < a) = P(-a < U(\avgX) < a) = \gamma$$
由于$U$是标准正态分布，我们可以通过查表很容易地求出$a$的值$a\_\gamma$。
然后，我们可以使用上文的关系求出$m$的置信区间。
$$u(X) = \avgX - \frac{\sigma}{\sqrt{n}} a_\gamma, \; v(X) = \avgX + \frac{\sigma}{\sqrt{n}} a_\gamma$$
{: .proof}

#### 未知方差求期望

若总体的方差未知，则可以使用样本方差$S^2$近似，此时使用的随机变量为：
$$U(\avgX) = \frac{\avgX - m}{\frac{S}{\sqrt{n-1}}} \sim t(n-1)$$
其中$t$表示服从学生t-分布，$S = \sqrt{S^2}$表示样本的标准差。
{: .proposition}

注意到：
$$\frac{\avgX - m}{\frac{\sigma}{\sqrt{n}}} \sim N(0,1), \quad \frac{n S^2}{\sigma^2} \sim \chi^2(n-1)$$
从而：
$$U(\avgX) = \frac{\avgX - m}{\frac{\sigma}{\sqrt{n}}} \cdot \left( \frac{\sqrt{\frac{n S^2}{\sigma^2}}}{\sqrt{n-1}} \right)^{-1} \sim \frac{N(0,1)}{\sqrt{\frac{\chi^2(n-1)}{n-1}}} =  t(n-1)$$
现在，根据定义，可以尝试求解$m$
$$U(\avgX) = \frac{\avgX - m}{\frac{S}{\sqrt{n-1}}} 
\iff m = \avgX - U(\avgX) \frac{S}{\sqrt{n-1}}$$
学生t-分布也是一个中心化的对称分布，因此我们如法炮制查表求出$a\_\gamma$，从而可得置信区间：
$$u(X) = \avgX - a_\gamma \frac{S}{\sqrt{n-1}}, \; v(X) = \avgX + a_\gamma \frac{S}{\sqrt{n-1}}$$
{: .proof}

### 正态分布的方差

#### 已知均值求方差

当总体的均值已知时，我们使用估计量$T$：
$$T = \frac{1}{n} \sum_{i=1}^n \left( X_i - m \right)^2$$
注意和样本方差不同，此处不使用样本均值，而是总体均值。
和随机变量$U$：
$$U(T) = \frac{nT}{\sigma^2} \sim \chi^2(n)$$
进行区间估计。
{: .proposition}

证明随机变量服从卡方分布是容易的，但是卡方分布并非对称分布，因此我们研究一下如何求置信区间。
首先，我们仍然先考虑限制随机变量$U$：
$$P(a < U < b) = \gamma = 1 - \alpha$$
如前文所述，我们考虑以下概率：
$$P(U < b) = 1 - \frac{\alpha}{2}, \quad P(U < a) = \frac{\alpha}{2}$$
由于$U$服从卡方分布，我们也可以比较容易地由查表计算出$a,b$的值$a\_\gamma$和$b\_\gamma$。
$U$和$\sigma^2$之间的关系比较简单，此处不再赘述，可得置信区间为：
$$v(X) = \frac{n t}{a_\gamma}, \; u(X) = \frac{n t}{b_\gamma}$$
其中$t$是估计量$T$的值。
{: .proof}

#### 未知均值求方差

当均值未知时，我们直接使用样本的方差（修正前后均可）进行估计。
$$U = \frac{n S^2}{\sigma^2} = \frac{(n-1){S^*}^2}{\sigma^2} \sim \chi^2(n-1)$$
{: .proposition}

该估计的证明与用法和已知均值情况下的完全相同。
{: .proof}

### 双正态分布估计

接下来我们研究两个正态分布：
$$X \sim N(m_1, \sigma_1^2), \; Y \sim N(m_2, \sigma_2^2), \; X,Y\text{独立}$$
之间关系的区间估计。

#### 两个正态分布期望的差

我们使用$D$：
$$D = \overline{X} - \overline{Y} \to m_1 - m_2$$
来估计两个正态分布的期望的差，其服从正态分布：
$$D \sim N(m_1 - m_2, \frac{\sigma_1^2}{n_1} + \frac{\sigma_2^2}{n_2})$$
若两个正态分布的方差已知但不相等，则可使用：
$$U(D) = \frac{D - (m_1 - m_2)}{\sqrt{\frac{\sigma_1^2}{n_1} + \frac{\sigma_2^2}{n_2}}} \sim N(0,1)$$
进行区间估计。
若两个正态分布的方差未知但相等，则可使用：
$$U(D) = \frac{D - (m_1 - m_2)}{\sqrt{\sum(X_i - \overline{X})^2 + \sum(Y_i - \overline Y)^2}} \cdot \frac{\sqrt{n_1 + n_2 - 2}}{\sqrt{\frac{1}{n_1} + \frac{1}{n_2}}} \sim t(n_1 + n_2 - 2)$$
进行区间估计。
{: .proposition}

标准正态分布和t-分布都是中心化的对称分布，而如何使用它们已经在之前介绍过了，假设我们已经求出$a\_\gamma$，则两者的置信区间都可以用$U$的定义容易地求出。
{: .proof}

#### 两个正态分布方差之比

两个分布的方差之比的估计量为：
$$T = \frac{ {S_1^*}^2}{ {S_2^*}^2}$$
可由以下随机变量进行区间估计：
$$U(T) = T \times \frac{\sigma_2^2}{\sigma_1^2} = \frac{ {S_1^*}^2 \sigma_2^2}{ {S_1^*}^2 \sigma_1^2} \sim F(n_1 - 1, n_2 - 1)$$
{: .proposition}

注意到
$$(n_1-1)\frac{ {S_1^*}^2}{\sigma_1^2} \sim \chi^2 (n_1-1), \; (n_2-1)\frac{ {S_2^*}^2}{\sigma_2^2} \sim \chi^2 (n_2-1)$$
从而
$$U(T) = \frac{(n_1-1)\frac{ {S_1^*}^2}{\sigma_1^2} / (n_1-1)}{(n_2-1)\frac{ {S_2^*}^2}{\sigma_2^2} / (n_2-1)} \sim F(n_1-1, n_2-1)$$
费舍尔分布不是对称的分布，因此我们通常采用。
$$P(U < a) = \frac{\alpha}{2}, \; P(U < b) = 1 - \frac{\alpha}{2}$$
这一区间。
{: .proof}

费舍尔分布具有一条特殊的性质，即：
$$P(U > a) = P(\frac{1}{U} < \frac{1}{a})$$
因此，其分布表上通常只提供$P(U < a) = 0.99$之类的反查。
为了解出$P(U < a) = 0.01$的解，我们需要进行转化：
$$P(U < a) = 1 - P(U \ge a) = 1 - P(\frac{1}{U} \le \frac{1}{a})$$
从而查出$\frac{1}{a}$的值。

### 二项分布的概率

我们使用成功频率$f$估计二项分布的成功概率$p$。
使用的随机变量为：
$$U(f) = \frac{f - p}{\sqrt{p(1-p)/n}} \sim N(0,1)$$
{: .proposition}

根据棣莫弗-拉普拉斯定理，我们使用正态分布近似二项分布，可得：
$$f \sim N(p, \frac{p(1-p)}{n})$$
从而$U(f) \sim N(0,1)$
{: .proof}

值得注意的是，在求解$U$和$p$的关系时，需要解不等式：
$$P(-a < p < a) = \gamma \iff P(-a < \frac{f-p}{\sqrt{p(1-p)/n}} < a) = \gamma$$
即需要求解不等式：
$$\frac{|f-p|}{\sqrt{p(1-p)/n}} < a$$
我们可以选择两边同时平方并求解不等式，也可以选择直接进行近似：
$$\sqrt{p(1-p)/n} \approx \sqrt{f(1-f)/n}$$
甚至可以直接使用近似
$$\sqrt{p(1-p)} \approx \sqrt{\frac{1}{2} \times \frac{1}{2}} = \frac{1}{2}$$
