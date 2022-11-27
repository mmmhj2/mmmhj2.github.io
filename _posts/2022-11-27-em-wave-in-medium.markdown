---
layout: post
title: "介质中的电磁波"
categories: electromagnetism
date: 2022-11-27 19:40:00 +0800
--- 

Firefox浏览器不能正确渲染部分公式的下划线/上划线。
如果出现此情况，可以调整缩放等级或改用SVG渲染模式。
{: .remark}

我们已经知道，在真空中，电磁场之间满足麦克斯韦方程：
$$
\begin{aligned}
\nabla \cdot \vec E (M,t) & = \frac{\rho(M,t)}{\epsilon_0} \\
\nabla \cdot \vec B (M,t) & = 0 \\
\nabla \times \vec E (M, t) & = - \frac{\partial \vec B}{\partial t}  (M, t)\\
\nabla \times \vec B (M, t) & = \mu_0 \vec j (M, t) + \mu_0 \epsilon_0 \frac{\partial \vec E}{\partial t}(M, t)
\end{aligned}
$$
显然，现实当中电磁波并非总是在真空中传播。
日常生活中，无论是光、手机的蜂窝网络信号还是微波炉里的微波，都是在空气中传播的。
更特殊地，光在两种不同的介质之间传播时，还会发生散射现象。
这些现象显然并不能都由正空中的麦克斯韦方程组解释，因此我们需要研究不同介质中的麦克斯韦方程。

## 电介质对电磁场的响应

我们使用一个简单的模型，即极化模型，来描述电解质对电磁场的响应。

假设真空中有两块相对放置的电极板，分别带正负电，我们可以测量两者之间的电势差。
现在，向两块电极板之间插入一块玻璃，可以观察到两者的电势差下降了。
显然玻璃和真空的不同之处在于玻璃之中含有物质，因此我们可以说，物质受电场的影响，产生了一个相反的电场，才使得电势差下降了。
从分子的角度看，这可能是由于电子云和原子核的相对移动（电子极化）、极性分子取向性排列（取向极化）或正负离子分离（离子极化）导致的。

为了研究极化现象，我们定义一个物理量：**极化强度**。

设体积元$\mathrm d \tau$中的偶极矩之和为$\mathrm d \vec{p} (M,t)$，则极化强度矢量$\vec{P}(M, t)$定义为：
$$
\vec{P} (M, t) = \frac{\mathrm d \vec{p} (M,t)}{\mathrm d \tau}
$$
国际制单位为库仑每平方米。
{: .definition}

从而我们可以计算极化电荷的面密度$\sigma_P (M,t) = \vec{P} (M,t) \cdot \vec{n}$和体密度$\rho_P (M, t) = - \nabla \cdot \vec{P} (M,t)$。

更进一步地，我们定义**极化电流**：
$$
\vec {j_P} (M, t) = \frac{\partial}{\partial t} \vec{P} (M, t)
$$
其量纲与电流密度相同。
{: .definition}

## 电极化率

显然，电介质的极化和施加的外电场之间存在某种相关性。
在这里，我们只研究最简单的电介质：线性、均匀、各向同性的电介质。

- 线性电介质：电介质某处极化强度和和此处的外电场呈线性关系；
- 均匀电介质：电介质的极化强度和外电场之间的关系与电介质中的位置无关；
- 各向同性电介质：电介质的极化强度和外电场之间的关系和外电场的方向无关。

在这种情况下，极化强度和外电场强度之间的关系可写为：
$$
\vec {P} (M,t) = \epsilon_0 \chi_e \vec{E} (M, t)
$$
$\chi_e$为由材料决定的常数，即电极化率。

我们只研究对平面谐波的响应，此时电场和极化强度都可表示成复数形式。
从而有以下命题：

线性、均匀、各向同性的电介质对平面谐波的极化矢量由以下关系决定：
$$
\vec{\underline{P}} (M, t) = \epsilon_0 \underline{\chi_e} \vec{\underline E} (M, t)
$$
{: .proposition}

如果外电场是直线偏振的，那么极化矢量也是“直线偏振”的，而且两者之间存在一个相位差：
$$
\vec{\underline{P}} (M, t) = \epsilon_0 \left| \underline{\chi_e} \right| \vec{E_0} \cdot \mathrm{exp} \left[ j \left( \omega t - k x + \mathrm{arg}(\underline{\chi_e}) \right) \right]
$$

### 耦合电子模型与电极化率的计算

