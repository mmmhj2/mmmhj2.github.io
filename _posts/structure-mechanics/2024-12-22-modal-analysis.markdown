---
title: "模态分析与动态响应"
categories: ["结构力学"]
tags: ["振动力学"]
---

前面我们介绍过使用各种离散方法研究结构的静力学特性的方法。
本文将利用这些方法，进一步地研究结构的动态特性。

## 模态的求解

之前我们在瑞利-里兹法中介绍过模态的概念与求解。
一般来说，对于任意离散化后的系统，其模态可由以下命题求出。

对离散的微分方程系统
$$M \ddot U(x,t) + K U(x, t) = F(t),$$
其中$M$是对称正定的矩阵，$K$是对称且正定或半正定的矩阵，分别称为质量矩阵和刚度矩阵，$\ddot \circ$表示对时间的二阶导，其模态是特征方程
$$\det (M \omega^2 - K) = 0$$
的解。
{: .theorem}

前文我们在瑞利-里兹法中中给出过一个证明，这里给出另外一个证明。

根据分离变量的原理，设$U(x,t) = \phi(x) \cdot T(t)$，其中$\phi$是用于逼近的基函数组成的向量，即振型（mode shape），而由于考虑整个系统的振动模态，$T$是一个函数而非向量。
不妨认为基函数是正交标准的，即
$$\phi_i \phi_j = \delta_{ij}.$$
设方程右手边为零，求解其次解。带入原式，得到
$$M \phi \ddot T(t) + K \phi T(t) = 0.$$
左乘$\phi^T$，得到
$$\phi^T M \phi \ddot T + \phi^T K \phi T = 0.$$
从而
$$\ddot T = -\frac{\phi^T K \phi}{\phi^T M \phi} T.$$
考虑到矩阵$M,K$的（半）正定性，不妨设
$$\frac{\phi^T K \phi}{\phi^T M \phi} = \omega^2 \ge 0, \quad \omega \ge 0$$
则
$$T(t) = \begin{cases}
A \cos (\omega t + B) &, \omega > 0 \\
A + Bt &, \omega = 0
\end{cases}$$
可见构件的振动频率为$\omega$，因此这是离散化后构件的一个模态。
为求出这样的模态，我们可以从最小的模态开始，这就要求
$$\frac{\partial \omega^2}{\partial \phi} = 0,$$
即
$$\frac{\partial}{\partial \phi} \frac{\phi^T K \phi}{\phi^T M \phi} = \frac{\phi^T M \phi \frac{\partial \phi^T K \phi}{\partial \phi} - \phi^T K \phi \frac{\partial \phi^T M \phi}{\partial \phi}}{(\phi^T M \phi)^2} = 0,$$
即
$$\phi^T M \phi \frac{\partial \phi^T K \phi}{\partial \phi} - \phi^T K \phi \frac{\partial \phi^T M \phi}{\partial \phi} = 0.$$
利用二次型的梯度公式，有
$$(\phi^T M \phi) K \phi - (\phi^T K \phi) M \phi = 0.$$
从而
$$(K - \omega^2 M) \phi = 0.$$
我们知道$\phi$是非平凡的解，从而左边的矩阵必然不可逆，因此
$$\det (K - \omega^2 M) = 0.$$
这个式子说明，对同样一组的振型$[\phi\_i]$，可能存在多个模态$\omega\_i$。实际上，模态个数与振型的个数相同：每一个振型相当于一个特征向量，而模态频率则是其特征值，它们共同构成了对原问题的特征向量和特征值的估计。
{: .proof}

不难注意到这个方程形似特征值方程，实际上这种求解这种方程的问题叫做广义特征值问题。
注意方程的特征值是相似不变的，因此如果需要求解新的模态，必须选择一组新的基函数，而这些基函数必须要和原基函数正交，这样在这些基函数下的矩阵才能给出不同的特征值。

### 模态的特征

