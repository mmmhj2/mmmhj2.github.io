---
title: "哈密顿原理与简正模"
categories: ["结构力学"]
---

本文主要根据哈密顿原理研究简单结构的性质。

## 哈密顿原理

### 变分法

设$u(t)$为一函数，$\tilde u(t)$为在满足约束的前提下另一任意选择的函数，则函数$u(t)$的变分记为
$$\delta u(t) = \tilde u(t) - u(t)$$
此处满足约束通常指在制定过程的开始和结尾处，两函数相等
$$\tilde u(t_1) = u(t_1), \quad \tilde u(t_2) = u(t_2)$$
{: .definition}

根据变分的定义，我们有以下性质：

变分对于求导的交换性：
$$\frac{d}{d t} \delta u = \delta \frac{d}{dt} u = \delta \dot u,\quad \frac{d}{d x} \delta u = \delta \frac{d}{dx} u = \delta u'$$
变分对积分的交换性：
$$\delta \int_I F \, dx = \int_I \delta F \, dx$$
{: .proposition}

虚功原理是静力学中的一个重要原理，它指出，静力平衡的系统的虚功为零。
虚功即力在虚位移上的做功，用变分可写为：
$$\sum (m \ddot u_i - X_i) \delta u_i = 0$$
其中$m \ddot u\_i$为质点$i$所受惯性力，$X\_i$为外力。

### 哈密顿原理

<small>(哈密顿原理)</small> 一个物理系统在两个状态之间的真实轨迹由以下泛函的驻点给出：
$$S = \int_{t_1}^{t_2} \mathcal L [\mathbf q, \mathbf{\dot q}, t] \, dt$$
其中$\mathcal L$为拉格朗日量，在结构力学中通常考虑保守系统，且由于静平衡，外力的功总是零，因此其拉格朗日量为
$$\mathcal L = \mathcal T - \mathcal V_\text{总} = \mathcal T - \mathcal V_\text{内} + W_\text{外}$$
用变分的形式可写为
$$\delta \int_{t_1}^{t_2} \mathcal L [\mathbf q, \mathbf{\dot q}, t] \, dt = 0$$
{: .theorem}

哈密顿原理和拉格朗日方程都可以从虚功原理导出。

#### 哈密顿原理与运动方程

利用哈密顿原理可给出系统的运动方程：
$$ - \frac{d}{d t} \frac{\partial E_k}{\partial \dot q_n} + \frac{\partial E_k}{\partial q_n} + Q_n + F_n = 0, \quad \forall n$$
其中$E\_k$是动能，$Q\_n$是势能对应的广义力，$F\_n$是外力广义力。
{: .proposition}

注意到
$$\delta E_k = \sum_n \frac{\partial E_k}{\partial \dot q_n} \delta \dot q_n + \frac{\partial E_k}{\partial q_n} \delta q_n$$
交换哈密顿定理中变分和积分的位置，可得
$$
\begin{aligned}
0= \delta \int \mathcal L\, dt &= \int \delta E_k - \delta V + \delta W\, dt \\
&= \int \sum_n \frac{\partial E_k}{\partial \dot q_n} \delta \dot q_n + \frac{\partial E_k}{\partial q_n} \delta q_n + Q_n \delta q_n + F_n \delta q_n \, dt \\
&= \int \sum_n \frac{\partial E_k}{\partial \dot q_n} \delta \dot q_n + \left(\frac{\partial E_k}{\partial q_n} + Q_n + F_n \right)\delta q_n \, dt
\end{aligned}
$$
对$\delta \dot q$一项进行分部积分
$$\int_I \frac{\partial E_k}{\partial \dot q_n} \delta \dot q_n \, dt = \left. \frac{\partial E_k}{\partial \dot q_n} \delta q_n \right|_{t_1}^{t_2} - \int_I \frac{d}{dt} \frac{\partial}{\partial \dot q_n} E_k \delta q_n \, dt$$
我们要求变分在过程的开始与结束相等，因此消去右侧第一项，得到
$$\int_I \frac{\partial E_k}{\partial \dot q_n} \delta \dot q_n \, dt = - \int_I \frac{d}{dt} \frac{\partial E_k}{\partial \dot q_n} \delta q_n \, dt$$
代入原方程，可得运动方程的弱形式
$$ 0 = \int \sum_n \left(- \frac{d}{dt} \frac{\partial E_k}{\partial \dot q_n} + \frac{\partial E_k}{\partial q_n} + Q_n + F_n \right)\delta q_n \, dt$$
利用变分$\delta q$的任意性，得到对应的强形式
$$-\frac{d}{dt} \frac{\partial E_k}{\partial \dot q_n} + \frac{\partial E_k}{\partial q_n} + Q_n + F_n = 0$$
{: .proof}

