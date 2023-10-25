---
title: "常见概率分布"
categories: ["概率论"]
---

本文将介绍几个常见的概率分布

## 离散概率分布

### 二项分布

概率质量函数形如
$$P(X = x) = \binom{n}{k} p^k (1-p)^{n-k},\quad p \in (0,1); n \in \mathbb N$$
的离散随机变量服从的分布称为*二项分布*（Binomial distribution），记为$X \sim B(n,p)$
{: .definition}

二项分布可视为若干个独立同分布的满足零一分布的离散随机变量的和的分布。

二项分布的常见矩为：
$$\begin{aligned}
\mathbf E(X) &= np \\
\mathbf V(X) &= np(1-p)
\end{aligned}$$
{: .proposition}

### 超几何分布

概率质量函数形如
$$P(X = k) = \frac{\binom{Np}{k} \binom{N - Np}{n - k}}{\binom{N}{n}}, \quad p \in (0,1); n,N \in \mathbb N$$
的离散随机变量服从的分布称为*超几何分布*（Hypergeometric distribution），记为$X \sim H(N,n,p)$
{: .definition}

超几何分布常用于表示从具有两个类型的整体（如及格和不及格）中抽出但不放回地进行抽样，样本中某种类型（该类型在总体中有$Np$个）的个数的分布。

超几何分布的常见的矩为：
$$\begin{aligned}
\mathbf E(X) &= np \\
\mathbf V(X) &= np(1-p) \frac{N-n}{N-1}
\end{aligned}$$
{: .proposition}

### 泊松分布

概率质量函数形如
$$P(X = k) = \frac{e^{-\lambda} \lambda^k}{k!}, \quad \lambda \in \mathbb R^*$$
的离散随机变量服从的分布称为*泊松分布*（Poisson distribution），记为$X \sim P(\lambda)$
{: .definition}

泊松分布常用于描述单位时间内随机事件发生的次数。

泊松分布的常见的矩为：
$$\begin{aligned}
\mathbf E(X) &= \lambda \\
\mathbf V(X) &= \lambda
\end{aligned}$$
{: .proposition}

泊松分布的矩的证明需要用到指数函数的幂级数定义，此处证明其期望：
$$
\begin{aligned}
\mathbf E(X) &= \sum_{x=0}^\infty x P(X = x) \\
&= \sum_{x=1}^\infty x \frac{e^{-\lambda} \lambda^x}{x!} \\
&= \lambda e^{-\lambda} \sum_{x=1}^\infty \frac{\lambda^{x-1}}{(x-1)!} \\
&= \lambda e^{-\lambda} e^{\lambda} = \lambda
\end{aligned}
$$
方差的证明需要用到幂级数的导数，我们计算$\mathbf E(X^2)$：
$$
\begin{aligned}
\mathbf E(X^2) &= \sum_{x=0}^\infty x^2 P(X = x) \\
&= \sum_{x=1}^\infty x^2 \frac{e^{-\lambda}}{\lambda^x}{x!} \\
&= \lambda e^{-\lambda} \sum_{x=1}^\infty \frac{x \lambda^{x-1}}{(x-1)!}
\end{aligned}
$$
注意到
$$x \lambda^{x-1} = \frac{\mathrm d \lambda^x}{\mathrm d \lambda}$$
从而：
$$\begin{aligned}
\mathbf E(X^2) &= \lambda e^{-\lambda} \frac{\mathrm d}{\mathrm d \lambda} \left[ \sum_{x=1}^{\infty} \frac{\lambda ^x}{(x-1)!} \right] \\
&= \lambda e^{-\lambda} \frac{\mathrm d \lambda e^{\lambda}}{\mathrm d \lambda} \\
&= \lambda + \lambda^2 \\
\mathbf V(X) &= \mathbf E(X^2) - (\mathbf E(X))^2 \\
&= \lambda
\end{aligned}$$
{: .proof}

泊松分布具有*可加性*，即：
$$X \sim P(\lambda), Y \sim P(\mu) \implies X+Y \sim P(\lambda + \mu)$$
{: .proposition}

## 连续概率分布

