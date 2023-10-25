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

### 正态分布

概率密度函数形如
$$p(x) = 
\frac{\exp\left[ -\frac{1}{2} \left( \frac{x - m}{\sigma} \right)^2 \right] }{\sigma \sqrt{2\pi}} , \quad \sigma \in \mathbb R_+;m, x \in \mathbb R$$
的连续概率分布称为*正态分布*（Normal distribution，又称高斯分布），记为$X \sim N (m, \sigma^2)$或$X \sim LG(m, \sigma)$。
$m = 0, \sigma = 1$的正态分布称为*标准正态分布*（Standard normal distribution）。
{: .definition}

正态分布是统计学中最重要的分布之一，但是其累积分布函数不具有解析形式。
其函数和反函数值通常通过查表求出。

#### 卡方分布

#### 费舍尔分布

#### 学生t分布
