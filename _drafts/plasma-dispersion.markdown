---
title: "等离子体中的色散"
categories: "波动物理"
---

本文中，我们将借助电磁波在等离子体中的传播理解波的色散。

## 电磁波在局部中性等离子体中的传播

等离子体或等离子态物体是高温下常见的一类物质的总称，其特点在于其中的相当一部分分子处于被电离的状态，因此具有良好的导电性。
本节我们将简单研究电磁波在一种等离子体模型下的传播。

### 稀等离子体模型

我们将研究最简单的等离子体模型：稀等离子体模型。
我们有五个基本假设：

1. 等离子体由等电荷的阳离子和电子组成，其中电子的密度为$n\_e$；
2. 在没有电磁波的情况下，等离子体保持局部的电中性，即体积元中的阳离子和电子个数相同；
3. 不考虑等离子体中粒子的相互作用；
4. 忽略阳离子和电子所受的重力，假设质量大的阳离子保持静止；
5. 电子的速度远小于光速。

#### 稀等离子体中的麦克斯韦方程

考虑稀等离子体中的麦克斯韦方程：
$$
\left\{
\begin{aligned}
    \vec \nabla \cdot \vec E & = \frac{\rho}{\varepsilon_0} = 0 \\
    \vec \nabla \cdot \vec B & = 0 \\
    \vec \nabla \times \vec E & = \frac{\partial \vec B}{\vec t} \\
    \vec \nabla \times \vec B & = \mu_0 \vec j + \mu_0 \varepsilon_0 \frac{\partial \vec E}{\partial t}
\end{aligned}
\right.
$$

如果我们假设这个波具有复数的形式，那么我们可以把方程放到复数域下：
$$
\left\{
    \begin{aligned}
        - i \vec k \cdot \vec{\underline E} &= 0 \\
        - i \vec k \cdot \vec{\underline B} &= 0 \\
        - i \vec k \times \vec{\underline E} &= - i \omega \vec{\underline B} \\
        -i \vec k \times \vec{\underline B} &= \mu_0 \vec{\underline j} + \frac{j \omega}{c^2} \vec{\underline E}
    \end{aligned}
\right.
$$

这能极大地简化我们的计算。

前两个等式说明等离子体中的电磁波依然是纵波，而后两个等式意味着我们需要求出等离子中的电流才能得出电磁场。

#### 等离子体中的电流与电磁场的联系

在局部电中性的等离子体中，电流密度和电场满足：
$$
\frac{\partial \vec j}{\partial t} = \frac{n_0 e^2}{m} \vec E
$$
{: .proposition}

对单个电子应用牛顿第二定律：
$$
\begin{aligned}
    m \frac{\mathrm d \vec v(x(t),t)}{\mathrm d t} &= -e \vec E \\
    m \left\lbrack \frac{\partial \vec v}{\partial t} + (\vec v \cdot \vec \nabla) \vec v \right\rbrack &= -e \vec E \\
\end{aligned}
$$
我们假设电磁场沿Z轴正方向传播，那么电子的速度只有XY方向的分量（因为电磁波是纵波），从而：
$$
(\vec v \cdot \vec \nabla) \vec v =
\begin{pmatrix}
    v_x \\ v_y \\ 0
\end{pmatrix}
\cdot
\begin{pmatrix}
    \frac{\mathrm d}{\mathrm d x} \\
    \frac{\mathrm d}{\mathrm d y} \\
    \frac{\mathrm d}{\mathrm d z}
\end{pmatrix}
\cdot
\begin{pmatrix}
    v_x \\ v_y \\ 0
\end{pmatrix}
= v_x \frac{\mathrm d v_x}{\mathrm d x} + v_y \frac{\mathrm d v_y}{\mathrm d y}
$$
在一个电子的尺度上，可以认为电磁场是均匀的，从而其速度与XY轴坐标无关，因此上式等于零。
带回前式，不难得到：
$$
m \frac{\partial \vec v}{\partial t} = -e \vec E
$$
注意到$\vec j = n\_0 e \vec v$，两边同时乘$e n\_0$即可得到原式。
{: .proof}

若电磁场是正弦波，那么有：
$$
\vec{\underline j}(M,t) = \underline \gamma \vec{\underline E}(M,t)
$$
其中
$$
\underline \gamma = - i \frac{n_0 e^2}{m \omega} = - i \varepsilon_0 \frac{\omega_p^2}{\omega}
$$
其中
$$
\omega_p = \sqrt{\frac{n_0 e^2}{m \varepsilon_0}}
$$
等离子体在电场下的表现和电导率为$\underline \gamma$的导体相同。
我们约定电场正比于$\exp i \omega t$，若更换这个约定，那么电导率也会变化。
{: .proposition}

将上一个方程置于复数形式下即可。
{: .proof}

### 克莱因-戈尔登方程

在中性的稀等离子体中，电场是满足以下传播方程：
$$
\Delta \vec E - \frac{1}{c^2} \frac{\partial^2 \vec E}{\partial t^2} = \frac{\omega_p^2}{c^2} \vec E
$$
这个方程称为克莱因-戈尔登方程。
{: .theorem}

我们知道，
$$\nabla \times \nabla \times \vec E = \vec \nabla \nabla \cdot \vec E - \Delta \vec E$$
从而对麦克斯韦-法拉第方程再取旋度，可得：
$$
\begin{aligned}
    RHS &= - \nabla \cdot \frac{\partial \vec B}{\partial t} = - \frac{\partial}{\partial t} \nabla \cdot \vec B \\
    &= - \frac{\partial}{\partial t} \left( \mu_0 \vec j + \mu_0 \varepsilon_0 \frac{\partial \vec E}{\partial t} \right) \\
    &= - \mu_0 \frac{n e_0^2}{m} \vec E - \mu_0 \varepsilon_0 \frac{\partial^2}{\partial t^2} \vec E \\
\end{aligned}
$$
从而：
$$
    - \vec \Delta \vec E = - \mu_0 \frac{n e_0^2}{m} \vec E - \mu_0 \varepsilon_0 \frac{\partial^2}{\partial t^2} \vec E
$$
移项即可。
{: .proof}

### 寻找行波解

局部中性的等离子体中谐行波的色散关系为：
$$
k^2 = \frac{\omega^2 - \omega_p^2}{c^2} \quad \omega_p^2 = \frac{n_0 e^2}{m \varepsilon_0}
$$
{: .proposition}

在复数形式下观察克莱因-戈尔登方程：
$$
\begin{aligned}
    &(-ik)^2 \underline{\vec E} - \frac{1}{c^2} (i \omega)^2 \underline{\vec E} = \frac{\omega_p^2}{c^2} \underline{\vec E} \\
    \implies & \frac{\omega^2}{c^2} - k^2 = \frac{\omega_p^2}{c^2}
\end{aligned}
$$
移项即可。
{: .proof}

我们称等离子体的折射系数满足：
$$
n^2 = 1 - \frac{\omega_p^2}{\omega^2}
$$
那么色散关系可写为：
$$
k^2 = n^2 \frac{\omega^2}{c^2}
$$
{: .definition}

#### 隐失波

当波的角频率小于$\omega\_p$时，电磁波不能在等离子体中传播，而是指数衰减至零且不传播任何能量，因此称为隐失波。
因此，等离子体可视为一个高通滤波器，其截止频率与本征频率$\omega\_p$相同。
{: .proposition}

注意到$k^2 = \frac{\omega^2 - \omega_p^2}{c^2}$，不难得出：
$$
k = j \sqrt{\frac{\omega_p^2 - \omega^2}{c^2}} = j \frac{\omega}{c} \sqrt{\frac{\omega_p^2}{\omega^2}-1}
$$
代入可得：
$$
\begin{aligned}
    \underline{\vec E} 
    &= \underline{\vec E_0} \exp \left\lbrack j(\omega t - \underline k z) \right\rbrack \\
    &= \underline{\vec E_0} \exp \left\lbrack j \omega t \right\rbrack \exp \left\lbrack - |k| z \right\rbrack \\
    \implies
    \vec E &= \vec E_0 e^{-|k|z} \cos \omega t
\end{aligned}
$$
{: .proof}

不难发现波的振幅是指数衰减的。
借鉴一阶系统或RC电路中的说法，我们称$\delta = - \frac{1}{|k|}$为等离子体的特征厚度。
若等离子体的实际厚度大于特征厚度，那么可认为电磁波不能穿过该等离子体。

值得注意的是，由于$k$是一个虚数，根据谐行波的结构关系：
$$
\underline{\vec B} = \frac{\underline{\vec k} \times \underline{\vec E}}{\omega}
$$
可以发现磁场总是比电场提前四分之一个波长，因此根据：
$$
\langle \vec \Pi \rangle = \frac{1}{2} \Re \left( \underline{\vec B^*} \times \underline{\vec E} \right)
$$
可知玻印廷矢量为零，波不传递能量。
因此所有能量要么被吸收了，要么被反射了。
