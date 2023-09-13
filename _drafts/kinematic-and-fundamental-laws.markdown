---
title: "动力学与基本定理"
categories: ["流体力学"]
---

## 表述运动

当我们描述物体，尤其是连续体的运动时，通常可以采用两种视点：拉格朗日视点和欧拉视点。

在拉格朗日法中，连续体被视作一些微小粒子的集合，这些微小粒子的性质随着时间发生各种变化。
在这种表述中，连续体的任意性质只随着时间变化而变化，通常在对时间求导时写成全导数的形式。

在欧拉法中，我们不对从哪个位置观测连续体做任何假设，因此连续体的性质不仅随着时间变化，而且随着观测点的位置变化，此时对时间求导则只能写成偏导数的形式。

如果我们希望让观测点以任意速度运动，则必须考虑观测点的运动对连续体性质的影响。
此时，我们引入物质导数：
$$
\begin{aligned}
\frac{\mathrm D A(\vec x, t)}{\mathrm D t} 
&= \frac{\partial A(\vec x, t)}{\partial t} + \frac{\partial A(\vec x, t)}{\partial \vec x} \frac{\partial \vec x}{\partial t} \\
&= \frac{\partial A(\vec x, t)}{\partial t} + \vec v \cdot \nabla A
\end{aligned}
$$
这种视点称为人工欧拉-拉格朗日法。

物质导数可以视作是连接两种视点的桥梁。
只需要让其中的速度$\vec v$等于流体的速度$\vec U$，即可实现两者的转化。

### 流体力学的研究对象

流体力学是连续体力学的一部分，因此通常只在宏观尺度上处理问题。
欲满足宏观的连续性假设，物体分子的离散粒子性不能对欲求解的问题产生任何影响。
物体分子的离散性可由其平均自由程表示。
因此，流体力学通常只能解决特征尺度远大于该环境下分子的平均自由程的问题。
流体力学研究的物理量也通常都是宏观的物理量。

流体力学的研究对象通常是质点，或称流体微团。
对任意一个流体微团，我们假设其速度与流体的宏观速度总是相同。

流体微团的集合称为一个控制体，控制体可由其边界确定。

尺寸无穷小的控制体称为流体微粒。

流体微粒的无穷小尺寸允许我们将其物理性质视作均匀的，因此其速度、密度和任何物理量都可以视作仅仅与位置和时间相关。
因此，流体微粒的质量等于该点处的密度乘体积，而不需要进行积分。

### 流线与迹线

固定时间$t$下的**流线**（Streamlines）由以下方程给出：
$$\vec U \times \mathrm{d} \vec x = 0$$
其中$\mathrm{d} \vec x$表示*一条*流线的切向量，$\vec U$表示流体的速度。
{: .definition}

流体的**迹线**（Pathlines）表示某一粒子随时间运动的轨迹，由以下方程给出：
$$\frac{\mathrm d \vec x}{\mathrm d t} = \vec U(\vec x, t)$$
{: .definition}

![](/assets/fluiddyn/Streaklines_and_pathlines_animation.gif "From https://en.wikipedia.org/wiki/File:Streaklines_and_pathlines_animation.gif under the Creative Commons Attribution-Share Alike 3.0 Unported license.")
{: .align-center}

流线与迹线的定义比较相似，但两者并不相同。
上图中的灰色短线表示速度场，而灰色虚线表示流线。
红点的红色运动轨迹即为迹线。

当流体处于**定常**流动时，即流体的速度与时间无关时，流体的流线与迹线重合。
{: .proposition}

### 雷诺定理

雷诺定理给出了关于体积的积分量（如质量）对时间的导数关系。

设$S(t)$表示一控制体$D(t)$的边界，边界上一点的法向量为$\vec n$，边界一点的运动速度（非流体速度）为$\vec W$。
记$\varphi (\vec x, t)$为一物理量，$\varPhi(t)$为其在控制体上的积分：
$$\varPhi(t) = \iiint_{D(t)} \varphi(\vec x, t) \mathrm d \nu$$
则：
$$\frac{\mathrm d \varPhi(t)}{\mathrm d t} = \iiint_{D(t)} \frac{\partial \varphi}{\partial t} \mathrm d \nu + \iint_{S(t)} \varphi \vec W \cdot \vec n \mathrm d S$$
{: .theorem}

若控制体随流体一起运动，则$\vec W = \vec U$；
若控制体不动，则$\vec W = 0$。

### 不可压缩性

现在欲计算随流体运动的控制体的体积随时间的导数，令$\varphi = 1$，则$\varPhi = V$，代入雷诺定理，可得：
$$\frac{\mathrm d V}{\mathrm d t} = \iint_S \vec U \cdot \vec n \mathrm d S = \iiint_{D} \nabla \vec U \mathrm d \nu$$

取体积微元$V = \nu$，可得：
$$\frac{\mathrm d \nu}{\mathrm d t} = \nu \nabla \vec U$$

从而我们有以下命题：

一流体不可压缩，即微粒的体积不随时间变化，当且仅当
$$\nabla \vec U = 0$$
{: .proposition}

上文已经提出了一个证法，现在利用密度提出另一个证法。
流体不可压缩，即其微粒的密度不变：
$$\frac{\mathrm d \rho}{\mathrm d t} = 0$$
（此处为拉格朗日视点，注意区别欧拉视点的$\frac{\partial \rho}{\partial t} = 0$，后者只表示流动是定常的。）
从而：
$$
\frac{\mathrm d \rho}{\mathrm d t} 
= \frac{\partial \rho}{\partial t} + \vec v \nabla \rho 
= 0
$$
由于流体的质量守恒，因此密度的变化率等于质量流出的速率，即：
$$\frac{\partial \rho}{\partial t} = - \nabla (\rho \vec v)$$
从而：
$$
\begin{aligned}
\vec v \nabla \rho - \nabla(\rho \vec v) &= 0 \\
v_i \partial_i \rho - \partial_i (\rho v_i) &= 0 \\
v_i \partial_i \rho - v_i \partial_i \rho - \rho \partial_i v_i &= 0 \\ -\rho \partial_i v_i &= 0 \\ - \rho \nabla \vec v &= 0
\end{aligned}
$$
从而有$\nabla \vec v = 0$
{: .proof}
