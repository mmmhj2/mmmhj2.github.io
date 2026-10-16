---
title: "量子力学的形式化表述"
categories: ["量子力学"]
---

本文主要介绍量子力学中的各种形式化表述。

## 量子力学公理

首先介绍量子力学的一些基本原理。

### 物理量与算子

为描述物理系统的状态，在量子力学中通常使用狄拉克记号（Bra-ket notation）来表示希尔伯特空间中的各种元素。

希尔伯特空间$H$中的向量表示物理系统的量子态，称为*右矢*（ket），记为$\vert \psi \rangle$；
而该空间上的连续线性泛函，即其连续对偶空间$H^\star$中的向量，则称为*左矢*（bra），记为$\langle \psi \vert$。
表示量子态的矢量简称为*态矢*。
这个希尔伯特空间通常是在一至三维欧几里得空间（取决于问题所研究空间的维数）上定义的勒贝格$ L^2(\mathbb R^n)$空间。
{: .definition}

根据狄拉克记号，要在空间上应用一个线性映射$A$，应当写为$A \vert x \rangle$，而要应用一个（半）双线性映射，则应当写为$\langle y \vert A \vert x \rangle$。

现在的问题是，这个希尔伯特空间中的右矢和左矢之间是否构成双射？
这就是说，给出一个左矢，是否一定能找到唯一的右矢，而给出一个右矢，又是否能找到唯一的左矢？
若不能，那么这个表示就不是良构的。
由于该空间装备有内积，从右矢到左矢的映射是显然的，而且一定是单射，仅需要利用内积构造这个变换：
$$
\Phi: H \to H^\star, \; \vert \psi \rangle \mapsto \langle \psi, \cdot \rangle.
$$
但是，该映射的满射性却不总是显然的。
对于有限维的内积空间，通过验证维数相等即可证明该映射是双射，这也叫做内积空间的典范同构（canonical isomorphism）。
但对于可积函数构成的无限维空间而言，这个结论并非显然。
幸运的是，只要这个内积空间是完备的，那么里斯表示定理（Riesz Representation Theorem）就保证了这一点；而根据定义，希尔伯特空间就是完备的内积空间。

应当注意，量子态所处的空间一般是波函数的空间，即平方可积的函数构成的希尔伯特空间，也就是上文中提到的勒贝格空间，因此其中的内积实际上是：
$$
\langle \psi \vert \phi \rangle = \int_{\mathbb R^n} \psi^*(\vec x) \phi(\vec x) \, \mathrm d \vec x, \quad (n = 1, 2, 3).
$$
勒贝格空间通常是无穷维的，而为了给出其中波函数坐标表示，也就是态矢，必须首先确定其基向量。
在量子力学中，所研究问题的基向量和欲研究的物理量有密切的联系。

量子力学中，所有可观测的物理量都由一个*可观测量*（Observable）表述。
可观测量是一个自伴线性算子，也称厄米算子。
与物理量有关的可观测量算子用$\hat \cdot$符号标记。
{: .proposition}

常见的可观测量有动量和哈密顿量，即：
$$\hat p = \frac{\hbar}{i} \nabla , \quad \hat H = \frac{\hat p \cdot \hat p}{2m} + V = - \frac{\hbar^2}{2m} \Delta + V$$
哈密顿量出现在薛定谔方程中：
$$i \hbar \frac{\partial}{\partial t} \psi (\vec r, t) = \hat H \psi (\vec r, t) = - \frac{\hbar^2}{2m}\nabla_r \psi (\vec r, t) + V \psi(\vec r, t)$$

在代数中，我们已经知道，厄米矩阵总是可以对角化，且其特征值均为实数。
这些特征值——也称本征值——在量子力学中具有重要的物理意义。

对任何物理量的测量结果只能是其对应的可观测量算子的特征值之一。
{: .proposition}

以哈密顿量为例，其特征值就是系统的能量的可能的取值。

有趣的一点是以上理论并非只能应用于量子力学中，也能应用于经典力学中。
这种方法称为经典力学的希尔伯特空间表述，其中最知名的是库普曼-冯诺依曼经典力学（Koopman-von Neumann classical mechanics）。

