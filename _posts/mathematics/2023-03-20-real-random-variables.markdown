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

### 期望、二次型与协方差

对有限概率空间中的两个实随机变量$X,Y$，$(X,Y) \mapsto E(XY)$是一个**正定的对称双线性型**，从而$X \mapsto E(X^2)$是一个**正定的二次型**。
{: .proposition}

设$\Omega = \\\{ \omega_1, \dots, \omega_n \\\}$，且$\mathbf{P}(\omega\_i) = p\_i > 0$。
再设$X(\omega\_i) = x\_i$，$Y(\omega\_j) = y\_j$。
注意到可以把任何随机变量转化为$\mathbb{1}$的线性组合，那么有：
$$
\begin{aligned}
    XY &= \left( \sum_{i = 1}^n x_i \mathbb{1}_{\omega_i} \right) \left( \sum_{j = 1}^n y_j \mathbb{1}_{\omega_j} \right) \\
    &= \sum_{i = 1}^n \sum_{j = 1}^n x_i y_j \mathbb{1}_{\omega_i} \mathbb{1}_{\omega_j} \\
    &= \sum_{i = 1}^n x_i y_i \mathbb{1}_{\omega_i}
\end{aligned}
$$
从而：
$$
\begin{aligned}
    E(XY) &= E(\sum_{i = 1}^n x_i y_i \mathbb{1}_{\omega_i}) \\
    &= \sum_{i = 1}^n x_i y_i E(\mathbb{1}_{\omega_i}) \\
    &= \sum_{i = 1}^n x_i y_i p_i
\end{aligned}
$$
已知$p_i$恒正，不难验证这个函数是正定的对称双线性型。
{: .proof}

根据代数所学知识，很容易发现，$X \mapsto \sqrt{E(X^2)}$构成一个范数。
实际上所谓方差就是一个随机变量与其期望在期望这一范数下的距离的平方，而标准差就是距离。

接下来，我们自然关心两个随机变量之间是否存在类似的关系，答案是当然。
实际上，方差也是一个二次型，而协方差就是这个二次型对应的*极双线性型*。

设映射：
$$
\begin{array}{cccc}
    \mathbf{Cov}: & \mathcal L (\Omega) \times \mathcal L (\Omega) & \to & \mathbb R_+ \\
    & (X,Y) & \mapsto & \mathbf E( (X - \mathbf EX) (Y - \mathbf EY) )
\end{array}
$$
这个映射称为两个随机变量的**协方差**，是方差对应的对称双线性型。
这个双线性型的正惯性指数为$N-1$，负惯性指数为零，其中$N$是$\Omega$的基数。
{: .definition}

设映射：
$$
\begin{array}{cccc}
    \varphi: & \mathcal L (\Omega) & \to & \tilde{\mathcal L}(\Omega) \\
    & X & \mapsto & X - E(X) = \tilde{X}
\end{array}
$$
其中，$\tilde{\mathcal L}(\Omega) = \\\{ X | \mathbf E(X) = 0 \\\}$。
我们已经知道$\mathbf E$是一个线性映射，因此$\tilde{\mathcal L}(\Omega)$实际上是其核。
根据秩-零化度定理，不难发现$\tilde{\mathcal L}(\Omega)$实际上是$\mathcal L(\Omega)$的一个超平面。
实际上，这个映射是向此超平面的正交投影。
从而我们有：
$$
\begin{aligned}
    X &= \tilde X + \mathbf EX \mathbb 1_{\Omega} \\
    \mathbf E(X^2) &= \mathbf E(\tilde X^2 + 2 \tilde X \mathbf EX + \mathbf E(X)^2) \\
    &= \mathbf E (\tilde X^2) + 2 \mathbf E(\tilde X \mathbf EX)  + \mathbf E(\mathbf E(X)^2) \\
    &= \mathbf E (\tilde X^2) + 2 \mathbf EX E\tilde X  + \mathbf E(\mathbf E(X)^2) \\
    &= \mathbf E (\tilde X^2) + \mathbf E(X)^2 \\
    &= \mathbf V(X) + E(X)^2
\end{aligned}
$$
这样我们使用线性映射重新证明了用期望计算方差的公式。
我们知道，$\mathbf V$实际上是$\mathbf E(X^2)$和$\varphi$的复合，而$\varphi$是一个正交投影，这相当于把一个二次型限制在一个子空间上，当然限制后的映射依然是二次型。
此外，我们知道$\mathbf V(X) = \mathbf E(\varphi(X) \cdot \varphi(X))$，从而容易验证$\mathbf {Cov}(X,Y) = \mathbf E(\varphi(X) \varphi(Y))$是其对应的对称双线性型。
最后，我们知道$\mathbf V(X)$在子空间$\tilde {\mathcal L}(\Omega)$上恒正，因为若$\mathbf EX = 0$则$\mathbf V(X) = \mathbf E(X^2)$；
而在其补空间$\mathrm{Span}(\mathbb 1_{\Omega})$上为零，因此其正惯性指数为$N-1$，负惯性指数为零。
{: .proof}

