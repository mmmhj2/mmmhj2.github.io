---
layout: single_legacy
title: "系统的研究方法"
date: 2022-11-25 01:20:00 +0800
categories: "控制理论"
--- 

![](/assets/system/block-diagram-complete.svg)
{: .center-image}

我们来研究上图所示的一个系统。
图中$E(p)$表示输入量的拉普拉斯变换，$S(p)$表示输出量的，$P(p)$表示噪声或扰动。
我们已经知道，对于线性时不变系统，利用拉普拉斯变换，可以很简单的得出$S(p) = H(p) \cdot E(p)$，其中$H(p)$表示系统的传递函数。
现在，假设我们已经知道了系统中每一个部分的传递函数，要如何求出整个系统的传递函数呢？

首先，我们来看看最简单的情况：两个传递函数的“串联”。

假设第一个传递函数为$H_1(p)$，第二个传递函数为$H_2(p)$，输入量被第一部分作用后的输出为$\chi(p)$，那么有：
$$
\begin{aligned}
& \left\{
\begin{aligned}
\chi(p) &= H_1(p) \cdot E(p) \\
S(p) &= H_2(p) \cdot \chi(p) 
\end{aligned}
\right. \\
& \implies S(p) = H_2(p) \cdot H_1(p) \cdot E(p) \\
& \implies H(p) = \frac{S(p)}{E(p)} = H_2(p) \cdot H_1(p)
\end{aligned}
$$
正如电路中的阻抗串联一样。

然而，实际系统和我们将要研究的系统一样，不可能只有简单的串联部分。
实际上，对这个系统，两大问题分别在于：系统中的反馈回路和系统外的扰动。
接下来，我们来解决这两个问题。

### 反馈回路
首先解决反馈回路的问题。考虑以下简单的带反馈系统：

![](/assets/system/block-diagram-pursuit-simple.svg)
{: .center-image}

对于这个系统，以下方程组成立：
$$
\left\{
\begin{aligned}
S(p) &= A(p) \cdot \epsilon(p) \\
\epsilon(p) &= E(p) - u_m(p) \\
u_m(p) &= B(p) \cdot S(p)
\end{aligned}
\right.
$$
解这个方程组，可得：
$$
S(p) = A(p) \cdot \left[ E(p) - B(p) \cdot S(p) \right]
\implies H(p) = S(p) / E(p) = \frac{A(p)}{1+A(p)B(p)} 
$$

### 控制变量

反馈回路的问题已经解决，接下来就只剩下多变量的问题了。
为了解决这一问题，我们使用经典的控制变量法。
首先，假设系统没有受到扰动，即$P(p) = 0$。
系统就变成下图所示的简单负反馈系统。

![](/assets/system/block-diagram-pursuit-complete.svg)
{: .center-image}

利用前述公式，这个系统的传递函数容易得出：
$$
H_c(p) = A(p) \cdot \frac{H_1(p) H_2(p) H_3(p)}{1 + H_1(p) H_2(p) H_3(p) H_4(p)}
$$
这个传递函数$H_c(p)$叫做系统的闭环传递函数。

接下来，我们假设系统的输入为0，求出系统关于噪声的传递函数。
待研究的系统可以转化为如下系统：

![](/assets/system/block-diagram-regulation.svg)
{: .center-image}

再次利用上述公式，求得：
$$
H_p(p) = \frac{H_3(p)}{1+H_2(p) H_1(p) H_4(p) H_3(p)}
$$
这个传递函数叫做输出对扰动的传递函数。

### 综合

由系统的线性，当输入和扰动均不为零时，可以简单地把系统由它们分别产生的输出叠加起来。
从而，对于整个系统，有：
$$
S(p) = H_c(p) \cdot E(p) + H_p(p) \cdot P(p)
$$

为了更好地研究这些系统，我们还定义了两个额外的传递函数：
- 输出对误差的传递函数
$$H_{CD}(p) = \left. \frac{S(p)}{\epsilon(p)} \right|_{P(p)=0} = H1(p) H2(p) H3(p)$$
- 开环传递函数
$$H_{BO}(p) = \left. \frac{u_m(p)}{\epsilon(p)} \right|_{P(p)=0} = H1(p) H2(p) H3(p) H4(p)$$

### 线性时不变系统的性能指标

- 稳定性：受到冲激时，无穷处输出为0，或对有界的输入，输出也有界；
- 强健性：系统抵抗扰动的能力；
- 准确性：系统响应指令的能力；
- 快速性：系统到达指定状态的速度，通常取到达目标值5%附近所需的时间；
- 阻尼：系统阻碍振动的能力，通常有欠阻尼、过阻尼和临界状态三种。
