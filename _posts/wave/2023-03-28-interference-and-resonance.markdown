---
title: "波的干涉与共振"
categories: "波动物理"
---

## 干涉现象

当两列同频率的波相遇时，两者的叠加的振幅不一定大于两者之和，这是因为两束波之间发生了干涉。

在下面的内容中，我们总是约定波的振幅为正数。

### 干涉的计算

设两列波为：
$$
s_1(M,t) = S_1(M) \cos(\omega t - \varphi_1(M))
$$
$$
s_2(M,t) = S_2(M) \cos(\omega t - \varphi_2(M))
$$
其在某点处重合，产生新的波：
$$
s(M,t) = s_1(M,t) + s_2(M,t) = S(M) \cos (\omega t - \varphi(M))
$$
这个波的振幅为：
$$
S(M) = \sqrt{S_1^2(M) + S_2^2(M) + 2 S_1(M) S_2(M) \cos [\varphi_2(M) - \varphi_1(M)]}
$$
{: .theorem}

$$
\begin{aligned}
    s(M,t) &= s_1(M,t) + s_2(M,t) \\
    &= S_1(M) \cos (\underbrace{\omega t - \varphi_1(M)}_x) + S_2(M) \cos(\underbrace{\omega t - \varphi_2(M)}_y) \\
    &= S_1(M) \cos x + S_2(M) \cos y \\
    &= S_1(M) \cos x + S_2(M) \cos (x + \phi) \\
    &= S_1(M) \cos x + S_2(M) (\sin x \cos \phi + \cos x \sin \phi) \\
    &= (\underbrace{S_1(M) + S_2(M) \sin \phi}_A) \cos x + \underbrace{S_2(M) \cos \phi}_B \sin x \\
    &= \sqrt{A^2+B^2} \left( \frac{A}{\sqrt{A^2 + B^2}} \cos x + \frac{B}{\sqrt{A^2 + B^2}} \sin x \right) \\
    &= \sqrt{A^2+B^2} (\cos \theta \cos x + \sin \theta \sin x) \\
    &= \sqrt{A^2+B^2} \cos(x - \theta)
\end{aligned}
$$
因此，波的振幅为：
$$
\begin{aligned}
    \sqrt{A^2 + B^2} &= (S_1(M) + S_2(M) \sin \phi)^2 + S_2^2 (M) \cos^2 \phi \\
    &= S_1^2(M) + S_2^2(M) + 2S_1(M) S_2(M) \sin \phi
\end{aligned}
$$
{: .proof}

这一计算方法可以非常容易地从复数表示中看出，实际上有：
$$
S(M) e^{-j \varphi(M)} = S_1(M) e^{-j \varphi_1(M)} + S_2(M) e^{-j \varphi_2(M)}
$$

### 干涉相长与相消

在给定的点$M$处，若指定两列波的振幅$S\_1(M)$和$S\_2(M)$，那么该处叠加的波的振幅取最大值，当且仅当
$$
\varphi_2(M) - \varphi_1(M) \equiv 0 \pmod{2\pi}
$$
取最小值，当且仅当
$$
\varphi_2(M) - \varphi_1(M) \equiv \pi \pmod{2\pi}
$$
前者称为干涉相长，后者称为干涉相消。
{: .proposition}

发生干涉相长时，波的振幅为两列波振幅之和；发生干涉相消时，振幅为两列波的振幅之差的绝对值。

发生干涉相长时，有：
$$
\varphi_2(M) - \varphi_1(M) = k \overline{E_2 M} - k \overline{E_1 M} = 2 \pi n, \; n \in \mathbb{Z}
$$
因此发生干涉相长的点总是*组成双曲线的一支*。
干涉相消同理。

## 简正模

在前几章中，我们学习了达朗贝尔方程的解的形式，并且发现了两组等价的解：行波解（可由简谐行波解生成）和驻波解。

根据方程的边界条件，我们选择这两种解之一：
- 当存在没有边界条件的方向时，选择行波解；
- 当所有方向都有边界条件时，选择驻波解。

本节中，我们将根据驻波解研究所有方向都被固定的系统的振动。

### 简正模的定义

对一维系统，若达朗贝尔方程：
$$
\frac{\partial^2 u}{\partial x^2} - \frac{1}{c^2} \frac{\partial^2 u}{\partial t^2} = 0
$$
的边界条件为：
$$
\forall t, \; u(0,t) = u(L,t) = 0
$$
那么其解总是可以分解成一组由边界条件决定的独立的驻波解的线性叠加。
这些驻波解就是这个系统的**简正模**。
{: .proposition}

