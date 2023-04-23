---
title: "等离子体中的色散"
categories: ["波动物理", "电磁学"]
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
因此，等离子体可视为一个*高通*滤波器，其截止频率与本征频率$\omega\_p$相同。
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

#### 非隐失波的结构关系

若$\omega > \omega_p$，那么这个波不再是隐失波，而能够在等离子体中正常传播。
但是，等离子体仍是色散的介质，因为$\omega$和$k$不是线性相关的。 \
此时，局部电中性的等离子体中的电场和磁场分别满足：
$$\vec E(M,t) \cdot \vec u = \vec B(M,t) \cdot \vec u = 0$$
且电场和磁场之间满足：
$$\vec B (M,t) = \frac{\vec k \times \vec E(M,t)}{\omega} = \frac{\vec u \times \vec E(m,t)}{v_\varphi}$$。
{: .proposition}

这些命题容易由计算验证。

## 波包在非吸收色散介质中的传播

本节中，我们将在色散但非吸收性的介质中研究一个波包（或波列）的传播。

### 两个频率相近的同振幅谐波

现在考虑两个频率相近的谐波的叠加：
$$\omega_1 = \omega_0 - \frac{\delta \omega}{2}, \, \omega_2 = \omega_0 + \frac{\delta \omega}{2}$$
那么新的波的振幅为：
$$
\begin{aligned}
    u(x,t) &= u_m \cos [\omega_1 t - k_{(\omega_1)}x] + u_m \cos [\omega_2 t - k_{(\omega_2)}x] \\
    &= 2 u_m \big( 
    \cos[(\omega_0 - \frac{\delta\omega}{2})t - (k - \frac{\mathrm d k}{\mathrm d \omega} \frac{\delta \omega}{2})x] \\ 
    &+ 
    \cos[(\omega_0 + \frac{\delta\omega}{2})t - (k + \frac{\mathrm d k}{\mathrm d \omega} \frac{\delta \omega}{2})x] \big) \\
    &= 2 u_m \cos (\omega_0 t - k_0 x) \cos (\frac{\delta \omega}{2}t - \frac{\mathrm d k}{\mathrm d \omega} \frac{\delta \omega}{2}x) \\
    &= 2 u_m \cos (\omega_0 t - k_0 x) \cos (\frac{\delta \omega}{2}(t - \frac{\mathrm d k}{\mathrm d \omega}x))
\end{aligned}
$$

不难发现，这个振幅具有两个不同的部分，一个部分具有非常显著的行波的特点，角频率为$\omega\_0$，波矢为$k\_0$，而另一个部分的频率非常的低，波矢为$\frac{\mathrm d k}{\mathrm d \omega}$。
实际上，正如调制的信号一样，后一个频率很低的波构成了这个波的包络，即波包。

波包的速度，即$\frac{\mathrm d \omega}{\mathrm d k}$，称为这个波的**群速度**。

### 更一般的波包

波包，或称波列，为一系列无穷多同向传播的平面谐波的叠加，这些平面谐波中主要的角频率非常接近$\omega\_0$：
$$u(x,t) = \Re [\underline{u}(x,t)]$$，其中
$$
\begin{aligned}
    \underline{u}(x,t) &= \int_0^\infty \underline A(\omega) \exp [j(\omega t - k(\omega) x)] \mathrm d \omega \\
    & \approx \int_{\omega_0 - \frac{\delta\omega}{2}}^{\omega_0 + \frac{\delta\omega}{2}}\underline A(\omega) \exp [j(\omega t - k(\omega) x)] \mathrm d \omega
\end{aligned}
$$
{: .definition}

#### 时域有限性

我们不加证明地给出以下性质：

根据傅里叶变换的性质，波包在时域上的长度$\tau$和在频域上的长度$\delta \omega$满足：
$$
\delta \omega \cdot \tau \approx 1
$$
{: .proposition}

#### 包络存在性

波包可由一个平面谐波乘一个包络$\underline{E}$表述：
$$
\underline{u}(x,t) \approx \exp [j (\omega_0 t - k_{(\omega_0)}x)] \underline{E}(x,t)
$$
{: .proposition}

$$
\begin{aligned}
    u(x,t) 
    &= \int_{\omega_0 - \frac{\delta \omega}{2}}^{\omega_0 + \frac{\delta \omega}{2}} \underline{A}(\omega) \exp [j(\omega t - k x)] \mathrm d \omega \\
    &= \int_{\omega_0 - \frac{\delta \omega}{2}}^{\omega_0 + \frac{\delta \omega}{2}} \underline{A}(\omega) \exp [j(\omega_0 t - k_0 x)] \exp [j((\omega - \omega_0)t - (k - k_0)x)] \mathrm d \omega \\
    &= \exp [j(\omega_0 t - k_0 x)] \int_{\omega_0 - \frac{\delta \omega}{2}}^{\omega_0 + \frac{\delta \omega}{2}} \underline{A}(\omega) \exp [j((\omega - \omega_0)t - (k - k_0)x)] \mathrm d \omega \\
    &= \exp [j(\omega_0 t - k_0 x)] \int_{\omega_0 - \frac{\delta \omega}{2}}^{\omega_0 + \frac{\delta \omega}{2}} \underline{A}(\omega) \exp [j(\omega - \omega_0)(t - \left. \frac{\mathrm d k}{\mathrm d \omega} \right|_{\omega = \omega_0} x)] \mathrm d \omega \\
    &= \exp [j(\omega_0 t - k_0 x)] \underline{E}(x,t)
