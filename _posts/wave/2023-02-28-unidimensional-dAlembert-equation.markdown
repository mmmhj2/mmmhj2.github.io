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

### 行波解

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

#### 单色行波

能够表示为以下形式的行波称为**谐波**，也称单色波：
$$
u(x,t) = u_m \cos (\omega t - k x - \varphi)
$$
其中$u_m$称为振幅。
角频率$\omega$（或周期$T$、或频率$f$）表示其时域上的周期性；
波矢$\vec k$的范数表示其空间上的周期性。
{: .definition}


对于一个谐波，平面$\omega t - k x = C$（$C$为常数）表示了一个等相位平面，这个平面可写成$x = \frac{\omega}{k}t - \frac{C}{k}$的形式，从而可以看作以$\frac{\omega}{k}$的速度向前移动。
这个速表示了相位的速度，因此称为**相速度**，记为$v_\varphi$。

联系$\omega$和$k$的关系称为**色散关系**，对于一维达朗贝尔方程的谐波解，其色散关系为$\nu_\varphi = \frac{\omega}{k} = c$。
若介质中波的相速度与$\omega$无关，那么称这个介质为*非色散*的。

#### 谐波的复数表示

根据以下定理，我们可以构造复数来非常简单地表示一个谐波。

若$u(x,t) = u\_m \cos (\omega t - kx - \varphi)$为任何*线性且系数与时间无关的波方程*的解，那么
$$
\underline{u}(x,t) = u_m \exp \left[ j (\omega t - kx - \varphi) \right]
$$
也是这个方程的解。
{: .theorem}

我们构造
$$
\begin{aligned}
    u(x, t - \frac{\pi}{2\omega}) &= u_m \cos \left( \omega (t - \frac{\pi}{2 \omega}) - kx - \varphi \right) \\
    &= u_m \cos \left( \omega t - kx - \varphi - \frac{\pi}{2} \right) \\
    &= u_m \sin \left( \omega t - kx - \varphi \right)
\end{aligned}
$$
根据波动方程的性质，这个函数也是原方程的解，因为其只是进行了平移。
原式$u_m \exp \left[ j (\omega t - kx - \varphi) \right]$可以使用欧拉公式展开，从而表示为这两个函数的线性组合，因此也是这个方程的解。
{: .proof}

使用复数，我们可以非常方便地表示求导和积分运算，就像使用拉普拉斯变换研究线性系统一样。

然而，值得注意的是，这个复数表示对乘法通常不适用，因此进行这种非线性的变换时必须回到三角函数表示。

$$
\Re [ \underline{u}(x,t) \cdot \underline{v} (x,t) ] \neq u(x,t) \cdot v(x,t)
$$
{: .remark}

如果我们需要计算同周期的两个谐波的积的平均值，那么还是可以借助复数表示的。

设$u(x,t)$和$v(x,t)$表示两个同向的同周期谐波，那么有：
$$
\left< u(x,t) \cdot v(x,t) \right>_T = \frac{1}{2} \Re [\underline{u}(x,t) \cdot \underline{v}^*(x,t)]
$$
其中$\left< u(x,t) \right>\_T$表示$T$时间内的平均值，即$\frac{1}{T} \int_{t_0}^{t_0 + T} u(x,t) \mathrm d t$，$v^*$表示复数的共轭。
{: .proposition}