我们先介绍两个支集为*正实数*的连续概率分布，最后介绍统计学中常用的几个和正态分布相关的分布。
可以简单地认为这些分布在负实数上的概率密度函数和累积分布函数都是零。

### 指数分布

概率密度函数形如
$$p(x) = 
\lambda e^{-\lambda x} 
, \quad \lambda \in \mathbb R_+, x \in \mathbb R_+$$
的连续概率分布称为*指数分布*，记为$X \sim \exp (\lambda)$。
其累计分布函数为
$$P(x) = \begin{cases}
1 - e^{- \lambda x} & x \ge 0 \\
0 & x < 0
\end{cases}$$
{: .definition}

指数分布的矩为：
$$\begin{aligned}
\mathbf E(X) &= \lambda^{-1} \\
\mathbf V(X) &= \lambda^{-2}
\end{aligned}$$
{: .proposition}

$$
\begin{aligned}
\mathbf E(X) &= \int_{0}^{+\infty} x p(x) \mathrm d x \\
&= \int_0^{\infty} x \lambda e^{-\lambda x} \mathrm d x \\
&= \lambda \left[\left. -\frac{x e^{-\lambda x}}{\lambda} \right|_0^{\infty} - \int_0^{\infty} - \frac{e^{-\lambda x}}{\lambda}\mathrm d x\right] \\
&= \lambda \frac{1}{\lambda^2} = \lambda^{-1}
\end{aligned}
$$
方差同理，只需计算$\mathbf E(X^2)$即可。
{: .proof}

和几何分布类似，指数分布具有无记忆性。

（无记忆性）连续随机变量$X$满足无记忆性：
$$P(X > x + x_0 | X > x_0) = P(P > x), \ \forall x,x_0 > 0$$
当且仅当$X$服从指数分布。
{: proposition}

### 伽马分布

概率密度函数形如
$$p(x) = 
\frac{\lambda^r}{\Gamma(r)} e^{-\lambda x} x^{r-1} , \quad r \in \mathbb R_+, x \in \mathbb R_+$$
的连续概率分布称为*伽马分布*（Gamma distribution），记为$X \sim \gamma (r, \lambda)$。
$\lambda = 1$时，可简写为$\gamma(r)$或$\gamma\_r$。
{: .definition}

$\Gamma$表示伽马函数，定义为
$$\Gamma(r) = \int_0^\infty e^t t^{r-1} \mathrm d t$$
在正整数上，有：
$$\Gamma(n) = (n-1)!$$

其不具有解析的累积分布函数。

伽马分布的矩为：
$$\begin{aligned}
\mathbf E(X) &= \frac{r}{\lambda} \\
\mathbf V(X) &= \frac{r}{\lambda^{2}}
\end{aligned}$$
{: .proposition}

$$
\begin{aligned}
\mathbf E(X) &= \int_0^{\infty} x p(x) \mathrm d x \\
&= \int_0^{\infty} x \frac{\lambda^r}{\Gamma(r)} e^{-\lambda x} x^{r-1} \mathrm d x \\
&= \frac{1}{\Gamma(r)} \int_0^\infty (\lambda x)^r e^{-\lambda x} \mathrm d x \\
&= \frac{1}{\Gamma(r)} \int_0^\infty \frac{1}{\lambda} (\lambda x)^r e^{-\lambda x} \mathrm d (\lambda x) \\
&= \frac{\Gamma(r+1)}{\lambda \Gamma(r)} = \frac{r}{\lambda}
\end{aligned}
$$
方差同理。
{: .proof}

伽马分布的概率密度函数虽然复杂，但是具有很多有趣的性质。

首先，不难注意到指数分布是特殊的伽马分布：

当$r = 1$时，伽马分布退化为指数分布：
$$X \sim \Gamma(1, \lambda) \iff X \sim \exp(\lambda)$$
{: .proposition}

对伽马分布，有：
$$X \sim \gamma(r, \lambda) \iff \lambda X \sim \gamma(r,1) = \gamma_r$$
{: .proposition}

注意该命题对指数分布也成立，因为指数分布是特殊的伽马分布。

