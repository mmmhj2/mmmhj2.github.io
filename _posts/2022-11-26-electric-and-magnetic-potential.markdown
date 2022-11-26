---
layout: post
title: "电标势与磁矢势"
categories: electromagnetism
date: 2022-11-26 16:08:00 +0800
--- 

在静电场中，我们发现电场$\vec{E}$的旋度为零。
这表明，静电场的积分与路径无关而只与起点和终点有关。
这样的场被称作保守场，其一定是由某个标量的梯度产生的。
我们把这个标量记作电势$V$，满足$ \nabla V = \vec E$。

在时变的电场中，这个关系并不一定存在。
更一般的，由真空中的麦克斯韦方程：
$$
\begin{aligned}
\nabla \cdot \vec E (M,t) & = \frac{\rho(M,t)}{\epsilon_0} \\
\nabla \cdot \vec B (M,t) & = 0 \\
\nabla \times \vec E (M, t) & = - \frac{\partial \vec B}{\partial t}  (M, t)\\
\nabla \times \vec B (M, t) & = \mu_0 \vec j (M, t) + \mu_0 \epsilon_0 \frac{\partial \vec E}{\partial t}(M, t)
\end{aligned}
$$
其电场的旋度不再为零，从而不再存在电势。
但是我们又发现，磁场的散度总是零，这个特殊的性质促使我们再去寻找特别的“势”。

## 电标势与磁矢势的定义

我们知道，所谓“梯度无旋，旋度无散”。
磁场的散度为零，说明其一定是某个矢量场的旋度，我们把这个场称作**磁矢势**。

磁矢势$\vec A (M, t)$为满足如下性质的矢量场：
$$
\vec B (M, t) = \nabla \times \vec A (M, t)
$$
{: .definition}

我们注意到，导致电场不再具有势的原因是磁场的时变，而磁场又可由磁矢势表示出来。
因此，我们可以重新定义一个**电标势**。

电标势$V (M,t)$为满足以下性质的标量场：
$$
\vec E (M, t) = - \nabla V (M, t) - \frac{\partial \vec A}{\partial t} (M, t)
$$
{: .definition}

需要注意，电标势虽然也被称作电势，但是在含时变磁场的电磁场中，电场并不是保守场，因此也不具有势。
电标势是电势在时变情况下的推广，本身并不是某个场的势场。

容易看出，由于微分符号的性质，在电标势或磁矢势上附加某些变换（比如加减一个常数），其表示的电场和磁场仍然不变。
因此，电场和磁场对应的势并不唯一。
这促使我们去寻找一些能够简化计算的规定。

## 电标势与磁矢势的规范

为了简化计算或是使得这两个势具有一定的物理意义而提出的限制条件叫做**规范**。
这一节我们研究两个最重要的规范：库仑规范和洛伦茨规范。

### 库仑规范

在静止态下，我们有以下库仑方程：
$$
\nabla \cdot \vec E (M) = - \Delta V (M) = \frac{\rho(M)}{\epsilon_0}
$$

我们希望，在时变情况下这个方程仍然成立。
向麦克斯韦方程中带入电标势的定义，可得：
$$
\begin{aligned}
\nabla \cdot \vec E (M,t)
&= - \Delta V (M, t) - \nabla \cdot \frac{\partial \vec A}{\partial t} (M, t) \\
&= - \Delta V (M, t) - \frac{\partial}{\partial t} \nabla \cdot \vec A (M, t) \\
&= \frac{\rho(M)}{\epsilon_0}
\end{aligned}
$$
在经典物理学中，我们总是假设各个函数足够光滑，因此可以交换求导符号的顺序。

我们仍然希望电标势可以满足库仑方程，因此我们要求$\nabla \cdot \vec A (M, t) = 0$。
这一要求就是**库仑规范**。

### 达朗贝尔方程

洛伦茨规范与电磁波的传导密切相关，因此我们先来研究真空中电磁波的传导问题。
在真空之中，我们假设不存在源，也就是说电荷和电流密度均为0。

