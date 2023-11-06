---
title: "应变张量"
categories: "结构力学"
tags: ["连续介质力学"]
---

本文将主要介绍结构力学中的应变张量。

## 应变

### 小变形假设

和刚体运动学相同，我们考虑可变形介质上的一个点，其在某个运动过程前后坐标的差称为其*位移向量*（Displacement），常记为$\mathbf u$。

在结构力学中，我们常常利用小变形假设来简化研究。

（小变形假设）一般认为，物体因外力作用而产生的变形量远远小于其原始尺寸，即在静止平衡态下，$\mathbf u \to 0$。
{: .proposition}

### 梯度张量

#### 平移梯度张量

$$\def\d{\mathrm{d}}$$

考虑介质上两个邻近的点$P, P\_1$，之间的向量为$\d \mathbf x$，若其在某个过程后分别变为$P', P\_1'$，之间的向量变为$\d \mathbf x'$，我们需要找到一个变换$F$，将过程前的向量变换为过程后的向量。

利用微分的关系，我们有：
$$\d \mathbf x_i = \frac{\partial \mathbf x_i'}{\partial \mathbf x_1} \d \mathbf x_1 + \frac{\partial \mathbf x_i'}{\partial \mathbf x_2} \d \mathbf x_2 + \frac{\partial \mathbf x_i'}{\partial \mathbf x_3} \d \mathbf x_3$$

写成矩阵的形式，可得
$$
\d \mathbf x' = \begin{pmatrix}
\frac{\partial \mathbf x_1'}{\partial \mathbf x_1} &
\frac{\partial \mathbf x_1'}{\partial \mathbf x_2} &
\frac{\partial \mathbf x_1'}{\partial \mathbf x_3} \\
\frac{\partial \mathbf x_2'}{\partial \mathbf x_1} &
\frac{\partial \mathbf x_2'}{\partial \mathbf x_2} &
\frac{\partial \mathbf x_2'}{\partial \mathbf x_3} \\
\frac{\partial \mathbf x_3'}{\partial \mathbf x_1} &
\frac{\partial \mathbf x_3'}{\partial \mathbf x_2} &
\frac{\partial \mathbf x_3'}{\partial \mathbf x_3} \\
\end{pmatrix}
\begin{pmatrix}
\d \mathbf x_1 \\
\d \mathbf x_2 \\
\d \mathbf x_3 \\
\end{pmatrix}
$$

注意到用于变换的矩阵正好为一个梯度张量，我们称其为平移梯度张量。

*平移梯度张量*是表示介质上任意两点之间的位置关系变化的张量，定义为：
$$\mathbf  F_{ij} = \frac{\partial \mathbf x_i'}{\partial \mathbf x_j}$$
{: .definition}

#### 位移梯度张量

对于同样的情况，现在考虑其位移，从$P$到$P'$的位移记为$\mathbf u$，而从$P\_1$到$P\_1'$的位移记为$\mathbf u'$，由于$P$和$P\_1$两点之间很近，又根据小变形假设两者$P'$和$P'\_1$可由变形前的状态近似，因此狂歌位移之间的差就是位移向量的微分，记为$\d \mathbf u$，从而：
$$\mathbf u' = \mathbf u + \d \mathbf u$$

根据全微分的计算方法
$$\d \mathbf u = 
\begin{pmatrix}
\frac{\partial \mathbf u_1}{\partial \mathbf x_1} &
\frac{\partial \mathbf u_1}{\partial \mathbf x_2} &
\frac{\partial \mathbf u_1}{\partial \mathbf x_3} \\
\frac{\partial \mathbf u_2}{\partial \mathbf x_1} &
\frac{\partial \mathbf u_2}{\partial \mathbf x_2} &
\frac{\partial \mathbf u_2}{\partial \mathbf x_3} \\
\frac{\partial \mathbf u_3}{\partial \mathbf x_1} &
\frac{\partial \mathbf u_3}{\partial \mathbf x_2} &
\frac{\partial \mathbf u_3}{\partial \mathbf x_3} \\
\end{pmatrix}
\begin{pmatrix}
\d \mathbf x_1 \\
\d \mathbf x_2 \\
\d \mathbf x_3 \\
\end{pmatrix}
$$

从而按照相同的方式，我们可以定义位移梯度张量。

*平移梯度张量*是表示介质上任意两点之间的位移关系变化的张量，定义为：
$$\mathbf H_{ij} = \frac{\partial \mathbf u_i}{\partial \mathbf x_j}$$
{: .definition}

特别地，对于任意一点$P$，其坐标和位移之间满足：
$$\mathbf u = \mathbf x' - \mathbf x$$
从而
$$\d \mathbf u = \d \mathbf x' - \d \mathbf x \implies \mathbf H = \mathbf F - \mathbf I$$

#### 形变张量

现在考虑介质上的形变。
为了表示形变，我们需要引入三个点：$P, P\_1, P\_2$。
记：
$$
\def\bx{\mathbf{x}}
\d\bx = \vec{PP_1}, \quad \delta \bx = \vec{PP_2}
$$

任何一个形变都可以由这三个点之间的距离和夹角的变化来表示，
而距离和夹角的变化都可以通过向量的内积来表示。
因此，我们可以使用这两个向量的内积来表示形变。

计算
$$\d \bx' \cdot \delta \bx' = (\mathbf F \d \bx)^\top (\mathbf F \delta \bx) = \d \bx (\mathbf{F^\top F}) \delta \bx$$
再计算其变化量
$$\d \bx' \cdot \delta \bx' - \d \bx \cdot \delta \bx = \d \bx (\mathbf{F^\top F} - \mathbf I) \delta \bx$$

从而我们可以定义两个表征形变的张量。

定义表征形变的*柯西-格林张量*（Cauchy-Green tensor）为：
$$\mathbf C = \mathbf{F^\top F}$$
*格林-拉格朗日张量*（Green-Lagrange tensor）为：
$$\mathbf E = \frac{1}{2} (\mathbf C - \mathbf I) = \frac{1}{2}(\mathbf{F^\top F} - \mathbf I)$$
{: .definition}

#### 膨胀与滑移

我们考虑沿方向$\vec n$的向量$\d \bx$，应变导致的长度增大的绝对量和相对量都是易于计算的：
$$
\begin{aligned}
\lambda(\vec n) &= \frac{|\d \bx'|}{|\d \bx|} = \sqrt{\vec n^\top \mathbf C \vec n} = \sqrt{1 + 2 \vec n^\top \mathbf E \vec n} \\
\epsilon(\vec n) &= \frac{|\d \bx'| - |\d \bx|}{|\d \bx|} = \sqrt{\vec n^\top \mathbf C \vec n} - 1
\end{aligned}
$$

至于形变导致的角度变化，我们选择两个正交的方向向量$\vec n, \vec m$以及该方向上的向量$\d \bx$和$\delta \bx$，设$\gamma$表示形变后两向量角度的变化量，则：
$$\sin \gamma(\vec m, \vec n) = \frac{\vec n^\top \mathbf C \vec m}{\sqrt{\vec n^\top \mathbf C \vec n} \sqrt{\vec m^\top \mathbf C \vec m}}$$

### 无穷小位移

接下来考虑计算格林-拉格朗日张量
$$
\def\bF{\mathbf{F}}
\def\bI{\mathbf{I}}
\def\bH{\mathbf{H}}
\def\bu{\mathbf{u}}
\begin{aligned}
\mathbf E &= \frac{1}{2} (\bF^\top \bF - \bI) \\
&= \frac{1}{2} ((\mathbf H^\top + \bI)(\mathbf H + \bI) - \bI) \\
&= \frac{1}{2} (\mathbf H + \mathbf H^\top + \mathbf H \mathbf H^\top)
\end{aligned}
$$
从而
$$\mathbf E_{ij} = \frac{1}{2} \left( \frac{\partial \bu_i}{\partial \bx_j} + \frac{\partial \bu_j}{\partial \bx_i} + \frac{\partial \bu_k}{\partial \bx_i}\frac{\partial \bu_k}{\partial \bx_j} \right)$$

利用小变形假设，略去高阶无穷小，可得：
$$\varepsilon_{ij} = \frac{1}{2} \left( \frac{\partial \bu_i}{\partial \bx_j} + \frac{\partial \bu_j}{\partial \bx_i}\right)$$

这种张量易于求解，我们将主要研究这种形式的格林-拉格朗日应变张量。

在小变形假设下，线性应变张量定义为：
$$\varepsilon_{ij} = \frac{1}{2} \left( \frac{\partial \bu_i}{\partial \bx_j} + \frac{\partial \bu_j}{\partial \bx_i}\right)$$
或
$$\varepsilon = \frac{1}{2} (\mathbf H + \mathbf H^\top)$$
{: .definition}

#### 膨胀

通过简单的代换和等价无穷小替换，可以得到：
$$
\begin{aligned}
\lambda(\vec n) &= \frac{|\d \bx'|}{|\d \bx|} = 1 + \vec n^\top \varepsilon \vec n \\
\epsilon(\vec n) &= \frac{|\d \bx'| - |\d \bx|}{|\d \bx|} = \vec n^\top \varepsilon \vec n \\
\gamma(\vec m, \vec n) &= 2 \vec n^\top \varepsilon \vec n
\end{aligned}
$$

此外，应变导致的体积变化为（略去高阶无穷小）：
$$\frac{\Delta V}{V} = \frac{V' - V}{V} = \varepsilon_{11} + \varepsilon_{22} + \varepsilon_{33} = \mathrm{Tr}(\varepsilon)$$

和应力类似，线性应变张量对角线上的元素表示应变导致的膨胀，而对角线外的元素表示应变导致的夹角变化。

#### 主应变

应变矩阵也是一个对称矩阵，因此也能被对角化。
按照和应力相同的方式，我们定义主应变和主应变方向。

应变张量必然具有三个正交的特征向量。
当三个特征向量的长度均为一时，其对应的特征值按从大到小的顺序分别称为第一、第二和第三主应变。
这三个特征向量所在的方向称为主应变方向。
{: .definition}

#### 位移张量的分解

对位移梯度张量$\bH$，注意到：
$$\d \bu = \bH \d \bx = \left(\frac{\bH + \bH^\top}{2} + \frac{\bH - \bH^\top}{2} \right) \d \bx$$

令$\omega = \frac{\bH - \bH^\top}{2}$，这是一个反对称矩阵，可以写为：
$$\omega = \begin{pmatrix}
0 & \omega_{12} & \omega_{13} \\ -
\omega_{12} & 0 & \omega_{23} \\ -
\omega_{13} & -\omega_{23} & 0
\end{pmatrix}$$
左乘一个这种矩阵相当于和一个向量叉乘：
$$\omega \cdot \d \bx = \Omega \times \d \bx$$
其中
$$\Omega = \begin{pmatrix} -\omega_{23} \\ \omega_{13} \\ - \omega_{12} \end{pmatrix}$$

从而位移向量可以写为：
$$\d \bu = \bu(\bx + \d \bx) - \bu(\bx) = \varepsilon \cdot \d \bx + \Omega \times \d \bx$$

这意味着任何两点之间的位移向量的变化都是由一次旋转和一次形变导致的。

#### 形变张量的分解

对形变张量$\varepsilon$，其也可以按照类似应力的方式进行分解：

$$\varepsilon = \frac{1}{3} \mathrm{Tr}(\varepsilon) \bI - \left( \varepsilon - \frac{1}{3} \mathrm{Tr}(\varepsilon) \bI \right)$$

第一部分的数量矩阵可视为一个均匀的膨胀变形，称为体积应变张量（volumetric strain tensor），而第二部分的迹为零，这意味着这个形变维持体积不变，称为偏应变张量（deviatoric strain tensor）。

和上一节的内容结合，我们可将位移向量的变化变为三个变换的组合。

### 相容性方程

若已知位移场，则求解形变张量是容易的。
然而，若已知形变张量，则不一定能够求出一个位移场，这是因为需要求解一个比较复杂的偏微分方程：
$$\frac{1}{2}(\partial_j \bu_i + \partial_i \bu_j) = \varepsilon$$

相容性方程给出了该偏微分方程有解的充分必要条件。

用于求解位移场的偏微分方程组有解，当且仅当以下六个方程都得到满足：
$$
\begin{aligned}
\partial_{22} \varepsilon_{11} + \partial_{11} \varepsilon_{22} - 2 \partial_{12} \varepsilon_{12} &= 0 \\
\partial_{23} \varepsilon_{11} + (\partial_{11} \varepsilon_{23} - \partial_{23} \varepsilon_{31} - \partial_{13} \varepsilon_{21}) &= 0
\end{aligned}
$$
其余四个方程可通过下标的圆排列得出。
{: .proposition}
