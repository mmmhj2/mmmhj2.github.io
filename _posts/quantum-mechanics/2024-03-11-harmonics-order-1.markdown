---
title: "一阶谐振子"
categories: ["量子力学"]
---

本文研究量子力学下的一阶谐振子。

## 量子力学的计算

一阶谐振子模型来自两个原子之间的交互。
假设一维空间中一原子固定，另一原子的原子间势能符合二次模型，即
$$V(x) = \frac{1}{2} k x^2 = \frac{1}{2} m \omega^2 x^2$$
其中，$k$为一常数。
那么该原子会在平衡点附近做角频率为$\omega$的简谐振动，且该原子的总能量为
$$\epsilon = \frac{1}{2} m \dot x^2 + \frac{1}{2} k x^2 =  \frac{p^2}{2m} + \frac{1}{2} m \omega^2 x^2$$
我们将进一步研究这个模型。

### 哈密顿量的研究

首先考虑谐振子的哈密顿量，这可由能量构造出来
$$\hat H = \frac{\hat p^2}{2 m} + \frac{1}{2} m \omega^2 \hat x^2$$

我们首先考虑其简化。

#### 哈密顿量的无量纲化

对位移和动量进行无量纲化，令
$$\tilde H = \frac{\hat H}{\hbar \omega} , \ \tilde x = \sqrt{\frac{m \omega}{\hbar}} x, \ \tilde p = \sqrt{\frac{1}{m \hbar \omega}} p$$
则
$$\tilde H = \frac{1}{2} \tilde p^2 + \frac{1}{2} \tilde x^2$$

对于算子的研究，我们总是希望能够将单个算子分解为多个算子的复合，从而根据这些分解的算子性质研究原算子的性质，就像对矩阵进行各种分解一样。
这个形式酷似平方差公式，我们考虑利用它进行因式分解。
注意到
$$(\tilde x - i \tilde p) (\tilde x + i \tilde p) = \tilde x^2 + \tilde p^2 + i \tilde x \tilde p - i \tilde p \tilde x = \tilde x^2 + \tilde p^2 + i [\tilde x, \tilde p]$$
同时
$$[\tilde x, \tilde p] = \frac{1}{\hbar}[\hat x, \hat p] = i$$
因此
$$\frac{1}{2}(\tilde p^2 + \tilde x^2) = \frac{1}{2}(\tilde x - i \tilde p)(\tilde x + i \tilde p) + \frac{1}{2}$$
从而
$$\tilde H = \frac{1}{2}(\tilde x - i \tilde p)(\tilde x + i \tilde p) + \frac{1}{2}$$

#### 定义新算符

我们完成了哈密顿算符的分解，从而定义新的算符：

定义
$$
\begin{aligned}
\hat a &= \frac{\tilde x + i \tilde p}{\sqrt{2}} \\
\hat a^\dagger &= \frac{\tilde x - i \tilde p}{\sqrt 2} \\
\hat N &= \frac{1}{2}(\tilde x - i \tilde p)(\tilde x + i \tilde p) = \hat a^\dagger \hat a \\
\end{aligned}
$$
其中$\hat a$称为*湮没算符*（annihilation operator），$\hat a^\dagger$称为*产生算符*（creation operator）。
{: .definition}

这些算符的几个有关的对易子为
$$
\begin{aligned} \left[\hat a, \hat a^\dagger\right] &= 1 \\
[\hat N, \hat a] = [\hat a^\dagger \hat a, \hat a] &= - \hat a\\
[\hat N, \hat a^\dagger] = [\hat a^\dagger \hat a, \hat a^\dagger] &= \hat a^\dagger
\end{aligned}
$$

对于算符$\hat N$，注意到
$$\hat H = \hbar \omega \tilde H = \hbar \omega (\hat N + \frac{1}{2}) $$
不难验证以下命题：

算符$\hat N, \hat H$具有**相同的特征空间**，或者——以量子力学的说法——**具有相同的本征态**。
{: .proposition}

#### 产生与湮没算符的性质

考虑一维、本征能量非简并的情况，记$\hat N$算符定义的量子数（特征值）为$\nu$，对应的量子态（特征向量）为$\vert\nu\rangle$，则
$$\hat N \vert\nu\rangle = \nu \vert \nu \rangle, \quad \langle \nu \vert \hat N \vert \nu \rangle = \Vert \hat a \vert \nu \rangle \Vert^2 \ge 0$$
因此有以下命题：

一维谐振子的$\hat N$量子数非负。
{: .proposition}

又注意到
$$\hat N (\hat a \vert \nu \rangle) = (\hat a \hat N + [\hat N, \hat a]) \vert \nu \rangle = (\hat a \hat N - \hat a) \vert \nu \rangle = (\nu - 1) \hat a \vert \nu \rangle$$
这意味着$\hat a \vert \nu \rangle$也是$\hat N$的特征向量，特征值（量子数）为$\nu - 1$。
又注意到
$$\Vert \hat a \vert \nu \rangle \Vert^2 = \langle \nu \vert \hat N \vert \nu \rangle = \nu$$
从而
$$\hat a \vert \nu \rangle = \sqrt{\nu} \vert \nu - 1 \rangle \implies \hat a \vert \nu \rangle \propto \vert \nu - 1 \rangle$$
因此我们有以下命题：

对一个量子态使用湮没算符可以得到新的量子态，且若该量子态的量子数非零，则新量子态的量子数等于原量子数减一。
{: .proposition}

这里注意我们专门提出了量子数为零的情况。
不难验证，对量子数为零的量子态使用湮没算符会得到零向量。
零向量通常记为$\vert \varnothing \rangle$，注意与$\vert 0 \rangle$区别。

