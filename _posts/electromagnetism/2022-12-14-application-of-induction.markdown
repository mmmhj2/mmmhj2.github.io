---
layout: post
title: "电磁感应的应用"
categories: electromagnetism
date: 2022-12-14 21:46:00 +0800
---

$$
\newcommand{d}{\mathrm{d}}
$$

我们此前使用麦克斯韦方程给出了感生与动生电势的较严格的证明。
现在，我们来研究电磁感应的几个典型应用。

## 变压器

变压器是由两卷缠绕的导线（线圈）通过磁场交互形成的电子元件。
其中一个线圈称为主线圈，另一个称为副线圈。
为了防止漏磁，通常在要将两个线圈缠绕在铁磁体上。
我们假设主线圈有$N_1$匝，副线圈有$N_2$匝。
此处我们研究的是理想变压器，没有漏磁和铁损，即耦合系数为$m=1$，且没有电功率。

![](/assets/em/transformer.svg)
{: .center-image}

我们假设流过铁磁体中的磁通量为$\Phi$，则通过两个线圈的磁通量分别为$\Phi_1 = N_1 \Phi$、$\Phi_2 = N_2 \Phi$。
设线圈的绕行方向如图所示，约定电流方向同上。对于线圈，我们都采用用电器约定，从而其电势降低方向与电流方向相同。

我们有：
$$
e_1 = -\frac{\d \Phi_1}{\d t} = - N_1 \frac{\d \Phi}{\d t} \quad
e_2 = -\frac{\d \Phi_2}{\d t} = - N_2 \frac{\d \Phi}{\d t} 
\implies \frac{e_2}{e_1} = \frac{N_2}{N_1}
$$
在等效电路中，我们约定了电压降方向，从而有：
$$
U_1 = -e_1 \quad U_2 = -e_2 
\implies \frac{U_2}{U_1} = - \frac{N_2}{N_1}
$$
我们知道这个变压器是理想变压器，从而两端功率相等，又由电功率和电压电流的关系，我们可以导出：
$$
\frac{i_2}{i_1} = - \frac{N_1}{N_2}
$$

## 扬声器与麦克风

我们先研究扬声器的原理。麦克风和扬声器的原理实际上是一致的，只是方向相反而已。

![](/assets/em/speaker.svg)
{: .center-image}

扬声器的内部构造如上图所示。
其中，两个U形磁铁内部由线圈穿过，磁铁与一层薄膜相连，薄膜又通过弹簧固定。
我们假设系统水平放置，并设系统中轴为Z轴。
可知，薄膜与磁铁系统一共受五个力：

- 重力$m \vec g$和支持力$\vec R$；
- 弹力$\vec {F_R} = - k z \vec{e_z}$；
- 与空气的摩擦力$\vec {F_\lambda} = - \lambda \vec v$；
- 安培力$\vec {F_L}$。

我们按照先力学再电学的顺序研究这个系统。

### 力学部分

我们沿Z轴方向建立一个柱坐标系。
设磁铁之间的磁场大小为$B$，则其矢量为$\vec B = B \vec{e_r}$。
设线圈有$N$匝，距中心的距离为$a$，电感为$L$电阻为$R$。

先计算安培力：
$$
\begin{aligned}
\vec {F_L} 
&= N \oint i \d \vec l \times \vec B \\
&= N \oint i (a \d \theta) B \vec{e_\theta} \times \vec{e_r} \\
&= 2 \pi N i B a (- \vec{e_z})
\end{aligned}
$$

首先受力分析，由牛顿第二定律：
$$
\begin{aligned}
m \vec a &= m \vec g + \vec R + \vec{F_R} + \vec{F_\lambda} + \vec{F_L} \\
m \ddot z &= -k z - \lambda \dot z - 2 \pi N i B a \quad \text{在Z轴投影}
\end{aligned}
$$
从而我们得到了这个系统在Z轴上的运动方程。

### 电学部分

