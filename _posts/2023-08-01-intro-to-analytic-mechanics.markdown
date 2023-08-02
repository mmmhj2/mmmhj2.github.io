---
title: "分析力学初步"
categories: ['理论力学']
---

## 动力学普遍方程

### 惯性力的定义

我们知道，一个质点的运动受牛顿第二定律的约束：
$$m \vec a = \vec F$$

从这个公式中不难发现，质点的质量和其加速度的数乘和力具有同样的量纲。
出于便利，我们可以把这个物理量当作力来考虑，称为**惯性力**（inertial force，也称假想力，fictitious force）。
这样，牛顿第二定律就可以写为：
$$\vec F - \vec F_\text{惯} = 0$$
从而对运动的质点的研究就可以和对平衡质点的研究统一起来。

惯性力不仅是对量纲的观察的产物，也是具有物理意义的。
举例来说，对非惯性系下平衡的物体，从惯性系下看去，它就像是受到了一个额外的力一样。

如果这个非惯性系仅在平动，那么惯性力是相当简单的，而若非惯性系在转动，则其惯性力比较复杂。
转动的质点具有径向加速度、科氏加速度和切向加速度三个转动有关的加速度，相对地，其惯性力具有离心力、科氏力和欧拉力三个分量。
设非惯性系以角速度$\vec \omega$转动，质点在*该参考系下*的位矢为$\vec r$，速度为$\vec v$，则有：

$$
\begin{array}{lcl}
\vec a_\text{径向} = \vec \omega \times (\vec \omega \times \vec r) & \iff & \vec F_\text{离心} = -m \vec \omega \times (\vec \omega \times \vec r) \\
\vec a_\text{科氏} = 2 \vec \omega \times \vec v & \iff & \vec F_\text{科氏} = -2m \vec \omega \times \vec v \\
\vec a_\text{切向} = \frac{\mathrm d \vec \omega}{\mathrm d t} \times \vec r & \iff & \vec F_\text{欧拉} = -m  \frac{\mathrm d \vec \omega}{\mathrm d t} \times \vec r 
\end{array}
$$

### 达朗贝尔原理

理解了惯性力后，达朗贝尔原理就呼之欲出了：

对单个质量为$m$的质点，其运动的每一个瞬时，作用与质点上的外力（包括主动力和约束力）与惯性力构成一组平衡力系，即：
$$\vec F + \vec F_\text{约} + \vec F_\text{惯} = 0$$
{: .theorem}

对有$n$个质点的质点系，其在运动的每一个瞬时，每一个质点都满足这一关系。
现在，利用质点系平衡的条件，我们知道质点系上的所有主动力，约束力和惯性力都构成平衡力系，从而：
$$
\begin{aligned}
\sum_{i=1}^n \vec F_i + \sum_{i=1}^n \vec F_{\text{约},i} + \sum_{i=1}^n \vec F_{\text{惯},i} = 0 \\
\sum_{i=1}^n \vec M_O (\vec F_i) + \sum_{i=1}^n \vec M_O (\vec F_{\text{约},i}) + \sum_{i=1}^n M_O(\vec F_{\text{惯},i}) = 0
\end{aligned}
$$

注意到质点系内力的主矢与主矩总是零，还可写为：
$$
\begin{aligned}
\sum_{i=1}^n \vec F_{\text{外},i} + \sum_{i=1}^n \vec F_{\text{惯},i} = 0 \\
\sum_{i=1}^n \vec M_O (\vec F_{\text{外}, i}) + \sum_{i=1}^n \vec M_O(\vec F_{\text{惯},i}) = 0
\end{aligned}
$$

像这种以达朗贝尔原理为基础，利用静力学手段求解动力学问题的方法，称为**动静法**。

### 虚功原理与动力学普遍方程

在研究静力学时，我们学习过**虚功原理**：