（可加性）当$\lambda = 1$时，两个独立的伽马分布具有可加性：
$$X \sim \gamma_r, Y \sim \gamma_s \implies X + Y \sim \gamma_{r + s}$$
更一般地，$\lambda$相同的两个独立的伽马分布具有可加性：
$$X \sim \gamma(r, \lambda), Y \sim \gamma(s, \lambda) \implies X + Y \sim \gamma(r+s, \lambda)$$
{: .proposition}

证明这个命题需要使用到$B$分布的知识，因此这个证明仅供参考。
对于$\lambda = 1$的情况，注意到随机变量和的概率密度函数是两个概率密度函数的卷积，我们可以直接计算：
$$
\begin{aligned}
p_{X+Y}(z) &= \int_0^z p_X(x) p_Y(z-x) \mathrm d x \\
&= \int_0^z \frac{x^{r-1} e^{-x}}{\Gamma(r)} \frac{(z-x)^{s-1} e^{-(z-x)}}{\Gamma(s)} \mathrm d x \\
&= e^{-z} \int_0^z \frac{x^{r-1} (z-x)^{s-1}}{\Gamma(r) \Gamma(s)} \mathrm d x \\
&= e^{-z} z^{r+s-1} \int_0^1 \frac{t^{r-1} (1-t)^{s-1}}{\Gamma(r) \Gamma(s)} \mathrm d t
\end{aligned}
$$
利用$B$分布的概率密度函数的定义，我们知道：
$$\int_0^1 t^{r-1} (1-t)^{s-1} \frac{\Gamma(r+s)}{\Gamma(r) \Gamma(s)} \mathrm d t = 1$$
从而
$$p_{X+Y}(z) = \frac{e^{-z} z^{r+s-1}}{\Gamma(r+s)}$$
也可以使用矩生成函数的乘积来计算这个卷积。
对于$\lambda \neq 1$的情况，我们可以使用上一个命题将其转化为$\lambda = 1$的情况，从而得证。
{: .proof}

### 正态分布

概率密度函数形如
$$p(x) = 
\frac{\exp\left[ -\frac{1}{2} \left( \frac{x - m}{\sigma} \right)^2 \right] }{\sigma \sqrt{2\pi}} , \quad \sigma \in \mathbb R_+;m, x \in \mathbb R$$
的连续概率分布称为*正态分布*（Normal distribution，又称高斯分布），记为$X \sim N (m, \sigma^2)$或$X \sim LG(m, \sigma)$。
$m = 0, \sigma = 1$的正态分布称为*标准正态分布*（Standard normal distribution）。
{: .definition}

正态分布是统计学中最重要的分布之一，但是其累积分布函数不具有解析形式。
其函数和反函数值通常通过查表求出。

不难发现标准正态分布和伽马分布具有以下关系：
$$U \sim N(0,1) \implies \frac{U^2}{2} \sim \gamma(\frac{1}{2})$$

正态分布的期望和方差为：
$$\begin{aligned}
\mathbf E(X) &= m \\
\mathbf V(X) &= \sigma^2
\end{aligned}$$
{: .proposition}

证明中需要用到高斯积分：
$$\int_{-\infty}^{\infty} \exp \left[ - a t^2 \right] \mathrm d t = \sqrt{\frac{\pi}{a}}$$
{: .proof}

正态分布具有可加性，即对两个独立的正态随机变量$X,Y$，有：
$$
\begin{multline}
X \sim N(m_1, \sigma_1^2), Y \sim N(m_2, \sigma_2^2)  \\ \implies X+Y \sim N(m_1 + m_2, \sigma_1^2 + 
sigma_2^2)
\end{multline}
$$
{: .proposition}

#### 卡方分布

设$(X\_1, \dots, X\_n)$为一列独立同分布的标准高斯随机变量，则其平方和的分布称为*卡方分布*（Chi-square distribution，也写为$\chi^2$分布），记为：
$$\sum_{i=1}^n X_i^2 \sim \chi^2 (n)$$
其中$n$称为自由度。
{: .definition}

卡方分布是一个特殊的伽马分布，其概率密度函数为：
$$p(x) = \frac{x^{\frac{n}{2} - 1} e^{-\frac{x}{2}}}{2^{\frac{n}{2}} \Gamma(\frac{n}{2})}$$
{: .proposition}

