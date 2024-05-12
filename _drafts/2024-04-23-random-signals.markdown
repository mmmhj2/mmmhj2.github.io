---
title: "随机信号"
categories: "信号处理"
---

本文主要关心对随机信号的处理。
随机信号常用于对噪声进行建模。

## 随机信号

一个随机信号（stochastic signal）或随机函数（stochastic function）定义为概率空间$(\Omega, \mathcal F, \mathcal P)$与参数集合$T$的笛卡尔积到状态空间$S$的映射：
$$
\begin{aligned}
x: \quad \Omega \times T &\quad \to \quad S \\
(\omega, t) &\quad \mapsto \quad x_\omega(t)
\end{aligned}
$$
参数集合通常表示时间，因此一般为实数集或整数集。
当$\omega$固定时，函数
$$
\begin{aligned}
x_\omega: \quad T & \quad \to \quad S \\
t & \quad \mapsto \quad x_\omega(t)
\end{aligned}
$$
称为原函数的样本函数（Sample function）。
{: .definition}

### 随机信号的概率属性

注意到当$t$固定时，随机信号$x\_\omega(t)$是一个$\Omega$上的随机变量，我们可以利用这一点定义随机信号的众多概率属性。

随机信号$x\_\omega(t)$的统计均值定义为：
$$m(t) = \mathbf E [x_\omega(t)]$$
统计协方差（也称自协方差，autocovariance）定义为
$$\gamma_{xx}(t_1, t_2) = \mathbf E[x_\omega(t_1) x_\omega(t_2)] - \mathbf E[x_\omega(t_1)] \mathbf E[x_\omega(t_2)]$$
{: .definition}

随机信号有一个重要的性质：平稳性（stationarity）。

若随机信号的均值和自协方差与时间$t$无关，且二阶矩有界，则称随机变量是平稳（stationary）的。
$$
\begin{cases}
m(t) = m(t + \tau) &, \forall \tau \in T \\
\gamma_{xx}(t_1, t_2) = \gamma_{xx}(t_1 - t_2, 0) &, \forall t_1, t_2 \in T \\
\mathbf E[|x_\omega(t)|^2] < \infty &, \forall t \in T
\end{cases}
$$
此时，我们记
$$\gamma_{xx}(\tau) = \gamma_{xx}(t + \tau, 0), \forall t$$
{: .definition}

这是信号处理中常用的平稳性的定义。
数学上的定义更加严格。

### 随机信号的时间属性

接下来我们研究随机信号的在固定事件下的时间属性，即样本函数的性质。
这一部分中我们假设参数集合为实数集。

随机信号$x\_\omega(t)$的时间均值定义为
$$\overline{x_\omega(t)} = \lim_{T_1 \to +\infty, T_2 \to -\infty} \frac{1}{T_1 - T_2} \int_{T_2}^{T_1} x_\omega(t) \, \mathrm d t$$
其时间自相关函数定义为
$$R_{xx}(\tau) = \overline{x_\omega(t) x_\omega(t-
\tau)}$$
中心化自相关函数（central autocorrelation function）定义为
$$c_{xx}(\tau) = \overline{x_\omega(t) x_\omega(t - \tau)} - \overline{x_\omega(t)} \cdot \overline{x_\omega(t - \tau)}$$
{: .defintion}

自相关函数是偶函数，且在零处取最大值。

和平稳性对应，随机信号也可具有遍历性（ergodicity）。

若随机函数$x_\omega(t)$的时间均值和自相关函数均与随机事件$\omega$无关，则称该随机函数具有遍历性。
{: .definition}

通俗地讲，一个信号若是平稳的，则其取值与时间无关；若是遍历的，则该信号在长时间上的表现不具有随机性——任何随机变量的取值都可以遍历所有可能的状态。

若随机函数是平稳且遍历的，则：
$$m(t) = \overline{x_\omega(t)}, \quad \gamma_{xx}(\tau) = c_{xx}(\tau)$$
这意味着对该随机信号在时间上平均和在随机变量上平均具有相同的统计学意义。
{: .proposition}

对非遍历、非平稳的信号，自相关函数的定义为
$$R_{xx}(t, \tau) = \mathbf E[x(t) x(t-\tau)]$$
对平稳的信号，该函数只与$\tau$有关。
对平稳且遍历的信号，该函数还可以定义为时间平均
$$R_{xx}(\tau) = \lim_{T \to \infty} \frac{1}{T} \int_{0}^{T} x(t) x(t-\tau) \, \mathrm d t$$

### 随机信号的谱

我们希望像普通的信号一样分析随机信号的频谱，因此我们需要引入随机信号的能量和功率等概念，以用于傅里叶分析。

随机信号$x\_\omega(t)$的瞬时功率定义为
$$P_\omega(t) = \vert x_\omega(t) \vert^2$$
平均功率定义为
$$P_\omega = \overline{P_\omega(t)} = \lim_{T \to \infty} \frac{1}{T} \int_{-T}^T |x_\omega(t)|^2 \, \mathrm d t$$
{: .definition}

随机信号的傅里叶变换定义为
$$X_\omega(\nu) = \int_{-\infty}^{+\infty} x_\omega(t) e^{-j 2\pi \nu t} \, \mathrm d t$$
该傅里叶变换产生的函数也是随机函数。
{: .definition}

根据帕塞瓦尔等式，注意到
$$\int_{\mathbb R} \vert X_\omega (\nu) \vert^2 \, \mathrm d \nu = \int_{\mathbb R} \vert x_\omega(t) \vert^2 \, \mathrm d t$$
从而平均功率也能写为
$$P_\omega = \lim_{T \to \infty} \frac{1}{T} \int_{-T}^T |x_\omega(t)|^2 \, \mathrm d t = \lim_{T \to \infty} \frac{1}{T} \int_{\mathbb R} |X_\omega(\nu)|^2 \, \mathrm d \nu$$
而其期望为
$$P = \mathbf E [P_\omega] = \lim_{T \to \infty} \frac{1}{T} \int_{\mathbb R} \mathbf E\left[ |X_\omega(\nu)|^2 \right] \, \mathrm d \nu$$

从而我们给出功率谱密度的定义：

随机变量的功率谱密度（Spectral density of power）定义为
$$S_{xx}(\nu) = \lim_{T \to \infty} \frac{1}{T} \mathbf E \left[ \vert \hat X_\omega(\nu)\vert^2 \right]$$
其中$\hat X\_\omega$是
$$
\DeclareMathOperator{\rect}{rect}
\hat x_\omega(t) = x_\omega(t) \times \rect_T(t)
$$
的傅里叶变换。
{: .definition}

随机信号的功率谱密度与自相关系数密切相关。

<small>（维纳-辛钦定理）</small>
中心化且平稳的随机信号$x\_\omega(t)$的功率谱密度与自相关系数之间存在以下关系：
$$S_{xx}(\nu) = \int_{\mathbb R} R_{xx}(\tau) e^{-j 2\pi \nu \tau}\, \mathrm d \tau$$
{: .theorem}
