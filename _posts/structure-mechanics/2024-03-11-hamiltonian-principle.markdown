---
title: "哈密顿原理与模态"
categories: ["结构力学"]
tags: ["振动力学"]
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

在应用变分的任意性时，注意检查约束条件，只有在没有约束的情况下才能直接取得强形式。

#### 例子：弯曲梁的运动方程

设一横置、一端固定、另一端受向上的力$F\_0$、只发生弯折的二维梁的长度为$L$，试求其运动方程。<br/>
考虑欧拉-伯努利梁条件，设梁的纵向位移为$v(x, t)$，则其弯折角为
$$\omega \approx \tan \omega = \frac{\partial v}{\partial x}$$
单个横截面刚体内每一点的横向位移为
$$u(x,y,t) = - \omega y = - \frac{\partial v}{\partial x}$$
从而应变和应力为
$$\epsilon = \frac{\partial u}{\partial x} = - y \frac{\partial^2 v}{\partial x^2}, \quad \sigma = E \epsilon =  E y \frac{\partial^2 v}{\partial x^2}$$
而总的形变能为
$$V = \frac{1}{2} \int_0^L \int_\Omega \sigma : \epsilon \, d\Omega dx = \frac 1 2 \int_0^L E J \left( \frac{\partial^2 v}{\partial x^2} \right)^2\,dx$$
也可直接使用之前求过的形变能公式。
动能容易求解：
$$E_k = \frac{1}{2} \int_0^L \rho S \dot v^2 \, d x$$
代入哈密顿方程，得到
$$
\begin{aligned}
0 & = \int_{t_0}^{t_1} \delta E_k - \delta V + \delta W \, dxdt \\
&= \int_{t_0}^{t_1}  \frac 1 2  \int_0^L \rho S \delta (\dot v^2) \, dx  + \frac 1 2 \int_0^L EJ \delta \left( \frac{\partial^2 v}{\partial x^2} \right)^2 \,dx + F_0 \delta u(L, t) \, dt
\end{aligned}
$$
对于动能项，有
$$
\begin{aligned}
&\int_{t_0}^{t_1} \frac 1 2 \int_0^L \rho S \delta (\dot v^2) \, dtdx \\
=& \int_{t_0}^{t_1}\int_0^L \rho S \dot v \delta \dot v \, dtdx \\
=&\cancel{\left[ \int_0^L \rho S \dot v \delta v dx \right]_{t_0}^{t_1}} + \int_{t_0}^{t_1} \int_0^L \rho S \ddot v \delta v \, dxdt
\end{aligned}
$$
对于势能项，反复利用分部积分可得
$$
\begin{aligned}
& \int_{t_0}^{t_1} \frac 1 2 \int_0^L EJ \delta \left( \frac{\partial^2 v}{\partial x^2} \right)^2 \,dxdt \\
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
注意第一个和第三个方程，由于边界约束条件，不能直接取得强形式，只能说明变分为零。
{: .exampl}

## 模态

本章主要关注振动的模态，尤其是特征模态。

系统的*特征模态*（eigenmode）是齐次方程的自由时间谐波解，具有
$$u(x,t) = \phi (x) \exp (i \omega t)$$
的形式。
{: .definition}

### 特征模态的表示