一个物理系统（质点系）处于*静态平衡*，当且仅当，所有施加的外力，经过*符合约束条件的虚位移*，所做的虚功的总和等于零：
$$\delta W = \sum \vec F_i \cdot \delta \vec r_i = 0$$
{: .theorem}

出于讨论方便，我们可以将外力和约束力区分开，从而将方程写为：
$$\delta W = \sum \vec F_i \cdot \delta \vec r_i + \sum \vec F_{C,i} \cdot \delta \vec r_i = 0$$

现在将惯性力插入方程中，即可得到用于任意物理系统的“虚功原理”，也称动力学普遍方程：

对一个有$n$个质点的质点系，其上所受力（主动力和约束力）和惯性力在任何符合约束条件的虚位移上所做的虚功为零：
$$\sum_{i=1}^n \vec F_i \cdot \delta \vec r_i + 
\sum_{i=1}^n \vec F_{\text{约},i} \cdot \delta \vec r_i + 
\sum_{i=1}^n \vec F_{\text{惯},i} \cdot \delta \vec r_i = 0$$
若该质点系受双边理想约束，即约束力在任何虚位移上的虚功均为零，那么：
$$\sum_{i=1}^n \vec F_i \cdot \delta \vec r_i +  
\sum_{i=1}^n \vec F_{\text{惯},i} \cdot \delta \vec r_i = 0$$
这一方程称为**动力学普遍方程**。
{: .theorem}

质点系受双边理想约束（即约束力的虚功为零）是分析力学的基本假设之一。

## 第二类拉氏方程

动力学普遍方程是求解动力学问题的有力工具，然而，其中的变分法产物——虚位移——仍具有很大的不确定性，拉氏方程解决了这一问题。

### 从动力学普遍方程的推导

动力学普遍方程可被拆分为直角坐标形式：
$$\sum_{i=1}^n [(F_{i,x} - m_i a_{i,x}) \delta x_i + (F_{i,y} - m_i a_{i,y}) \delta y_i + (F_{i,z} - m_i a_{i,z}) \delta z_i] = 0$$
如果每个坐标轴上的变分都是独立的，那么这个方程可以很容易地改写到每个坐标轴上：
$$(F - ma) \delta x = 0$$
然后求解。
然而，由于质点的运动受到约束，每个质点在坐标轴上的变分不一定是独立的。

尽管如此，我们还是可以利用自由度的概念将动力学普遍方程改写为分立的方程，改写的成果就是拉氏方程。

#### 广义坐标与广义速度

设具有$n$个质点的、受到完整约束的质点系具有$k$个自由度，则其在任何时间，确定其所有质点位置的$3n$个坐标都可以由$k$个仅与时间相关的函数$q\_i(t)$表示：
$$
\left.
\begin{aligned}
x_i &= x_i (q_1, \dots, q_k, t) \\
y_i &= y_i (q_1, \dots, q_k, t) \\
z_i &= z_i (q_1, \dots, q_k, t)
\end{aligned}
\right\} \iff
\vec r_i = \vec r_i (q_1, \dots, q_k, t)
$$
这$k$个函数具有和空间坐标相似的功能，因此称为系统的**广义坐标**（generalized coordinate）。

现在对两边同时求全导数：
$$
\vec v_i = \dot{\vec r_i} = \frac{\partial \vec r_i}{\partial q_1} \dot q_1 + \cdots + \frac{\partial \vec r_i}{\partial q_k} \dot q_k + \frac{\partial \vec r_i}{\partial t}
$$
从而广义坐标对时间的导数具有和速度相似的功能，称为系统的**广义速度**（generalized velocity）。

若对两边同时求变分，则可得：
$$
\delta \vec r_i = \frac{\partial \vec r_i}{\partial q_1} \delta q_1 + \cdots + \frac{\partial \vec r_i}{\partial q_k} \delta q_k = \sum_{j=1}^k \frac{\partial \vec r_i}{\partial q_j} \delta q_j
$$
这能够用来表示系统的虚位移。

#### 改写动力学普遍方程

现在考察动力学普遍方程。

