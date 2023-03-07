---
title: "声波与高维波"
categories: "波动物理"
---

本章中我们以声波为楔子，研究波在更高维空间的传递。

## 声学假设下的波动方程

### 声学中的流体力学假设

#### 声波的定义

在忽略重力的情况下，静止的流体可以用以下均匀的矢量场表示：
$$
\vec v(M,t) = \vec 0, \mu (M,t) = \mu_0, P(M,t) = P_0
$$
其中$\vec v$表示速度场，$\mu$表示密度场，$P$表示压力场。

声波是*应用于该平衡状态的一个微扰*，在声波存在的情况下，上面的场变为：
$$
\begin{aligned}
    \vec v(M,t) &= \vec 0 + \vec v_1(M,t), \\
    \mu(M,t) &= \mu_0 + \mu_1(M,t), \\
    P(M,t) &= P_0 + p_1(M,t)
\end{aligned}
$$
其中$p\_1$是一个代数值，称为*超压*或*声压*；$\mu_1$也是一个代数值。
{: .definition}

任何流体粒子以这种方式运动产生的波都可以叫做声波，除了声音的波之外，地震波也是一种声波。

#### 声波有关的假设

根据声波的性质，为了方便我们的研究，我们做出以下假设：

- 流动是理想的，不存在压缩、粘性与摩擦；
- 无量纲量$\frac{\mu\_1}{\mu\_0}$、$\frac{p\_1}{P\_0}$和$\frac{\Vert \vec v_1 \Vert}{c}$是及其关于时间和空间的一阶导数是一阶无穷小，其中$c$为波速；
- 三个声学物理量关于时间的平均为零。

### 耦合方程

声波的耦合方程为三个线性化的偏微分方程：
$$
\mu_0 \frac{\partial \vec v_1}{\partial t}(M,t) = - \vec \nabla p_1(M,t)
$$
这个方程称为欧拉方程，实际上是运动方程；
$$
\mu_0 \nabla \cdot \vec v_1 (M,t) = - \frac{\partial \mu_1}{\partial t}(M,t)
$$
这个方程称为质量方程；
$$
\mu_1 (M,t) = \mu_0 \chi_S p_1 (M,t)
$$
这个方程称为绝热方程，其中$\chi\_S = \frac{1}{\mu} \left(\frac{\partial \mu}{\partial P}\right)_S$，称作*等熵压缩率*。
{: .proposition}

首先考虑第一个方程，根据牛顿第二定律：
$$
\mu \frac{\partial v(t, M)}{\partial t} = - \vec \nabla P(M,t)
$$
注意到$M$实际上是一个关于$t$的函数，这里需要使用复合函数的偏导：
$$
(\mu_0 + \mu_1) \left[ \frac{\partial \vec v}{\partial t} + \frac{\partial \vec v}{\partial \vec M} \frac{\partial \vec M}{\partial t} \right] = - \vec \nabla (P_0 + p_1(M,t))
$$
其中$\frac{\partial \vec v}{\partial \vec M}$也可以写为$\vec v \cdot \vec \nabla$，后者为向量微分算子。
这表示将$\vec v$的每一个分量求偏导，然后乘上该分量的单位向量[^1]。
形如这种求导称为*物质导数*，是流体力学中导数的推广。
现在，注意到$\frac{\partial \vec v}{\partial \vec M} \frac{\partial \vec M}{\partial t}$是高阶无穷小，因此略去。
把梯度中的常数去掉，写成：
$$
(\mu_0 + \mu_1) \frac{\partial \vec v}{\partial t} = -\vec\nabla p_1(M,t)
$$
略去高阶无穷小$\mu\_1 \frac{\partial\vec v}{\partial t}$即可得到第一个方程。

[^1]: $\vec v \cdot \vec \nabla \vec v$既可以看作$(\vec v \cdot \vec \nabla) \vec v$，其意义和本文所述一样，也可以看作$\vec v \cdot (\vec \nabla \vec v)$，此时后者表示协变导数或雅可比矩阵。

---