$$
\forall X, Y \in \mathcal L(\Omega), \quad | \mathbf Cov(X,Y) | \le \sigma_X \sigma_Y
$$
{: .proposition}

对双线性型$\mathbf Cov$应用柯西-施瓦茨不等式即可得证。
{: .proof}

$$
\begin{aligned}
    \mathbf {Cov}(X,Y) &= \mathbf E(XY) - (\mathbf EX )(\mathbf EY) \\
    \mathbf V (X+Y) &= \mathbf V(X) + \mathbf V(Y) + 2 \mathbf{Cov}(X,Y)
\end{aligned}
$$
{: .proposition}

这两个命题可由简单的计算验证。
{: .proof}

从定义上不难看出，协方差也可以作为范数，表征两个随机变量在线性空间上的某种距离，可以作为相关性的一种度量。
为了表征这种相关性，我们选择使用其“夹角”：

定义两个随机变量$X,Y$的相关系数为：
$$
\frac{\mathbf {Cov}(X,Y)}{\sigma_X \cdot \sigma_Y}
$$
若相关系数为一，那么说明两个随机变量“共线”，即存在常数$a,b,c$满足$aX+bY=c$；
若相关系数为零，那么说明两个随机变量正交，这样的随机变量称为**（线性）无关**的。
{: .definition}

考虑到$\mathbf {Cov}$作为一个对称的正二次型（虽然不是正定的），也可以以类似范数的方式来使用[^1]，这种定义方式无疑让人联想到内积空间中的夹角。

[^1]: 这种范数实际上称为**半范数**（seminorm）。

若两个随机变量是独立的，那么它们是线性无关的。
{: .proposition}

这个命题的证明比较容易，此处不再赘述。

反之，两个线性无关的随机变量不一定是独立的，这是因为，正如其名，相关系数只能表示*线性空间*下的相关性。
若两个随机变量以非线性的形式相关（比如一个是另一个的平方），那么就不会在相关系数中表现出来。

若随机变量$X\_1, \dots, X\_n$两两无关，那么：
$$
\mathbf V(X_1 + \cdots X_n) = \mathbf V(X_1) + \cdots + \mathbf V(X_n)
$$
{: .proposition}

这个命题由简单的计算即可验证。
需要注意的是，这里要求随机变量两两无关，不同于此前要求独立。

## 典型不等式

此处列出几个和期望相关的典型不等式。

（柯西-施瓦茨不等式）
$$
| \mathbf E(XY) | \le \sqrt{\mathbf E(X^2) \mathbf E(Y^2)}
$$
{: .proposition}

考虑到$E$是一个正定的对称双线性型，这个不等式是显然的。
{: .proof}

（琴生不等式）对非零区间上的凸（Convex）函数$\varphi$，任何取值在该区间上的随机变量$X$满足：
$$
\varphi(\mathbf EX) \le \mathbf E (\varphi(X))
$$
{: .proposition}

$X$为常函数的情况易证，不妨设$X$不是常函数。
凸函数的性质保证：
$$
\forall c \in I, \exists \lambda \in \mathbb R, \forall x \in I, \quad \varphi(c) + \lambda(x-c) \le \varphi(x)
$$
设$c = \mathbf EX$，$x = X$，两边取期望，注意到$\mathbf E (X - \mathbf EX) = 0$即可得证。
{: .proof}

（马尔可夫不等式）设$X$为一**正**随机变量，那么对所有$t > 0$，有：
$$
\mathbf P (X \ge t) \le \frac{\mathbf E(X)}{t}
$$
若$\varphi$为一增函数，那么还有：
$$
\mathbf P (X \ge t) \le \frac{\mathbf E(\varphi(X))}{\varphi(t)}
$$
{: .proposition}

有：
$$
\begin{aligned}
    X &= X \mathbb{1}_{X < t} + X \mathbb{1}_{X \ge t} \\
    & \ge X \mathbb{1}_{X \ge t} \\
    & \ge t \mathbb{1}_{X \ge t}