对于方程的第一项$\vec F_i \cdot \delta \vec r_i$，我们可以将其转化为$k$个仅和广义坐标相关的矢量的和。
记$Q\_j$为：
$$Q_j = \sum_{i=1}^n \left( F_{i,x} \frac{\partial x_i}{\partial q_j} + F_{i,y} \frac{\partial y_i}{\partial q_j} + F_{i,z} \frac{\partial z_i}{\partial q_j} \right)$$
则：
$$\sum_{i=1}^n \vec F_i \cdot \delta \vec r_i = \sum_{i=1}^n \left( \vec F_i \cdot  \sum_{j=1}^k \frac{\partial \vec r_i}{\partial q_j} \delta q_j \right) = \sum_{j=1}^k Q_j \delta q_j$$
显然$Q\_j$具有和力相似的功能，因此称为**广义力**。

然后考虑第二项：
$$
\begin{aligned}
\sum_i - m_i \vec a_i \cdot \delta \vec r_i 
&= \sum_i \left( - m_i \frac{\mathrm d \vec v_i}{\mathrm d t} \cdot \sum_j \frac{\partial \vec r_i}{\partial q_j} \delta q_j \right) \\
&= \sum_i \sum_j \left( -m_i \frac{\mathrm d \vec v_i}{\mathrm d t} \cdot \frac{\partial \vec r_i}{\partial q_j} \delta q_j \right) \\
&= \sum_i \sum_j \left[ -m_i \frac{\mathrm d}{\mathrm d t} (\vec v_i \cdot \frac{\partial \vec r_i}{\partial q_j}) + m_i \vec v_i \cdot \frac{\mathrm d}{\mathrm d t} \frac{\partial \vec r_i}{\partial q_j} \right] \delta q_j \\
&= \sum_i \sum_j \left[ -m_i \frac{\mathrm d}{\mathrm d t}(\vec v_i \cdot \frac{\partial \vec v_i}{\partial \dot q_j}) + m_i \vec v_i \cdot \frac{\partial \vec v_i}{\partial q_j} \right] \delta q_j \\
&= - \sum_i \sum_j \left[ \frac{\mathrm d}{\mathrm d t} \left( \frac{\partial \frac{1}{2} m_i \vec v_i \cdot \vec v_i}{\partial \dot q_j} \right) - \frac{\partial \frac{1}{2} m_i \vec v_i \cdot \vec v_i}{\partial q_j} \right] \delta q_j
\end{aligned}
$$

考虑到$\frac{1}{2} m\_i \vec v\_i \cdot \vec v\_i$之和为质点系的动能，我们记：
$$T = \sum_i \frac{1}{2} m_i \vec v_i \cdot \vec v_i$$
从而：
$$\sum_i - m_i \vec a_i \cdot \delta \vec r_i = \sum_j Q^*_j \delta q_j, \; Q_j^* = - \frac{\mathrm d}{\mathrm d t} \frac{\partial T}{\partial \dot q_j} + \frac{\partial T}{\partial q_j}$$

最后，动力学普遍方程可以写为：
$$\sum_{j=1}^k (Q_j^* + Q_j) \delta q_j = 0$$
注意到广义坐标之间是独立的，我们有：
$$Q_j^* + Q_j = 0 \iff \frac{\mathrm d}{\mathrm d t} \frac{\partial T}{\partial \dot q_j} - \frac{\partial T}{\partial q_j} = Q_j, \quad \forall j = 1, \dots, k$$

#### 结论

对自由度为$k$的受到完整双边理想约束的动力学系统，其运动方程具有以下形式：
$$\frac{\mathrm d}{\mathrm d t} \frac{\partial T}{\partial \dot q_j} - \frac{\partial T}{\partial q_j} = Q_j, \quad \forall j = 1, \dots, k$$
这个方程就称为**第二类拉格朗日方程**，简称拉格朗日方程。
{: .theorem}

