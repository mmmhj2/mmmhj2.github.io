---
title: "传热学公式小结"
---

## 基本定义

*热通量*（Heat flux）是通过单位面积的热能，定义为
$$\vec \phi \, \mathrm d S = \mathrm d \vec \Phi$$
其中$\vec \Phi$是热功率矢量，国际单位为瓦特；热通量的国际单位为瓦特每平方米。
{: .definition}

热传递的方式可分为热传导、热对流和热辐射，根据以上三种热传递方式，可以写出任意物体的能量守恒定律的传热学表示。

任何物体的能量守恒可改写为
$$\dot Q + \Phi_\text{传导} + \Phi_\text{对流} + \Phi_\text{辐射} = \rho C \frac{\partial T}{\partial t}$$
其中$\dot Q$是其他来源导致的能量变化（如燃烧、做功等）。
{: .proposition}

如果将温度差视为势差，则可类比电阻给出热阻的定义。

*热阻*（Heat resistance）定义为温度差与热功率之比
$$R_T = \frac{\Delta T}{\Phi}$$
其国际单位制为开尔文每瓦特。
{: .definition}

## 热传导

热传导是最简单的热传递方式之一，其遵守傅里叶定律。

（傅里叶定律）热传导的热通量与温度具有以下关系
$$\vec \phi = - k \nabla T \iff \vec \Phi = - k S \nabla T$$
其中$k$是由物体决定的常量，称为热导率，国际制单位为瓦特每米每开尔文。
{: .proposition}

利用傅里叶定律，一维情形下热传导的等效热阻可以由以下方式计算。

一维热传导的热阻为
$$R_T = \int_z \frac{\mathrm d z}{kS}$$
{: .proposition}

特别地，对均质球壳，结果为
$$R_T = \frac{1}{4\pi k} \left( \frac{1}{r_1} - \frac{1}{r_2} \right)$$
对均质圆柱壳，结果为
$$R_T = \frac{\ln \dfrac{r_1}{r_2}}{2 \pi L k}$$

## 热对流

由于热对流通常涉及流固耦合的特点，该现象难以精确的定量研究。
在传热学中，我们通常使用经验公式——牛顿冷却定律——进行计算。

由热对流产生的热通量可用以下公式计算：
$$\phi = h \Delta T \iff \Phi = h S \Delta T$$
其中$h$是由实验确定的常数，称为传热系数，国际制单位为瓦特每平方米每开尔文。
{: .proposition}

该公式亦可用于进行热传导的近似。

## 热辐射

热辐射是唯一不需要介质的热传递方式，或者说，其介质就是电磁波。
实际上，光照就是一种特殊的热辐射。

物体的吸收率（也叫吸光率，Absorptance）、反射率（Reflectance）和透过率（也叫透光率，Transmittance）定义为
$$\alpha = \frac{\phi^\text{a}}{\phi^\text{i}}， \rho = \frac{\phi^\text{r}}{\phi^\text{i}}， \tau = \frac{\phi^\text{t}}{\phi^\text{i}}$$
即吸收、反射和透过的能量与入射的能量之比。
根据能量守恒定律，以上三者之和为一。
{: .definition}

一般物体对某波长的电磁波的吸收率、反射率和透过率与电磁辐射的波长有关。
但传热学通常只研究整个谱上的情况，因此一般认为它们都与波长无关。
若物体是均质的，则$\phi$可被替换为$\Phi$。

对于不透明（$\tau = 0$）的介质，其总的辐射等于其发射的能量减去吸收的能量，即
$$\phi^\text{R} = \phi^\text{e} - \phi^\text{a}$$

### 黑体辐射

黑体是一类特殊的物体——其吸收所有辐射，即$\alpha = 1$。
这种简单的模型有益于对热辐射进行研究。

黑体发射的能量遵守斯特藩-玻尔兹曼定律：
$$\phi_\text b^\text e = \sigma T^4$$
其中$\sigma = \frac{2 \pi^5 k^4}{15 c^2 h^3} \approx 5.67 \times 10^{-8}$称为斯特藩-玻尔兹曼常数。
{: .proposition}

黑体发射的辐射的能量谱遵守普朗克定律：
$$\phi_{\text b, \lambda}^\text e = \frac{c_1 \lambda^{-5}}{\exp \left( \frac{c_2}{\lambda T} \right) - 1}$$
其中
$$c_1 = 2 \pi h \frac{c_0^2}{n^2}, \quad c_2 = \frac{h c_0}{n k}$$
{: .proposition}

利用普朗克定律计算黑体辐射在指定频率之类的能量过于复杂，通常使用黑体辐射函数查表完成。

黑体辐射函数定义为
$$\tau(\lambda, T) = \frac{\int_0^\lambda \phi_{\text b, \lambda}^\text e \, \mathrm d \lambda}{\phi_\text b^\text e}$$
该函数通常按$\lambda \cdot T$列表，可从表中查出。
{: .definition}