厄米矩阵既然可以对角化，则其特征向量组成希尔伯特空间的一组基底，因此具有重要的意义——这就是问题所研究的空间的基底向量。
若不加特殊说明，我们接下来用$\varphi\_n$来表示这些向量。

这些基底向量可以用来将问题中研究的波函数转化为态矢表示。
通常这些向量会被按能量从低到高的顺序进行编号，从而仅使用单个自然数就可以代表态矢，这种自然数被叫做量子数（quantum number）。

对于一些特殊的系统（通常是具有对称性的系统，例如之后要研究的类氢原子），其波函数可拆分成多个独立的波函数的乘积。
这种情况下，每个波函数都可以具有自己的态矢，从而具有自己的量子数；另一方面，由于对称性，对不同的波函数，其可观测量可能相同。
由于这些原因，有时需要多个量子数才能确定态矢对应的波函数。
以类氢原子为例，确定其波函数的量子数可达三个：主量子数，对应能量，即化学中所谓电子层；角量子数，对应角动量，化学中称为亚电子层；磁量子数，对应磁矩。
若考虑电子自旋则还需加上自旋量子数，但由于自旋一般不产生宏观效应，因此常常忽略这个量子数，尤其是化学研究中。

我们将在说明简并和对易可观测量完备集合时进一步说明这些问题。

### 概率与坍缩

首先定义简并的概念。

若可观测量的特征值的重数不均为一，则称该可观测量的特征值是*退化*的或*简并*的（Degenerate），重数称为该特征值的简并度（Degeneracy）。
{: .definition}

如果特征值的重数大于一，就说明一个特征值具有多个线性独立的特征向量，因此即使确定了该物理量，仍然不能确定该系统具体处于什么状态。
这样的状态在数学上称为退化，在物理中则称为简并。

物理量在测量后为某一特征值的概率为：
$$p_n = \sum_d \vert \langle \varphi_{n,d} \vert \psi \rangle \vert^2 = \sum_d \langle \varphi_{n,d} \vert \psi \rangle \langle \psi \vert \varphi_{n,d} \rangle$$
其中$d$为简并度，$\varphi\_{n,d}$为特征向量。
若该特征值不是简并的，则可简写为
$$p_n = \langle \varphi_{n} \vert \psi \rangle \langle \psi \vert \varphi_{n} \rangle$$
{: .proposition}

注意到特征向量组成希尔伯特空间的一组基底，任何状态向量可写为特征向量的线性组合：
$$\vert\psi\rangle = \sum c_{n,d} \vert \varphi_{n,d} \rangle$$
因此取得特征值的概率为
$$p_n = \sum \vert c_{n,d} \vert^2$$
非简并态的概率化简为
$$p_n = \vert c_n \vert^2$$

对物理量进行测量后，对应的波函数立刻被投影至测量出的特征值的特征空间中，这一现象称为*坍缩*（Collapse, Reduction）。
新的波函数为
$$\vert \psi' \rangle = \frac{\sum_d c_{n,d} \vert \varphi_{n,d} \rangle }{\sqrt{\sum_d \vert c_{n,d} \vert^2}}$$
其中$c_{n,d}$即位于该状态的概率。
非简并态下，新的波函数为
$$\vert \psi' \rangle = \vert \varphi_n \rangle$$
{: .proposition}

### 薛定谔绘景

量子力学中描述系统随时间变化的基本假设称为量子力学的*动力学绘景*。
根据使用的公设和研究对象的重点不同，有多种数学上等价的动力学绘景可用，这些绘景也是公设的一部分。
在我们的研究中主要使用薛定谔绘景（Schrödinger's picture）。

在薛定谔绘景中，系统的状态由态矢表示，态矢随时间流动而变化，而表示可观测量的算符则保持不变。
在此基础上，哈密顿算符为$\hat H$的系统的量子态随时间的变化由*薛定谔方程*完全描述：
$$\hat H \vert \psi(t) \rangle = i \hbar \frac{d}{d t} \vert \psi(t) \rangle$$
{: .proposition}

薛定谔方程还给出了概率流的表述。
利用概率流，我们可以给出量子力学中的连续性方程。
这个方程和薛定谔方程等价，但是具有和电磁学等其他物理学方向相同的表示形式。

