---
layout: single
title: "高阶系统波德图的渐进研究"
date: 2022-12-03 19:10:00 +0800
categories: "控制理论"
---

## 高阶系统的传递函数

现在，我们对简单的一阶和二阶系统的研究已经比较充分了，但是，对于更复杂的系统，要怎么处理呢？
实际上，$(\mathbb R [X], +, \cdot)$（实数多项式环）的性质告诉我们，任何一个实系数多项式都可以分解成系数至多为二次的多项式的乘积。
从而，我们可以将更高次的传递函数分解成一阶和二阶的。

我们假设系统有如下传递函数：
$$
H(p) = \frac{K e^{-\tau p}}{p^\alpha}
\frac{1+ b_1 p + b_2 p^2 + \cdots + b_m p^m}{1 + a_{\alpha+1} p + a_{\alpha+2} p^2 + \cdots + a_n p^{n-\alpha}}
$$
其中，多项式的系数都是实数。$K$称为**静态增益**， $\tau$称为**延迟**，$\alpha$称为系统的类别，$n$就是系统的阶数。
分子多项式的零点称为**零点**，分母多项式的零点称为**极点**。

为了保证以下研究的普遍性，我们在复数域下进行研究。

我们把多项式写成（复数）零点的积的形式：
$$
H(p) = \frac{K e^{-\tau p}}{p^\alpha}
\frac{b_m \prod_{i=1}^m (p - z_i)}{a_n \prod_{k=1}^{n-\alpha} (p - p_k)}
$$
再把传递函数里的多项式化为首一多项式，并把多出的系数纳入$K$中，则有：
$$
H(p) = \frac{K^\prime e^{-\tau p}}{p^\alpha}
\frac{\prod_{i=1}^m (p - z_i)}{\prod_{k=1}^{n-\alpha} (p - p_k)}
$$
进一步的，我们知道在复数域下多项式的根要么是实数，要么是一对共轭的复数，我们可以把传递函数写成：
$$
H(p) = \frac{K e^{-\tau p}}{p^\alpha} 
\frac{
\prod_{z_i \in \mathbb R} (p - z_i)^{\alpha_i}
\prod_{z_j \in \mathbb C} \left[ (p - z_j) (p - \overline{z_j}) \right]^{\beta_j}
}{
\prod_{p_k \in \mathbb R} (p - p_k)^{\gamma_k}
\prod_{p_l \in \mathbb C} \left[ (p - p_l) (p - \overline{p_l}) \right]^{\delta_l}
}
$$
注意重根已经被合并同类项了，此时所有根都是两两不同的。
这样，我们就成功将系统的传递函数化为一阶和二阶之乘积了。

我们提前默认系统稳定的前提是其特征多项式（即传递函数的分母）的零点的实部小于零，然后进一步变换该传递函数。

对于一阶系统，我们知道其传递函数的标准形式和特征时间$\tau$紧密相关。
我们令
$\tau_k = -\frac{1}{p_k} \in \mathbb R^\*\_\+$
$\tau_i = -\frac{1}{z_i} \in \mathbb R^\*$
则有
$$
\begin{aligned}
p-p_k &= \frac{1}{\tau_k} (1 + \tau_k p) \\
p-z_i &= \frac{1}{\tau_i} (1 + \tau_i p) \\
\end{aligned}
$$