然后考虑第二个方程。
根据经典的质量守恒方程，有：
$$
\frac{\partial \mu}{\partial t} + \nabla \cdot (\mu \vec v) = 0
$$
展开可得：
$$
\frac{\partial \mu_0 + \mu_1}{\partial t} + \nabla \cdot (\big( \mu_0 + \mu_1 \big) \vec v_1) = 0
$$
略去常数的导数和高阶无穷小$\mu\_1\vec v\_1$可得：
$$
\frac{\partial \mu_1}{\partial t} + \mu_0 \nabla \cdot \vec v_1 = 0 
$$

---

最后考虑第三个方程。
根据定义：
$$
\begin{aligned}
    \chi_S &= \frac{1}{\mu} \left. \frac{\partial \mu}{\partial P} \right|_S \\
    &= \frac{1}{\mu_0 + \mu_1} \frac{\partial \mu_0 + \mu_1}{\partial P} \\
    &\approx \frac{1}{\mu_0} \frac{\partial \mu_1}{\partial P} \approx \frac{\mu_1}{\mu_0 p_1}
\end{aligned}
$$
从而
$$
\mu_0 p_1 \chi_S = \mu_1
$$

### 声压方程

声压满足以下三维达朗贝尔方程：
$$
\Delta p_1 (M,t) - \frac{1}{c^2} \frac{\partial^2 p_1}{\partial t^2} = 0
$$
其中$c = \frac{1}{\sqrt{\mu\_0 \chi\_S}}$。
{: .proposition}

对欧拉方程求散度，可得：
$$
\begin{aligned}
    \nabla \left( \mu_0 \frac{\partial \vec v_1}{\partial t} \right) &= - \nabla \cdot \vec \nabla \cdot p_1 \\
    \frac{\partial}{\partial t}\left( \mu_0 \nabla \cdot \vec v_1 \right) &= - \Delta p_1 \\
    - \frac{\partial^2}{\partial t^2} \mu_1 &= - \Delta p_1 &\text{代入质量方程} \\
    - \frac{\partial^2}{\partial t^2} \mu_0 \chi_S p_1 &= - \Delta p_1  &\text{代入绝热方程} \\
    \Delta p_1 - \chi_S p_1 \frac{\partial^2 p_1}{\partial t^2} &= 0 &\text{整理}
\end{aligned}
$$
{: .proof}

### 数量级估计

#### 理想气体的声波波速

理想气体中声波的波速为：
$$
c_s = \sqrt{\frac{\gamma R T}{M}}
$$
其中$M$为摩尔质量。
{: .proposition}

假设整个过程是绝热的，那么有：$P V^\gamma = K$，其中$K$为一常数。
从而$V = K^{\frac{1}{\gamma}} P^{-\frac{1}{\gamma}}$。
有
$$
\mu = \frac{m}{V} = \frac{m}{K^\frac{1}{\gamma}} P^\frac{1}{\gamma}
$$
接下来计算：
$$
\begin{aligned}
    \frac{\partial \mu}{\partial P} &= \frac{m}{\gamma K^\frac{1}{\gamma}} P^{\frac{1}{\gamma}-1} \\
    &= \frac{m}{\gamma V P^\frac{1}{\gamma}} P^{\frac{1}{\gamma} - 1} \\
    &= \frac{m}{\gamma PV} \\
    &= \frac{m}{\gamma nRT}
\end{aligned}
$$
从而
$$
c = \frac{1}{\sqrt{\mu_0 \chi_S}} = \frac{1}{\sqrt{\frac{\partial \mu}{\partial P}}} = \sqrt{\frac{\gamma RT}{M}}
$$
{: .proof}

在拉普拉斯提出用绝热变换描述声波现象之前，科学家们一直使用等温变化进行建模，此时得出的波速为
$$
c = \sqrt{\frac{RT}{M}}
$$
对空气而言，这两者的误差可高达20%。

#### 液体中的声波波速

液体的等熵压缩率较小且可视为常数，以水为例，$\chi\_S = 5 \times 10^{-10} \text{Pa}^{-1}$，其波速约为$1.4 \times 10^3$米每秒，高达空气中声速的五倍。

### 声学假设的进一步讨论

在此前的假设中，我们曾设：
$$
\left( \vec v_1 \cdot \vec \nabla \right) \vec v_1 \ll \frac{\partial \vec v_1}{\partial t}
$$