同理，对$\hat a^\dagger$，有
$$\hat a^\dagger \vert \nu\rangle = \sqrt{\nu + 1} \vert \nu + 1\rangle$$

对一个非平凡的量子态使用产生算符可以得到新的量子态，新量子态的量子数等于原量子数加一。
{: .proposition}

利用这两个性质，我们可以证明$\nu$必为自然数。

一阶谐振子的量子数必定是自然数。
{: .theorem}

假设$\nu \not \in \mathbb N$，则根据实数的阿基米德性质：
$$\exists \, n \in \mathbb N,\quad \text{s.t.} \quad \nu \in ]n, n+1[$$
利用湮没算符，可得
$$\hat N (\hat a^{n+1} \vert \nu \rangle) = (\nu - n - 1) \hat a^{n+1} \vert \nu \rangle$$
这产生了一个不可能的量子态：量子数$\nu - n - 1$小于零，因此矛盾。
如果$\nu$是自然数，则不断应用湮没算符会产生零向量而停止，不会产生负的量子数。
{: .proof}

考虑到$\nu$必为自然数，接下来用$n$指代它。

### 波动方程的解

利用这些性质，我们可以尝试求出波动方程的解。

#### 本征能量

我们尝试根据定义求解本征态与本征能量。
将本征态$\vert n \rangle$代入方程，利用哈密顿算符
$$\hat H \vert n \rangle = (\hat N + \frac{1}{2}) \hbar \omega \vert n \rangle = (n + \frac{1}{2}) \hbar \omega \vert n\rangle = \epsilon \vert n \rangle$$
从而其本征能量和基态能量为
$$\epsilon_n = (n + \frac{1}{2}) \hbar \omega, \quad \epsilon_0 = \frac{\hbar \omega}{2}$$

#### 基态波函数

我们首先考虑基态的波函数。
考虑基态$\vert 0\rangle$，则
$$\hat a \vert 0 \rangle = \vert \varnothing \rangle$$
因此，对任意量子态$\vert x \rangle$
$$\langle x \vert \hat a \vert 0 \rangle = \langle x \vert \varnothing \rangle = 0$$
直接代入$\hat a$的定义，即可得出基态波函数的方程：
$$
\begin{aligned}
\frac{1}{\sqrt{2}} \left( \sqrt{\frac{m \omega}{\hbar}} x + \sqrt{\frac{\hbar}{m \omega}} \frac{d}{d x} \right) \varphi_0(x) &= 0 \\
\iff \left( \frac{m \omega}{\hbar} x + \frac{d}{dx} \right) \varphi_0 (x) &= 0
\end{aligned}
$$
这是个简单的一阶微分方程，可直接求解。

一维谐振子基态波函数为
$$\varphi_0(x) = \left(\frac{m \omega}{\pi \hbar} \right)^{1/4} \exp \left[ - \frac{1}{2} \frac{m\omega}{\hbar} x^2 \right]$$
{: .proposition}

#### 最小波函数

我们希望求出不确定性最小的波包，利用
$$\langle 0 \vert \hat x \vert 0 \rangle = \sqrt{\frac{\hbar}{2 m \omega}} \langle 0 \vert \hat a + \hat a^\dagger \vert 0 \rangle$$
又
$$\hat a \vert 0 \rangle = 0, \quad \hat a^\dagger \vert 0 \rangle = \vert 1 \rangle \implies \langle 0 \vert \hat a + \hat a^\dagger \vert 0 \rangle = \langle 0 \vert 1 \rangle = 0$$
从而$\langle 0 \vert \hat x \vert 0 \rangle = 0$。
还有
$$\langle 0 \vert \hat x^2 \vert 0 \rangle = \frac{\hbar}{2 m \omega} \langle 0 \vert \hat a^2 + {\hat a^\dagger} ^2 - 2 \hat N - 1 \vert 0 \rangle = \frac{m \hbar \omega}{2}$$
因此
$$\Delta x = \sqrt{(\langle 0 \vert \hat x \vert 0 \rangle)^2 - \langle 0 \vert \hat x^2 \vert 0 \rangle} = \sqrt{\frac{\hbar}{2 m \omega}}$$
动量的计算同理，其不确定性为
$$\Delta p = \sqrt{\frac{m \hbar \omega}{2}}$$
从而
$$\Delta x \Delta p = \frac{\hbar}{2}$$
从而其不确定性最小，恰好等于不确定性原理规定的下界。

#### 激发态的波函数

激发态的波函数可使用产生算符计算：
$$
\begin{aligned}
\vert n \rangle &= \frac{1}{\sqrt{n!}} \hat a^\dagger \vert 0 \rangle \\
\iff \varphi_n (x) &= \sqrt{\frac{1}{2^n n!}} \left( \sqrt{\frac{m\omega}{\hbar}}x - \sqrt{\frac{\hbar}{m\omega}} \frac{d}{dx} \right)^n \varphi_0(x) \\
&= \left( \frac{m\omega}{\pi \hbar} \right)^{1/4} \sqrt{\frac{1}{2^n n!}} \exp \left[ - \frac{m\omega}{2\hbar}x^2  \right] H_n(\sqrt{\frac{m\omega}{\hbar}} x)
\end{aligned}
$$
其中$H\_n$为厄米多项式。

激发态的不确定度为
$$\Delta x = \sqrt{2n+1} \sqrt{\frac{\hbar}{2 m \omega}}, \quad \Delta p = \sqrt{2n+1}\sqrt{\frac{m \hbar \omega}{2}}$$