利用黑体辐射函数，两个波长之间的黑体辐射为
$$\phi_{\text e, \lambda_1, \lambda_2}^e = [\tau(\lambda_1, T) - \tau(\lambda_2, T)] \sigma T^4$$

黑体辐射谱中能量最集中的波长可由维恩位移定律算出。

黑体辐射的峰值波长与黑体温度之积为常数：
$$\lambda_\max T = b$$
其中$b \approx 2.897 \times 10^{-3} \,\text{mK}$称为维恩位移常数。
{: .proposition}

### 灰体辐射

黑体是一个十分理想的模型，我们通过引入发射率的概念使其更接近现实情况。

发射率（Emissivity）定义为物体实际发射的辐射与黑体辐射之比：
$$\varepsilon(\lambda) = \frac{\phi^\text e_\lambda}{\phi_{\text b, \lambda}^e}$$
灰体是发射率与波长无关的物体。
{: .definition}

吸收率和发射率之间具有特别的关系，该关系称为基尔霍夫热辐射定律。

物体的吸收率和发射率相等，即
$$\varepsilon(\lambda) = \alpha(\lambda)$$
{: .proposition}

该定律是借助灰体证明的，但是对一般的物体都具有较好的近似效果。

### 视界因子

从一个物体发出的热辐射不一定总是能到达另一个物体，我们使用视界因子定量地表述该现象。

视界因子（View factor）是离开某物体并被另一物体接受的辐射与该物体发射的总辐射之比：
$$F_{i, j} = \frac{\Phi_{i \to j}}{\Phi_i^\text{p}} = \frac{\Phi_{i \to j}}{S_i \phi_i^\text{p}}$$
离开该物体的辐射一般是发射的辐射与反射的辐射之和。
{: .definition}

有两种显然的情况可直接计算出视界因子：
1. 若某物体$i$是凸的，则$F\_{i,i} = 0$；
2. 若物体$j$包裹了物体$i$，则$F\_{i,i} + F\_{i,j} = 1$

视界因子还具有两个可帮助计算的性质：加和性和互易性。

视界因子具有加和性，即
$$F_{1, 2+3} = F_{1, 2} + F_{1, 3}$$
然而
$$F_{1 + 2, 3} \textcolor{red}{\neq} F_{1, 3} + F_{2, 3}$$
{: .proposition}

视界因子具有互易性，即
$$S_1 F_{1, 2} = S_2 F_{2, 1}$$
{: .proposition}

### 辐照度

综合考虑以上所有因素，被不透明灰体$i$照射的物体$j$所受的热辐射为
$$\Phi = F_{i, j} S_i \big[\varepsilon_i \underbrace{\sigma T^4}_{\phi_i^\text e} + \underbrace{(1 - \varepsilon_i)}_{\rho_i} \phi_i^\text i \big]$$

有些时候，为了简化计算，我们直接使用一个变量来表述物体发出的所有辐射。

辐照度（Radiosity）是物体发出的辐射之总和，包括透过、反射和发射的辐射：
$$J = \phi^\text e + \phi^\text r + \phi^\text t$$
对不透明灰体，可写为
$$J = \varepsilon \underbrace{\sigma T^4}_{\phi_\text b^\text e} + (1 - \varepsilon) \phi^\text i$$
{: .definition}

现在，考虑两个互相辐射的灰体，注意到
$$\Phi_{i \to j} = A_i F_{i, j} (J_i - J_j)$$
我们可将$\Phi$类比为电流，$J$类比为电势，从而阻值为
$$R = \frac{1}{A_i F_{i,j}}$$
在处理多个灰体之间的相互辐射时，可使用这种类比来快速化简。

## 换热器

换热器是主要使用热传导和热对流进行热量交换的设备。
在换热器设计中，我们主要关心其效率，这可由热交换效率给出。

换热器的热交换效率定义为
$$U = \frac{1}{\Delta T} \frac{\mathrm d \Phi}{\mathrm d A}= \frac{\phi}{\Delta T}$$
即热阻率的倒数。
{: .definition}

为计算复杂换热器的效率，通常不直接使用温差来进行计算，而是使用对数均温差。

对数均温差（Logarithmic Mean Temperature Difference，LMTD）定义为
$$\Delta T_\text{LM} = \frac{\Delta T_\text{入口} - \Delta T_\text{出口}}{\ln \Delta T_\text{入口} - \ln \Delta T_\text{出口}}$$
这里的入口温差和出口温差是换热器一端的温差。
若换热器中处于逆流状态，则一种液体的入口和另一种流体的入口不一定位于同一端。
{: .definition}

利用对数均温差，换热器中的热量流动为
$$\Phi = U A F \Delta T_\text{LM}$$
其中$F$是校正系数，当换热器为双层对逆流式散热器或发生相变时该函数为一。
