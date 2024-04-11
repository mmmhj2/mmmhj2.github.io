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

我们暂时用$\lambda^2 \hbar^2$和$\mu \hbar$来表示$L^2$和$L_z$的本征值，则状态向量可写为$|\lambda^2, \mu \rangle$，且
$$
\hat L^2 | \lambda^2, \mu \rangle = \lambda^2 \hbar^2 | \lambda^2, \mu \rangle, \ \hat L_z | \lambda^2, \mu \rangle = \mu \hbar | \lambda^2, \mu \rangle
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
\hat L_z (\hat L_+ | \lambda^2, \mu \rangle) 
&= \hat L_+ \hat L_z |\lambda^2, \mu \rangle + \hbar \hat L_+ | \lambda^2, \mu \rangle \\
& = (\mu + 1) \hbar \hat L_+ | \lambda^2, \mu \rangle \\
\implies \hat L_+ | \lambda^2, \mu \rangle &\propto | \lambda^2, \mu + 1 \rangle
\end{aligned}
$$
更进一步地，我们还可以计算其系数
$$
\begin{aligned}
\Vert \hat L_+ | \lambda^2, \mu \rangle \Vert^2 
&= \langle \lambda^2, \mu | \hat L_+^\dagger \hat L_+ | \lambda^2, \mu \rangle \\
&= \langle \lambda^2, \mu | \hat L_- \hat L_+ | \lambda^2, \mu \rangle \\
&= \langle \lambda^2, \mu | \hat L^2 - \hat L_z^2 - \hbar \hat L_z | \lambda^2, \mu \rangle \\
&= [\lambda^2 - \mu^2 - \mu] \hbar^2 \langle \lambda^2, \mu | \lambda^2, \mu \rangle
\end{aligned}
$$
利用本征态向量长度均为一的性质，可得
$$\hat L_+ | \lambda^2, \mu \rangle = \hbar \sqrt{\lambda^2 - \mu (\mu + 1)} | \lambda^2, \mu + 1 \rangle$$
对降算符做类似的处理，可得到相似的结果。

升算符和降算符可增减本征态的量子数：
$$
\begin{aligned}
\hat L_+ | \lambda^2, \mu \rangle &= \hbar \sqrt{\lambda^2 - \mu (\mu + 1)} | \lambda^2, \mu + 1 \rangle \\
\hat L_- | \lambda^2, \mu \rangle &= \hbar \sqrt{\lambda^2 - \mu (\mu - 1)} | \lambda^2, \mu + 1 \rangle \\
\end{aligned}
$$
{: .proposition}

### 本征态的界

接下来我们利用阶梯算符来处理$\mu$的取值范围。
首先注意到
$$(\lambda^2 - \mu^2) \hbar^2 = \langle \lambda^2, \mu | \hat L^2 - \hat L_z^2 | \lambda^2, \mu \rangle = \langle \lambda^2, \mu | \hat L_x^2 + \hat L_y^2 | \lambda^2, \mu \rangle \ge 0$$
从而$\mu^2 \le \lambda^2$，因此$\mu$具有界，
不妨设其上确界（最大值）和下确界（最小值）分别为$\mu\_\max$和$\mu\_\min$。
由于其具有最值，对最值的本征向量应用升算符和降算符必然得到零向量，这意味着
$$
\begin{multline}
\hat L_+ | \lambda^2, \mu_\max \rangle = | \varnothing \rangle \\
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
\hat L_+ | \lambda^2, \mu_\max \rangle = | \varnothing \rangle \\
\implies \hat L_- \hat L_+ | \lambda^2, \mu_\max \rangle = | \varnothing \rangle \\
\implies (\hat L^2 - \hat L_z^2 - \hbar \hat L_z) | \lambda^2, \mu_\max \rangle = | \varnothing \rangle
\end{multline}
$$
从而
$$
\begin{aligned}
\lambda^2 \hbar^2 | \lambda^2, \mu_\max \rangle 
&= \hat L^2 | \lambda^2, \mu_\max \rangle \\
&= (\hat L_z^2 + \hbar \hat L_z) | \lambda^2, \mu_\max \rangle \\
&= \mu_\max (\mu_\max + 1) \hbar^2 | \lambda^2, \mu_\max \rangle \\
\implies \lambda^2 &= \mu_\max (\mu_\max + 1)
\end{aligned}
$$
以上分析给出了以下命题。

量子数$\mu$的最值是$\frac \hbar 2$的正整数倍，且其最值与另一个量子数$\lambda$之间存在一一对应的关系。
因此我们可以使用$| \mu\_\max, \mu \rangle$来表示一个本征态。
{: .proposition}

### 轨动量矩

利用微分方程的边界条件，我们还能更进一步地限制量子数的取值。
利用本征态的定义，我们有：
$$
\begin{multline}
\hbar \mu | \mu_\max, \mu \rangle = \hat L_z | \mu_\max, \mu \rangle = - i \hbar \frac{\partial}{\partial \varphi} |\mu_\max, \mu \rangle \\
\iff \hbar \mu \psi (\theta, \varphi) = - i \hbar \frac{\partial}{\partial \varphi} \psi(\theta, \varphi)
\end{multline}
$$
利用分离变量法得到这个偏微分方程的解：
$$\psi_{\mu_\max, \mu}(\theta, \varphi) = A(\theta) e^{i \mu \varphi}$$
利用循环边界条件，得到
$$\psi_{\mu_\max, \mu}(\theta, \varphi) = \psi_{\mu_\max, \mu}(\theta, \varphi + 2 \pi) \iff e^{i \mu \varphi} = e^{i \mu (\varphi + 2\pi)}$$
这意味着$\mu$只能是整数。

轨动量矩的量子数$\mu$只能为整数，其最值也只能为整数。
这两个整数$\mu\_\max$和$\mu$分别称为轨量子数（orbital quantum number）和磁量子数（magnetic quantum number），通常记为$l$和$m\_l$。
{: .proposition}

这个命题说明了轨道动量矩的量子化。
然而，单个粒子的总动量矩中还要包括其自旋动量矩，自旋动量矩算符（通常表示为$\hat S$）的特征值和总动量矩算符（通常表示为$\hat J$）的特征值均是半整数。
这些算符也具有和动量矩算符相似的形式，尤其是其对易子具有一致的形式。
实际上，动量矩算符正是根据对易子定义的。

#### 球谐函数

## 自旋算符

### 磁矩与自旋

#### Uhlenbeck-Goudsmit 阐释

### 自旋算符

### 泡利矩阵

### 不相容原理
