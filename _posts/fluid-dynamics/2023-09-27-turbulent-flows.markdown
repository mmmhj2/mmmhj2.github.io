---
title: "湍流"
categories: ["流体力学"]
---

本章中，我们将主要研究湍流问题。

## 湍流的统计学表述

我们很难给湍流下一个严格的定义，尽管湍流有许多重要的特点。
这些特点中，最重要也是最明显的一点就是其随机性。
当我们需要从大量的随机性中寻找规律时，统计学就派上了用场，因此，大多数关于湍流的理论都是统计学理论，我们将研究这些理论中的一小部分。

### 统计学概述

我们使用频率学派的朴素概率论来为湍流进行建模，在这种体系下，可给出任意物理量的平均值（或称期望）的定义：

物理量$\varphi$的平均值定义为：
$$\overline \varphi(\vec x, t) = \lim_{N \to \infty} \frac{1}{N} \sum_{n=1}^N \varphi_n(\vec x, t)$$
其中$N$表示试验次数，$\varphi_n$表示第$n$次试验时测量的值。
{: .definition}

我们将所有物理量表述成*中心化随机变量*的形式，以速度（矢量场）和压强（标量场）为例：
$$\vec U(\vec x, t) = \overline{\vec U} (\vec x, t) + \vec u(\vec x,t), \; P(\vec x, t) = \overline{P}(\vec x, t) + p(\vec x, t)$$
注意此时我们使用大写字母$P$表示压强。

#### 均值算子

出于方便考虑，我们可以将求均值这一操作定义为一个算子：
$$\overline{\cdot}: \; x \mapsto \overline{x}$$
该算子是*线性*的，且与求导运算具有*交换性*：
$$
\def\pd#1#2{\frac{\partial #1}{\partial #2}}
\overline{\pd{\vec U}{t}} = \pd{\overline{\vec U}}{t}, \quad
\overline{\nabla \cdot \vec U} = \nabla \cdot \overline{\vec U}
$$

考虑作用于两个随机变量之积上的均值算子，有：
$$
\overline{VW} = \overline{(\overline{V} + v)(\overline{W} + w)} = \overline{\overline V \cdot \overline W} + \overline{\overline{V} w} + \overline{v \overline{W}} + \overline{v \cdot w}
$$
注意到$v$和$w$都是中心化随机变量，其均值为零；
此外，$\overline{V}$和$\overline{W}$都是数而非随机变量，因此对它们没有作用，我们可得：
$$\overline{VW} = \overline{V} \cdot \overline{W} + \overline{v \cdot w} = \overline{V} \cdot \overline{W} + \mathrm{Cov}(V,W)$$

### 均值的动能与黏性耗散

接下来我们研究均值视点下的黏性耗散。

首先将速度拆分：
$$\vec U(\vec x, t) = \overline{\vec U}(\vec x, t) = \vec u (\vec x, t)$$

然后对动能取平均：
$$
\frac{1}{2} \overline{\vec U \cdot \vec U} = \frac{1}{2} \overline{\vec U} \cdot \overline{\vec U} + \frac{1}{2} \overline{\vec u \cdot \vec u}
$$
注意到动能的平均比平均速度的动能多出一项。

对形变张量取平均：
$$
\frac{1}{2} \nu \overline{(\partial_j U_i + \partial_i U_j)^2} = \frac{1}{2} \nu (\partial_j \overline{U_i} + \partial_i \overline{U_j})^2 + \frac{1}{2} \nu \overline{(\partial_j u_i + \partial_i u_j)^2}
$$
这里也多出了一项。

这些多出的项都和随机变量$\vec u$有关，可以认为它们表征了湍流和平均状态的差异。

若将流体的速度写为中心随机变量的形式，则定义：
$$
\def\ol#1{\overline{#1}}
k = \frac{1}{2} \overline{\vec u \cdot \vec u}
$$
为*湍动能*（Turbulent kinetic energy）；
$$
\varepsilon = \frac{1}{2} \ol{(\partial_j u_i + \partial_i u_j)^2}
$$
为*平均湍流耗散*；
$$u^\prime = \sqrt{\frac{2}{3} k}$$
为*湍流特征速度*。
{: .definition}

