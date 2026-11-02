---
title: "不确定度的计算和表示"
---

标准不确定度

## 不确定度的计算

### A 类不确定度的计算

A 类不确定度来自通过对测量结果进行统计分析来得到，具体而言，指的是计算测量结果的平均值的标准差，也叫平均值标准误（Standard Error of Mean, SEM）：

1. 从独立的测量结果得到平均值：
$$\mu = \frac{1}{n} \left( x_1 + x_2 + \cdots + x_n \right).$$
2. 从测量结果估计总体方差和标准差：
$$\sigma^2 = \frac{1}{n-1} \sum_{i=1}^n(x_i - \mu)^2.$$
3. 计算平均值标准误，作为 A 类不确定度：
$$u_A = \frac{\sigma}{\sqrt{n}} = \sqrt{\frac{\sum_{i=1}^n(x_i - \mu)^2}{n(n-1)}}.$$

这种方法也叫贝塞尔公式法，得名于从样本估计整体方差时的贝塞尔校正（Bessel's correction）。

#### A 类不确定度的极差法

如果观测次数较小而不足以使用贝塞尔公式法给出估计标准误，那么可以考虑采用极差法。
设样本的极差（Range）为$R$，我们假设测量结果服从正态分布，并且从样本极差估计正态分布的标准差，从而作为 A 类不确定度。

从均值为$\mu$，标准差为$\sigma$的正态分布中抽取$n$个样本，则样本极差的期望为
$$E[R] = d(n) \sigma,$$
其中$d$是一个只与$n$有关的常量，称为无偏常量（Unbiasing constant）。
{: .proposition}

因此，使用极差法估计的 A 类不确定度为
$$
u_a = \frac{R}{d(n) \sqrt{n}}.
$$

考虑样本$X\_1, \dots, X\_N$，我们首先进行标准化，令
$$Z_i = \frac{X_i - \mu}{\sigma},$$
那么
$$R = X_{\max} - X_{\min} = \sigma(Z_{\max} - Z_{\min}).$$
对两边取期望，有
$$E[R] = \sigma (E[Z_{\max}] - E[Z_{\min}]).$$
根据标准正态分布的对称性，样本最小值的期望显然等于最大值期望的相反数，因此
$$E[R] = 2 \sigma E[Z_{\max}].$$
正态分布采样最大值的分布的计算是比较直接的，我们尝试计算其累计分布函数：
$$F(z) = P(z_{\max} \le z) = \prod_{i=1}^n P(z_i \le z) = \Phi(z)^n,$$
那么其概率密度函数为
$$f(z) = F(z)' = n \Phi'(z) \Phi(z)^{n-1},$$
期望为
$$E[Z_{\max}] = n \int_{-\infty}^\infty z \Phi'(z) \Phi(z)^{n-1} \, \mathrm d z,$$
是一个只与$n$有关的常数，不妨设为$d(n) / 2$。
从而
$$E[R] = d(n) \sigma.$$
这个常数不具有闭式解，因此通常使用数值计算或者查表得到。
{: .proof}

### B 类不确定度的评定

#### 从仪器资料中计算

#### 从假定分布计算

## 不确定度的合成

### 任意函数的合成

设 $\mathbf X = \{ X\_1, \dots, X\_n \}$ 为一列（可能相关的）随机变量，有另一随机变量可表示为该列随机变量的函数：
$$Y = f(\mathbf X) = f(X_1, \dots, X_n),$$
则该随机变量的方差为
$$\mathrm{Var}[f(\mathbf X)] = \sum_{i=1}^n f_i^2 \sigma_i^2 + 2 \sum_{1 \le i < j \le n} f_i f_j \mathrm{Cov}(X_i, X_j) + \mathcal O(\Vert \mathbf X \Vert^2),$$
其中
$$f_i = \frac{\partial f}{\partial X_i}(\mu_1, \dots, \mu_n),$$
为该函数对指定分量的偏导在均值处的取值，而 $\mu\_i$ 是 $X\_i$ 的期望，$\sigma\_i$ 是其方差。
{: .proposition}

典型情况是$Y$是待测量的物理量，而$X$是用来计算物理量的实际测量的值。
这种情况下，函数$f$也叫做*测量模型*。

这意味着，对两个独立变量的不确定度，我们可以由以下方式计算：
$$
c = f(a, b) \implies u_c = \sqrt{ \left(\left.\frac{\partial f}{\partial a}\right\vert_{\mu_a, \mu_b}\right)^2 u_a^2 + \left(\left.\frac{\partial f}{\partial b}\right\vert_{\mu_a, \mu_b}\right)^2 u_b^2 },
$$
这里$\partial\_a f(\mu\_a, \mu\_b)$也叫做测量对$a$的灵敏系数（sensitivity coefficients）。

### 常见函数的合成

## 不确定度的表示

### 大学物理实验中的不确定度

## 参考文献

1. GB/T 27418-2017 测量不确定度评定和表示
2. JJF 1059.1-2012 测量不确定度评定和表示
3. https://physics.nist.gov/cuu/Uncertainty/index.html