\end{aligned}
$$
{: .proof}

### 波包的时变

波包由两个参数描述：\
相速度$v\_\varphi$：
$$
v_\varphi = \frac{\omega_0}{k(\omega_0)}
$$
和群速度$v\_g$：
$$
v_g = \left( \frac{\mathrm d \omega}{\mathrm d k} \right)
$$
{: .proposition}

若介质的群速度与频率无关，那么称这个介质是弱色散的，波包在其中传播时不会变形；
反之，则称这个介质是强色散的。

波包的相速度可以超过光速，但是群速度则不能。

## 任意角度入射电磁波的反射与透射

我们设垂直屏幕向内为X轴，界面的方向为Y轴，建立右手直角坐标系。
设入射电磁波在OYZ平面内，且其*在平面内偏振*，入射波所在的介质位于Z轴负半轴，其折射率为$n\_1$，透射波的为$n\_2$。
设入射角为$\theta\_1$，反射角为$\theta\_1^\prime$，透射角为$\theta\_2$。

我们设：
$$
\begin{aligned}
    \vec{\underline{E_i}} &= E_0 \exp [j (\omega t - \vec k_i \cdot \vec{OM})] \vec v_i \\
    \vec{\underline{E_r}} &= \underline{r} E_0 \exp [j (\omega t - \vec k_r \cdot \vec{OM})] \vec v_r \\
    \vec{\underline{E_t}} &= \underline{t} E_0 \exp [j (\omega t - \vec k_t \cdot \vec{OM})] \vec v_t
\end{aligned}
$$
根据我们的假设，$\vec v\_i, \vec v\_r, \vec v\_t$都在OYZ平面内。

根据几何关系，不难发现
$$
\vec k_i = \cos \theta \vec u_z + \sin \theta \vec u_y
$$
然后再根据磁场和电场的耦合关系，即结构关系，可得：
$$
\vec{\underline{B_i}} = \frac{n_1}{c} E_0 \exp [j(\omega t - \vec k_i \cdot \vec{OM})] \vec u_x
$$
同理，可以计算其他两个磁场，可得：
$$
\begin{aligned}
    \vec{\underline{B_i}} &= \frac{n_1}{c} E_0 \exp [j (\omega t - \vec k_i \cdot \vec{OM})] \vec u_x \\
    \vec{\underline{B_r}} &= - \underline{r} \frac{n_1}{c} E_0 \exp [j (\omega t - \vec k_r \cdot \vec{OM})] \vec u_x \\
    \vec{\underline{B_t}} &= \underline{t} \frac{n_2}{c} E_0 \exp [j (\omega t - \vec k_t \cdot \vec{OM})] \vec u_x
\end{aligned}
$$

根据电场在界面法向连续的特点，我们有：
$$\begin{multline}
    E_0 \exp[j(\omega t - \vec k_i \cdot \vec{OM})] \cos \theta_1 \\
    + \underline{r} E_0 \exp[j(\omega t - \vec k_r \cdot \vec{OM})] \cos \theta_1^\prime \\
    = \underline{t} E_0 \exp[j(\omega t - \vec k_t \cdot \vec{OM})] \cos \theta_2
\end{multline}$$
由于$\vec{OM}$可取界面上任何一点，我们可以得出：
$$\vec k_i \cdot \vec{OM} = \vec k_r \cdot \vec{OM} = \vec k_t \cdot \vec{OM}$$
从而有：
$$
\begin{aligned}
    k_i \sin \theta_1 = k_r \sin \theta_1^\prime &\iff \theta_1 = \theta_1^\prime \\
    k_i \sin \theta_1 = k_t \sin \theta_2 &\iff n_1 \sin \theta_1 = n_2 \sin \theta_2
\end{aligned}
$$
严格地讲，入射、反射和透射波的频率相等也是由这里推出的，但我们直接假设它们相等，从而略去了这里的证明。
最后，我们有：
$$\cos \theta_1 + \underline{r} \cos \theta_1^\prime = \underline{t} \cos \theta_2$$

同理，应用磁场连续的特点，我们有：
$$n_1(1-\underline{r}) = n_2 \underline{t}$$

代入，即可得：
$$\underline{r} = \frac{n_1 \cos\theta_2 - n_2 \cos\theta_1}{n_2\cos\theta_1 + n_1 \cos \theta_2}$$
这个关系称为*菲涅尔公式*。

如果电场不是在平面内偏振，而是沿X轴偏振，那么反射系数有所不同。

### 布儒斯特角

我们考虑反射系数等于零的特殊情况：
$$
\begin{aligned}
    r = 0 \iff n_1 \cos \theta_2 &= n_2 \cos \theta_1 \\
    \theta_1 &= \arccos [\frac{n_2}{n_1} \cos \theta_2] \le \frac{\pi}{2}
\end{aligned}
$$
若入射角恰好等于此角，那么不会出现反射光，这个角称为布儒斯特角。

如果入射光不是沿平面偏振的，那么反射光就不再是零。
相对地，此时入射光沿平面偏振的分量的反射光为零，因此反射光一定是垂直于入射面方向偏振的，所以这个角也称为起偏振角。
