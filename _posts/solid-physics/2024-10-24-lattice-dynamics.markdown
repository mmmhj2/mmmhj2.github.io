---
title: "晶格动力学"
categories: ["固体物理"]
---

本文研究晶格的动力学，即晶格中原子的运动。
在之前的模型中，我们总是假设晶格中的原子是静止的；然而，这与 X 射线衍射给出的结果不相符——X 射线衍射的结果说明其中的原子总是在振动的。

在研究固体物理时，我们通常使用*波恩-冯·卡门边界条件*，此时要注意晶体中的两种平移周期性：
$$
\mathbf u(x_j, t) = \mathbf u(x_j + L, t) = \mathbf u(x_j + N a, t),
$$
其中$L$是整个材料的大小，而$a$是晶格的大小，$N$是整个材料中的晶格数，此处假设材料为一维，多维的情况是容易推广的。
根据傅里叶变换，有
$$
\mathbf u(x_j, t) = \sum_q A_{q, j} \exp[iqx_j], \, q = n\frac{2\pi}{L} = n\frac{2\pi}{Na}.
$$
注意到$a$的傅里叶变换即在倒易空间中，因此$L$的傅里叶变换$q$也在倒易空间中，$q$也称为*格波*。
格波作为傅里叶变换的基底，具有正交归一性，即
$$\int_{-L/2}^{L/2} \exp[iqx] \exp[iq'x] \,\mathrm d x = L\delta_{q, q'}$$

由于$q$由材料的周期性和晶格的周期性同时组成，我们可将其写为两者之和
$$
\begin{multline}
q = n_L \frac{2\pi}{L} + n_a \frac{2\pi}{a} \implies \\
\mathbf u(x_j, t) = \sum_{k \in \text{布里渊区}} \sum_{G \in \text{倒空间}} A_{k+G, j} \exp[i(k+G)x_j].
\end{multline}
$$
重组可得
$$
\begin{aligned}
\mathbf u(x_j, t) &= \sum_k \exp[ikx_j] \sum_G A_{k+G, j} \exp[iGx_j] \\
&= \sum_{k \in \text{布里渊区}} \exp[ikx_j] v_{k,j}(x_j),
\end{aligned}
$$
其中$v\_{k,j}$是一个周期为$a$的周期函数。

根据
$$
q = n\frac{2\pi}{L} = n\frac{2\pi}{Na}
$$
的关系，一维材料中由多少个原胞，那么第一布里渊区中就有多少个$q$点。
实际情况中，$N$会极其大，进行模拟时会从较小的值迭代增加，直到收敛。

## 经典晶格动力学

### 波恩-奥本海默近似

*波恩-奥本海默近似*(Born-Oppenheimer Approximation)认为，由于电子的质量远小于原子核，因此电子只在视为静止原子核产生的势场中运动，而原子核则只受到电子的平均作用力。
更进一步地，可将这种势场归纳于一般的弹簧产生的弹性势能的势场中。

在原子$n$的平衡位置$u\_n$，势能的一阶导数等于零，我们取二阶导数进行近似，则有
$$
m \ddot u_n = -2 \sum_n V_{n,j} (u_j - u_n),
$$
其中$V\_{n,j}$表示两原子之间作用产生的势能。
将$u\_n$的谐波解代入，可将方程重组为矩阵的形式，
$$
-\omega_q^2 A_j(q) + \sum_n D_{n,j} A_n(q) = 0, \implies \hat D \vec A(q) = \omega^2_q \vec A(q).
$$

### 一维单原子链

我们现假设存在一条两种原子交错组成的链条，第一种原子与平衡位置的距离记为$x\_i$，第二种原子的距离记为$y\_i$，两种原子之间以弹性系数不同（$K\_S, K\_L$）的弹簧相连，则微分方程为
$$
\left\{
\begin{aligned}
m \ddot x_i &= - K_S (x_i - y_i) - K_L(x_i - y_{i-1})\\
m \ddot y_i &= - K_S (y_i - x_i) - K_L(y_i - x_{i+1})
\end{aligned}
\right..
$$

带入谐波解，得到矩阵形式
$$
\begin{pmatrix}
\Omega_S^2 + \Omega_L^2 & -(\Omega_S^2 + \Omega_L^2 e^{-iqa}) e^{iqd} \\
-(\Omega_S^2 + \Omega_L^2 e^{iqa}) e^{-iqd} & \Omega_S^2 + \Omega_L^2
\end{pmatrix}
\begin{pmatrix}
X \\ Y
\end{pmatrix}
=
\omega_q^2
\begin{pmatrix}
X \\ Y
\end{pmatrix}
$$
求解该特征值问题，得到
$$\omega_q = \sqrt{\Omega_S^2 + \Omega_L^2 \pm \sqrt{\Omega_S^4 + \Omega_L^4 + 2 \Omega_S^2 \Omega_L^2 \cos qa}}.$$
这两个特征值对应的色散关系，根据$q$趋于零时的行为，分别称为声学支和光学支：
- 若$q \to 0$时，$\omega\_q \to 0$，则称为声学支，该色散关系类似于声波等物质波；
- 否则，称为光学支，该色散关系类似于电磁波。