讨论两者相除的数量级，可得：
$$
\frac{\left( \vec v_1 \cdot \vec \nabla \right) \vec v_1}{\frac{\partial \vec v_1}{\partial t}} \sim \frac{| \vec v_1 |}{L \backslash t} \sim \frac{| \vec v_1 |}{c} \ll 1
$$
其中$L$为系统的特征长度。
这表明我们的假设仅在粒子的特征运动速度远小于声速时有效。
这两个速度的比值称为马赫数。

## 声波的能量

### 声压的功率

在某一面积微元上，声压力的元功率可表示为：
$$
\mathrm d \mathcal P (M,t) = \mathrm d \vec F \cdot \vec v_1 = p_1(M,t) \vec v_1(M,t) \cdot \mathrm d \vec S(M)
$$

我们定义声波的**玻印廷矢量**为
$$
\vec \Pi (M,t) = p_1 (M,t) \vec v_1 (M,t)
$$
国际制单位为瓦特每平方米。
玻印廷矢量在某一面积上的积分就是声波通过该面积传递的能量，若为正则其方向与面积规定的方向相同。
{: .definition}

### 能量守恒方程

声波的局域能量守恒方程为：
$$
\nabla \cdot \vec \Pi (M,t) + \frac{\partial e}{\partial t}(M,t) = 0
$$
其中
$$
e(M,t) = \frac{\mu_0}{2} v_1^2 (M,t) + \frac{\chi_S}{2}p_1^2 (M,t)
$$
可视为粒子的动能和“压缩势能”的密度。
{: .proposition}

$$
\begin{aligned}
    \mu_0 \nabla \cdot \vec v_1 &= - \frac{\partial \mu_1}{\partial t} &\text{质量方程}\\
    \mu_0 \nabla \cdot \vec v_1 &= - \mu_0 \chi_S \frac{\partial p_1}{\partial t} &\text{代入绝热方程} \\
    p_1 \nabla \cdot \vec v_1 &= - \chi_S p_1 \frac{\partial p_1}{\partial t} \\
\end{aligned}
$$
此式称为①式。
$$
\begin{aligned}
    \mu_0 \frac{\partial \vec v_1}{\partial t} &= - \vec \nabla p_1 &\text{欧拉方程} \\
    \mu_0 \vec v_1 \cdot \frac{\partial \vec v_1}{\partial t} &= \vec v_1 \cdot \vec \nabla p_1 
\end{aligned}
$$
此式称为②式。
两式相加，得：
$$
\begin{aligned}
    p_1 \nabla \cdot \vec v_1 + \vec v_1 \vec \nabla p_1 &= - \chi_S p_1 \frac{\partial p_1}{\partial t} - \mu_0 \vec v_1 \frac{\partial \vec v_1}{\partial t} \\
    \nabla \cdot (p \vec v_1) &= - \frac{\partial}{\partial t} \left[ \frac{1}{2}\chi_S p_1^2 + \frac{1}{2} \mu_0 v_1^2 \right]
\end{aligned}
$$
移项即可得原式。
{: .proof}

此处的证明和电磁学中证明电场和磁场的能量耦合非常相似。

声波的全局能量守恒方程为：
$$
\frac{\mathrm d E}{\mathrm d t} (t) = - \oint_S \vec \Pi \cdot \mathrm d \vec S = - \oint_S p \vec v \cdot \mathrm d \vec S
$$
{: .proposition}

$$
\begin{aligned}
    \frac{\mathrm d E}{\mathrm d t} &= \iiint_V \left( \mu_0 \vec v_1 \frac{\partial \vec v_1}{\partial t} + \chi_S p_1 \frac{\partial p_1}{\partial t}\right) \mathrm d \tau \\
    &= - \iiint_V \left( \vec v_1 \vec \nabla p + p \nabla \cdot \vec v_1 \right) \mathrm d \tau &\text{使用①和②代换}\\
    &= - \iiint_V \left( \nabla \cdot (p_1 \vec v_1) \right) \mathrm d \tau \\
    &= - \oint_S \vec \Pi \mathrm d \vec S &\text{斯托克斯公式}
\end{aligned}
$$
{: .proof}