对电场的旋度再次应用旋度，可得：
$$
\begin{aligned}
\nabla \times \nabla \times \vec E 
&= \nabla \nabla \cdot \vec E - \Delta \vec E \\
\nabla \times \left( - \frac{\partial \vec B}{\partial t} \right) 
&= - \Delta \vec E \\
\frac{\partial}{\partial t} \nabla \times \vec B
&= \Delta \vec E \\
\frac{\partial}{\partial t} \mu_0 \epsilon_0 \frac{\partial \vec E}{\partial t} 
&= \Delta \vec E \\
\Delta \vec E - \mu_0 \epsilon_0 \frac{\partial^2 \vec E}{\partial t^2} &= 0
\end{aligned}
$$
对磁场故技重施，可得：
$$
\nabla \vec B - \mu_0 \epsilon_0 \frac{\partial^2 \vec B}{\partial t^2} = 0
$$

以上两个方程叫做达朗贝尔方程。
这两个方程的解具有波动的形式，因此我们说麦克斯韦方程预言了电磁波的存在。

特别地，达朗贝尔方程有一组简单的解：
$$
\begin{aligned}
\vec E (M, t) 
& = E_{0x} \cdot \cos (\omega t - \vec k \cdot \vec r - \varphi_x) \vec e_x \\
& + E_{0y} \cdot \cos (\omega t - \vec k \cdot \vec r - \varphi_y) \vec e_y \\
& + E_{0z} \cdot \cos (\omega t - \vec k \cdot \vec r - \varphi_z) \vec e_z
\end{aligned}
$$
形如这种形式的解被成为**平面谐波**。其中，$\vec k$ 称为波矢。

这个波满足一个特别的关系：**色散关系**
$$
k = \frac{\omega}{c} \iff \lambda = c T
$$

### 洛伦茨规范

我们希望，对于电标势和磁矢势，达朗贝尔方程仍然成立。
将磁矢势和电标势重新带入磁场的旋度方程，这样等式左边又会出现两个旋度：
$$
\begin{aligned}
\nabla \times \nabla \times \vec A 
&= \mu_0 \epsilon_0 \frac{\partial \vec E}{\partial t} \\
\nabla \nabla \cdot \vec A - \Delta \vec A 
&= - \mu_0 \epsilon_0 \frac{\partial}{\partial t}(\nabla V + \frac{\partial \vec A}{\partial t}) \\
\Delta \vec A - \mu_0 \epsilon_0 \frac{\partial^2 \vec A}{\partial t^2}
&= \nabla \left( \nabla \cdot \vec A + \mu_0 \epsilon_0 \frac{\partial V}{\partial t} \right)
\end{aligned}
$$
为了使磁矢势仍然满足达朗贝尔方程的形式，我们只能取
$$
\nabla \cdot \vec A + \mu_0 \epsilon_0 \frac{\partial V}{\partial t} = 0
$$
这个规范就叫**洛伦茨（Lorenz）规范**。
注意不是洛伦兹（Lorentz）规范。

## 推迟势与准静态假设

我们已经知道，达朗贝尔方程的平面谐波解满足色散关系$k = \frac{\omega}{c}$。
这说明，更一般的，电磁波在真空中实际上光速传播。
同样的，因源的改变导致的电势的改变，也应该以光速传播。
这促使我们引入**推迟势**的概念。

在静电场中，我们有
$$
V(M) 
= \iiint_{P \in V} k \frac{\rho(P)}{r} \mathrm{d} \tau(P) 
= \frac{1}{4 \pi \epsilon_0} \iiint_{P \in V} \frac{\rho(P)}{r} \mathrm{d} \tau(P)
$$
考虑到势的传播速度，修改后引入推迟势：
$$
\begin{aligned}
V(M,t) 
&= \frac{1}{4 \pi \epsilon_0} \iiint_{P \in V} \frac{\rho(P, t - \frac{r}{c})}{r} \mathrm{d} \tau(P) \\
\vec A(M,t) 
&= \frac{\mu_0}{4 \pi} \iiint_{P \in V} \frac{\vec j (P, t - \frac{r}{c})}{r} \mathrm{d} \tau(P) \\
\end{aligned}
$$