对于二阶系统，我们设$p_l = a_l + j b_l, \; a_l < 0$，则其多项式可写为：
$$
\begin{aligned}
(p - p_l) (p - \overline{p_l})
&= (p - a_l - j b_l)(p - a_l + j b_l) \\
&= p^2 - 2 a_l p + (a_l^2 + b_l^2) \\
&\sim p^2 + 2 \xi_l \omega_{0,l} p + \omega_{0,l}^2
\end{aligned}
$$
令：
$$
\left\{
\begin{aligned}
\omega_{0,l} &= \sqrt{a_l^2 + b_l^2} \\
\xi_l &= - \frac{a_l}{\sqrt{a_l^2 + b_l^2}}
\end{aligned}
\right.
$$
则其多项式可写为标准形式。

下面，我们进一步简化此多项式：
我们把所有$\tau$和$\omega_0$提取出来，并纳入系数$K^\prime$中，有
$$
\begin{aligned}
H(p) 
&= \frac{K^\prime e^{-\tau p}}{p^\alpha} 
\frac{\prod \left[ \frac{1}{\tau_i} (1 + \tau_i p) \right]^{\alpha_i}}{\prod \left[ \frac{1}{\tau_k} (1 + \tau_k p) \right]^{\gamma_k}}
\frac
{\prod \left[ \omega_{0,j}^2 \left( 1 + \frac{2\xi_j}{\omega_{0,j}} p + \frac{p^2}{\omega_{0,j}^2} \right) \right]^{\beta_j}}
{\prod \left[ \omega_{0,l}^2 \left( 1 + \frac{2\xi_l}{\omega_{0,l}} p + \frac{p^2}{\omega_{0,l}^2} \right) \right]^{\gamma_l}} \\
&= \frac{K^{\prime\prime} e^{-\tau p}}{p^\alpha} 
\frac{\prod (1 + \tau_i p)^{\alpha_i}}{\prod(1 + \tau_k p)^{\gamma_k}}
\frac
{\prod \left( 1 + \frac{2\xi_j}{\omega_{0,j}} p + \frac{p^2}{\omega_{0,j}^2} \right)^{\beta_j}}
{\prod \left( 1 + \frac{2\xi_l}{\omega_{0,l}} p + \frac{p^2}{\omega_{0,l}^2} \right)^{\gamma_l}} \\
&= \frac{K^{\prime\prime} e^{-\tau p}}{p^\alpha} 
\prod (1 + \tau_i p)^{\alpha_i}
\prod \left( 1 + \frac{2\xi_j}{\omega_{0,j}} p + \frac{p^2}{\omega_{0,j}^2} \right)^{\beta_j}
\end{aligned}
$$
最后一步我们把分子和分母写在一起，此时次数可以有负数。

## 波德图

现在，我们带入$p = j \omega$来求系统的增益和辐角。

$$
\begin{aligned}
H(j \omega) &= 
\frac{K}{(j \omega)^\alpha} e^{-j\tau\omega} 
\prod (1 + j \tau_i p)^{\alpha_i} \prod ( \left( 1 - \frac{\omega^2}{\omega_{0,j}^2} \right) + j \frac{2\xi_j}{\omega_{0,j}} \omega )^{\beta_j} \\
\implies
A(\omega) &= \frac{K}{\omega^\alpha} \prod ( 1 + \tau_i^2 p^2)^{\frac{\alpha_i}{2}} \prod ( \left( 1 - \frac{\omega^2}{\omega_{0,j}^2} \right)^2 + \frac{4\xi^2}{\omega_{0,j}^2} \omega^2 )^{\frac{\beta_j}{2}} \\
G_{dB}(\omega) &= 
\underbrace{20 \log K - 20 \alpha \log \omega}_{积分} + 
\underbrace{10 \sum a_i \log (1 + \tau_i \omega^2)}_{一阶} \\ &+ 
\underbrace{10 \sum \beta_j \log \left[ \left( 1 - \frac{\omega^2}{\omega_{0,j}^2} \right)^2 + \frac{4\xi^2\omega^2}{\omega_{0,j}^2} \right]}_{二阶} \\
\varphi(\omega) &= 
\underbrace{- \alpha \frac{\pi}{2} - \tau \omega}_{积分} +
\underbrace{\sum a_i \arctan(\tau_i \omega)}_{一阶}  \\  &+
\underbrace{\sum b_j \left[ \frac{\pi}{2} - \arctan \left( \frac{\omega_{0,j}^2 - \omega^2}{2 \xi \omega_{0,j} \omega} \right) \right]}_{二阶}
\end{aligned}
$$

从而有以下渐进结论：

- 积分器系统：斜率$-20 \alpha$，辐角$-\alpha \frac{\pi}{2}$。
- 一阶系统：
  + $\omega \ll \omega_0$时，斜率为零，辐角为零；
  + $\omega \gg \omega_0$时，斜率$20 \alpha_i$，辐角$\alpha_i \frac{\pi}{2}$；
  + $\tau_i < 0$时，斜率不变，辐角变为相反数。
- 二阶系统：
  + $\omega \ll \omega_0$时，斜率为零，辐角为零；
  + $\omega \gg \omega_0$时，斜率$40 \beta_j$，辐角$\beta_j \pi$。
- 延迟系统：对渐进无影响。

## 例子

设系统的传递函数为：
$$
H(p) = \frac{10}{p} \frac{(p+1)(p+0.1)(p^2+p+4)}{(p+2)(p+0.01)(p^2+p+9)}
$$
其“标准化”后的传递函数为：
$$
H(p) = \frac{200}{9p} \frac{(1+p)(1+10p)(1+\frac{p}{4}+\frac{p^2}{4})}{(1+0.5p)(1+100p)(1+\frac{p}{9}+\frac{p^2}{9})}
$$
则其渐进斜率和辐角为：

| |0.01| |0.1| |1| |2| |3| |
|---|---|---|---|---|---|---|---|---|---|---|
|-20||-40||-20||0||+20||-20|
|-90||-180||-90||0||90||-180|

注意其积分器段的渐近线在$\omega = 1$时通过$20 \log \frac{200}{9}$。