#### 两端固定细绳的简正模

长度为$L$、两端固定的细绳的达朗贝尔方程的方程的解是以下驻波的线性组合：
$$
u_n(x,t) = C_n \cos (2\pi f_n t - \varphi_n) \sin (\frac{2 \pi}{\lambda_n}x)
$$
其中：
$$
\left\{
    \begin{aligned}
        &f_n = \frac{cn}{2L} \\
        &\lambda_n = \frac{2L}{n}
    \end{aligned}
\right.
$$
其中$n$称为其*模数*。
{: .proposition}

首先根据边界条件选择驻波解：
$$
u(x,t) = A \cos(\omega t + \varphi_0) \cos(k x + \psi_0)
$$
然后使其满足边界条件：
$$
\left\{
\begin{aligned}
    u(0, t) &= A \cos(\omega t + \varphi_0) \cos \psi_0 = 0 \\
    u(L, t) &= A \cos(\omega t + \varphi_0) \cos (kL + \psi_0) = 0
\end{aligned}
\right.
$$
从第一个等式得出：
$$
\cos \psi_0 = 0 \implies \psi_0 = \frac{\pi}{2} + 2 \pi, \quad p \in \mathbb Z
$$
从第二个等式得出：
$$
\cos (kL + \psi_0) = 0 \implies kL + \psi_0 = \frac{pi}{2} + q \pi, \quad q \in \mathbb Z
$$
将第一个等式代入第二个等式，可得$kL = n \pi$，$n \in \mathbb Z$，从而$k = \frac{n \pi}{L}$。
然后即可得到$\lambda\_n = \frac{2 \pi}{k} = \frac{2L}{n}$
最后利用色散关系：
$$
f_n = \frac{\omega_n}{2\pi} = \frac{k_n c}{2 \pi} = \frac{nc}{2L}
$$
{: .proof}

### 从简正模构造通解

利用傅里叶变换的性质，不难证明：
$$
u(x,t) = \sum_{n=1}^\infty \left[ A_n \cos(2 \pi f_n t) + B_n \sin(2 \pi f_n t) \right] \sin \left( \frac{2\pi}{\lambda_n}x\right)
$$
其中
$$
\left\{
\begin{aligned}
    A_n &= \frac{2}{L} \int_0^L u(x,t=0) \sin(\frac{\pi}{L}nx) \mathrm d x \\
    B_n &= \frac{2}{n\pi c} \int_0^L u(x,t=0) \sin(\frac{\pi}{L}nx) \mathrm d x
\end{aligned}
\right.
$$
{: .theorem}

### 受迫振动与共振

我们观察到，对两端固定的细绳，若让一端以其简正模的频率之一振动，那么细绳会出现固定的波腹与波节，且此时的纵向振动幅度最大。
此时我们称系统出现了**共振**。

我们注意到边界条件变为：
$$
\left\{
\begin{aligned}
    u(0, t) &= A \cos(\omega t + \varphi_0) \cos \psi_0 = \textcolor{red}{u_m \cos (\omega t)} \\
    u(L, t) &= A \cos(\omega t + \varphi_0) \cos (kL + \psi_0) = 0
\end{aligned}
\right.
$$
此时，解可被视为一个暂态和一个稳态的叠加。
我们只关心稳态的解，从而继续忽略初值条件并使用一样的推理：
首先根据边界条件选择驻波解：
$$
u(x,t) = A \cos(\omega t + \varphi_0) \cos(k x + \psi_0)
$$
然后使其满足边界条件：
$$
\left\{
\begin{aligned}
    u(0, t) &= A \cos(\omega t + \varphi_0) \cos \psi_0 = u_m \cos (\omega t) \\
    u(L, t) &= A \cos(\omega t + \varphi_0) \cos (kL + \psi_0) = 0
\end{aligned}
\right.
$$
最后可以发现解的振幅为$\frac{u_m}{\cos \psi_0}$，当$\cos \psi_0 = \sin kL = 0$时，振幅取最大值，此时有$kL = n\pi$。
从而$k = \frac{n\pi}{L}$，$\omega_0 = \frac{n \pi c}{L}$，不难发现其和简正模的频率相同。

我们也可以利用干涉来解释这一现象：一端发出的波被固定的另一端反射之后与自身干涉相长，最后形成共振。