我们假设线圈由电势为$E$的电源驱动。
我们对电源、电阻和电感都采用**电源约定**，此时其电流方向与电势升高方向相同。
我们知道，线圈其电势升（电源约定）为$u_L = -L \frac{\d i}{\d t}$。
线圈切割磁感线，因此产生的动生电动势为：
$$
\begin{aligned}
e 
&= N \oint \left( \vec{v_e} \times \vec B \right) \cdot \d \vec l \\
&= N \oint \left( z \vec{e_z} \times B \vec{e_r} \right) (a \d \theta) \vec{e_\theta} \\
&= 2 \pi N a \dot z B
\end{aligned}
$$
从而对整个回路应用基尔霍夫环路定理：
$$
\begin{aligned}
E + u_R + u_L + e &= 0 \\
E - Ri - L \frac{\d i}{\d t} + 2 \pi N a \dot z B &= 0
\end{aligned}
$$

### 计算总功率

这两个方程比较复杂且互相耦合，因此难以直接求解。
我们将力学的式子乘上$\dot z$，电学的式子乘上$i$，凑成功率的形式，然后相减，可得：
$$
\begin{aligned}
m \ddot z \dot z + k z \dot z + \lambda {\dot z}^2 + \cancel{2 \pi a N i B \dot z} - 
Ei + Ri^2 + Li \frac{\d i}{\d t} - \cancel{2 \pi N a \dot z B i} &= 0 \\
m \ddot z \dot z + k z \dot z + \lambda {\dot z}^2 - Ei + Ri^2 + Li \frac{\d i}{\d t} &= 0 \\
\frac{\d}{\d t} \left( \frac{1}{2} m {\dot z}^2 \right) + \frac{\d}{\d t} \left( \frac{1}{2} k z^2 \right) + 
\lambda v_e^2 - Ei - Ri^2 + \frac{\d}{\d t} \left( \frac{1}{2} L i^2 \right) &= 0 \\
\iff Ei = Ri^2 + \lambda v_e^2 + \frac{\d}{\d t} \left( E_{\text{动能}} + E_{\text{弹性势能}} + E_{\text{电感}} \right)
\end{aligned}
$$
其中第二项就是引起空气振动发声而散失的功率。

### 正弦输入与传递函数

现在我们假设电势为正弦函数，输出为薄膜沿Z轴的速度。
由线性响应假设，输出，即速度以及Z坐标，都是同一频率的正弦信号。
在复数域下，我们假设：
$$
\underline{E}(t) = \underline{E_0} \exp j \omega t \quad
\underline{i}(t) = \underline{i_0} \exp j \omega t \quad
\underline{v}(t) = \underline{v_0} \exp j \omega t \quad 
\underline{z}(t) = \underline{z_0} \exp j \omega t 
$$
从而带入原方程：
$$
(j \omega)^2 m \underline{z} + k \underline{z} + \lambda (j \omega) \underline{z} + 2 \pi a \underline{i} B N = 0
$$
我们知道Z轴速度即为Z坐标的导数，从而有$\underline v = j \omega \underline z$：
$$
\begin{aligned}
j \omega m \underline v = \frac{k \underline v}{j \omega} + \lambda \underline v = - 2 \pi a \underline i B N \\
\iff \underline v = - \frac{2 \pi a B N \underline i}{j \omega m + \frac{k}{j \omega} + \lambda}
\end{aligned}
$$
从而其传递函数为：
$$
\underline H = \frac{\underline v}{\underline i} = - \frac{2 \pi a N B}{\lambda + j \left( m \omega - \frac{k}{\omega} \right)}
$$
其模长（增益）为：
$$
\left| \underline H \right| = \frac{2 \pi a N B}{\sqrt{\lambda^2 + \left( m \omega - \frac{k}{m} \right)^2}}
$$
这是一个带通滤波器。

## 涡旋电流

我们此前一般研究都是一条线上的电磁感应现象，对于一个金属体，其产生的感应电场可以在其体内产生三维的感应电流，因此非常复杂。
在不施加外电场的情况下，这种感应电流会形成环形，称为涡旋电流（或傅科电流）。
但是这种电流非常难以用解析的方法求解，因此通常仅限于实验研究。

这一节中，我们用巴洛轮（Barlow's wheel）为例，研究圆形片上的电流。