为了从理论上计算电极化率，我们采用一个简单的模型：耦合电子模型，其基本假设如下：
- 外电场限制为直线偏振的平面谐波；
- 只研究电子云的运动，忽略原子核的运动；
- 介质稀疏，电子云之间不存在相互作用，不考虑诱导偶极矩；
- 电子云受三个力：弹力$\vec{F} = - m \omega^2_0 \vec{r}$、摩擦力$\vec{F_f} = - m \Gamma \frac{\mathrm d \vec{r}}{\mathrm d t}$和洛伦兹力，其中洛伦兹力忽略磁场分量，且忽略电场在空间尺度上的变化（因为电子云很小）。

对**单个**电子云应用牛顿第二定律，计算并乘上电子密度即可得出$\underline{\chi_e}$和$\omega$，即电场角频率的关系。

$$
\underline{\chi_e}(\omega) = \frac{\omega_p^2}{\omega_0^2 - \omega^2 + j \Gamma \omega}, \omega_p = \sqrt{\frac{n_e e^2}{m \epsilon_0}}
$$
其中$\omega$为电场角频率，$n_e$为单位体积的电子个数，即电子密度，其他物理量的意义已在前文给出。
{: .proposition}

显然，电极化率是一个复数：
$$
\left\{
\begin{aligned}
\chi_e^\prime = & \Re(\underline{\chi_e}) = &\frac{\omega_p^2}{\omega_0^2} \frac{1-\frac{\omega^2}{\omega_0^2}}{(1-\frac{\omega^2}{\omega_0^2})^2 + \frac{\Gamma^2 \omega^2}{\omega^4}} \\
\chi_e^{\prime \prime} = & \Im(\underline{\chi_e}) = &-\frac{\omega_p^2}{\omega_0^2} \frac{\frac{\Gamma \omega}{\omega_0^2}}{(1-\frac{\omega^2}{\omega_0^2})^2 + \frac{\Gamma^2 \omega^2}{\omega^4}}
\end{aligned}
\right.
$$

除了模长和辅角以外，电极化率的虚部也有特殊的物理意义。
我们来计算一下极化电流的平均焦耳功率。
$$
\begin{aligned}
\left< \vec{P} \right> 
&= \left< \vec{j_P} \cdot \vec{E} \right> 
= \frac{1}{2} \Re \left< \underline{\vec{j_P}} \cdot \underline{\vec{E^*}} \right> \\
&= \frac{1}{2} \Re \left< \frac{\mathrm d \underline{\vec{P}}}{\mathrm d t} \cdot \underline{\vec{E^*}} \right> 
= \frac{1}{2} \Re \left< j \omega \underline{\vec{P}} \cdot \underline{\vec{E^*}} \right> \\
&= \frac{1}{2} \Re \left< j \omega \epsilon_0 \underline{\chi_e} \underline{\vec{E}} \cdot \underline{\vec{E^*}} \right> \\
&= \frac{1}{2} \omega \epsilon_0 \left| \underline{\vec{E}} \right|^2 \Re \left< j \underline{\chi_e} \right> \\
&= - \frac{1}{2} \omega \epsilon_0 \left| \underline{\vec{E}} \right|^2 \Im \left< \underline{\chi_e} \right> 
\end{aligned}
$$
可以看出，电极化率的虚部表征了因极化而被吸收的电功率。

$\underline X^*$表示复数的共轭。
{: .remark}

如果电介质中存在多种极化，那么其电极化率就是多种极化的电极化率之和。
比如对于水来说，其电极化率的虚部有三个峰，分别在微波、红外和紫外区。
对于可见光，水的电极化率的虚部很小，因此我们说水对于可见光是**透明**的。

## 电介质下的麦克斯韦方程

我们将电荷分为自由电荷和极化电荷，同理将电流分为自由电流和极化电流，然后带入麦克斯韦方程。
$$
\begin{aligned}
\nabla \cdot \vec E (M,t) & = \frac{\rho_{\text{自由}}(M,t)+\rho_{\text{极化}}(M,t)}{\epsilon_0} \\
\nabla \cdot \vec B (M,t) & = 0 \\
\nabla \times \vec E (M, t) & = - \frac{\partial \vec B}{\partial t}  (M, t)\\
\nabla \times \vec B (M, t) & = \mu_0 \left( \vec j_{\text{自由}} (M, t) + \vec j_{\text{极化}} (M, t) \right) + \mu_0 \epsilon_0 \frac{\partial \vec E}{\partial t}(M, t)
\end{aligned}
$$
再将极化电流和极化体电荷密度的表达式带入并化简，即可得到：
$$
\begin{aligned}
\nabla \cdot (\epsilon_0 \vec E+ \vec {P} ) & =  \rho_{\text{自由}} \\
\nabla \cdot \vec B & = 0 \\
\nabla \times \vec E  & = - \frac{\partial \vec B}{\partial t} \\
\nabla \times \vec B  & = \mu_0 \vec j_{\text{自由}} + \mu_0 \frac{\partial}{\partial t} \left( \epsilon_0 \vec E + \vec P \right)
\end{aligned}
$$
现在我们定义**电位移矢量** $\vec D = \epsilon_0 \vec E + \vec P$，则该方程组可进一步化简：
$$
\begin{aligned}
\nabla \cdot \vec D & =  \rho_{\text{自由}} \\
\nabla \cdot \vec B & = 0 \\
\nabla \times \vec E  & = - \frac{\partial \vec B}{\partial t} \\
\nabla \times \vec B  & = \mu_0 \vec j_{\text{自由}} + \mu_0 \frac{\partial}{\partial t} \vec D
\end{aligned}
$$
这就是电介质中的麦克斯韦方程。

我们继续考虑平面谐波这一特殊情况，此时麦克斯韦方程可写成复数形式。
我们在引入一个特殊的量，**相对介电常数**，则此方程组还可以进一步化简。

对于线性、均匀、各向同性的电介质中传播的平面谐电磁波，以下方程成立：
$$
\begin{aligned}
\nabla \cdot \underline{\vec E} &= \frac{\rho_{\text{自由}}}{\epsilon_0 \underline{\epsilon_r}} \\
\nabla \cdot \underline{\vec B} &= 0 \\
\nabla \times \underline{\vec E} &= - \frac{\partial \underline{\vec B}}{\partial t} \\
\nabla \times \underline{\vec B} &= \mu_0 \underline{\vec j}_{\text{自由}} + \mu_0 \epsilon_0 \underline{\epsilon_r} \frac{\partial \underline{\vec E}}{\partial t}
\end{aligned}
$$
其中$\underline{\epsilon_r} = 1 + \underline{\chi_e}$称为该电介质的相对介电常数。
{: .proposition}

### 理想电介质

类比在真空中的无源情况，我们寻求更进一步地简化此麦克斯韦方程，为此，我们引入理想电介质的概念：
如果线性、均匀、各向同性的电介质没有自由电荷和自由电流，那么称其为**理想**的。

对在理想电介质下的*平面谐波*，以下麦克斯韦方程成立：
$$
\begin{aligned}
\nabla \cdot \underline{\vec E} &= 0 \\
\nabla \cdot \underline{\vec B} &= 0 \\
\nabla \times \underline{\vec E} &= - \frac{\partial \underline{\vec B}}{\partial t} \\
\nabla \times \underline{\vec B} &= \mu_0 \epsilon_0 \underline{\epsilon_r} \frac{\partial \underline{\vec E}}{\partial t}
\end{aligned}
$$
{: .proposition}

类比真空中的达朗贝尔方程，我们也可以写出其传播方程：
$$
\begin{aligned}
\Delta \underline{\vec E} - \frac{\underline{\epsilon_r}}{c^2} \frac{\partial^2 \underline{\vec E}}{\partial t^2} &= \vec 0 \\
\Delta \underline{\vec B} - \frac{\underline{\epsilon_r}}{c^2} \frac{\partial^2 \underline{\vec B}}{\partial t^2} &= \vec 0 \\
\end{aligned}
$$

显然，这个方程和真空中的达朗贝尔方程高度相似，但是只要$\underline \epsilon_r \neq 1$，其解就**并不具有平面谐波的形式**。
具体来说，这个方程的解的形式为：
$$
\underline{\vec{E}} (M, t) = \underline{\vec{E_0}} \cdot \mathrm{exp} \left[ j \left( \omega t - \underline{\vec{k}} \cdot \vec{r} \right) \right]
$$
并且也满足色散关系。

电介质中波的传播方程为：
$$
\underline{\vec{E}} (M, t) = \underline{\vec{E_0}} \cdot \mathrm{exp} \left[ j \left( \omega t - \underline{\vec{k}} \cdot \vec{r} \right) \right]
$$
其中$\underline{\vec k}$满足
$$
\underline{k}^2 = \underline{\epsilon_r} \frac{\omega^2}{c^2} \iff \underline{k}^2 = \left( \underline{n} \frac{\omega}{c} \right)^2
$$
$\underline{\epsilon_r}$为相对介电常数，$\underline n$为（复）折射率。
这一关系称为色散关系。
{: .proposition}

我们假设$\underline{\vec k} = \underline k \vec u = (k^\prime + j k^{\prime \prime}) \vec u$。
则在波的传播方程中进一步将其实部与虚部分开：
$$
\begin{aligned}
\underline {\vec E} 
&= \underline {\vec E_0} \cdot \mathrm{exp} \left[ j \left( \omega t - k^\prime \vec{u} \vec{r} - j k^{\prime \prime} \vec{u} \vec{r} \right) \right] \\
&= \underline {\vec E_0} 
\cdot \mathrm{exp} \underbrace{\left[ j \left( \omega t - k^\prime \vec{u} \vec{r} \right) \right]}_{\in \mathbb C}
\cdot \mathrm{exp} \underbrace{\left[ k^{\prime \prime} \vec u \vec r \right]}_{\in \mathbb R}
\end{aligned}
$$
可以看出，在$\Im (k) = 0$时这个波形式的解相当于一个平面谐波，但是其色散关系和真空中的不同。
而当$\Im (k) \neq 0$时，这个波的振幅会指数衰减。

此外，类比真空中，这个波也有结构关系。

电介质中的波满足：
$$
\begin{aligned}
\underline{\vec B} &= \frac{\underline{\vec k} \times \underline{\vec E}}{\omega} \\ \iff
\underline{\vec E} &= \frac{\underline{\vec B} \times \underline{\vec k}}{\mu_0 \epsilon_0 \underline{\epsilon_r} \omega}
\end{aligned}
$$
这个关系叫做波的结构关系。如果对左右两边取实部，这个关系不再成立，除非$\underline k$的虚部为零。
{: .proposition}

对这种电磁波，其玻印廷矢量为：
$$
\begin{aligned}
\left< \vec \Pi \right> 
&= \frac{1}{\mu_0} \left< \vec E \times \vec B \right> \\
&= \frac{1}{2 \mu_0} \Re \left( \underline{\vec E} \times \underline{\vec B}^* \right) \\
&= \frac{1}{2 \mu_0} \frac{\Im(k)}{\omega} \left| \underline{\vec E} \right|^2 \vec u
\end{aligned}
$$

## 光学应用

我们将以上所有结论应用在光学上。

### 折射率

我们定义折射率为：
$$
\underline{n}^2 = \underline \epsilon_r = 1 + \underline \chi_e
$$
此时应用色散关系可将$\underline{\vec k}$写成折射率的函数：
$$
k^\prime = n^\prime(\omega) k_0, k^{\prime\prime} = n^{\prime\prime}(\omega) k_0
$$
其中$k_0 = \frac{\omega}{c}$

特别的，当$\left| \underline \chi_e \right| \ll 1$时，有$\sqrt{1 + \underline \chi_e} \approx 1 + \frac{1}{2} \underline{\chi_e}$，从而：
$$
\Re(\underline n) = 1 + \frac{1}{2} \Re(\underline \chi_e), \Im(\underline n) = \frac{1}{2} \Im(\underline \chi_e)
$$
其实部也叫折射率，虚部也叫吸收率。
虚部很小时，称$\omega$处在“透明区”，此时几乎不发生吸收；
否则称为“吸收区”。

### 柯西定律

我们考虑稀疏电介质的透明区，此时$\Im(\underline n) = 0, n = \Re(\underline n) = 1 + \frac{1}{2} \chi_e$。
只考虑可见光区，即$\omega \ll \omega_0$。
再假设$\Gamma \ll \omega_0$（对电子来说，$\Gamma \sim 10^8, \omega_0 \sim 10^{16}$）。

有 
$$
\begin{aligned}
n
&= 1 + \frac{\omega_p^2}{2 \omega_0^2} \left[ \frac{1-\frac{\omega^2}{\omega_0^2}}{\left( 1 - \frac{\omega^2}{\omega_0^2} \right)^2 + \frac{\Gamma^2 \omega^2}{\omega_0^4}} \right] \\
&= 1 + \frac{\omega_p^2}{2 \omega_0^2} + \frac{\omega_p^2}{\omega_0^4} \omega^2 \\
&= A + \frac{\omega_p^2}{\omega_0^4} \left( \frac{2 \pi c}{\lambda} \right)^2 \\
&= A + \frac{B}{\lambda^2}
\end{aligned}
$$
这一定理叫做柯西定律。
注意式子中的$\lambda$是真空中的。

当$\omega \ll \omega_0$时，折射率与真空波长满足以下关系：
$$
\eta = A + \frac{B}{\lambda^2}
$$
其中，$A,B$为两个与材料有关的常数。
{: .proposition}


### 塞内尔折射定律

以下三个定律合称为塞内尔折射定律。

- 反射光与入射光同处于入射平面之中，入射平面指入射光与法线所成平面；
- 入射光和反射光与法线的夹角大小相同；
- 若存在折射光，则其满足：
$$
n_1 \sin i_1 = n_2 \sin i_2
$$
注意角度为有向角。
{: .proposition}

证明比较复杂，此处略过。
