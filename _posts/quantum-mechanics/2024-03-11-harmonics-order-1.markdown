---
title: "一阶谐振子"
categories: ["量子力学"]
---

本文研究量子力学下的一阶谐振子。

## 量子力学的计算

### 哈密顿量

对位移和动量进行无量纲化

### 新算符
我们定义新的算符
$$\hat a = \frac{\tilde x + i \tilde p}{\sqrt{2}}, \quad \hat a^\dagger = \frac{\tilde x - i \tilde p}{\sqrt 2}$$

该算符的几个有关的对易子为
$$
\begin{aligned}
[\hat a, \hat a^\dagger] &= \dots \\
[\hat N, \hat a] = [\hat a^\dagger \hat a, \hat a] &= \dots \\
[\hat N, \hat a^\dagger] = [\hat a^\dagger \hat a, \hat a^\dagger] &= \dots 
\end{aligned}
$$

考虑一维、本征能量非简并的情况，计本征能量为$\nu$，对应的量子态为$|\nu\rangle$，则
$$\hat N |\nu\rangle = \nu | \nu \rangle, \quad \langle \nu | \hat N | \nu \rangle = \Vert \hat a | \nu \rangle \Vert^2 \ge 0$$

又注意到
$$\hat N (\hat a | \nu \rangle) = (\hat a \hat N - \hat a) | \nu \rangle = (\nu - 1) \hat a | \nu \rangle$$
这意味着$\hat a | \nu \rangle$也是$\hat N$的特征向量，特征值为$\nu - 1$，同时
$$\Vert \hat a | \nu \rangle \Vert^2 = \langle \nu | \hat N | \nu \rangle = \nu$$
从而
$$\hat a | \nu \rangle = \sqrt{\nu} | \nu - 1 \rangle$$
这个算符称为湮没算符（annihilation operator），因为其让$\nu$下降了。

同理，对$\hat a^\dagger$，有
$$\hat a^\dagger |\nu\rangle = \sqrt{\nu + 1} |\nu + 1\rangle$$
这个算符称为产生算符（creation operator），因为其让$\nu$提升了。

我们利用这两个算符证明$\nu$必为自然数。
假设$\nu$不是自然数，因此必被两个自然数钳制。
设$\nu \in ]n-1, n[$，则反复利用湮没算符，可得$\nu - n$是一个特征值，这与前文所述$\nu$非负矛盾。
因此，$\nu$必为自然数，接下来用$n$指代它。

### 本征态

利用哈密顿算符
$$\hat H | n \rangle = (\hat N + \frac{1}{2}) \hbar \omega | n \rangle = (n + \frac{1}{2}) \hbar \omega |n\rangle$$
从而其本征能量和基态能量为
$$\epsilon_n = (n + \frac{1}{2}) \hbar \omega, \quad \epsilon_0 = \frac{\hbar \omega}{2}$$

### 波函数
考虑基态$|0\rangle$，则
$$...$$

我们希望求出不确定性最小的波包，利用
$$\langle 0 | \hat x | 0 \rangle = \sqrt{\frac{\hbar}{2 m \omega}} \langle 0 | \hat a + \hat a^\dagger | 0 \rangle$$
又
$$\hat a | 0 \rangle = 0, \quad \hat a^\dagger | 0 \rangle = | 1 \rangle \implies \langle 0 | \hat a + \hat a^\dagger | 0 \rangle = \langle 0 | 1 \rangle = 0$$
从而$\langle 0 | \hat x | 0 \rangle = 0$。
还有
$$\langle 0 | \hat x^2 | 0 \rangle = \frac{\hbar}{2 m \omega} \langle 0 | \hat a^2 + {\hat a^\dagger} ^2 - 2 \hat N - 1 | 0 \rangle = \frac{m \hbar \omega}{2}$$
因此
$$\Delta x = \sqrt{(\langle 0 | \hat x | 0 \rangle)^2 - \langle 0 | \hat x^2 | 0 \rangle} = ...$$
动量的计算同理。
从而其不确定性最小，恰好等于不确定性原理规定的下界。

激发态的波函数可使用产生算符计算：
$$| n \rangle = \frac{1}{\sqrt{n!}} \hat a^\dagger | 0 \rangle$$
其不确定度为
$$......$$