![](/assets/em/Diagram_of_barlow's_wheel.jpg)
{: .center-image}

巴洛轮就是如上图所示的实验装置。
实验进行时，用水银一类液体导体浸泡这个装置的下半部分，从而形成回路，然后以$\omega_0$作为初始角速度转动此轮。
这个装置的等效电路如下图所示：

![](/assets/em/barlow.svg)
{: .center-image}

我们约定以圆心为原点，Z轴正方向与磁场方向一致，建立柱坐标系来方便研究。

### 电学部分

我们从盘上任取一条从圆心到接触点之间的连线（不要求为直线），计算其感应电动势：
$$
\begin{aligned}
e
&= \int_0^L (\vec v_e \times \vec B) \cdot \d \vec l \\
&= \int_0^L [(r\omega \vec e_\theta) \times (B \vec e_z)] \cdot (\d r \vec e_r + r \d \theta \vec e_\theta) \\
&= \int_0^L (B r \omega \vec e_r) \cdot (\d r \vec e_r + r \d \theta \vec e_\theta) \\
&= \int_0^L Br \omega \d r = \frac{1}{2} a^2 \omega B
\end{aligned}
$$
其中$a$为圆盘半径，$\omega$为圆盘角速度。
可以发现这个电动势和连线的方式没有关系，只要是起点在圆心，终点在接触点，那么电动势就是相同的。

进一步地，我们根据这个等效电路，可以利用基尔霍夫定理写出：
$$
e - u_R - u_C = 0 \iff e = RC \frac{\d u_C}{\d t} + u_c
$$

### 力学部分

我们首先研究安培力：
$$
\begin{aligned}
\d \vec F 
&= i \d \vec l \times \vec B \\
&= i ( \d r \vec e_r + r \d \theta \vec e_\theta) \times B \vec e_z \\
&= (-i \d r \vec e_\theta + i r \d \theta \vec e_r)B
\end{aligned}
$$
圆盘是刚体，且质心被固定，没有位移，因此我们只考虑$\vec e_\theta$方向的力，从而有：
$$
\d \vec F = - i \d r \vec e_\theta
$$
这与一条直导线的受力相同。

接着我们计算力矩：
$$
\Gamma = \int_0^L \vec r \times \d \vec F = \int_0^a -i B r \d r \vec e_r \times \vec e_\theta = - i B \frac{a^2}{2} \vec e_z
$$
从而由角动量定理：
$$
J \frac{\d \omega}{\d t} = - \frac{i B a^2}{2} = - \frac{C B a^2}{2} \frac{\d u_c}{\d t}
$$
两边积分可得：
$$
J ( \omega(t) - \omega_0 ) = - \frac{CBa^2}{2} ( u_c(t) - \cancel{u_c(0)})
$$

### 求解方程

现在问题转化为求微分方程组的解：
$$
\left\{
\begin{aligned}
J ( \omega(t) - \omega_0 ) = - \frac{CBa^2}{2} u_c(t) \\
\frac{\d u_c(t)}{\d t} + \frac{u_c(t)}{\tau} = \frac{a B \omega(t)}{2 \tau}
\end{aligned}
\right.
$$
其中$\tau$为特征时间，即$\frac{1}{RC}$。
直接带入即可求解，解为：
$$
\left\{
\begin{aligned}
u_c(t) &= \frac{\omega_0 a B \tau^\prime}{2 \tau} \left( 1 - e^{-\frac{t}{\tau^\prime}} \right) \\
\omega (t) &= \frac{2 u_c(\infty)}{aB} \left( 1 + \frac{a^3 B^2 C}{2 \tau J} e^{- \frac{t}{\tau^\prime}} \right) 
\end{aligned}
\right.
$$
其中$\tau^\prime = \frac{1}{\frac{1}{\tau}+\frac{a^3 B^2 C}{2 \tau J}}$，$u_c(\infty) = \frac{\omega_0 a B \tau^\prime}{2 \tau}$。

### 能量分析

我们仿照此前的方式，把力学方程乘上$\omega$，电学方程乘上$i$，然后取等：
$$
Ri^2 + \frac{\d}{\d t} (\frac{1}{2} C u_c^2) - \frac{\d}{\d t} (\frac{1}{2} J \omega^2) = e i - \Gamma \omega = 0
$$
这个等式指明了所有能量的转化。
