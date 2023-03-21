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

### 声强与声能级

通常人耳能听到的声压约为$10^{-5}$至$100$帕斯卡。

我们定义，声波的玻印廷矢量的范数关于时间的平均数为**声强**，国际制单位为瓦特每平方米：
$$
I(M) = \langle \Vert \vec \Pi(M,t) \Vert \rangle
$$
这个物理量的对数称为**声能级**，单位一般取分贝：
$$
\mathcal I_{dB}(M) = 10 \lg \left( \frac{I(M)}{\Pi_0} \right)
$$
通常取$\Pi\_0 = 10^{-12}$瓦特每平方米。
{: .definition}

## 声波方程的解：三维平面谐波

### 波面与平面波

在电磁学中我们研究过平面波，此处加以复习：
- 若对波函数$\Psi(M,t)$存在一个表面使在任意固定的$t\_0$时间上该平面上的点的波函数的值相等，则称这个平面为**波面**。
- 若某个波的所有波面都是平面，那么称这个波为**平面波**，这些平面称为*波平面*。
- 平面波的所有波平面必须都是平行的，这些波平面的法向量称为波的*传递方向*。

任何形如：
$$
\Psi (M,t) = \Psi(\pm \vec{OM} \cdot \vec n - ct)
$$
的波函数都表示一个沿$\pm \vec n$传播的平面波。
{: .proposition}

### 平面谐波

**平面谐波**，或称**平面单色波**，是遵守以下形式的特殊的平面波：
$$
P(M,t) = p_m \cos (\omega t - \vec k \cdot \vec r + \varphi)
$$
如果这个波是矢量而非标量，那么其矢量的所有三个坐标必须遵守相同的形式，且$\omega$和$\vec k$相同。
{: .definition}

出于方便考虑，我们总是选择波的传播方向作为$X$轴，此时一个（标量）谐波可以写为：
$$
P(x,t) = p_m \cos (\omega t - k x + \varphi)
$$
其中$p_m$称为*振幅*。
这个函数对时间和空间都具有周期性，满足：
$$
\omega = 2 \pi f = \frac{2 \pi}{T}, \quad k = \frac{2\pi}{\lambda} = 2\pi \sigma
$$
其中$T$称为周期，$f$称为频率，$\omega$称为角频率；
$k$称为波矢，$\lambda$称为波长，$\sigma$称为波数。

#### 谐波的复数表示

我们可以用复数来表示一个谐波：
$$
\underline{p}(M,t) = \underline{p_m} \exp \left[ j (\omega t - \vec k \cdot \vec r) \right]
$$
其中：
$$
\underline{p_m} = p_m \exp (j \varphi)
$$
{: .proposition}

复数表示的优点在于任何求导和积分运算都被转换成多项式的乘除：
- 对时间求偏导相当于乘$j\omega$；
- 对一维坐标（设为$x$）求偏导相当于乘$- j k\_x$；
- 对标量波，求梯度相当于乘$-j \vec k$；
- 对矢量波，求散度相当于点乘$- j \vec k$，求旋度相当于在前面叉乘$-j \vec k$。

#### 色散关系

满足达朗贝尔方程的单色行波满足色散关系：
$$
\Vert \vec k \Vert = \frac{\omega}{c}
$$
{: .proposition}

### 解的性质与特点

#### 声波的结构关系

我们知道，对电磁波而言，电场波和磁场波相互耦合，因此其具有一定的结构关系。
对声波而言，声压与速度也具有耦合关系，因此也具有一定的结构关系。

若声压波$p_1$是平面谐波，那么速度波$\vec v_1$也是，且其传播方向共线且同向。
两者之间满足结构关系：
$$
\vec v_1 (M,t) = \frac{p_1(M,t)}{\mu_0 c} (\pm \vec n)
$$
{: .proposition}

这说明声压与速度同相且振幅成正比，并且由平面谐波描述的声波一定是横波，因为$\vec v_1$平行于$\vec n$。