这个方程也可以使用泛函分析中的欧拉-拉格朗日方程来非常快捷地得到——实际上，拉格朗日方程就是欧拉-拉格朗日方程在分析力学中的复述。

值得注意的是，拉氏方程中只有主动力和广义坐标表述的运动状态，即相空间中的状态。
注意到约束力总是和约束成对出现，如果需要求约束力，则可以解除约束，然后将约束力当作主动力来求解。

### 有势力与拉格朗日量

如果作用在质点系上的所有主动力均为有势力，那么我们记系统的势能函数为：
$$V = V(q_1, \dots, q_k, t)$$
显然，所有广义力都可以用势能函数的导数来表示：
$$Q_j = - \frac{\partial V}{\partial q_j}$$
注意到势能与广义速度无关，有：
$$0 = \frac{\partial V}{\partial \dot q_j}$$
代入原式，即可得：
$$\frac{\mathrm d}{\mathrm d t} \left[ \frac{\partial (T-V)}{\partial \dot q_j} \right] - \frac{\partial (T-V)}{\partial q_j} = 0$$

我们定义$L = T - V$，称为系统的**拉格朗日量**（Lagrangian），则方程可写为：
$$\frac{\mathrm d}{\mathrm d t} \frac{\partial L}{\partial \dot q_j} - \frac{\partial L}{\partial q_j} = 0$$

进一步地，如果系统的主动力只是部分有势，那么可以将有势能的部分的广义力计入拉氏量中，而单独计算剩下的主动力的广义力。
这些广义力可以使用定义计算，也可以简单地取让广义力对应的广义坐标增大，而让其他广义坐标不变的虚位移$\delta q\_j$，然后求出所有非保守力在该方向上的虚功，则：
$$\delta W = Q_j \delta q_j \iff Q_j = \frac{\delta W}{\delta q_j}$$

## 拉氏方程的首次积分

现在我们希望从拉氏方程中寻找到一些守恒量。
在运动学中，常见的守恒量有动能和动量。
我们知道，在拉氏方程中，动能和拉格朗日量的作用相似，因此可以从拉氏量开始寻找守恒量。
守恒量就是关于时间不变的量，为了研究它们，我们需要对这个方程进行积分。

### 拉氏量的结构

我们知道，在拉氏方程中，拉氏量是动能和势能之差，为此，我们分别研究系统的动能和势能。
首先考虑系统的动能：

$$
\begin{aligned}
T &= \sum_i \frac{1}{2} m_i \vec v_i \cdot \vec v_i \\
&= \sum_i \frac{1}{2} m_i \left( \frac{\partial \vec r_i}{\partial q_1} \dot q_1 + \cdots + \frac{\partial \vec r_i}{\partial q_k} \dot q_k + \frac{\partial \vec r_i}{\partial t} \right) \cdot \left( \frac{\partial \vec r_i}{\partial q_1} \dot q_1 + \cdots \right)
\end{aligned}
$$
这个式子可以看作是关于广义速度的一个二次多项式，其中的二次、一次和常数项分别为：
$$
\begin{aligned}
T_2 &= \sum_{i=1}^n \frac{m_i}{2} \left( \sum_{j=1}^k \sum_{l=1}^k \frac{\partial \vec r_i}{\partial q_j} \frac{\partial \vec r_i}{\partial q_l} \dot q_j \dot q_l \right) = \mathbf{Q^\top A Q} \\
T_1 &= \sum_{i=1}^n m_i \left( \sum_{j=1}^k \frac{\partial \vec r_i}{\partial q_j} \frac{\partial r_i}{\partial t} \dot q_j \right) = \mathbf{BQ} \\
T_0 &= \sum_{i=1}^n \frac{m_i}{2} \frac{\partial \vec r_i}{\partial t} \cdot \frac{\partial \vec r_i}{\partial t} = C \\
\implies & T = T_2 + T_1 + T_0
\end{aligned}
$$
其中：
$$\mathbf{Q} = \begin{bmatrix} \dot q_1 \\ \vdots \\ \dot q_k \end{bmatrix}, \; \mathbf{A} \in \mathcal{M}_{k,k}, \; \mathbf{B} \in \mathcal{M}_{1,k}, \; C \in \mathbb{R}$$
值得注意的是，$\mathbf{A}, \mathbf{B}, C$实际上都是关于广义坐标和时间的函数。
若系统所受的约束为定常约束，则其位矢不显含时间$t$，从而其对时间的偏导数为零，因此系统的动能只含有二次项：
$$T = \mathbf{Q^\top A Q}$$