齐次系统的运动方程总是具有以下的形式：
$$
\begin{aligned}
D u & = - \rho \ddot u & \text{(强形式)} \\
\int_\Omega D u \cdot v \, d \Omega &= - \int_\Omega \rho \ddot u \cdot v \, d \Omega, \ \forall v & \text{(弱形式)}
\end{aligned}
$$
其中$D$是一个微分算子，以上文的弯曲梁为例，微分算子$D = \frac{EJ}{S} \frac{\partial^4}{\partial x^4}$。
对弱形式左侧应用分部积分，得到
$$
\cancelto{v(\partial \Omega) = 0}{\left[ (\int D u) \cdot v \right]_{\partial\Omega}} -
\int_\Omega (\int Du) \cdot \frac{\partial v}{\partial \Omega} \, d \Omega
$$
通过这种方式，我们总是可以将$Du$的导数阶数降低一阶，而时$v$的导数升高一阶，从而使得$u,v$的导数阶数相等。
此时，左边可写为$\int K \frac{\partial^n u}{\partial \Omega^n} \frac{\partial^n v}{\partial \Omega^n}$。
现在，令
$$B(u,v) = \int_\Omega K \frac{\partial^n u}{\partial \Omega^n} \frac{\partial^n v}{\partial \Omega^n} \, d \Omega, \quad (u,v) = \int_\Omega u\cdot v \, d \Omega$$
则原方程可写为
$$B(u,v) = - (\rho \ddot u, v), \quad \forall v$$
显然，$B(\cdot, \cdot)$和$(\cdot, \cdot)$是两个对称双线性形。
现在代入特征模态的定义，得到
$$B(\phi \exp (i \omega t), v) = \omega^2 (\rho \phi \exp (i \omega t), v)$$
注意到两边的积分和导数都是关于空间而非时间的，将时间项提出并消去，得到
$$B(\phi , v) = \omega^2 (\rho \phi, v)$$
根据这一表述，我们有特征模态的等价定义。

称有序对$(\phi, \omega)$是一个特征模态，若其满足
$$B(\phi , v) = \omega^2 (\rho \phi, v)$$
其中$B(\cdot, \cdot)$和$(\cdot, \cdot)$是两个由物体固有性质确定的对称双线性形。
{: .definition}

### 特征模态的性质

<small>(正交性)</small>两个不同的特征模态具有正交性，即
$$(\rho \phi_i, \phi_j) = (\rho \phi_j, \phi_i) = 0$$
{: .proposition}

利用定义，先令$v = \phi\_j$，得到
$$B(\phi_i, \phi_j) = \omega_i^2 (\rho \phi_i, \phi_j)$$
再令$v = \phi\_i$，得到
$$B(\phi_j, \phi_i) = \omega_j^2 (\rho \phi_j, \phi_i)$$
两等式相减，得到
$$0 = (\omega_i^2 - \omega_j^2) (\rho \phi_i, \phi_j)$$
从而$\omega\_i \neq \omega\_j$时，两者内积为零，因此正交。
{: .proof}

<small>(基底)</small>
特征模态的线性组合仍是原方程的解，归一化（$(\rho \phi, \phi) = 1$）的特征模态构成解空间的一组基底。
{: .proposition}

### 模态叠加

我们知道特征模态的构成了方程解的基底，因此无外力下的运动方程的任何解总是可以由其表出：
$$Du = - \rho \ddot u \implies u(x,t) = \sum_{i=0}^\infty q_i(t) \phi_i(x)$$
注意到特征模态的对应项中不含有时间，这意味着任何负载导致的动态变化均与特征模态无关，从而即使施加了额外的外力，新的解依然能由特征模态表出
$$Du = -\rho \ddot u + \textcolor{red}{f} \implies u(x,t) = \sum_{i=0}^\infty q_i(t) \phi_i(x)$$
然后，我们可以通过代入运动方程来求解系数$q\_i(t)$，从而解出受负载下的结构的响应。
通常情况下，将解代入原方程并利用特征模态的正交性，可使得原方程变为无穷个特征模态的系数方程，它们都具有如下形式
$$\ddot q_i + \omega_i^2 q_i = \underbrace{F_i}_\text{约束力} + \underbrace{f_i}_\text{外力}$$
这种分析方法称为模态叠加法（Modal synthesis）。

通常情况下，高频的特征模态对低频负载的响应影响极弱，因此可以通过只使用低频模态计算的方法降低运算复杂度并得到近似解，这种方法称为模态截断（Modal truncation）。

### 例子：拉压梁的特征模态

