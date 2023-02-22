---
title: "一维达朗贝尔方程"
categories: "波动物理"
---

## 波的概念

**波**是由标量或矢量场描述的一个物理量，其场同时依赖于时间与空间。
这个物理量与时间和空间相关联的方程称为这个波的*波动方程*。

本文中我们总是研究一维空间下的情形，此时这个波可以由空间坐标$x$和时间坐标$t$描述。
这个波在坐标$(x,t)$处的物理量与平衡状态下$x$位置的物理量之间的差构成一个矢量$\vec{u}(x,t)$，这个矢量称为此波传播的信号。

根据这个矢量与横坐标轴之间的关系，可以把波分为两个种类：
1. 若$\vec u (x,t) = u(x,t) \vec{e_X}$，即波的信号方向（通常表示介质的位移方向）水平于波的传播方向，那么这个波称为**纵波**；
2. 若$\vec u (x,t) \cdot \vec{e_X} = 0$，即波的信号方向垂直于波的传播方向，那么这个波称为**横波**。

## 一维达朗贝尔方程的例子

### 同轴线缆

我们以奥利维·赫维赛德建立的同轴线缆模型为例研究信号在其中的传播。
这个模型研究一段无穷小长度的线缆$\mathrm d x$，其含有四个参数：
电感$L$、电容$C$、电阻$R$和电导$G$。

![](/assets/wave/Transmission_line_element.svg "Creative Commons Attribution-Share Alike 3.0 Unported Source: https://commons.wikimedia.org/wiki/File:Transmission_line_element.svg"){: .align-center}

