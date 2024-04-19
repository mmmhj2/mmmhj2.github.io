---
title: "量子力学中的动量矩"
categories: ["量子力学"]
---

本文关注量子力学中的动量矩。
我们知道量子力学中重要的物理量未哈密顿量，而其中通常具有动能和势能两个部分。
对于刚体而言，除了平动动能之外，还具有转动动能：
$$E_{c,t} = \frac{p^2}{2m}, \quad E_{c,r} = \frac{L^2}{2J}$$
其中$L$即为动量矩。

因此，研究动量矩是必要的。

## 量子力学中的动量矩

我们知道，经典力学中的动量矩为
$$\vec L = \vec r \times \vec p$$
其直角坐标下的表示为
$$
\left\{
\begin{aligned}
L_x & = y p_z - z p_y \\
L_y & = z p_x - x p_z \\
L_z & = x p_y - y p_x
\end{aligned}
\right.
$$
我们将研究量子力学中对应的动量矩算符。

### 动量矩算符

直角坐标系下的动量矩算符是容易得到的：
$$\hat L = \hat r \times \hat p = - i \hbar (\hat r \times \nabla)$$

直角坐标系下的动量矩算符为 
$$
\begin{aligned}
\hat L_x & = \hat y \hat p_z - \hat z \hat p_y = - i \hbar \left( y \frac{\partial}{\partial z} - z \frac{\partial}{\partial y} \right)\\
\hat L_y & = \hat z \hat p_x - \hat x \hat p_z = - i \hbar \left( z \frac{\partial}{\partial x} - x \frac{\partial}{\partial z} \right)\\
\hat L_z & = \hat x \hat p_y - \hat y \hat p_x = - i \hbar \left( x \frac{\partial}{\partial y} - y \frac{\partial}{\partial x} \right) \\
\hat L^2 & = \hat L_x^2 + \hat L_y^2 + \hat L_z^2
\end{aligned}
$$
{: .definition}

为研究转动，我们常常将坐标系变换为球坐标系。在此坐标系下，我们只考虑角度的变动而非半径的变动，从而动量矩算符也可容易地求得。

球坐标系下的动量矩算符为：
$$
\begin{aligned}
\hat L_x & = i \hbar \left( \sin \varphi \frac{\partial}{\partial \theta} + \frac{\cos \varphi}{\tan \theta} \frac{\partial}{\partial \varphi} \right) \\
\hat L_y & = i \hbar \left( - \cos \varphi \frac{\partial}{\partial \theta} + \frac{\sin \varphi}{\tan \theta} \frac{\partial}{\partial \varphi} \right) \\
\hat L_z & = - i \hbar \frac{\partial}{\partial \varphi} \\
\hat L^2 & = - \hbar^2 \left( \frac{1}{\sin \theta} \frac{\partial}{\partial \theta} (\sin \theta \frac{\partial}{\partial \theta}) + \frac{1}{\sin^2 \theta} \frac{\partial^2}{\partial \varphi^2} \right)
\end{aligned}
$$
{: .definition}

### 算符的交换性

接下来考察算符的对易子及其交换性。
首先注意到
$$
\begin{aligned}
\left[\hat L_x, \hat L_y\right] &= [\hat y \hat p_x - \hat x \hat p_y, \hat z \hat p_x - \hat x \hat p_z] \\
&= [\hat y \hat p_z, \hat z \hat p_x] - [\hat y \hat p_z, \hat x \hat p_z] + [\hat z \hat p_y, \hat z \hat p_x] - [\hat z \hat p_y, \hat x \hat p_z] \\
&= \hat y \hat p_x [\hat p_z, \hat z] + \hat x \hat p_y [\hat z, \hat p_z] \\
&= i \hbar (\hat x \hat p_y - \hat y \hat p_x) \\
&= i \hbar \hat L_z
\end{aligned}
$$
这意味着任意两个不同方向的动量矩算符不具有交换性。
然而，考察动量矩算子整体，可以注意到
$$
\begin{aligned}
\left[ \hat L^2, \hat L_x \right] &= [\hat L_x^2 + \hat L_y^2 + \hat L_z^2, \hat L_x] \\
&= [\hat L_x^2, \hat L_x] + [\hat L_y^2, \hat L_x] + [\hat L_z^2, \hat L_x] \\
&= \hat L_y [\hat L_y, \hat L_x] + [\hat L_y, \hat L_x] \hat L_y + \hat L_z [\hat L_z, \hat L_x] + [\hat L_z, \hat L_x] \hat L_z \\
&= - i\hbar (\hat L_y \hat L_z + \hat L_z \hat L_y) + i\hbar (\hat L_y \hat L_z + \hat L_z \hat L_y) \\
&= 0
\end{aligned}
$$
这意味着动量矩平方算子可以和任何单个方向的动量矩交换。

动量矩算符在任何方向上的分量算符之间不可交换，而动量矩平方算符本身可以与任何分量算符交换。
更具体地说，其对易子为：
$$
\begin{aligned}
\left[\hat L_x, \hat L_y\right] &= i \hbar \hat L_z \\
\left[\hat L_y, \hat L_z\right] &= i \hbar \hat L_x \\
\left[\hat L_z, \hat L_x\right] &= i \hbar \hat L_y \\
\left[\hat L^2, \hat L_x\right] &= \left[\hat L^2, \hat L_y\right] = \left[\hat L^2, \hat L_z\right] = 0 \\
\end{aligned}
$$
或可简单写为
$$[\hat L_i, \hat L_j] = \epsilon_{ijk} i \hbar \hat L_k, \quad [\hat L^2, \hat L_i] = 0$$
{: .proposition}

根据广义海森堡原理，任何对易子不为零的可观测量的不确定性非零：
$$\Delta L_x \Delta L_y \ge \frac{\hbar}{2} \left< L_z\right>$$
然而，动量矩的平方和任意方向的动量矩分量之间的对易子为零，这意味着我们可以以确定的方式观测这两个量。
我们选择动量矩的平方和和Z轴分量进行观测，因为这两个算符的对易子为零且Z轴分量的表达式最简单。
如果观测到一个物体的动量矩平方和和Z轴分量，则可将其动量矩限制在一个球的切面园上。
这两个可观测量实际上构成了转动刚体的对易力学完全集。

## 动量矩的本征态

我们暂时用$\lambda^2 \hbar^2$和$\mu \hbar$来表示$L^2$和$L_z$的本征值，则状态向量可写为$\vert\lambda^2, \mu \rangle$，且
$$
\hat L^2 \vert \lambda^2, \mu \rangle = \lambda^2 \hbar^2 \vert \lambda^2, \mu \rangle, \ \hat L_z \vert \lambda^2, \mu \rangle = \mu \hbar \vert \lambda^2, \mu \rangle
$$
不妨设$\lambda > 0$。

### 阶梯算符

和谐振子类似，对刚性转子，也有特殊的操作动量矩本征态的算符。

定义一对算符：
$$
\hat L_+ = \hat L_x + i \hat L_y, \ \hat L_- = \hat L_x - i \hat L_y
$$
为阶梯算符（Ladder operators），前者称为升算符，后者称为降算符。
这两个算符*不是厄米的*，因此*不对应*可观测量。
{: .definition}

这两个算符满足
$$
\begin{aligned}
\hat L_+ \hat L_- &= (\hat L_x + i \hat L_y)(\hat L_x - i \hat L_y) \\
& = \hat L_x^2 + \hat L_y^2 - i [\hat L_x, \hat L_y] \\
& = \hat L^2 - \hat L_z^2 - i [\hat L_x, \hat L_y] \\
\hat L_- \hat L_+ &= \hat L^2 - \hat L_z^2 + i [\hat L_x, \hat L_y] \\
\implies \hat L^2 - \hat L_z &= \frac{1}{2} (\hat L_+ \hat L_- + \hat L_- \hat L_+)
\end{aligned}
$$
实际上，它们也是用类似平方差公式的方法因式分解得到的。

我们接着计算其对易子
$$
\begin{aligned}
\left[ \hat L^2, \hat L_\pm \right] &= [\hat L^2, \hat L_x \pm i \hat L_y] \\
&= [\hat L^2, \hat L_x] \pm i [\hat L^2, \hat L_y] \\
&= 0 \\
\left[ \hat L_z, \hat L_\pm \right] &= [\hat L_z, \hat L_x \pm i \hat L_y] \\
&= i \hbar \hat L_y \pm \hbar \hat L_x \\
&= \pm \hbar \hat L_\pm
\end{aligned}
$$

阶梯算符的对易子为
$$[ \hat L^2, \hat L_\pm ] = 0, \ [ \hat L_z, \hat L_\pm ] = \pm \hbar \hat L_\pm$$
{: .proposition}

这两个算符和产生湮没算符一样，也可使本征态上升或下降，我们可利用对易子证明这一点：
$$
\begin{aligned}
\hat L_z (\hat L_+ \vert \lambda^2, \mu \rangle) 
&= \hat L_+ \hat L_z \vert\lambda^2, \mu \rangle + \hbar \hat L_+ \vert \lambda^2, \mu \rangle \\
& = (\mu + 1) \hbar \hat L_+ \vert \lambda^2, \mu \rangle \\
\implies \hat L_+ \vert \lambda^2, \mu \rangle &\propto \vert \lambda^2, \mu + 1 \rangle
\end{aligned}
$$
更进一步地，我们还可以计算其系数
$$
\begin{aligned}
\Vert \hat L_+ \vert \lambda^2, \mu \rangle \Vert^2 
&= \langle \lambda^2, \mu \vert \hat L_+^\dagger \hat L_+ \vert \lambda^2, \mu \rangle \\
&= \langle \lambda^2, \mu \vert \hat L_- \hat L_+ \vert \lambda^2, \mu \rangle \\
&= \langle \lambda^2, \mu \vert \hat L^2 - \hat L_z^2 - \hbar \hat L_z \vert \lambda^2, \mu \rangle \\
&= [\lambda^2 - \mu^2 - \mu] \hbar^2 \langle \lambda^2, \mu \vert \lambda^2, \mu \rangle
\end{aligned}
$$
利用本征态向量长度均为一的性质，可得
$$\hat L_+ \vert \lambda^2, \mu \rangle = \hbar \sqrt{\lambda^2 - \mu (\mu + 1)} \vert \lambda^2, \mu + 1 \rangle$$
对降算符做类似的处理，可得到相似的结果。

升算符和降算符可增减本征态的量子数：
$$
\begin{aligned}
\hat L_+ \vert \lambda^2, \mu \rangle &= \hbar \sqrt{\lambda^2 - \mu (\mu + 1)} \vert \lambda^2, \mu + 1 \rangle \\
\hat L_- \vert \lambda^2, \mu \rangle &= \hbar \sqrt{\lambda^2 - \mu (\mu - 1)} \vert \lambda^2, \mu + 1 \rangle \\
\end{aligned}
$$
{: .proposition}

### 本征态的界

接下来我们利用阶梯算符来处理$\mu$的取值范围。
首先注意到
$$(\lambda^2 - \mu^2) \hbar^2 = \langle \lambda^2, \mu \vert \hat L^2 - \hat L_z^2 \vert \lambda^2, \mu \rangle = \langle \lambda^2, \mu \vert \hat L_x^2 + \hat L_y^2 \vert \lambda^2, \mu \rangle \ge 0$$
从而$\mu^2 \le \lambda^2$，因此$\mu$具有界，
不妨设其上确界（最大值）和下确界（最小值）分别为$\mu\_\max$和$\mu\_\min$。
由于其具有最值，对最值的本征向量应用升算符和降算符必然得到零向量，这意味着
$$
\begin{multline}
\hat L_+ \vert \lambda^2, \mu_\max \rangle = \vert \varnothing \rangle \\
\implies \sqrt{\lambda^2 - \mu_\max (\mu_\max + 1)} = 0 \\
\implies \mu_\max (\mu_\max + 1) = \lambda^2
\end{multline}
$$
同理，有
$$\mu_\min (\mu_\min - 1) = \lambda^2$$
从而
$$
\begin{multline}
\mu_\max (\mu_\max + 1) - \mu_\min (\mu_\min - 1) = 0 \\
\implies (\mu_\max + \mu_\min)(\mu_\max - \mu_\min - 1) = 0
\end{multline}
$$
由于最大值必然大于等于最小值，因此后一项不能为零，从而
$$\mu_\max + \mu_\min = 0$$

最后，注意到由于所有$\mu$均可由升算符和降算符产生，而每次应用该算符会使$\mu$增加或减少一，从而使特征值增加或减少$\hbar$，因此
$$\exists n \in \mathbb N ,\quad \mu_\min \hbar + n \hbar = \mu_\max \hbar$$
从而
$$\mu_\max = - \mu_\min = \frac n 2 \hbar, \ n \in \mathbb N$$

更进一步地，注意到
$$
\begin{multline}
\hat L_+ \vert \lambda^2, \mu_\max \rangle = \vert \varnothing \rangle \\
\implies \hat L_- \hat L_+ \vert \lambda^2, \mu_\max \rangle = \vert \varnothing \rangle \\
\implies (\hat L^2 - \hat L_z^2 - \hbar \hat L_z) \vert \lambda^2, \mu_\max \rangle = \vert \varnothing \rangle
\end{multline}
$$
从而
$$
\begin{aligned}
\lambda^2 \hbar^2 \vert \lambda^2, \mu_\max \rangle 
&= \hat L^2 \vert \lambda^2, \mu_\max \rangle \\
&= (\hat L_z^2 + \hbar \hat L_z) \vert \lambda^2, \mu_\max \rangle \\
&= \mu_\max (\mu_\max + 1) \hbar^2 \vert \lambda^2, \mu_\max \rangle \\
\implies \lambda^2 &= \mu_\max (\mu_\max + 1)
\end{aligned}
$$
以上分析给出了以下命题。

量子数$\mu$的最值是$\frac \hbar 2$的正整数倍，且其最值与另一个量子数$\lambda$之间存在一一对应的关系。
因此我们可以使用$\vert \mu\_\max, \mu \rangle$来表示一个本征态。
{: .proposition}

### 轨动量矩

利用微分方程的边界条件，我们还能更进一步地限制量子数的取值。
利用本征态的定义，我们有：
$$
\begin{multline}
\hbar \mu \vert \mu_\max, \mu \rangle = \hat L_z \vert \mu_\max, \mu \rangle = - i \hbar \frac{\partial}{\partial \varphi} \vert\mu_\max, \mu \rangle \\
\iff \hbar \mu \psi (\theta, \varphi) = - i \hbar \frac{\partial}{\partial \varphi} \psi(\theta, \varphi)
\end{multline}
$$
利用分离变量法得到这个偏微分方程的解：
$$\psi_{\mu_\max, \mu}(\theta, \varphi) = A(\theta) e^{i \mu \varphi}$$
利用循环边界条件，得到
$$\psi_{\mu_\max, \mu}(\theta, \varphi) = \psi_{\mu_\max, \mu}(\theta, \varphi + 2 \pi) \iff e^{i \mu \varphi} = e^{i \mu (\varphi + 2\pi)}$$
这意味着$\mu$只能是整数。

轨动量矩的量子数$\mu$只能为整数，其最值也只能为整数。
这两个整数$\mu\_\max$和$\mu$分别称为轨量子数（orbital quantum number，也称角量子数）和磁量子数（magnetic quantum number），通常记为$l$和$m\_l$。
{: .proposition}

例如，当$l=3$时，动量矩的大小为
$$\Vert \vec L \Vert = \hbar \sqrt{l(l+1)} = 2\sqrt{3} \hbar$$

这个命题说明了轨道动量矩的量子化。
然而，单个粒子的总动量矩中还要包括其自旋动量矩，自旋动量矩算符（通常表示为$\hat S$）的特征值和总动量矩算符（通常表示为$\hat J$）的特征值均是半整数。
这些算符也具有和动量矩算符相似的形式，尤其是其对易子具有一致的形式。
实际上，动量矩算符正是根据对易子定义的。

#### 球谐函数

函数
$$Y_l^{m_l}(\theta, \varphi) = \frac{(-1)^{l+m_l}}{2^l l!} \sqrt{\frac{2l+1}{\pi} \frac{(l-m_l)!}{(l+m_l)!}} e^{i m_l \varphi} \sin^{m_l} \theta \frac{d^{l+m_l}}{d(\cos \theta)^{l+m_l}} \sin^{2l} \theta$$
称为球谐函数（Sphere harmonic function），是算符$\hat L^2$和$\hat L\_Z$共同的特征函数。
{: .proposition}

球谐函数实际上是球坐标下拉普拉斯方程的解，实际上也是球坐标下一组特殊函数的基底，因此具有非常重要的物理意义。
表示论说明，球谐函数空间实际上是旋转群$\mathrm{SO}(3)$的表示。

## 自旋算符

接下来我们考虑粒子的自旋以及其与角动量算符的关系。

### 磁矩与自旋

考虑绕某一轴做定轴转动的电子，其产生磁矩$\vec \mu$：
$$\vec \mu = \frac{- e}{2} \vec r \times \vec v = \frac{-e}{2m} \vec L = \gamma \vec L = \mu_B \hbar \vec L$$
其中$\gamma = \frac{-e}{2m}$称为磁旋比（Gryomagnetic ratio），$\mu\_B = \frac{e\hbar}{2m}$称为玻尔磁子（Bohr magneton）。

在外加磁场$\vec B$下，电子会受力而使得旋转轴向磁场方向靠拢。
电子因此具有势能
$$E = - \vec \mu \cdot \vec B$$

现在，假设电子以随机的转轴方向通过一定向的磁场，则由于其方向不同，所受洛伦兹力也不同，从而在磁场出口处会向四处散开。
然而，实验结果表明，电子总是会出现在固定的几个位置，因此一定存在其他没有考虑到的因素。
这个实验就是Stern-Gerlach实验，而Uhlenbeck和Goudsmit通过引入自旋的概念解决了这一问题。

#### Uhlenbeck-Goudsmit 阐释

Uhlenbeck 和 Goudsmit 认为，电子除了绕某一轴旋转之外，还会绕自己旋转，从而产生额外的磁矩$\mu\_S$：
$$\mu_S = \gamma g \vec S$$
其中$\vec S$即自旋角动量，$g$称为G因子，电子的G因子约等于二。
从而总的磁矩为
$$\mu = \gamma(\vec L + g \vec S)$$

电子的自旋算符$\hat S$的轨量子数$\mu\_\max$为二分之一，因此称电子具有二分之一自旋。

### 自旋算符与泡利矩阵

电子的自旋算符$\hat S$的轨量子数（记为$m\_s$）为二分之一，这意味着其磁量子数取值只能为$-\frac{1}{2}, 0, \frac{1}{2}$，因此只具有两个非零的本征态。
我们记
$$\vert \frac{1}{2}, \frac{1}{2} \rangle = \vert \uparrow \rangle = \vert + \rangle, \quad \vert \frac{1}{2}, -\frac{1}{2} \rangle = \vert \downarrow \rangle = \vert - \rangle$$
从而
$$\hat S_Z \vert+\rangle = \frac{\hbar}{2} \vert + \rangle, \quad \hat S_Z \vert - \rangle = - \frac{\hbar}{2} \vert - \rangle$$
现在，我们注意到可将自旋算符在这两个特征向量组成的基底下的矩阵表出，从而得到
$$\hat S_Z = \frac{\hbar}{2} \hat \sigma_Z = \frac{\hbar}{2} \begin{pmatrix} 1 & 0 \\ 0 & -1 \end{pmatrix}$$
这个矩阵称为自旋算符的泡利矩阵。

接下来，注意到
$$
\hat S_+ \vert + \rangle = \vert \varnothing \rangle, \hat S_+ \vert - \rangle = \hbar \vert + \rangle
\implies
\hat S_+ = \hbar \begin{pmatrix} 0 & 1 \\ 0 & 0 \end{pmatrix}
$$
同理
$$S_- = \hbar \begin{pmatrix} 0 & 0 \\ 1 & 0 \end{pmatrix}$$
从而
$$
\begin{aligned}
\hat S_X &= \frac{1}{2} (\hat S_+ + \hat S_-) = \frac{\hbar}{2} \begin{pmatrix} 0 & 1 \\ 1 & 0 \end{pmatrix} \\
\hat S_Y &= \frac{i}{2} (\hat S_- - \hat S_+) = \frac{\hbar}{2} \begin{pmatrix} 0 & -i \\ i & 0 \end{pmatrix}
\end{aligned}
$$

### 不相容原理

注意到每个粒子的波函数可由其位置$\vec r$和自旋量子数$m\_s$决定，一个含有$n$个粒子的系统的波函数可写为：
$$\psi(\vec r_1, m_{s,1}, \dots, \vec r_i, m_{s, i}, \dots, \vec r_j, m_{s, j}, \dots, \vec r_n, m_{s,n})$$
调换第$i$个和第$j$个粒子，则概率不应发生变化，从而
$$
\begin{multline}
\vert \psi(\vec r_1, m_{s,1}, \dots, \vec r_i, m_{s, i}, \dots, \vec r_j, m_{s, j}, \dots, \vec r_n, m_{s,n}) \vert^2 \\
= \vert \psi(\vec r_1, m_{s,1}, \dots, \vec r_j, m_{s, j}, \dots, \vec r_i, m_{s, i}, \dots, \vec r_n, m_{s,n}) \vert^2
\end{multline}
$$
从而
$$
\begin{multline}
\psi(\vec r_1, m_{s,1}, \dots, \vec r_i, m_{s, i}, \dots, \vec r_j, m_{s, j}, \dots, \vec r_n, m_{s,n}) \\
= e^{i \varphi} \psi(\vec r_1, m_{s,1}, \dots, \vec r_j, m_{s, j}, \dots, \vec r_i, m_{s, i}, \dots, \vec r_n, m_{s,n})
\end{multline}
$$
其中$\varphi$为一常数。
重复以上操作，得到
$$
\begin{multline}
\psi(\vec r_1, m_{s,1}, \dots, \vec r_i, m_{s, i}, \dots, \vec r_j, m_{s, j}, \dots, \vec r_n, m_{s,n}) \\
= e^{2 i \varphi} \psi(\vec r_1, m_{s,1}, \dots, \vec r_i, m_{s, i}, \dots, \vec r_j, m_{s, j}, \dots, \vec r_n, m_{s,n})
\end{multline}
$$
从而
$$e^{2 i \varphi} = 1 \implies e^{i \varphi} = \pm 1$$

若$e^{i \varphi} = 1$，则调换粒子的位置不会导致波函数的变化，这种粒子称为玻色子（Boson），具有整数自旋，其波函数是完全对称的。
若$e^{i \varphi} = -1$，则调换粒子的位置会使波函数变为相反数，这种粒子称为费米子（Fermion），具有半整数自旋，其波函数是完全反对称的。
夸克（Quark）和轻子（Lepton）都是费米子，如电子（轻子）是费米子。
奇数个夸克组成的粒子（如质子和中子）是费米子。
原子质量数为奇数的原子是费米子，而偶数的是玻色子。

费米子具有以下特别的性质：

对多个费米子组成的系统，不可能存在两个费米子具有相同的位置和自旋，该性质称为泡利不相容原理（Pauli's principle of exclusion）。
{: .proposition}

考虑两个具有相同位置和自旋的粒子，其波函数为
$$\psi(\vec r_1, m_{s,1}, \dots, \vec r_k, m_{s, k}, \dots, \vec r_k, m_{s, k}, \dots, \vec r_n, m_{s,n})$$
反转这两个粒子的位置，得到
$$
\begin{multline}
\psi(\vec r_1, m_{s,1}, \dots, \vec r_k, m_{s,k}, \dots, \vec r_k, m_{s,k}, \dots, \vec r_n, m_{s,n}) \\
= - \psi(\vec r_1, m_{s,1}, \dots, \vec r_k, m_{s,k}, \dots, \vec r_k, m_{s,k}, \dots, \vec r_n, m_{s,n})
\end{multline}
$$
从而系统的波函数是零，即存在具有相同位置和自旋的费米子的概率是零。
{: .proof}