这个命题可用简单的计算证明，此前的电磁场[计算玻印廷矢量](/电磁学/2022/11/27/em-wave-in-medium.html#耦合电子模型与电极化率的计算)时也用到了这个定理。

通过使用傅里叶变换，我们可以把任何（平方可积的）行波转换为谐波的线性组合，又因为达朗贝尔方程的所有解都可以转化为行波，因此谐波具有相当的重要性。
例如，行波$g(t-\frac{x}{t})$可以由傅里叶变换变为：
$$
g(t-\frac{x}{t}) = \int_0^\infty 2 \left| \hat{g}(f) \right| \cos \left( 2 \pi f (t - \frac{x}{c}) + \arg (\hat{g}(f)) \right) \mathrm d f
$$
其中$\hat{g}$表示傅里叶系数。
不难发现被积函数就是一个谐波。

### 驻波解

除了两个行波的组合之外，达朗贝尔方程还有一种特殊的解，即驻波解。

若波函数$u(\vec r, t)$可以写为一个关于$\vec r$的函数$F(\vec r)$和一个关于$t$的函数$G(t)$之积，那么称这个波为一个**驻波**。
{: .definition}

在驻波中，位置和时间相互独立地影响这个波，变量不具有$x - ct$的形式，因此这个波实际上不会前进，也不会传播能量。
值得注意的是，两个反向传播的频率和振幅相同的行波的叠加就是一个驻波：
$$
\begin{aligned}
    u(x,t) &= u_m \cos (\omega t - k x - \varphi) + u_m \cos(\omega t + k x - \psi) \\
    &= 2 u_m \cos (\omega t - \frac{\varphi + \psi}{2}) \cos (kx + \frac{\varphi - \psi}{2})
\end{aligned}
$$

一维达朗贝尔方程的驻波解具有以下形式：
$$
u(x,t) = C \cos(\omega t - \varphi) \cos(\frac{\omega}{c}x - \psi)
$$
其中$C, \varphi, \psi$是由偏微分方程的初始条件决定的常数。
在非色散介质中，我们假设$k = \frac{\omega}{c}$
{: .proposition}

我们设$X(x), T(t)$为两个函数，用分离变量法求解达朗贝尔方程，设$u(x,t) = X(x) \cdot T(t)$。
$$
\begin{aligned}
   \frac{\partial^2 u}{\partial x^2} - \frac{1}{c^2} \frac{\partial^2 u}{\partial t^2} &= 0 \\
   X T^{\prime \prime} &= c^2 X^{\prime \prime} T \\
   \frac{T^{\prime \prime}}{T} &= c^2 \frac{X^{\prime\prime}}{X}
\end{aligned}
$$
因为等式两边的函数互相独立且恒等，因此两边都一定等于常数，设该常数为$\alpha$，从而有：
$$
\left\{
    \begin{aligned}
        X^{\prime\prime} &= a X \\
        T^{\prime\prime} &= c^2 a T
    \end{aligned}
\right.
$$
接下来进行分类讨论，设$a \ge 0$，从而$a = k^2$，那么有：
$$
\left\{
    \begin{aligned}
        X^{\prime\prime} &= k^2 X \\
        T^{\prime\prime} &= c^2 k^2 T
    \end{aligned}
\right.
$$
解得$X(x) = A e^{kx} + B e^{-kx}$。
第一项显然违反能量守恒，而第二项属于过渡态而非稳定态，因此整个解都不值得关心。
现在我们设$a < 0$，从而$a = - k^2$，有：
$$
\left\{
    \begin{aligned}
        X^{\prime\prime} &= - k^2 X \\
        T^{\prime\prime} &= - c^2 k^2 T = - \omega^2 T
    \end{aligned}
\right.
$$
解得：
$$
\left\{
    \begin{aligned}
        X(x) &= A \cos(kx + \phi) \\
        T(t) &= B \cos(\omega x + \psi)
    \end{aligned}
\right.
$$
从而$u(x,t) = AB \cos(kx + \phi) \cos(\omega x + \psi)$。
{: .proof}

下面是一幅驻波的示意图：

![](/assets/wave/Standing_wave.gif)
{: .aligned-center}

不难发现，驻波的极值点和零点总是处于相同的位置，这两个点分别称为“波腹”和“波节”，图中波节用红点标识了出来。

驻波解和行波解在数学上是完全等价的，任何一个行波解都可以转化成一个驻波解：
$$
\begin{aligned}
    u(x,t) &= u_m \cos(\omega t + kx - \varphi) \\
    &= u_m \cos(\omega t - \varphi) \cos(kx) - u_m \sin(\omega t - \varphi) \sin(kx)
\end{aligned}
$$
这两个解可以用来解决完全相同的物理问题，而驻波解的优势在于其可以非常方便的由边界条件求出，这可以从下面的例子中得到印证。

## 同轴导线的特征阻抗

### 特征阻抗的定义

同轴导线的**特征阻抗**定义为：
$$
Z_c = \sqrt{\frac{l}{c}}
$$
其中$l$为单位长度导线的电感，$c$为电容。
{: .definition}

设导线中的电势由前向和后向的两个行波组成，那么电势行波和电流行波满足以下关系：
$$
\begin{aligned}
    u_\rightarrow(x - ct) &= Z_c i_\rightarrow(x - ct) \\
    u_\leftarrow(x - ct) &= -Z_c i_\leftarrow(x - ct)
\end{aligned}
$$
从而电势和电流的波可以写成：
$$
\begin{aligned}
    u(x,t) &= u_\rightarrow(x-ct) + u_\leftarrow(x+ct) \\
    i(x,t) &= \frac{1}{Z_c} \left( u_\rightarrow(x-ct) \textcolor{red}{-} u_\leftarrow(x+ct) \right)
\end{aligned}
$$
{: .proposition}

简单计算即可证明这个命题。

### 波的反射

我们把一段长度为$L$的同轴导线的前端接到信号发生器上，然后把后端短接并接地，就会在前端观察到反射的波形。
这个现象可以由达朗贝尔方程的边界条件解释。

根据上文的描述，达朗贝尔方程在边界处具有以下条件：
$$
\forall t ,\quad u_\rightarrow(L - ct) + u_\leftarrow(L + ct) = 0
$$
只要$u_\rightarrow(L - ct) \neq 0$，那么另一个行波就不可能等于零，因此一定存在反射波。
现在我们设$t^\prime = t + \frac{x - L}{c}$，可得：
$$
u_\rightarrow(L - c(t + \frac{x-L}{c})) + u_\leftarrow(L + c(t + \frac{x+L}{c})) = 0
$$
从而有：
$$
u_\rightarrow(x + ct) = - u_\leftarrow(2L - x - ct)
$$
这说明了前行波与反射波之间的关系。

### 尾端接有电阻的反射

现在我们不再将同轴导线的末端短接，而是在上面接上一个电阻$R$。

现在，向前的电势和电流满足：
$$
u_\rightarrow(L-ct) = R i_\rightarrow(L-ct)
$$
如果$R \neq Z_c$，那么这两个方程是矛盾的，因此单独一个向前的行波不可能是解，从而一定存在反射的行波。

定义**反射系数**为被反射的物理量与原物理量之比。
电压的反射系数为：
$$
r_v = \frac{u_\rightarrow(L,t)}{u_\leftarrow(L,t)}
$$
而电流的反射系数为：
$$
r_i = \frac{i_\rightarrow(L,t)}{i_\leftarrow(L,t)}
$$
{: .definition}

电压与电流的反射系数满足：
$$
r_v = \frac{R - Z_c}{R + Z_c} = -r_i
$$
{: .proposition}

联立：
$$
\left\{
    \begin{aligned}
        i(x,t) &= i_\rightarrow(x,t) + i_\leftarrow(x,t) \\
        i(x,t) &= \frac{1}{Z_c} (u_\rightarrow(x,t) - u_\leftarrow(x,t)) \\
        i(x,t) &= \frac{1}{R} (u_\rightarrow(x,t) + u_\leftarrow(x,t))
    \end{aligned}
\right.
$$
即可。
{: .proof}

当$R = Z_c$时，不存在反射，这种情况称为*阻抗匹配*。