出于简单考虑，我们设$R = G = 0$，然后使用基尔霍夫定律：
$$
\left\{
\begin{aligned}
    u(x,t) &= u(x + \mathrm d x, t) + L \mathrm d x \frac{\partial i}{\partial t} &\text{(KCL)} \\
    i(x,t) &= i(x + \mathrm d x, t) + C \mathrm d x \frac{\partial u}{\partial t} &\text{(KVL)}
\end{aligned}
\right.
$$
简单的代入计算即可得到：
$$
\left\{
\begin{aligned}
    L \frac{\partial i}{\partial t} (x,t) &= - \frac{\partial u}{\partial x} (x,t) &\text{(1)} \\
    C \frac{\partial u}{\partial t} (x,t) &= - \frac{\partial i}{\partial x} (x,t) &\text{(2)}
\end{aligned}
\right.
$$
然后对两式分别求偏导，可得：
$$
\left\{
\begin{aligned}
    L \frac{\partial^2 i}{\partial t^2} (x,t) &= - \frac{\partial^2 u}{\partial x \partial t} (x,t) \\
    C \frac{\partial^2 u}{\partial x \partial t} (x,t) &= - \frac{\partial^2 i}{\partial^2 x} (x,t) \\
\end{aligned}
\right.
\implies
LC \frac{\partial^2 i}{\partial t^2} (x,t) - \frac{\partial^2 i}{\partial x^2} (x,t) = 0 
$$
最后令$c = \frac{1}{\sqrt{LC}}$，即可得到达朗贝尔方程：
$$
\frac{\partial^2 i}{\partial t^2} (x,t) - \frac{1}{c^2} \frac{\partial^2 i}{\partial x^2} (x,t) = 0
$$
不难发现$c$的量纲恰好等于速度。

之前我们对(1)式求对$t$的偏导，对(2)式求对$x$的偏导，交换这两个求导的顺序即可得到电势的达朗贝尔方程。

#### 能量分析

根据电容和电感的性质，有：
$$
\begin{aligned}
    - \frac{\partial u}{\partial x} &= L \frac{\partial i}{\partial t} \\
    - \frac{\partial i}{\partial x} &= \frac{\partial q}{\partial t} = C \frac{\partial u}{\partial t}
\end{aligned}
$$

我们知道单位长度的功率可以写为$p(x,t) = u(x,t) \cdot i(x,t)$，对其求偏导可得：
$$
\begin{aligned}
    & \frac{\partial p}{\partial x} \\
    &= \frac{\partial u}{\partial x} i + u \frac{\partial i}{\partial x} \\
    &= - \frac{\partial u}{\partial x} C \frac{\partial u}{\partial t} - L \frac{\partial i}{\partial t} \frac{\partial i}{\partial x} \\
    &= - C u \frac{\partial u}{\partial t} - L i \frac{\partial i}{\partial t} \\
    &= - \frac{\partial \left( \frac{1}{2} C u^2 \right)}{\partial t} - \frac{\partial \left( \frac{1}{2} L i^2 \right)}{\partial t} \\
    &= - \frac{\partial e}{\partial t}
\end{aligned}
$$

最后我们得出：
$$
\frac{\partial p(x,t)}{\partial x} + \frac{\partial e(x,t)}{\partial t} = 0
$$

### 从离散模型到连续模型

我们使用一个离散的模型描述所有一维的波，即弹簧质点模型。

假设无穷个弹簧首尾相连，两个弹簧之间有一个质量为$m$的质点，第$n$个质点在$t$时间的位置为$x_n(t)$，和其平衡位置的位移为$\xi_n(t)$。
弹簧的劲度系数为$k$，原长（即平衡时的长度）为$a$，从而$\xi_n(t) = na + \xi_n(t)$。

根据牛顿第二定律，有：
$$
\begin{aligned}
    m \ddot{x}_n &= - k (x_n - x_{n+1}) - k(x_n - x_{n+1}) \\
    m \ddot{\xi}_n &= -2k \xi_n + k \xi_{n+1} + k \xi_{n-1}
\end{aligned}
$$

我们设$\xi(x, t)$为一个二阶可导的函数，这个函数根据$\xi(na, t) = \xi_n(t)$插值而得到。
从而有：
$$
\begin{aligned}
    \xi_n(t) &= \xi(na,t) \\
    \xi_{n-1}(t) &= \xi((n-1)a,t) = \xi(na,t) - a \frac{\partial \xi}{\partial x} + \frac{a^2}{2} \frac{\partial^2 \xi}{\partial x^2} \\
    \xi_{n+1}(t) &= \xi((n-1)a,t) = \xi(na,t) + a \frac{\partial \xi}{\partial x} + \frac{a^2}{2} \frac{\partial^2 \xi}{\partial x^2}
\end{aligned}
$$

现在我们尝试化简上述偏微分方程：
$$
\begin{aligned}
    m \frac{\partial^2 \xi}{\partial t^2} &= - k \left[ 2\xi - \left(\xi - a \frac{\partial \xi}{\partial x} + \frac{a^2}{2} \frac{\partial^2 \xi}{\partial x^2} \right) - \left(\xi+ a \frac{\partial \xi}{\partial x} + \frac{a^2}{2} \frac{\partial^2 \xi}{\partial x^2}\right) \right] \\
    m \frac{\partial^2 \xi}{\partial t^2} &= k a^2 \frac{\partial^2 \xi}{\partial x^2} \\
    0 &= \frac{\partial^2 \xi}{\partial t^2} - \frac{k a^2}{m} \frac{\partial^2 \xi}{\partial x^2}
\end{aligned}
$$
这就又得到了达朗贝尔方程。

## 一维达朗贝尔方程的解集

一维达朗贝尔方程即具有以下形式的偏微分方程：
$$
\frac{\partial^2 u}{\partial x^2} - \frac{1}{c^2} \frac{\partial^2 u}{\partial t^2} = 0
$$
{: .definition}

这个方程具有以下性质：
1. *线性*：若$u\_1, u\_2$为两个解，且$\lambda\_1, \lambda\_2$为两个数，那么$\lambda\_1 u\_1 + \lambda\_2 u\_2$也是一个解；
2. *可逆性*：若$u(x,t)$是一个解，那么$u(x,-t)$也是一个解。

### 反向的行波解

关于一维达朗贝尔方程，有以下定理：

一维达朗贝尔方程：
$$
\frac{\partial^2 u}{\partial x^2} - \frac{1}{c^2} \frac{\partial^2 u}{\partial t^2} = 0
$$
的解可以写成以下形式：
$$
u(x,t) = u_\rightarrow (x - ct) + u_\leftarrow (x + ct)
$$
其中，$u\_\rightarrow (x - ct)$是一个以$c$的速度向右传播的波，$u\_\leftarrow (x + ct)$是一个向左传播的波，通称为行波。
{: .theorem}

两个行波的叠加通常不是行波。
{: .remark}

我们设$r = x - ct, s = x + ct$，从而$x = \frac{r+s}{2}, s = \frac{s-r}{2}$。
然后计算所有微分算符：
$$
\begin{aligned}
    \frac{\partial}{\partial x} &= 
    \frac{\partial r}{\partial x} \frac{\partial}{\partial r} + \frac{\partial s}{\partial x} \frac{\partial}{\partial s} = 
    \frac{\partial}{\partial r} + \frac{\partial}{\partial s} \\
    \frac{\partial}{\partial t} &= 
    \frac{\partial r}{\partial t} \frac{\partial}{\partial r} + \frac{\partial s}{\partial t} \frac{\partial}{\partial s} = 
    c \frac{\partial}{\partial r} + c \frac{\partial}{\partial s} \\
    -2c \frac{\partial}{\partial s} &=
    -2c \left[ \frac{\partial t}{\partial s} \frac{\partial}{\partial t} + \frac{\partial x}{\partial s} \frac{\partial}{\partial x} \right] =
    - c \frac{\partial}{\partial x} - \frac{\partial}{\partial t} \\
    2c \frac{\partial}{\partial r} &=
    2c \left[ \frac{\partial t}{\partial r} \frac{\partial}{\partial t} + \frac{\partial x}{\partial r} \frac{\partial}{\partial x} \right] =
    c \frac{\partial}{\partial x} - \frac{\partial}{\partial t} \\
\end{aligned}
$$
从而：
$$
-4c^2 \frac{\partial^2}{\partial s \partial r} = \frac{\partial^2}{\partial t^2} - c^2 \frac{\partial^2}{\partial x^2}
$$
我们设$u(x,t)$为达朗贝尔方程的一个解，对其进行换元得到$v(r,s)$，从而：
$$
\frac{\partial^2 u}{\partial t^2} - c^2 \frac{\partial^2 u}{\partial x^2} = -4c^2 \frac{\partial^2 v}{\partial s \partial r} = 0
$$
现在我们知道$\frac{\partial^2 v}{\partial s \partial r} = 0$，从而$v$含有一个与$s$无关的分量，同理其还含有一个与$r$无关的分量。
因此我们可以把它写成$v(r,s) = f(r) + g(s)$，因此有：
$$
u(x,t) = f(x - ct) + g(x + ct)
$$
{: .proof}