设$\psi(\mathbf r, t)$为满足薛定谔方程的波函数，对应的概率密度为
$$
\rho(\mathbf r, t) = \vert \psi(\mathbf r, t) \vert^2,
$$
那么满足连续性方程
$$
\frac{\partial}{\partial t} \rho(\mathbf r, t) + \nabla \cdot \mathbf j(\mathbf r, t) = 0
$$
的矢量场$\mathbf j$称为该波函数的概率流。
{: .definition}

以无自旋的自由粒子为例，其波函数的概率流为
$$
\mathbf j = \frac{1}{2m} \left( \psi^\star \hat p \psi - \psi \hat p \psi^\star \right) = \frac{\hbar}{m} \Im(\psi^\star \nabla \psi).
$$

在电磁场中，我们通过界面上的连续性方程求解过界面的反射和透射系数。
利用概率流的连续性方程，我们也可以计算势垒的反射和透射系数。

## 狄拉克记号的计算
本节主要关注狄拉克记号下的各种计算。

### 算符的推导

在[之前的文章中]({% post_url wave/2023-06-06-introduction-to-quantum-mechanics %}#动量的分布)，我们简单地利用直觉推导了动量算符的表达式。
这里，我们将使用前文所述的公设进行更严谨的推导。

我们考虑一维情况下的位置$\hat x$和动量$\hat p$两个算符。
根据定义，位置和动量应该是它们的本征值，即
$$\hat x \vert x \rangle = x \vert x \rangle, \; \hat p \vert p \rangle = p \vert p \rangle. $$
这里$\vert x \rangle, \vert p \rangle$是不特定的特征向量（本征态）。
这两个算符不一定共享本征态，因此这两个特征向量不一定是相等的。
实际上，我们马上就会看到，这两个算符不共享特征空间。

我们断言任何波函数都是平面单色波的叠加。
对$n$维情况，有
$$
\psi(x) = \frac{1}{(2 \pi \hbar)^{n/2}} \int_{\mathbb R^n} \tilde \psi(p) \exp \left[ \frac{i}{\hbar} p \cdot x \right] \;\mathrm d p.
$$
这正是位置空间和向量空间之间的傅里叶变换，$\psi(x)$是位置表象的波函数、$\tilde\psi(p)$是动量表象的波函数。
我们设这个波函数的态矢为$\vert \psi \rangle$。
取右矢量是纯约定的，原则上也可规定为左矢，只需要对应地修改下面的推导。
从而有
$$
\psi(x) = \langle x \vert \psi \rangle, \; \tilde \psi(p) = \langle p \vert \psi \rangle.
$$
两种波函数的表征的态矢是一样的，它们只是在两个空间中的不同表征而已。
这样上述傅里叶变换可写为
$$
\langle x \vert \psi \rangle =  \int_{\mathbb R^n} \frac{\exp \left[ \frac{i}{\hbar} p x \right]}{(2 \pi \hbar)^{n/2}} \langle p \vert \psi \rangle  \;\mathrm d p.
$$
注意根据帕塞瓦尔定理，这个变换是酉同构，因此位置表象的和动量表象的波函数的确是同构的，指的是同一个空间中的同一个波函数。
数学上讲，可认为$\langle x \vert$和$\langle p \vert$是希尔伯特空间的“基底”，而$\vert \psi \rangle$是其中的抽象的元素，从而$\psi(x)$和$\tilde\psi(p)$都是这个元素的坐标表示。
关于这一点的更多内容，可参看装备希尔伯特空间（Rigged Hilbert Space, RHS）和盖尔范德三重偶（Gelfand Triple）。

考虑一维情况，对这个傅里叶关系两边同时对位置求导，得到
$$
\frac{\mathrm d \psi}{\mathrm d x} = \frac{1}{\sqrt{2\pi\hbar}} \int_{\mathbb R} \tilde\psi(p) \frac{ip}{\hbar} \exp \left[ \frac{ipx}{\hbar} \right] \mathrm d p.
$$

现在我们希望计算$\hat p$对任何波函数的作用。
我们知道算符$\hat p$是自伴的，因为其对应可观测量。
因此，我们断言算符$\hat p$可以利用谱定理进行展开，有
$$
\hat p \vert \psi \rangle = \int_{\mathbb R} \hat p \vert p \rangle \cdot \langle p \vert \psi \rangle \; \mathrm d p = \int_{\mathbb R} p \vert p \rangle \cdot \tilde\psi(p) \; \mathrm d p.
$$
这在物理上也叫做本征波函数展开。
本征函数展开的正确性可由泛函分析严格证明，但这远远超出了本文的讨论范围。

现在我们需要消去等式右侧的$\vert p \rangle$。
注意到利用本征波函数展开，有
$$
\begin{aligned}
\langle x \vert \psi \rangle 
&= \int_{\mathbb R} \langle x \vert p \rangle \langle p \vert \psi \rangle \; \mathrm d p \\
&= \int_{\mathbb R^n} \frac{\exp \left[ \frac{i}{\hbar} p x \right]}{\sqrt{2 \pi \hbar}} \langle p \vert \psi \rangle  \;\mathrm d p,
\end{aligned}
$$
从而
$$
\langle x \vert p \rangle = \frac{1}{\sqrt{2\pi\hbar}} \exp \left[ \frac{i}{\hbar} p \cdot x \right].
$$
这个式子实际上是上述傅里叶变换的“核函数”，承担了在位置和动量空间中转换的功能。

现在，将$\hat p \vert \psi \rangle$两边同时乘$\langle x \vert$，得到
$$
\begin{aligned}
\langle x \vert \hat p \vert \psi \rangle 
&= \int_{\mathbb R} p \langle x \vert p \rangle \cdot \tilde\psi(p) \; \mathrm d p \\
&= \frac{1}{\sqrt{2\pi\hbar}} \int_{\mathbb R} \exp \left[ \frac{i px}{\hbar} \right] p \tilde\psi(p) \; \mathrm d p. 
\end{aligned}
$$

将其与傅里叶变换的导数对比，即可得到
$$
\langle x \vert \hat p \vert \psi \rangle= \frac{\hbar}{i} \frac{\mathrm d}{\mathrm d x} \psi(x) = - i \hbar \frac{\mathrm d}{\mathrm d x} \langle x \vert \psi \rangle,
$$
注意到$\langle x \vert \hat p \vert \psi \rangle$就是将算符应用于位置表征的波函数上，写成波函数的形式，即有
$$\hat p \psi(x) = - i \hbar \frac{\mathrm d}{\mathrm d x} \psi(x),$$
这也叫做位置表象下的动量算符。

这个推导不使用除了平面单色波叠加之外的任何假设。
值得注意的是在单色波叠加这一假设上，我们人为规范了所有波的相位。
改变这个约定会连带改变动量表象波函数的形式，但不改变动量算符以及任何可观测的物理预言。
关于算符唯一性的更多内容，可参见斯通-冯诺伊曼定理。

从上面的讨论我们可以看出，量子力学中很多符合直觉的结论，其严格证明其实是相当复杂的，需要高等的数学背景并使用大量泛函分析中的结论。
因此，出于简单考虑，之后的讨论中我们将不再给出这么严格的说明了。

### 投影算符

向向量$\vert \varphi_n \rangle$投影产生投影向量的算子为
$$\vert \varphi_n \rangle \langle \varphi_n \vert$$
且
$$\sum_n \vert \varphi_n \rangle \langle \varphi_n \vert = \hat{\mathbb{1}}$$
{: .proposition}

考虑任意向量$\vert \psi \rangle$，向$\vert \varphi_n\rangle$投影并产生投影向量可表示为
$$\vert \varphi_n \rangle \langle \varphi_n \vert \psi \rangle$$
利用矩阵乘法的结合律即可得到投影向量算子。
注意到厄米算子的特征值构成了空间的一组基底，该算子的和就是全同映射。
{: .proof}

我们前面其实已经多次见到过投影算符了。
在介绍简并时出现的$\vert \psi \rangle \langle \psi \vert$和动量的本征波函数展开中使用的$\vert p \rangle \langle p \vert$，其实都是投影算符。

### 对易算符

通常情况下，两个算符的运算顺序是不能交换的，正如矩阵乘法一样。
如果两个算符对易，则代数中的结论告诉我们其必然含有至少一个相同的特征向量。
对于任何两个算符，我们都可以构造一个量来确定其对易性。

设$\hat A, \hat B$为两个算符，其*对易子*（commutator，也称交换子）定义为
$$[\hat A, \hat B] = \hat A \hat B - \hat B \hat A$$
显然，对易子为零的两个算符可对易，因此互相保持特征空间不变，并至少共享一组相同的特征基。
对易子为零的两个可观测量称为*相容的*（Compatible）可观测量。
{: .definition}

位移和动量的对易子为：
$$
\begin{aligned}
\forall \psi, \quad [\hat x, \hat p] \psi &= (\hat x \hat p - \hat p \hat x) \psi \\
&= x (\frac{\hbar}{i} \frac{\partial}{\partial x} \psi) - \frac{\hbar}{i} \frac{\partial}{\partial x} (x \psi) \\
&= i \hbar \psi
\end{aligned}
$$
从而
$$[\hat x, \hat p] = i \hbar \hat{\mathbb{1}}$$
{: .exampl}

### 对易可观测量完全集

设$(\hat A, \hat B, \cdots)$为一组两两可对易的算符，则其至少含有一组相同的特征基。
如果对任何一个量子态，可以通过给出这些相同特征向量的系数来完全地确定该量子态，即这些相同的特征向量构成量子态空间的一组基底，那么称这一组算符为*对易可观测量完全集*（Complete Set of Commuting Observables, CSCO）。
{: .definition}

对易的矩阵保持特征空间不变是线性代数中学习过的简单定理，此处不再赘述。
要点在于，对易可观测量完全集有何物理意义？

如果一个可观测量$A$是非简并的，那么其所有特征值只对应一个特征向量，因此只需要特征值就可以确定特征向量，从而确定整个波函数。
然而，若其是简并的，那么对同一个特征值，可能存在多个特征向量，从而无法确定波函数。
通过引入相容的可观测量$B$，由于具有相同的特征基，可观测量$A$的特征空间不发生变化，因此能由$A$表示的波函数依然能由$A$表示。
但是，对这些特征向量而言，尽管它们对于$A$有相同的特征值，对于$B$仍然可以具有不同的特征值，因此通过额外指定对$B$的特征值来将这些简并的状态区分开。

这种添加相容可观测量的过程可一直持续，直到找到可将所有简并状态都区分开的一组可观测量，这个时候就称找到了对易可观测量完全集。

### 均值与不确定度

某物理量的均值——即其期望，可用狄拉克记号表示为
$$\langle A \rangle_\psi = \langle \psi \vert \hat A \vert \psi \rangle$$
其不确定度——即标准差，可用狄拉克记号表示为
$$\Delta_\psi (A) = \sqrt{ \langle (\hat A - \langle A \rangle_\psi)^2 \rangle_\psi } = \sqrt{\langle A^2 \rangle_\psi- \langle A \rangle_\psi^2}$$
不确定度的算子$\Delta (\cdot)$也是厄米算子。
{: .proposition}

首先证明期望的公式。
$$
\begin{aligned}
\langle A \rangle_\psi &= \sum_n p_n a_n = \sum_n \vert \langle \varphi_n \vert \psi \rangle \vert^2 a_n \\
&= \sum_n \langle \psi \vert \varphi_n \rangle \langle \varphi_n \vert \psi \rangle a_n \\
&= \sum_n \langle \psi \vert \hat A (\vert \varphi_n \rangle \langle \varphi_n \vert) \psi \rangle \\
&= \langle \psi \vert \hat A \vert \psi \rangle 
\end{aligned}
$$
对于标准差，我们直接应用概率学中的结果（即二阶矩的定义）：
$$\sigma^2_X = \mathrm{E}\left( (X - \mathrm{E}(X) )^2 \right),$$
从而
$$
\begin{aligned}
\Delta_\psi(A)^2 &= \langle (\hat A - \langle A \rangle)^2 \rangle \\
 &= \langle \hat A \hat A - 2 \hat A \langle A \rangle + \langle A \rangle^2 \rangle \\
 &= \langle A^2 \rangle - \langle A \rangle^2.
\end{aligned}
$$
由于方差和标准差均非负，两边取平方根，原命题即得证。
{: .proof}

设$\hat A, \hat B$为两算符，$i \hbar \hat C = [\hat A, \hat B]$，则对任意波函数$\psi$，
$$\Delta_\psi (A) \Delta_\psi (B) \ge \frac{\hbar}{2} \langle C \rangle_\psi $$
这一关系称为广义海森堡不确定性关系，也称海森堡-罗伯逊（Heisenberg-Robertson）不确定性关系。
{: .proposition}

为将两个算符联系起来，考虑使用柯西-施瓦茨不等式。
注意到
$$\Delta(A)^2 = \langle (\hat A - \langle A \rangle)^2 \rangle = \langle \psi \vert (\hat A - \langle A \rangle)^2 \vert \psi \rangle,$$
其中略去了下标以使得表达式更简单。
不妨令
$$\vert \alpha \rangle = \vert \hat A - \langle A \rangle \vert \psi \rangle,$$
从而有
$$\Delta(A)^2 = \langle \alpha \vert \alpha \rangle.$$
同理，令
$$\Delta(B)^2 = \langle \beta \vert \beta \rangle.$$
根据柯西-施瓦茨不等式，有
$$\Delta(A)^2 \Delta(B)^2 = \langle \alpha \vert \alpha \rangle \langle \beta \vert \beta \rangle \ge \vert \langle \alpha \vert \beta \rangle \vert^2.$$
由于
$$\hat C = \frac{[\hat A, \hat B]}{i\hbar},$$
现在我们希望证明
$$\vert \langle \alpha \vert \beta \rangle \vert^2 \ge \frac{1}{4} \left\vert\langle [\hat A, \hat B] \rangle \right\vert^2.$$
直接进行计算，有
$$
\begin{aligned}
\mathrm{Re}(\langle \alpha \vert \beta \rangle) &= \frac{1}{2} (\langle \alpha \vert \beta \rangle + \langle \beta \vert \alpha \rangle) \\
&= \frac{1}{2} \langle \psi \vert \hat A \hat B + \hat B \hat A \vert \psi \rangle - \langle A \rangle \langle B \rangle, \\
\mathrm{Im}(\langle \alpha \vert \beta \rangle) &= \frac{1}{2i} (\langle \alpha \vert \beta \rangle - \langle \beta \vert \alpha \rangle) \\
&= \frac{1}{2i} \langle \psi \vert \hat A \hat B - \hat B \hat A \vert \psi \rangle,
\end{aligned}
$$
计算时注意：
$$\langle \psi \vert \hat A \langle B \rangle \vert \psi \rangle = \langle \psi \vert \langle A \rangle \hat B \vert \psi \rangle = \langle A \rangle \langle B \rangle.$$
从而
$$
\begin{aligned}
\vert \langle \alpha \vert \beta \rangle \vert^2 
& = \mathrm{Re}(\langle \alpha \vert \beta \rangle)^2 + \mathrm{Im}(\langle \alpha \vert \beta \rangle)^2 \\
& = \mathrm{Re}(\langle \alpha \vert \beta \rangle)^2 + \frac{1}{4} \langle  [\hat A, \hat B] \rangle^2\\
&\ge \frac{1}{4} \langle [\hat A, \hat B] \rangle^2.
\end{aligned}
$$
从而完成了证明。
{: .proof}

在这个证明中，我们实际上证明了一个更紧的不等式：
$$
\Delta^2 (A) \Delta^2 (B) \ge  \left\vert \frac{1}{2} \langle \psi \vert \hat A \hat B + \hat B \hat A \vert \psi \rangle - \langle A \rangle \langle B \rangle \right\vert^2 + \left\vert \frac{1}{2} \langle [\hat A, \hat B] \rangle \right\vert^2,
$$
这一关系有时叫做薛定谔（Schrödinger）不确定性关系。

带入位移与向量的对易子，即可得
$$\Delta (x) \Delta (p) \ge \frac{\hbar}{2} = \frac{h}{4\pi},$$
这是最经典的海森堡不确定性关系。

### 埃伦费斯特定理

我们已经提供了量子力学中对物理量和观测的定义，现在的问题是，量子力学中的物理量能否和经典力学中的物理量对应？
我们可借助埃伦费斯特定理回答这个问题。

<small>(Ehrenfest, 1927)</small>对任何物理量$A$及其对应的算符$\hat A$，其期望与哈密顿量算符$\hat H$满足：
$$\frac{\mathrm d}{\mathrm d t} \langle A \rangle = \frac{1}{i\hbar} \left\langle [\hat A, \hat H] \right\rangle + \left\langle \frac{\partial A}{\partial t} \right\rangle,$$
特别地，对位置$x$、动量$p$和有势外力$F = - \partial_x V(x)$，有
$$m \frac{\mathrm d \langle x \rangle}{\mathrm d t} = \langle p \rangle, \frac{\mathrm d \langle p \rangle}{\mathrm d t} = - \langle \partial_x V(x) \rangle.$$
{: .theorem}

直接进行计算：
$$
\begin{aligned}
\frac{\mathrm d \langle A \rangle}{\mathrm d t} 
&= \frac{\mathrm d}{\mathrm d t}\langle \psi \vert \hat A \vert \psi \rangle \\
&= \left(\frac{\partial }{\partial t} \langle \psi \vert \right) \hat A \vert \psi \rangle + \langle \psi \vert \left(\frac{\partial}{\partial t} \hat A\right) \vert \psi \rangle +  \langle \psi \vert \hat A \left(\frac{\partial}{\partial t} \vert \psi \rangle\right) \\
&= \left(\frac{\partial }{\partial t} \langle \psi \vert \right) \hat A \vert \psi \rangle + \langle \psi \vert \hat A \left(\frac{\partial}{\partial t} \vert \psi \rangle\right) + \left\langle\frac{\partial}{\partial t} \hat A\right\rangle.
\end{aligned}
$$
根据薛定谔方程，有
$$\frac{\partial \psi}{\partial t} = \frac{1}{i\hbar} \hat H \psi \iff
\frac{\partial \psi^*}{\partial t} = - \frac{1}{i\hbar} \psi^* \hat H,$$
注意哈密顿算符是厄米的，因此对共轭转置不变。
原方程可进一步写为
$$
\begin{aligned}
\frac{\mathrm d \langle A \rangle}{\mathrm d t} 
&= \left(\frac{\partial }{\partial t} \langle \psi \vert \right) \hat A \vert \psi \rangle + \langle \psi \vert \hat A \left(\frac{\partial}{\partial t} \vert \psi \rangle\right) + \left\langle\frac{\partial}{\partial t} \hat A\right\rangle \\
&= \frac{1}{i \hbar} \langle \psi \vert \hat A \hat H - \hat H \hat A \vert \psi \rangle + \left\langle\frac{\partial}{\partial t} \hat A\right\rangle \\
&= \frac{1}{i \hbar} \langle [\hat A, \hat H] \rangle +  \left\langle\frac{\partial}{\partial t} \hat A\right\rangle.
\end{aligned}
$$
对位置和动量的特殊情况，代入即可得证。
{: .proof}

特别注意，尽管这一定理是量子力学和经典物理物理量对应的基础，它并不说明这两者是完全对应的。
在原命题中，我们说：
对位置$x$、动量$p$和有势外力$F = - \partial_x V(x)$，有

$$m \frac{\mathrm d \langle x \rangle}{\mathrm d t} = \langle p \rangle, \frac{\mathrm d \langle p \rangle}{\mathrm d t} = - \textcolor{blue}{\langle \partial_x V(x) \rangle}.$$

然而，在经典力学中，正确的表达应该是：

$$m \frac{\mathrm d \langle x \rangle}{\mathrm d t} = \langle p \rangle, \frac{\mathrm d \langle p \rangle}{\mathrm d t} = - \textcolor{red}{\partial_x \langle V(x) \rangle}.$$

为完全将两者对应，还需额外添加波函数的“定域性”条件：
假设波函数集中于空间中的某一点$x\_0$，即满足
$$\partial_x V(\langle x \rangle) \approx \langle \partial_x V(x) \rangle \approx \partial_x V(x_0),$$
那么量子力学预测的位置和动量会和经典力学预测的大致相同。