由于基函数的正交性，即
$$\phi_i \phi_j = \delta_{ij},$$
二次型$\phi^T M \phi$的值为
$$\phi^T M \phi = \sum_{i,j} M_{ij} \phi_j \phi_i = \sum_i M_{ii}$$
对每一个模态$\omega\_i$及其对应的基函数$\phi\_i$（即振型），都有对应的矩阵对角线上的实数，这些实数标识了这个模态。
换句话说，注意到
$$
\phi_i^T M \phi_j = \tilde{m_i} \delta_{ij},\; \phi_i^T K \phi_j = \tilde{k_i} \delta_{ij},
$$
其中$\phi\_i$表示仅由第$i$个振型构成的向量，即只有第$i$项有一个振型函数的向量。
$\tilde{m\_i}$和$\tilde{k\_i}$称为模态$\omega\_i$的*模态质量*（modal mass）和*模态刚度*（modal stiffness）。
这意味着在振型构成的正交基底下，这两个矩阵均是对角化的，即这两个矩阵在该基底下是同时对角化的。

模态的频率可借助这两个量写出：
$$\omega_i = \sqrt \frac{\phi_i^T K \phi_i}{\phi_i^T M \phi_i} = \sqrt\frac{\tilde k_i}{\tilde m_i}.$$
或者可直接通过将两个矩阵同时对角化来求解特征值。

利用模态质量，可将振型重新标准化：
$$\tilde{\phi_i} = \frac{\phi_i}{\tilde{m_i}}.$$
这些新的模态的模态质量均为一，而模态刚度即为模态频率的平方$\omega^2$。

### 例子：简支梁的模态

设一二维欧拉梁两端简支，中点处置有一点载荷，试使用瑞利-里兹法估计其最低的两个模态。梁的长度为$L$，质量线密度为$\rho$，载荷质量为$\rho L$，抗弯刚度为$EI$。<br/>
对两端简支的欧拉梁，我们使用最常见的谐波作为振型：
$$\phi_n = \sin \frac{n \pi x}{L}.$$
这个振型是正交的，即
$$\int_0^L \phi_n \phi_m \,\mathrm d x = \frac{L}{2} \delta_{nm}.$$
首先计算质量和刚度矩阵。
先计算动能，有
$$E_k = \frac{1}{2} \left( \int_0^L \rho \dot u^2(x,t) \,\mathrm d x + \rho L \dot u^2(\frac{L}{2}, t) \right),$$
从而
$$M_{ij} = \rho \int_0^L \phi_i \phi_j \,\mathrm d x + \rho L \phi_i \phi_j = \frac{\rho L}{2} \delta_{ij} + \rho L \sin \frac{i\pi}{2} \sin\frac{j\pi}{2},$$
即
$$M = \frac{\rho L}{2} \begin{pmatrix} 3 & 0 & -2 \\ 0 & 1 & 0 \\ -2 & 0 & 3
\end{pmatrix}.$$
然后计算势能，有
$$E_p = \frac{1}{2} \int_0^L EI u''^2(x,t) \, \mathrm d x,$$
从而
$$K_{ij} = EI \int_0^L \phi_i'' \phi_j'' \, \mathrm d x = \frac{\pi^4 EI}{2 L^3} i^2 j^2 \delta_{ij},$$
即
$$K = \frac{\pi^4 EI}{2L^3} \begin{pmatrix}1&0&0\\0&16&0\\0&0&81\end{pmatrix}.$$
现在考虑广义特征值问题
$$\det (K - \omega^2 M) = 0,$$
解得特征值
$$\omega = 5.6825 \sqrt{\frac{EI}{\rho L^4}}, 39.4784 \sqrt{\frac{EI}{\rho L^4}}, 68.9945 \sqrt{\frac{EI}{\rho L^4}}$$
与对应的特征向量
$$v = \begin{pmatrix}0.8120 \\ 0 \\ -0.0067\end{pmatrix}, \begin{pmatrix}0 \\ -1.4142 \\ 0\end{pmatrix}, \begin{pmatrix}0.7353 \\ 0 \\ 1.0954\end{pmatrix}$$
从而前两阶模态频率和振型为
$$\omega_1 = 5.6825 \sqrt{\frac{EI}{\rho L^4}},\; \psi_1 = 0.8120 \phi_1 -0.0067 \phi_3,$$
和
$$\omega_2 = 39.4784 \sqrt{\frac{EI}{\rho L^4}}, \; \psi_2 = -1.4142 \phi_2.$$
{: .exampl}

## 动态响应

利用模态可研究系统的动态响应，我们首先考虑构件的自由振动，这相当于$F = 0$，即研究原方程的齐次解。

### 自由振动