推迟势虽然准确地描述了电标势和磁矢势的传播，但也使得计算变得非常复杂。
这让我们希望找到一些简化计算的方法。

### 准静态假设

当我们需要研究一个时间尺度极大，而空间尺度极小的问题时，我们就可以忽略空间位置对结果的影响。
在这种情况下，对于任意物理量，我们可以忽略其随位置的变化，即$u(x,t) \approx u(t)$，这样，我们就可以不再考虑推迟势了。

我们定义一个物理量
$$
\varepsilon = \frac{D}{cT^*}
$$
用来表征时间尺度和空间尺度的关系。
$D$表示系统的空间大小；
$T^*$表示系统的特征时间，对于波就是其周期；
$c$表示真空中的光速。
当$\varepsilon \ll 1$时，就可以使用准静态假设了。

为了实现数量级的估算，我们规定：
- 对时间求导相当于除以特征时间；
- 对空间求导相当于除以系统大小。

这样，我们有：
$$
\Delta V \sim \frac{V}{D^2}
, \frac{\partial^2 V}{\partial t^2} \sim \frac{V}{ {T^*}^2 }
\implies \Delta V \gg \frac{1}{c^2} \frac{\partial^2 V}{\partial t^2}
$$

考虑有源状态下的达朗贝尔方程：
$$
\Delta V - \frac{1}{c^2} \frac{\partial^2 V}{\partial t^2} = - \frac{\rho}{\epsilon_0}
$$
从而，在准静态假设下，有
$$
\Delta V \simeq - \frac{\rho}{\epsilon_0}
$$
这与静电场下的电势相同。同理，有
$$
\Delta \vec A \simeq - \mu_0 \vec j
$$

### 电准静态与磁准静态

为了更进一步的研究准静态下的电磁场，我们需要研究麦克斯韦方程。
在电磁场理论中，电场与磁场、电荷密度与电流密度是对立统一的。
这启示我们，可以通过研究电场与磁场大小的数量级关系，来忽略其中的一项。
我们规定，对于物理量$x$，$\tilde x$表示其数量级。

定义
$$
\xi = \frac{\tilde j}{\tilde \rho c}
$$
来表示电场与磁场的大小关系。在满足准静态假设的前提下，
如果$\xi \ll 1$，那么称其为电静态，
如果$\xi \gg 1$，那么称其为磁静态。

在电准静态条件下，我们可以忽略磁场的变化，此时，麦克斯韦方程可写为
$$
\begin{aligned}
\nabla \cdot \vec E (M,t) & = \frac{\rho(M,t)}{\epsilon_0} \\
\nabla \cdot \vec B (M,t) & = 0 \\
\nabla \times \vec E (M, t) & = 0 \\
\nabla \times \vec B (M, t) & = \mu_0 \vec j (M, t) + \mu_0 \epsilon_0 \frac{\partial \vec E}{\partial t}(M, t)
\end{aligned}
$$
且电标势不再有关于磁矢势那一项。
注意第三项方程的变化，这表明在电准静态下，我们忽略了电磁感应效应。
电磁感应效率非常重要，因此我们通常不使用电准静态条件。

在磁准静态条件下，我们可以忽略电场的变化，此时，麦克斯韦方程可写为
$$
\begin{aligned}
\nabla \cdot \vec E (M,t) & = \frac{\rho(M,t)}{\epsilon_0} \\
\nabla \cdot \vec B (M,t) & = 0 \\
\nabla \times \vec E (M, t) & = - \frac{\partial \vec B}{\partial t}  (M, t)\\
\nabla \times \vec B (M, t) & = \mu_0 \vec j (M, t)
\end{aligned}
$$
注意第四项方程的变化。
我们注意到，旋度的散度为零，因此在此条件下，$\nabla \cdot \vec j = 0$。
特别的，在此条件下，可以使用毕奥-萨伐尔定律和安培环路定理。
特别注意，在磁准静态条件下，电标势仍然含有关于磁矢势那一项。