我们已经知道
$$U \sim N(0,1) \implies \frac{U^2}{2} \sim \gamma(\frac{1}{2})$$
因此
$$X_i^2 \sim \gamma(\frac{1}{2}, \frac{1}{2})$$
利用可加性即可得：
$$\chi^2(n) = \gamma(\frac{n}{2}, \frac{1}{2})$$
{: .proof}

显然卡方分布具有伽马分布的所有性质，如可加性等，其期望和方差也可由伽马分布得到。

#### 费舍尔F-分布

若$X \sim \chi^2(n), Y \sim \chi^2(p)$，且两随机变量独立，则称
$$F = \frac{X p}{Y n}$$
服从*费舍尔F-分布*（F-distribution），记为
$$F \sim F(n, p)$$
{: .definition}

#### 学生t-分布

若$X \sim N(0,1), Y \sim \chi^2 (n)$，且两随机变量独立，则称
$$T = \frac{X}{\sqrt{\frac{Y}{n}}}$$
服从*学生t-分布*（Student's t-distribution），记为
$$T \sim T_n$$
{: .definition}

学生分布得名于其提出者的化名：Student。

## 分布的近似

本节中我们将研究学习过的概率分布的近似。

### 常见分布的近似

在离散分布中，我们可以用二项分布近似超几何分布，用泊松分布近似二项分布。
具体而言，通常在$n < 0.1 N$时用二项分布$B(n,p)$近似超几何分布$H(N,n,p)$。
当$p < 0.1, n > 50$时，可使用泊松分布$P(\lambda = np)$近似二项分布$B(n,p)$。

除此之外，我们还可以用正态分布进行近似。

（棣莫弗-拉普拉斯定理）
设$(X\_n)\_n$为一列独立同分布的二项分布随机变量，设$X_n \sim B(n,p)$，记
$$U_n = \frac{X_n - np}{\sqrt{np(1-p)}}, U \sim N(0,1)$$
则
$$\lim_{n \to \infty} P(U_n \le u) = P(U \le u), \forall u$$
或称$U\_n$*依分布收敛*至标准正态分布。
{: .theorem}

只需证明：
$$\lim_{n \to \infty} \binom{n}{k} p^{k} (1-p)^{n-k} = \frac{\exp \left[ - \frac{(k - np)^2}{2np(1-p)} \right]}{\sqrt{2\pi np(1-p)}}$$
把二项式系数写成阶乘的形式，然后利用斯特灵公式将阶乘展开即可。
{: .proof}

这个定理说明我们可以用正态分布来近似二项分布。
通常，当$np > 5$且$np(1-p) > 5$时，我们可以使用这个近似。
同理，当$\lambda > 18$时，我们也可以用正态分布来近似泊松分布。

棣莫弗-拉普拉斯定理是中心极限定理的特殊情况。

#### 连续性修正

当使用连续的随机变量近似离散的随机变量时，我们不能直接使用概率密度来近似概率质量。
相反，我们使用一个连续型变量一个区间的值来近似离散变量的值，通常选择以该离散值为中心，总长度为$1$的区间。

例如，在利用正态分布$X'$近似二项分布$X$时，我们做如下近似：
$$
\begin{aligned}
P(X = x) &= P(x - 0.5 < X' < x+0.5) \\
P(X \le x) &= P(X' < x+0.5) \\
P(X \ge x) &= P(X' > x-0.5)
\end{aligned}
$$

### 中心极限定理

（中心极限定理）
设$(X\_n)\_n$是一列独立同分布的随机变量，其方差存在，记$\mathbf EX = m$，$\mathbf VX = \sigma^2$，记
$$\hat X = \frac{\sum X_n - nm}{\sigma \sqrt{n}}, U \sim N(0,1)$$
则
$$\lim_{n \to \infty} P(\hat X \le x) = P(U \le x)$$
即$\hat X$依分布收敛于标准正态分布。
{: .theorem}

也可以说$\sum X\_n$依分布收敛于$N(mn, \sigma^2 n)$；
或$\overline X$依分布收敛于$N(m, \sigma^2 / n)$。

中心极限定理允许我们用正态分布近似任何重复次数足够多的独立随机试验的结果。

中心极限定理的证明通常需要用到矩生成函数或特征函数等知识，这超出了本文的范围。