考虑方程
$$M \ddot U(x, t) + K U(x, t) = 0,$$
及其初始条件
$$U(x, 0) = U_0,\; \dot U(x, 0) = V_0,$$
我们寻找形如
$$U = \tilde \phi(x) T(t) = \sum_i \tilde \phi_i (x) T_i (t)$$
的解，其中$\tilde \phi\_i$表示仅由第$i$个归一化的振型构成的向量。

根据上文的研究，我们可得出其通解：
$$U(x,t) = \sum_i \tilde  \phi_i (A_i + B_i t) + \sum_j \tilde  \phi_j (A_j \cos\omega_j t+ B_j \sin \omega_j t).$$
其中前者对应$\omega = 0$的情况，这种模态称为刚体模态；
后者对应$\omega > 0$的情况，这种模态称为弹性体模态。

现在代入位移的初始条件：
$$
U(x, 0) = \sum_i \tilde  \phi_i A_i + \sum_j \tilde  \phi_j A_j = U_0,
$$
左乘$\tilde \phi\_k^T M$，利用正交性，立刻得到
$$\tilde \phi_i^T M U_0 = A_i \tilde \phi_i^T M \tilde  \phi_i \implies A_i = \tilde \phi_i^T M U_0$$

同理，对速度的初始条件：
$$
\dot U(x, 0) = \sum_i \tilde \phi_i B_i + \sum_j \tilde \phi_j \omega_j B_j = V_0,
$$
左乘并利用正交性，可得
$$
B_i = \tilde \phi_i^T M U_0, \; B_j = \frac{\tilde \phi_j^T M U_0}{\omega_j}.
$$

特别地，若$K$是正定的，那么其特征值均大于零，从而不存在刚体模态。

### 受迫振动

接下来考虑受迫振动的情况，即方程非齐次的情况。
简单的瑞利-里兹法无法处理这种情况，而需要搭配傅里叶变换进行。
首先，考虑非齐次的方程
$$M \ddot U(t) + K U(t) = F(t).$$
为处理这种方程，通常的办法是分开考虑仅受外力的情况和既受外力又受约束的情况，此时方程分块写为
$$\begin{bmatrix} M_{ff} & M_{fc} \\ M_{cf} & M_{cc} \end{bmatrix} \ddot U(t) + \begin{bmatrix} K_{ff} & K_{fc} \\ K_{cf} & K_{cc} \end{bmatrix} U(t) = \begin{bmatrix} F_f \\ F_c\end{bmatrix} + \begin{bmatrix} 0 \\ F_R \end{bmatrix}, \; U = \begin{bmatrix} U_f \\ U_c \end{bmatrix},$$
下标$f$表示受迫（forced）、$c$表示约束（constrained），其中多出来的一项$F\_R$即约束施加的反力。
由于存在外力，反力不能通过仅研究能量而忽略。

考虑分别求解$U$的两个分块，第一个分块为：
$$M_{ff} \ddot U_f + K_{ff} U_f = F_f - M_{fc} \ddot U_c - K_{fc} U_c,$$
注意$U_c$是受约束的位移，因此方程右边是完全已知的，因此可以直接求解。
然后，对第二个分块，我们需要求解未知量$F_R$，有
$$F_R = M_{cf} \ddot U_f + M_{cc} \ddot U_c + K_{cf} U_f + K_{ff} U_c - F_c,$$
这个方程是容易求解的。

即使如此，求解这些方程依然是复杂的，然而，若荷载$F(t)$是周期性的，那么可借助傅里叶级数展开将其简化。
利用方程的线性，我们单独考虑傅里叶展开每一项的贡献，然后将其加和即可。

设荷载的傅里叶级数展开为
$$F(t) = \sum_{k=0}^\infty F_k \sin \omega_k t,$$
那么每一振型下的方程为
$$\ddot \psi_{ik} + \omega_i^2 \psi_{ik} = F_k \sin \omega_k t.$$
这个方程的特解为
$$\psi_{ik,p} = q_{ik} \sin \omega_k t = \frac{F_k}{\omega_i^2 - \omega_k^2} \sin \omega_k t.$$
从而所有的受迫振动，即所有特解的线性组合为
$$U(t) = \sum_{k=0}^\infty \sum_{i=1}^n q_{ik} \phi_i(t) \sin \omega_k t.$$

特解中值得注意的一点是傅里叶级数的频率和固有模态频率接近的情况——这意味着结构出现了共振。