只证明结构关系：
取
$$
\left\{ 
\begin{aligned}
    \mu_0 \frac{\partial \vec v_1}{\partial t} &= - \vec \nabla p_1 \\
    p_1 &= p_m \cos (\omega t \pm \vec k \cdot \vec x + \varphi) \\
    \vec v_1 &= v_m \cos (\omega t \pm \vec k \cdot \vec x + \varphi) \vec e_x
\end{aligned}
\right.
$$
第一个式子对时间求一阶偏导，然后代入后两个即可。
{: .proof}

#### 声阻抗

和电阻抗相同，若声波是平面谐波，那么我们也定义**声阻抗**：
$$
Z = \frac{p_1}{v_1}
$$
国际制单位为千克每平方米每秒。
{: .definition}

根据结构关系，立即可得：
- 若平面谐波的传播方向为正，那么$Z\_\oplus = \mu\_0 c = \sqrt{\frac{\mu\_0}{\chi\_s}}$；
- 若平面谐波的传播方向为负，那么$Z\_\ominus = - \mu\_0 c$。

水的声阻大约为1.6e6千克每平方米每秒，而空气的声阻抗仅有4.4e2千克每平方米每秒。
通常，固体的声阻抗略大于液体的，而液体的声阻抗远大于气体的。

#### 平面谐波声波的能量

若声波具有平面谐波的形式，那么其能量平分为振动动能和压缩势能。
其玻印廷矢量满足：
$$
\vec \Pi (M,t) = \frac{p_1^2(M,t)}{\mu_0 c} \vec n = c e(M,t) \vec n
$$
{: .theorem}

根据定义，其振动动能为$e\_c = \frac{\mu\_0}{2} v\_1^2$，而其压缩势能为$e\_p = \frac{\chi\_S}{2} p\_1^2$，代入结构关系即可得证。
玻印廷矢量满足：
$$
\begin{aligned}
    \vec \Pi &= p_1 \vec v_1 = \frac{p_1^2}{\mu_0 c} \vec n \\
    &= c \chi_S p_1^2 \vec n \\
    &= c (e_c + e_p) \vec n \\
    &= c e \vec n
\end{aligned}
$$
{: .proof}

## 声波方程的解：球面行波

具有以下形式的三维达朗贝尔方程的解称为**球面波**：
$$
p_1 (r,t) = \frac{f_\rightarrow(r-ct)}{r} + \frac{f_\leftarrow(r+ct)}{r}
$$
其中$\frac{f\_\rightarrow(r-ct)}{r}$称为从原点出发的*发散波*；
另一个称为*汇聚波*。
{: .definition}

我们在球坐标系下求解达朗贝尔方程：
$$
\begin{aligned}
    \Delta s - \frac{1}{c^2} \frac{\partial^2 s}{\partial t^2} &= 0 \\
    \frac{\partial^2 s}{\partial r^2} + \frac{2}{r} \frac{\partial s}{\partial r} - \frac{1}{c^2}\frac{\partial s}{\partial t^2} &= 0
\end{aligned}
$$
然后，我们使用$u = r \cdot s$进行换元，有：
$$
\begin{aligned}
    \frac{\partial^2}{\partial r^2} \left(\frac{u}{r} \right) 
    &= \frac{1}{r} \frac{\partial^2 u}{\partial r^2} - \frac{1}{r^2} \frac{\partial u}{\partial r} - \frac{1}{r^2} \frac{\partial u}{\partial r} + \frac{2}{r^3} u \\
    &= \frac{1}{r} \frac{\partial^2 u}{\partial r^2} - \frac{2}{r^2} \frac{\partial u}{\partial r} + \frac{2}{r^3} u \\
    \frac{2}{r} \frac{\partial}{\partial r}\left( \frac{u}{r} \right) 
    &= \frac{2}{r^2} \frac{\partial u}{\partial r} - \frac{2}{r^3}u
\end{aligned}
$$
两者代入方程可得：
$$
\frac{\partial^2 u}{\partial r^2} - \frac{1}{c^2} \frac{\partial^2 u}{\partial t^2} = 0
$$
从而$s = \frac{u}{r}$也是一组解，只要$u = r \cdot s$是达朗贝尔方程的解。
将行波解代入$u$即可发现$s$具有命题所述形式。
{: .proof}

### 球面行波声压对应的速度

若声压满足$p_1(r,t) = \frac{A_0}{r} \cos(\omega t - kr)$，那么速度满足：
$$
\vec v_1 (M,t) = \left[ \frac{A_0}{\mu_0 c r} \cos(\omega t - kr) + \frac{A_0}{\mu_0ckr^2} \sin(\omega t - kr) \right] \vec e_r
$$
这两项的前一项称为远场，后一项称为近场。
{: .proposition}

$$
\begin{aligned}
    \vec v_1 (M,t)
    &= \frac{1}{\mu_0} \int - \vec \nabla p_1 \mathrm d t \\
    &= - \frac{A_0}{\mu_0} \int \left[ - \frac{1}{r^2} \cos (\omega t-kr) + \frac{k}{r} \sin(\omega t-kr) \right] \mathrm d t \vec e_r \\
    &= - \frac{A_0}{\mu_0 r} \left[ -\frac{1}{\omega r}\sin(\omega t - kr) - \frac{k}{\omega} \cos(\omega t - kr) \right] \vec e_r + \cancel{\vec C} \\
    &= \frac{A_0}{\mu_0 r} \left[\frac{\sin(\omega t - kr)}{kcr} + \frac{\cos(\omega t - kr)}{c}\right] \vec e_r
\end{aligned}
$$
将两个项相除，能得到：
$$
\frac{\text{近场}}{\text{远场}} \sim \frac{\lambda}{2 \pi r}
$$
从而$r \ll \lambda$时近场其主导作用，而$r \gg \lambda$时反之。
{: .proof}

不难注意到，在远场下，平面谐波的结构关系*依然成立*，但在近场下则*不成立*。

### 平均功率

发散谐波通过同原点球面的平均功率与该球面的半径无关。
{: .proposition}

$$
I = \langle \vec \Pi \rangle = \langle \Vert p_1 \vec v_1 \Vert \rangle \approx \langle \Vert \frac{p_1^2}{Z} \vec e_r \Vert \rangle = \frac{A_0^2}{2r^2 Z}
$$
然后对球面的面积积分，不难发现结果与半径无关。
{: .proof}

## 法向入射声波的反射与透射

我们现在研究一维情况，设声波法向射入两个不同介质的界面，两个介质的声阻抗、密度和波速用下标不同的字母来表示。
设入射波的传播方向为$x > 0$，界面在$x = 0$处。
入射波、反射波和透射波的声压的复数形式如下：
$$
\begin{aligned}
    \underline{p_i}(x,t) &= \underline{p_{m,i}} \exp \left[ i (\omega t - k_1 x) \right] \\
    \underline{p_r}(x,t) &= \underline{p_{m,r}} \exp \left[ i (\omega t + k_1 x) \right] \\
    \underline{p_t}(x,t) &= \underline{p_{m,t}} \exp \left[ i (\omega t - k_2 x) \right] \\
\end{aligned}
$$
根据下文所述边界条件不难验证三个波的角频率一定相等。

### 边界条件

在界面处粒子速度和声压都是**连续的**：
$$
\vec v_A(0, t) = \vec v_B(0,t), \; p_A(0,t) = p_B(0,t)
$$
{: .proposition}

我们在界面两侧距离为$\varepsilon$处取两个平面，让这两个平面包围界面，然后使用物质守恒：
$$
\begin{aligned}
    \nabla \cdot \vec v &= - \frac{1}{\mu} \frac{\partial \mu}{\partial t} \\
    \iiint_S \nabla \cdot \vec v \mathrm d \tau &= - \iiint \frac{1}{\mu} \frac{\partial \vec v}{\partial t} \mathrm d \tau \\
    \iint_V \vec v \mathrm d \vec S &= - \iiint \frac{1}{\mu} \frac{\partial \vec v}{\partial t} \mathrm d \tau
\end{aligned}
$$
然后令$\varepsilon \to 0$，等式右边变为零，而左边只剩下对两个平面的积分：
$$
\iint \vec v \mathrm d \vec S = \vec v_B S_2 - \vec v_A S_1 = 0
$$
若两侧面积相等，则速度相等。
对于声压，由于我们假设位移非常微小，因此可将界面视为静止的。
对界面使用牛顿第二定律，取$\vec a = 0$即可得证。
{: .proof}

### 反射与透射系数

声压和速度的反射与透射系数定义为：
$$
\begin{array}{cc}
    \underline{r_{p, 1 \to 2}} = \frac{\underline{p_{m,r}}}{\underline{p_{m,i}}} & \qquad
    \underline{t_{p, 1 \to 2}} = \frac{\underline{p_{m,t}}}{\underline{p_{m,i}}} \\
    \underline{r_{v, 1 \to 2}} = \frac{\underline{v_{m,r}}}{\underline{p_{m,i}}} & \qquad
    \underline{t_{v, 1 \to 2}} = \frac{\underline{v_{m,t}}}{\underline{p_{m,i}}}
\end{array}
$$
（法向入射时）其值均为实数：
$$
\begin{array}{cc}
    {r_{p, 1 \to 2}} = \frac{Z_2 - Z_1}{Z_1 + Z_2} & \qquad
    {t_{p, 1 \to 2}} = \frac{2Z_2}{Z_1 + Z_2} \\
    {r_{v, 1 \to 2}} = \frac{Z_1 - Z_2}{Z_1 + Z_2} & \qquad
    {t_{v, 1 \to 2}} = \frac{2Z_1}{Z_1 + Z_2}
\end{array}
$$
{: .proposition}

根据边界条件，我们知道：
$$
\left\{
\begin{aligned}
    \underline{p_{m,i}} \exp [j \omega t] + \underline{p_{m,r}} \exp [j \omega t] &= \underline{p_{m,t}} \exp [j \omega t] \\
    \underline{v_{m,i}} \exp [j \omega t] + \underline{v_{m,r}} \exp [j \omega t] &= \underline{v_{m,t}} \exp [j \omega t] \\
\end{aligned}
\right.
$$
对所有$t$成立，从而它们的振幅满足：
$$
\left\{
\begin{aligned}
    \underline{p_{m,i}} + \underline{p_{m,r}} &= \underline{p_{m,t}} \\
    \underline{v_{m,i}} + \underline{v_{m,r}} &= \underline{v_{m,t}} \\
\end{aligned}
\right.
$$
然后代入
$$
\underline{v_{m,i}} = \frac{\underline{p_{m,i}}}{Z_1}, \;
\underline{v_{m,r}} = -\frac{\underline{p_{m,r}}}{Z_1}, \;
\underline{v_{m,t}} = \frac{\underline{p_{m,t}}}{Z_2}
$$
即可。
{: .proof}

不难发现当$Z\_1 > Z\_2$时，声压的反射系数为负数，这说明反射声压与入射声压相差半个相位。
当$Z\_1 = Z\_2$时，不发生反射，此时称为**阻抗匹配**。

### 反射与透射的能量

透射与反射的功率系数定义为：
$$
R_{1 \to 2} = \frac{\Vert \langle \vec \Pi_r (0, t) \rangle \Vert}{\Vert \langle \vec \Pi_i (0, t) \rangle \Vert}, \;
T_{1 \to 2} = \frac{\Vert \langle \vec \Pi_t (0, t) \rangle \Vert}{\Vert \langle \vec \Pi_i (0, t) \rangle \Vert}
$$
其值为：
$$
R = \left( \frac{Z_2 - Z_1}{Z_2 + Z_1} \right)^2, \quad T = \frac{4 Z_1 Z_2}{(Z_2 + Z_1)^2}
$$
{: .proposition}

我们知道$\Vert \vec \Pi \Vert = \frac{1}{2Z} p^2$，从而相除并代入反射或透射系数即可。
{: .proof}

不难注意到$R + T = 1$，这是因为界面不能储存能量，从而反射和透射的能量之和总是等于入射能量。