\end{aligned}
$$
两边同时取期望，注意到$\mathbb{1}_{X \ge t}$的期望等于$\mathbf P(X \ge t)$，即可得证。
注意到$\mathbf P(X \ge t) = \mathbf P(\varphi(X) \ge \varphi(t))$，后一个不等式也可得证。
{: .proof}

（切比雪夫不等式）设$X$为一任意正随机变量，那么对所有$t > 0$，有
$$
\mathbf P ( | X - \mathbf E X | \ge t) \le \frac{\mathbf V(X)}{t^2}
$$
{: .proposition}

取$X^\prime = |X - \mathbf E X|$代入马尔可夫不等式即可得证。
这个不等式可以推广到任意实随机变量，只需要取$\varphi(X) = \max(X,0)$即可。
{: .proof}

假设一个盒子中有10个除颜色以外完全相同的球，各自染上黑色或白色。
有人希望通过从盒子中随机取一个球，查看其颜色，然后放回的方式，估计其中黑色球的数量。
请利用切比雪夫不等式估计，至少要取多少次，才能使出错的概率小于$10^{-4}$。 \
我们用伯努利变量来描述一次实验，记第$i$次实验的结果为$X\_i$，若球为黑色则为一，否则为零。
那么这些变量是一系列独立的、概率为$p$的伯努利变量，记取出的黑球的总数为$S\_n = \sum\_{i=1}^n X\_n$。
要使用切比雪夫不等式，我们需要知道随机变量与其期望的差距，而要保证不犯错误，那么通过随机实验得出的黑球与实际的数量的差距不能过大。
因此，我们需要一个随机变量，其值表示实验得出的黑球数量，而其期望表示实际的黑球数量，变量：
$$10 \frac{S_n}{n} = 10 \overline X_n$$
的期望为$10p$，满足这个要求。 \
现在，我们需要确定“不确定度”，即切比雪夫不等式中的$t$。
我们希望通过实验得出的结果周围一个区间之内只含有一个整数，这样这个整数就一定是$10p$，从而一定是黑球的数量，代入不等式，可得：
$$
\begin{aligned}
    \mathbf{P}(| 10 \overline X_n - 10 p | \ge \frac{1}{2}) 
    &= \frac{\mathbf{V}(10 \overline X_n)}{\frac{1}{4}} \\
    &= 4 \mathbf{V}(10 \frac{S_n}{n}) \\
    &= \frac{400}{n} p (1-p) \\
    & \le \frac{100}{n}
\end{aligned}
$$
我们要求这个概率小于$10^{-4}$，代入即可得$n > 10^6$，从而$n$的最小值为$1000001$。
{: .exampl}

## 生成函数

设$X$为一自然数上分布的随机变量，那么：
$$
G_X(t) = \sum_{n = 0}^\infty \mathbf P(X = n) t^n
$$
称为这个随机变量的**生成函数**，也称**母函数**。
{: .definition}

注意到本章之中我们只研究有限概率空间，因此这个“级数”实际上只有有限项，从而总是良定义的多项式函数，不必关心其收敛问题。

设$X$为一自然数上分布的随机变量，那么：
$$
G_X(t) = \mathbf E (t^X)
$$
{: .proposition}

令$\varphi(x) = t^x$，那么
$$
G_X(t) = \sum_{n = 0}^\infty \mathbf P(X = n) t^n = \sum_{n = 0}^\infty \varphi(n) \mathbf P(X = n) = \mathbf E(t^X)
$$
{: .proof}

设$X,Y$为两个自然数上分布的独立随机变量，那么：
$$
G_{X+Y}(t) = G_X(t) \cdot G_Y(t)
$$
{: .proposition}

由于$X,Y$独立，它们的函数也独立，因此：
$$
G_{X+Y}(t) = E(t^X t^Y) = E(t^X) E(t^Y) = G_X(t) G_Y(t)
$$
{: .proof}

两个自然数上分布的随机变量的分布相同，当且仅当其母函数相同。
{: .proposition}

不难注意到母函数是由分布唯一确定的。
{: .proof}

对自然数上分布的随机变量$X$，有：
$$
G_X^{(r)}(1) = \mathbf E [X(X-1) \cdots (X-r+1)]
$$
{: .proposition}

简单计算可证。
{: .proof}

由最后一条定理，不难发现，对自然数上分布的随机变量$X$，有：
$$
\begin{aligned}
    \mathbf E (X) &= G_X^\prime (1) \\
    \mathbf V (X) &= G_X^{\prime \prime}(1) + G_X^\prime(1)(1 - G_X^\prime(1))
\end{aligned}
$$

这就终结了我们关于有限概率空间的所有讨论，接下来我们将关注无限的概率空间下的问题。