考虑一端固连、另一端附有一质点的只受拉压形变的梁。
设梁长度为$L$，质点质量为$M$，截面积为$S$，密度为$\rho$，杨氏模量为$E$。
试求其特征模态并验证其正交性，忽略重力。 </br>
设其轴向应变为$u(x,t)$，则动能为
$$E_k =\frac{1}{2} (\int_0^L \rho S \dot u^2 \, d x + M \dot u^2 (L, t))$$
势能为形变能与质点重力势能之和
$$V = \frac{1}{2} \int_0^L ES {u'}^2 \, dx$$
应用哈密顿原理，进行分部积分，可得运动方程以及边界条件：
$$
\begin{aligned}
ES u'' - \rho S \ddot u &= 0 \\
u(0, t) &= 0 \\
M \ddot u (L,t) + ES u'(L, t) &= 0
\end{aligned}
$$
其中$\circ'$表示对空间的偏导，$\dot \circ$表示对时间的偏导。
接下来使用分离变量法求解，且设时间解为谐波解
$$u(x,t) = X(x) \cdot T(t), \quad \ddot T(t) = - \omega^2 T(t)$$
我们主要关心空间解$X(x)$，可得方程及其边界条件为：
$$
\begin{aligned}
ES X'' + \rho S \omega^2 X &= 0 \\ -
M \omega^2 X(L) + ES X'(L) &= 0\\
X(0) &= 0 \\
\end{aligned}
$$
下面进行无量纲化，令$k^2 = \frac{\rho}{E} \omega^2, \mu = \frac{M}{\rho S L}$，重新整理，可得
$$
\begin{aligned}
X'' + k^2 X &= 0 \\
X'(L) - \mu k^2 L X(L) &= 0\\
X(0) &= 0 \\
\end{aligned}
$$
这是一个简单的二阶常系数齐次微分方程，且判别式为正，通解为
$$X(x) = A \cos k x + B \sin k x$$
代入第二个边界条件，易得$A = 0$，再代入第一个边界条件，得
$$B k \cos k L - B \mu k^2 L \sin k L = 0 \implies \tan kL = \frac{1}{\mu k L}$$
这就求出了所有特征模态的角频率（$k \to \omega$）。
特别地，在$\mu$趋近于零或无穷时，该方程有解析解。
以$\mu \to \infty$为例，有$\tan kL = 0$，从而
$$kL = \frac{\pi}{2} + n \pi \implies k_n = \frac{2n - 1}{2L} \pi$$
接下来验证模态的正交性，这就是说要找到满足正交性定义的对称双线性形式。
我们从运动方程开始，尝试构造出满足正交性的双线性形。
$$
\begin{aligned}
X_n'' + k^2_n X_n &= 0 \\
\int_0^L (X_n'' + k^2_n X_n) X_p \, d x &= 0\\
\int_0^L X_n'' X_p \, d x + \int_0^L k^2_n X_n X_p \, d x &= 0
\end{aligned}
$$
我们已经得到了两个双线性形式，但是其中一个是不对称的。
接下来考虑利用分部积分法重新分配导数的阶数，如同之前的定义中说明的一样。
$$
\begin{aligned}
& \int_0^L X_n'' X_p \, d x  \\
= & \left[ X_n' X_p \right]_0^L - \int_0^L X_n' X_p ' \, d x \\
= & X_n'(L) X_p(L) - X_n'(0) X_p(0) - \int_0^L X_n' X_p ' \, d x \\
= & \mu k^2 L X_n (L) X_p(L) - \int_0^L X_n' X_p ' \, d x
\end{aligned}
$$
从而原方程可全部变为对称的形式：
$$\mu k^2 L X_n (L) X_p(L) - \int_0^L X_n' X_p ' \, d x + \int_0^L k^2_n X_n X_p \, d x = 0$$
因此定义两个对称的双线性形式，其中一个具有微分形式：
$$
\begin{aligned}
B(f, g) &= \int_0^L f' g' \, d x \\
(f, g) &= \mu L f(L) g(L) + \int_0^L f g \, d x
\end{aligned}
$$
从而
$$B(X_n, X_p) - k_n^2 (X_n, X_p) = 0$$
交换$n, p$的位置，并将两方程相减，可得
$$(k_n^2 - k_p^2) (X_n, X_p) = 0 $$
从而
$$ (X_n, X_p) = 0 \iff n = p$$
因此正交性得到验证。
{: .exampl}