对势能而言，通常，势能只是时间和广义坐标的函数，而不显含广义速度，因此其对广义速度的偏导数为零。
从而现在我们可以将拉氏方程写成矩阵的形式：
$$ \mathbf{A \dot Q} + \mathbf{G} = \mathbf{0}, \; \mathbf{\dot Q} = \begin{bmatrix} \ddot q_1 \\ \vdots \\ \ddot q_n \end{bmatrix} $$
矩阵$\mathbf{A \dot Q} + \mathbf{G}$的每一行都表示一个广义坐标的方程。

现在，我们可以定义系统的守恒量：

若存在一个函数$F$，对方程的解$\mathbf{Q}$满足：
$$F(\dot q_1(t), \cdots, \dot q_k(t), q_1(t), \cdots, q_k(t), t) = K$$
其中$K$为常数，则称该函数为方程的一个**首次积分**。
{: .definition}

不难发现，首次积分表征了系统中的守恒量，因为其总是常数。

### 循环积分和能量积分

系统的首次积分相对难以寻找，然而对受理想约束的保守系统，一些特殊的首次积分是不难找到的，本节中将给出两个例子。

#### 循环积分

若拉氏量仅显含一部分广义坐标，而不显含另一部分（即偏导数为零），那么我们称不被显含的坐标为循环坐标，因为这种坐标通常和系统的旋转运动或周期运动相关。
具有循环坐标的系统有一种首次积分：*循环积分*。

现在，我们设一个自由度为$k$的系统具有$r$个循环坐标。
根据广义坐标选取的任意性，我们设循环坐标总是在下标靠后的位置，则其拉氏量可写为：
$$L = L(\dot q_1, \dots, \dot q_k, q_1, \dots, q_{k-r}, t)$$
现在代入拉氏方程，对循环坐标，可得：
$$\frac{\mathrm d}{\mathrm d t} \frac{\partial L}{\partial \dot q_j} = 0 \implies \frac{\partial L}{\partial \dot q_j} = C_j$$

显然，$p\_j = \frac{\partial L}{\partial \dot q\_j}$是一个守恒量，称为**广义动量**，因此，我们有以下命题成立：

循环坐标的广义动量守恒。
{: .proposition}

#### 能量积分

若拉氏量中不显含时间，那么有：
$$\frac{\mathrm d L}{\mathrm d t} = \sum_{j=1}^k \left( \frac{\partial L}{\partial q_j} \dot q_j + \frac{\partial L}{\partial \dot q_j} \ddot q_j \right)$$
若系统是保守系统，那么还有：
$$\frac{\mathrm d}{\mathrm d t} \frac{\partial L}{\partial \dot q_j} - \frac{\partial L}{\partial q_j} = 0$$
代入可得：
$$\frac{\mathrm d L}{\mathrm d t} = \sum_{j=1}^k \frac{\mathrm d}{\mathrm d t} \left( \frac{\partial L}{\partial \dot q_j} \dot q_j \right) \iff \frac{\mathrm d}{\mathrm d t} \left( \sum_{j=1}^k \frac{\partial L}{\partial \dot q_j} \dot q_j - L \right) = 0$$
从而也构成了一个守恒量。