从数学上讲，可认为湍动能是速度的方差，湍流特征速度是其标准差。
注意到我们认为速度（以及动能）在三个轴上均匀分布，因此在湍流特征速度中需要除以3。

### 能量级联

我们所使用的统计学模型来自前苏联数学家柯尔莫哥洛夫（А. Н. Колмого́ров），他既是公理化概率论的开创者，也是湍流最重要、最经典的数学模型——K41模型——的提出者。
这个模型中的一个重要概念就是湍流的能量级联。

该模型中，湍流中的漩涡具有不同的尺度。
最大的尺度和湍流的特征长度$L$同级，称为积分尺度或含能尺度；
最小的尺度由常数$\eta$确定，称为柯尔莫哥洛夫尺度或耗散尺度。
这湍流中的漩涡的尺寸可位于两个极端之间的任何位置。
两个尺度的比值由雷诺数确定，雷诺数越高，$\frac{L}{\eta}$越大。

我们已经知道，随着雷诺数的上升，湍流由层流逐渐失去稳定性而产生。
然而，湍流的维持和产生具有不同的机制。
在K41模型中，湍流通过能量由大尺度逐渐向小尺度转移而维持，在最小的尺度——耗散尺度下，湍流的能量逐渐消失。
按照这种理论，湍流中的漩涡会不断分裂成较小尺度，并使得能量一级一级传递下去，这种传地称为能量的*级联*（Cascade）。

我们只定性地描述这种级联，严格的定义与观察需要借助傅里叶变换在傅里叶空间下进行。

### 统计学定常

在统计学下，定常和均匀的概念也发生了变化：我们现在只关心统计学意义下的定常，而非随机变量在任意瞬时的定常。

称物理量$\varPhi$是*统计定常*的，若对于任意$T$，$\varPhi(\vec x, t)$和$\varPhi(\vec x, t + T)$具有相同的统计学特征（如均值、矩等）；
若对任意$\vec X$，物理量对应的中心随机变量$\varphi(\vec x, t)$和$\varphi(\vec x + \vec X, t)$具有相同的统计学特征，那么称其为统计均匀的。
{: .definition}

如果物理量是统计学定常的，那么我们可以定义其在时间上的均值：
$$\ol \varphi (\vec x) = \lim_{T \to \infty} \frac{1}{T} \int_0^T \varphi(\vec x, t) \mathrm d t$$
这可用来替代平均值的抽样的定义。

## 平均流动方程