#### 例子：弯曲梁的运动方程

设一横置、一端固定、另一端受向上的力$F\_0$、只发生弯折的二维梁的长度为$L$，试求其运动方程。<br/>
考虑欧拉-伯努利梁条件，设梁的纵向位移为$v(x, t)$，则其弯折角为
$$\omega \approx \tan \omega = \frac{\partial v}{\partial x}$$
单个横截面刚体内每一点的横向位移为
$$u(x,y,t) = - \omega y = - \frac{\partial v}{\partial x}$$
从而应变和应力为
$$\epsilon = \frac{\partial u}{\partial x} = - y \frac{\partial^2 v}{\partial x^2}, \quad \sigma = E \epsilon =  E y \frac{\partial^2 v}{\partial x^2}$$
而总的形变能为
$$V = \frac{1}{2} \int_0^L \int_\Omega \sigma : \epsilon \, d\Omega dx = \int_0^L E J \left( \frac{\partial^2 v}{\partial x^2} \right)^2\,dx$$
也可直接使用之前求过的形变能公式。
动能容易求解：
$$E_k = \frac{1}{2} \int_0^L \rho S \dot v^2 \, d x$$
代入哈密顿方程，得到
$$
\begin{aligned}
0 & = \int_{t_0}^{t_1} \delta E_k - \delta V + \delta W \, dxdt \\
&= \int_{t_0}^{t_1} \int_0^L \rho S \delta (\dot v^2) \, dx  + \int_0^L EJ \delta \left( \frac{\partial^2 v}{\partial x^2} \right)^2 \,dx + F_0 \delta u(L, t) \, dt
\end{aligned}
$$
对于动能项，有
$$
\begin{aligned}
&\int_{t_0}^{t_1}\int_0^L \rho S \delta (\dot v^2) \, dtdx \\
=& \int_{t_0}^{t_1} \int_0^L \rho S \dot v \delta \dot v \, dtdx \\
=&\cancel{\left[ \int_0^L \rho S \dot v \delta v dx \right]_{t_0}^{t_1}} + \int_{t_0}^{t_1} \int_0^L \rho S \ddot v \delta v \, dxdt
\end{aligned}
$$
对于势能项，反复利用分部积分可得
$$
\begin{aligned}
& \int_{t_0}^{t_1}\int_0^L EJ \delta \left( \frac{\partial^2 v}{\partial x^2} \right)^2 \,dxdt \\
= & - \left[ \int_{t_0}^{t_1} EJ \frac{\partial^2 v}{\partial x^2} \delta \frac{\partial v}{\partial x} \, dt \right]_0^L  + \left[ \int_{t_0}^{t_1} EJ \frac{\partial^3 v}{\partial x^3} \delta v \, dt \right]_0^L \\ -
& \int_{t_0}^{t_1}\int_0^L EJ \frac{\partial^4 v}{\partial x^4} \delta v \, dx dt 
\end{aligned}
$$
合并同类项并利用变分的任意性，可得运动方程以及边界条件
$$
\begin{aligned}
EJ \frac{\partial^4 v}{\partial x^4} + \rho S \ddot v &= 0 & \text{(运动方程)} \\
EJ \frac{\partial^2 v}{\partial x^2} \delta (\frac{\partial v}{\partial x}) &= 0, \, x = 0 \\ -
EJ \frac{\partial^2 v}{\partial x^2} \delta (\frac{\partial v}{\partial x}) &= 0, \, x = L \\ -
EJ \frac{\partial^3 v}{\partial x^3} \delta v &= 0, \, x = 0 \\
(EJ \frac{\partial^3 v}{\partial x} + F_0) \delta v &= 0, \, x = L
\end{aligned}
$$
后四个方程进一步写为
$$
\begin{aligned}
\delta (\frac{\partial v}{\partial x}) (0, t) &= 0 & \text{(固连约束)} \\ -
EJ \frac{\partial^2 v}{\partial x^2} (L, t) &= 0 & \text{(力矩平衡)} \\
\delta v (0, t) &= 0 & \text{(固连约束)} \\ -
EJ \frac{\partial^3 v}{\partial x^3} (L, t) &= F_0 & \text{(外力)}
\end{aligned}
$$
{: .exampl}

## 简正模