求解方程，可得：
$$\sum_{j=1}^k \frac{\partial L}{\partial \dot q_j} \dot q_j - L = 2 T_2 + T_1 - (T_2 + T_1 + T_0 - V) = E$$
即
$$T_2 - T_0 + V = E$$
这表明系统的一部分能量是守恒的，这个能量称为*广义能量*，而这种守恒称为**广义能量守恒**。
对定常约束的系统，$T\_0 = 0$，广义能量守恒就是一般意义下的机械能守恒。

广义能量中的势能的物理意义是显然的。
考虑到广义速度和速度具有相似的功能，广义能量中的二次项也不难理解。
那么$T\_0$的物理意义是什么呢？

对旋转的系统，如果将离心力（惯性力的一种，参见上文的讨论）视为有势力，那么会产生额外的势能，这种势能在广义能量守恒中以$-T\_0$的形式出现，因此这个势能也叫*离心势能*。

## 第一类拉氏方程

我们知道，广义坐标的个数和自由度相等，因此广义坐标的选取和系统所受的约束有很大的关系。
此外，选取合适的广义坐标对系统的求解是有利的。
很多时候，我们很难直接从约束方程中得到最合适的广义坐标的选择，甚至很难得到约束方程，这个时候，我们可以放宽对拉氏方程中变量独立性的限制，得到第一类拉格朗日方程。

设$q\_1, \dots, q\_m$为一组选定的参数，系统的自由度为$k$，满足$k < m$。
这些参数满足$s=m-k$个独立的约束方程：
$$f_i (q_1, \dots, q_m, t) = 0 \implies \sum_{j=1}^m \frac{\partial f_i}{\partial q_j} \delta q_j = 0$$

按照和第二类拉氏方程完全相同的推导，我们可得：
$$\sum_{j=1}^m \left\{ Q_j - \left[ \frac{\mathrm d}{\mathrm d t} \frac{\partial T}{\partial \dot q_j} - \frac{\partial T}{\partial q_j} \right] \right\} \delta q_j = 0$$
然而，由于$\delta q\_j$并不独立，我们不能得到$m$个形式上非常简单的方程。

为了求解这个方程，我们可以首先尝试利用约束方程将$\delta q_j$用$k$个独立的坐标表示出来，代入方程，然后求解。

更简单地，注意到拉氏方程实际上是一个泛函的最优化方程，我们可以使用拉格朗日乘子法，将方程变为：
$$\sum_{j=1}^m \left\{ Q_j - \left[ \frac{\mathrm d}{\mathrm d t} \frac{\partial T}{\partial \dot q_j} - \frac{\partial T}{\partial q_j} \right] + \sum_{i=1}^s \lambda_i \frac{\partial f_i}{\partial q_j} \right\} \delta q_j = 0$$
然后求解：
$$\frac{\mathrm d}{\mathrm d t} \frac{\partial T}{\partial \dot q_j} - \frac{\partial T}{\partial q_j} = Q_j + \sum_i \lambda_i \frac{\partial f_i}{\partial q_j} \quad \forall j = 1,\dots,m$$
这种带有拉氏乘子的方程称为**第一类拉氏方程**。
不难注意到拉氏乘子和广义力具有相同的量纲，如果选取的约束方程合适，那么其正是某一个约束对应的约束力。

目前已知的有关力学系统的速度的约束都是关于速度线性的，其总可以写为：
$$\sum_{j=1}^m A_{kj}(q_1, \dots, q_m, t) \dot q_j + b_k (q_1, \dots, q_m, t) = 0, \quad k = 1, \dots, r$$
那么其对虚位移的约束可写为：
$$\sum_{j=1}^m A_{kj}(q_1, \dots, q_m, t) \delta q_j = 0$$
从而方程可写为：
$$\frac{\mathrm d}{\mathrm d t} \frac{\partial T}{\partial \dot q_j} - \frac{\partial T}{\partial q_j} = Q_j + \sum_i \lambda_i \frac{\partial f_i}{\partial q_j} + \sum_{k=1}^r \mu_k A_{kj} \quad \forall j = 1,\dots,m$$