对平均流动而言，其满足：
$$
\def\vU{\vec{U}}
\def\avU{\overline{\vec{U}}}
\left\{
    \begin{aligned}
    & \pd{\avU}{t} + (\avU \cdot \nabla) \avU = - \frac{1}{\rho} \nabla \ol{P} + \nu \nabla^2 \avU + \frac{1}{\rho} \nabla \cdot T \\
    &\nabla \cdot \avU = 0
    \end{aligned}
\right.
$$
其中$T\_{ij} = - \rho \overline{u\_i u\_j}$，称为*雷诺应力张量*（Reynolds stress tensor）。
{: .proposition}

对N-S方程两边取平均，可得：
$$
\begin{aligned}
\pd{\ol{U_i}}{t} + \overline{U_j \partial_j U_i} = - \frac{1}{\rho} \partial_i P + \nu \partial_{jj} \overline{U_i}
\end{aligned}
$$
注意到：
$$
\begin{aligned}
\overline{U_j \partial_j U_i} 
&= \overline{\partial_j (U_i U_j)} - \cancelto{\nabla \cdot \vec U = 0}{\overline{U_i \partial_j U_j}} \\
&= \partial_j \ol{U_i} \cdot \ol{U_j} + \partial_j \ol{u_i u_j} \\
&= \cancelto{\nabla \cdot \ol{U} = 0}{\ol{U_i} \partial_j \ol U_j} + \ol U_j \partial_j \ol U_i + \partial_j \ol{u_i u_j} \\
&= (\avU \cdot \nabla)\avU - \frac{1}{\rho} \nabla \cdot T
\end{aligned}
$$
代入原式即得证。
{: .proof}

### 黏性子层

在雷诺数极大的时候，除了在速度梯度极大，从而雷诺张量极大的位置，其他位置的黏性项均可忽略。
类比于附面层，进行分层也可用来解决这一问题。

在靠近边界的位置，存在平均速度的梯度极大的区域，这一区域称为**黏性子层**。

虽然定义类似，黏性子层的厚度远远小于附面层的。

### 布辛涅司克近似

雷诺应力张量的存在为平均流动方程的求解带来了很大困难。
类比牛顿流体，布辛涅司克提出了对雷诺张量进行近似的方法。

在布辛涅司克近似（Boussinesq approximation）下，雷诺应力张量可表示为：
$$T = - \rho {u^\prime}^2 \mathbf{I} + 2 \rho \nu_T \ol{D}$$
其中：
$$\ol{D_{ij}} = \frac{1}{2} (\partial_j \ol{U_i} + \partial_i \ol{U_j})$$
$\nu\_t$称为*湍流黏性*。
{: .proposition}

这种近似将雷诺应力类比于黏性应力，因此也称为*涡黏模型*。

在布辛涅司克近似下，平均流动方程可改写为：
$$
\left\{
    \begin{aligned}
    & \pd{\avU}{t} + (\avU \cdot \nabla) \avU = - \frac{1}{\rho} \nabla (\ol{P} + \rho {u^\prime}^2) + 2 \nabla \cdot ((\nu + \nu_T) D) \\
    &\nabla \cdot \avU = 0
    \end{aligned}
\right.
$$
{: .proposition}

尽管该近似符合物理直觉，且修改后的方程能够给出相当准确的结果，但不具有严格的理论证明，且实验表明，其预测的雷诺应力和实际的相距甚远。
该方程中的湍流黏性可根据实验结果进行调整，以得出更加准确的结果。

为使该模型闭合，我们需要写出$\nu\_T$满足的方程，这是$k - \varepsilon$模型的基础。

## 扰动与湍动能方程

将N-S方程与平均流动方程相减，我们可以得出描述中心化随机变量——即扰动——的方程。

流体速度的扰动满足：
$$
\def\vu{\vec{u}}
\def\avu{\ol{\vu}}
\left\{
\begin{aligned}
& \pd{\vu}{t} + \underbrace{(\avU \cdot \nabla) \vu + (\vu \cdot \nabla) \avU}_{\text{I}} + \underbrace{(\vu \cdot \nabla) \vu}_{\text{II}} + \underbrace{\ol{(\vu \cdot \nabla) \vu}}_\text{III} = - \frac{1}{\rho} \nabla p + \underbrace{\nu \nabla^2 \vu}_\text{IV} \\
& \nabla \cdot \vu = 0
\end{aligned}
\right.
$$
{: .proposition}

在该方程中，我们标明了四个部分。
其中，第一个部分表征平均流动对扰动的效应；
第二个部分表示扰动的动量对流；
第三个部分表示湍流雷诺应力的反作用力；
第四个部分表示黏性对湍流的作用。

不难发现，平均速度出现在了扰动的方程中，而扰动也出现在平均速度的方程中，这说明两者之间存在强烈的耦合关系。

### 湍动能方程

流体的湍动能$k$满足：
$$\pd{k}{t} + \avU \cdot \nabla k = \Pi + \varepsilon - \nabla \cdot \vec \phi$$
其中：
$$
\begin{aligned}
k &= \frac{1}{2} \ol{\vec u \cdot \vec u} \\
\Pi &= - \ol{u_i u_j} \partial_j \overline{U_i} \\
\varepsilon &= \frac{1}{2} \nu \ol{d_{ij} d_{ij}} \\
\phi_i &= \overline{\frac{1}{2} \left(u_j u_j + \frac{p}{\rho} \right) u_i} - \nu \overline{d_{ij} u_j} \\
d_{ij} &= \partial_j u_i + \partial_i u_j
\end{aligned}
$$
对于一个固定的控制体，其积分形式为：
$$\frac{\mathrm d}{\mathrm d t} \iiint_D k \mathrm d v = \iiint_D (\Pi - \varepsilon) \mathrm d v - \iint_S (k \avU + \vec \phi) \cdot \mathrm d \vec S$$
这个方程又称为k方程。
{: .proposition}

将扰动方程两边同时乘$\vec u$，然后取平均值即可，其中共有七项，我们逐一化简。
- 时间偏导项：
$$\ol{u_i \frac{\partial u_i}{\partial t}} = \frac{\partial}{\partial t} \ol{\frac{1}{2} u_i u_i} = \pd{k}{t}$$
- 压强项：
$$\ol{-\frac{1}{\rho} u_i \partial_i p} = - \frac{1}{\rho} \partial_i \ol{u_i p} = \partial_i (- \frac{1}{\rho} \ol{u_i p})$$
这一项变为$\nabla \cdot \vec \phi$的一部分。
- IV项：注意到
$$\frac{1}{2} \nu \partial_{jj} \ol{u_i u_i} = \nu \ol{ u_i \partial_{jj} u_i} + \nu \overline{\partial_j u_i \partial_j u_i}$$
因此有
$$\ol{\nu u_i \partial_{jj} u_i} = \nu \partial_{jj} \ol{u_i u_i} - \nu \overline{\partial_j u_i \partial_j u_i}$$
又因为
$$\ol{d_{ij} d_{ij}} = 2 (\ol{\partial_j u_i \partial_j u_i} + \ol{\partial_i u_i \partial_j u_j})$$
从而
$$\ol{\nu u_i \partial_{jj} u_i} = \frac{1}{2} \nu \ol{d_{ij} d_{ij}} - \nu \partial_i \overline{d_{ij} u_j}$$
第一项成为$\varepsilon$，第二项成为$\nabla \cdot \vec \phi$的一部分。
- $$\ol{\ol{U_j} u_i \partial_j u_i} = \ol{U_j} \partial_j (\frac{1}{2} \ol{u_i^2}) = \ol{U_j} \partial_j k$$
- $$\ol{u_i u_j \partial_j \ol{U_i}} = \ol{u_i u_j} \partial_j \overline{U_i}$$
这一项成为$\Pi$。
- $$\ol{u_i u_j \partial_j u_i} = \overline{u_j \partial_j (\frac{1}{2} u_i^2)} = \overline{\partial_j (\frac{1}{2} u_i u_i u_j)}$$
这一项成为$\nabla \cdot \vec \phi$的一部分，最后一步用到了$\nabla \cdot \vec u = 0$。
- $$\overline{u_i \partial_j \overline{u_i u_j}} = \overline u_i \cdot \partial_j \ol{u_i u_j} = 0$$
{: .proof}

对于均匀的情况，可简化为：
$$\frac{\mathrm d k}{\mathrm d t} = \Pi - \varepsilon$$
如果平均流动为零，则可进一步简化为：
$$\frac{\mathrm d k}{\mathrm d t} = - \varepsilon$$

利用布辛涅司克近似，可进一步将$\Pi$写成：
$$\Pi = - \ol{u_i u_j} \partial_j \ol{U_i} = 2 \nu_T \ol{D_{ij} D_{ij}}$$

### 平均耗散方程

和$k$方程类似，我们也能提出平均湍流耗散$\varepsilon$的方程：

湍流的平均耗散$\varepsilon$，定义为$$\varepsilon = \frac{1}{2} \nu \ol{d_{ij} d_{ij}}$$，满足：
$$\pd{\varepsilon}{t} + \ol{\vec U} \cdot \nabla \varepsilon = \frac{\varepsilon}{k} (C_1 \Pi - C_2 \varepsilon) - \nabla \cdot \vec{\varphi_\varepsilon}$$
其中
$$\vec \varphi_\epsilon = - \frac{\nu_T}{\sigma_\varepsilon} \nabla \varepsilon$$
{: .proposition}

这两个方程合起来组成了$k - \varepsilon$模型，这是湍流的数值模拟的重要基础。
