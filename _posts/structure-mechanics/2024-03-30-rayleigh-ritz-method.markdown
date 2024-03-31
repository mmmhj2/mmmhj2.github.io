---
title: "瑞利-里兹法与有限元"
categories: ["结构力学"]
tags: ["振动力学"]
---

本文主要介绍求解模态的瑞利-里兹法与有限元方法。

## 瑞利-里兹法

若需要对结构进行分析，可以直接分析其受力和能量，利用哈密顿原理写出变分方程，然后变化为强形式直接得出微分方程，这些步骤对任何结构都是适用的。
然而，得出的偏微分方程往往过于复杂，难以求得解析解。
当下，我们可以选择使用各种方法求出其数值解和近似解，本节介绍一种求出近似解的方法，即瑞利-里兹法。

我们利用分离变量的方法，将近似解设为具有以下形式的解：
$$\overline u (x,t) = \sum_{i=0}^n \lambda_i(t) \psi_i(x)$$
其中$\psi\_i$是一个*满足边界条件（运动学许可）*的简单函数，通常是多项式函数。

利用这种形式，我们将原问题表述成另一个优化问题：
$$\text{最小化} \ \mathcal L(u) = 0 \iff \text{最小化} \ \mathcal L(\overline u) \iff \text{最小化} \ \mathcal L(\lambda_i)$$
从而进行求解。

### 能量的矩阵表示

利用瑞利-里兹法时，注意到能量从单个变量的二次型变为多个变量的对称二次型。
以拉压梁的动能为例：
$$
\begin{aligned}
E_k &= \frac{1}{2} \int_0^L \rho S \dot u^2 \, d x \\
&= \frac{1}{2} \int_0 ^L \rho S \left(\frac{\partial (\sum_{i} \lambda_i \psi_i)}{\partial t}\right)^2 \, dx \\
&= \frac{1}{2} \int_0^L \rho S \underbrace{\left( \sum_{i} \dot \lambda_i \psi_i \right)^2}_{\text{二次型}} \, d x \\
\end{aligned}
$$
我们用以下命题表述这个结论。

利用瑞利-里兹法时，结构的势能具有以下的形式：
$$V = \frac{1}{2} \begin{bmatrix} \lambda_1 & \cdots & \lambda_n \end{bmatrix} \cdot \mathbf S \cdot \begin{bmatrix} \lambda_1 \\ \vdots \\ \lambda_n \end{bmatrix} = \frac{1}{2} \Lambda^\top \mathbf S \Lambda$$
动能具有以下的形式：
$$E_k = \frac{1}{2} \begin{bmatrix} \dot \lambda_1 & \cdots & \dot \lambda_n \end{bmatrix} \cdot \mathbf M \cdot \begin{bmatrix} \dot \lambda_1 \\ \vdots \\ \dot \lambda_n \end{bmatrix} = \frac{1}{2} \dot\Lambda^\top \mathbf M \dot\Lambda$$
其中$\mathbf{S}, \mathbf{M}$是两个对称矩阵，分别称为*刚度矩阵*和*质量矩阵*。
{: .proposition}

外力的功则是线性的：
$$W(\vec F) = \vec F \cdot \vec u = 
\begin{bmatrix}F \psi_1 & \cdots & F \psi_n\end{bmatrix}
\begin{bmatrix}\lambda_1 \\ \vdots \\ \lambda_n\end{bmatrix}$$
外力矩的功类似，注意此处使用了欧拉-伯努利条件：
$$W(\vec M) = \vec M \cdot \vec \omega = \vec M \cdot \vec u' = 
\begin{bmatrix}M \psi_1' & \cdots & M \psi_n'\end{bmatrix}
\begin{bmatrix}\lambda_1 \\ \vdots \\ \lambda_n\end{bmatrix}
$$
我们统一将外力列向量记为$\mathbf F$。

### 应用哈密顿原理

我们已经求出了所有能量，现在可以应用哈密顿原理求解原问题了。
首先我们求出所有变量的变分：
$$
\begin{aligned}
\delta E_k &= \frac{1}{2} \delta (\dot \Lambda^\top \mathbf M \dot \Lambda) \\
&=  \frac{1}{2} \left[(\delta \dot \Lambda^\top) \mathbf M \dot \Lambda + \dot \Lambda^\top \mathbf M (\delta \dot \Lambda) \right] \\
&= \dot \Lambda^\top \mathbf M (\delta \dot \Lambda)
\end{aligned}
$$
同理：
$$\delta V = \Lambda^\top \mathbf S (\delta \Lambda), \ \delta W = \mathbf F^\top (\delta \Lambda)$$
其中
$$\delta \Lambda = \begin{bmatrix} \delta \lambda_1 & \cdots & \delta \lambda_n \end{bmatrix}^\top$$

现在利用哈密顿原理，得到
$$
\begin{aligned}
0 &= \delta \int_{t_1}^{t_2} \mathcal L\, d t \\
&= \int_{t_1}^{t_2} \delta E_k - \delta V + \delta W \, d t \\
&= \int_{t_1}^{t_2} \dot \Lambda^\top \mathbf M (\delta \dot \Lambda) - \Lambda^\top \mathbf S (\delta \Lambda) + \mathbf F^\top (\delta \Lambda) \, d t \\
&= \cancel{\left[ \dot \Lambda^\top \mathbf M (\delta \Lambda) \right]_{t_1}^{t_2}} - \int_{t_1}^{t_2} \left[\ddot \Lambda^\top \mathbf M + \Lambda^\top \mathbf S - \mathbf F^\top  \right] (\delta \Lambda)\, d t
\end{aligned}
$$
从而得到方程的强形式。

利用瑞利-里兹法，原问题的等价问题为，求解线性常系数全微分方程组
$$\mathbf M \ddot \Lambda + \mathbf S \Lambda = \mathbf F$$
{: .theorem}

瑞利-里兹法将偏微分方程变为常微分方程，这使得原问题更加易于求解。

### 求解模态

对模态熟悉的读者立马能够注意到，瑞利-里兹法的方程与模态叠加法的方程高度相似：
$$\ddot q_i + \omega_i^2 q_i = f_i$$
如果我们利用模态截断截取较低的模态，然后将该方程写成矩阵形式，可以得到
$$\ddot {\mathbf Q} + \Omega^2 \mathbf Q = \mathbf f$$
其中
$$\Omega = \mathrm{diag}(\omega_1, \dots, \omega_n), \ \mathbf Q = \begin{bmatrix} q_1 & \cdots & q_n \end{bmatrix}^\top, \ \mathbf f = \begin{bmatrix} f_1 & \cdots & f_n \end{bmatrix}^\top$$
注意到由于非零的运动总是产生正的动能，$\mathbf M$是正定矩阵，因此一定可逆，再对原方程进行变换，得到
$$\ddot \Lambda + \mathbf M^{-1} \mathbf S \Lambda = \mathbf M^{-1} \mathbf F$$
若矩阵$\mathbf M^{-1} \mathbf S$可对角化，则对该方程进行对角化，可直接得到模态方程，这意味着以下命题成立。

瑞利-里兹法求出的解是较低模态在不同基底下的近似，这些模态角频率的平方是矩阵$\mathbf M^{-1} \mathbf S$的特征值。
{: .theorem}

估计的模态的角频率可使用以下方程求出：
$$0 = \det(\mathbf M^{-1} \mathbf S - \tilde \omega^2 \mathbf I) = \det(\mathbf S - \tilde \omega^2 \mathbf M)$$
这也是微分方程的特征方程的解。

由于模态是时间谐波解，模态关于时间的导数是容易求得的：
$$\dot q_i = i \omega_i q_i$$
一旦求出了某个模态的角频率，直接代入瑞利-里兹法方程，得到
$$- \tilde \omega_i^2 \mathbf M \mathbf Q_i + \mathbf S \mathbf Q_i = (\mathbf S - \tilde \omega_i^2 \mathbf M) \mathbf Q_i = 0$$
根据上文的定理，这个方程的解就是该模态在瑞利-里兹法下的近似。

更进一步地，注意到
$$\mathbf Q_i^\top (\mathbf S - \tilde \omega_j^2 \mathbf M) \mathbf Q_j = 0, \ \forall i, j$$
这意味着
$$
\begin{aligned}
\mathbf Q_i^\top \mathbf S \mathbf Q_j &= \delta_{ij} \tilde \omega_i \tilde \omega_j \\
\mathbf Q_i^\top \mathbf M \mathbf Q_j &= \delta_{ij}
\end{aligned}
$$
这是模态正交性的一种体现。

## 有限元方法初步

瑞利-里兹法给出了求解结构问题的数值方法，但是该方法要求寻找满足约束条件的函数以进行估计，对复杂的结构，找到这种函数是非常困难的。
为解决这种问题，可将复杂的结构离散化为相连的简单几何体的组成的网格，将复杂的约束转化为简单几何体上的约束，从而进行化简。
这种简单的几何体体称为*元素*（Element），几何体的顶点称为节点（Node），有限元方法（Finite Element Method）因此得名。

有限元方法使用以下函数作为单个元素内解的近似：
$$\tilde u(x,t) = \sum_{i = 0}^n u_i(t) N_i(x)$$
$n$是节点个数，通常为三个，$u\_i$是节点处的系数，$N\_i$是该节点使用的插值函数（Interpolation function）。
{: .proposition}

这个近似也具有矩阵形式。
考虑三角形元素中的二维问题，其矩阵形式可写为
$$
\tilde {\mathbf U} =
\begin{bmatrix} \tilde u \\ \tilde v \end{bmatrix} =
\begin{bmatrix}
N_1 & 0 & N_2 & 0 & N_3 & 0 \\
0 & N_1 & 0 & N_2 & 0 & N_3 \\
\end{bmatrix}
\begin{bmatrix}
u_1 \\ v_1 \\ u_2 \\ v_2 \\ u_3 \\ v_3
\end{bmatrix} =
\mathbf N \mathbf U
$$

### 确定插值函数

对于单个元素内的插值函数，若我们确定了每个顶点处的取值，则可以利用重心坐标插值确定可以选择的插值函数。
以三角形为例：
$$\tilde u(x) = \lambda_1(x) u_1 + \lambda_2(x) u_2 + \lambda_3(x) u_3$$
其中$\lambda\_i$是点$x$处的重心坐标。
直角坐标与重心坐标之间存在以下关系：
$$
\begin{bmatrix}
1 & 1 & 1 \\
x_1 & x_2 & x_3 \\
y_1 & y_2 & y_3 
\end{bmatrix}
\begin{bmatrix}
\lambda_1 \\ \lambda_2 \\ \lambda_3
\end{bmatrix} =
\begin{bmatrix}
1 \\ x \\ y
\end{bmatrix}
$$
令
$$\mathbf C^\top = \begin{bmatrix}
1 & 1 & 1 \\
x_1 & x_2 & x_3 \\
y_1 & y_2 & y_3 
\end{bmatrix}$$
而$\mathbf {C^\top}^{-1}$为其逆（或广义逆），则
$$\begin{bmatrix}
\lambda_1 \\ \lambda_2 \\ \lambda_3
\end{bmatrix} = \mathbf {C^{\top}}^{-1}
\begin{bmatrix}
1 \\ x \\ y
\end{bmatrix}$$
从而
$$
\tilde {\mathbf U} = \begin{bmatrix}
\lambda_1 & \lambda_2 & \lambda_3
\end{bmatrix} \begin{bmatrix}
u_1 \\ u_2 \\ u_3
\end{bmatrix} = \begin{bmatrix}
1 & x & y
\end{bmatrix}
\mathbf C^{-1}
\begin{bmatrix}
u_1 \\ u_2 \\ u_3
\end{bmatrix}
$$
根据定义，我们求得了一个可能的插值函数。

若已知元素顶点处的解，则可能的插值函数可由重心坐标插值确定。
以三角形元素为例，此时：
$$\mathbf N = \begin{bmatrix} 1 & x & y \end{bmatrix} \cdot \mathbf C^{-1}$$
其中
$$\mathbf C = \begin{bmatrix}
1 & x_1 & y_1 \\
1 & x_2 & y_2 \\
1 & x_3 & y_3 \\
\end{bmatrix}$$
{: .proposition}

### 能量的矩阵表示

和瑞利-里兹法一样，我们也寻求将能量表示为矩阵的形式：
$$
\begin{aligned}
E_k 
&= \frac{1}{2} \int_\Omega \rho \dot {\tilde{\mathbf U}}^\top \dot{\tilde{\mathbf U}} \, dV = \frac{1}{2} \int_\Omega \rho \dot{\mathbf U}^\top \mathbf N^\top \mathbf N \dot{\mathbf U} \\
&= \frac{1}{2} \dot{\mathbf U}^\top \mathbf M \dot{\mathbf U} \\
V
&= \frac 1 2 \int_\Omega (D \tilde{\mathbf U})^\top \mathbf A (D \tilde{\mathbf U}) \, dV \\
&= \frac 1 2 \int_\Omega \mathbf U^\top (D \mathbf N)^\top  \mathbf A (D \mathbf N) \mathbf U \\
&= \frac 1 2 \mathbf U^\top \mathbf S \mathbf U \\
W 
&= \mathbf U^\top \mathbf F
\end{aligned}
$$
从而有以下命题：

有限元方法中能量的矩阵表示为
$$E_k = \frac{1}{2} \dot{\mathbf U}^\top \mathbf M \dot{\mathbf U}, \quad V = \frac 1 2 \mathbf U^\top \mathbf S \mathbf U, \quad W = \mathbf U^\top \mathbf F$$
其中
$$
\begin{aligned}
\mathbf M &= \int_\Omega \rho \mathbf N^\top \mathbf N \, d V \\
\mathbf S &= \int_\Omega (D \mathbf N)^\top \mathbf A (D \mathbf N) \, d V \\
\mathbf F &= \int_\Omega N^\top f \, d V + \int_{\partial \Omega} N^\top T \, dS
\end{aligned}
$$
三个矩阵分别是质量矩阵、刚度矩阵和表示外力的矩阵，$D$是关于空间坐标的一个微分算子。
{: .proposition}

以二维欧拉梁为例，其能量为
$$
\begin{aligned}
V &= \frac 1 2 \int_0^L ES \left( \frac{\partial u}{\partial x} \right)^2 \, d x + \frac 1 2 \int_0^L EJ \left( \frac{\partial^2 v}{\partial x^2} \right)^2 \, d x \\
E_c &= \frac 1 2 \int_0^L \rho S (\dot u^2 + \dot v^2) \, dx
\end{aligned}
$$
令$\mathbf U = [u\ v]^\top$，从而
$$\mathbf A = \begin{bmatrix} ES & 0 \\ 0 & EJ  \end{bmatrix}, \quad D = \begin{bmatrix} \frac{\partial}{\partial x} & 0 \\ 0 & \frac{\partial^2}{\partial x^2}\end{bmatrix}, \quad \mathbf F = 0$$
质量矩阵和刚度矩阵须根据插值函数确定。
{: .exampl}

### 组装方程

之前我们考虑的都是单个有限元内的方程，接下来考虑如何将这些方程组装起来求解整个模型的问题。
我们将单个有限元中的矩阵以下标$e$表示，且假设它们都位于统一的坐标系中，若不位于同一坐标系中，可使用过渡矩阵将其变换至同一坐标系中。
考虑这样一个分块矩阵：
$$\mathbf B = \begin{bmatrix} \mathbf 0 & \cdots & \mathbf 0 & \mathbf I & \mathbf 0 & \cdots & \mathbf 0
 \end{bmatrix}^\top \in \mathcal M_{d,nd}$$
其中$\mathbf 0$和$\mathbf I$都是维数与问题维数$d$相同的方块矩阵，$n$是有限元的个数。

将这个矩阵左乘总问题的任何矩阵，即可产生一个$d \times d$的矩阵。
这就相当于从总问题中提取出了单个有限元的子问题。
同时，将这个矩阵的转置和其本身左乘并右乘至单个有限元的矩阵，即可产生一个$nd \times nd$的矩阵。
将这些矩阵求和，即可得到总的矩阵。

利用这个矩阵，可以组装出以下方程
$$
\begin{aligned}
\mathbf U_e &= \mathbf B_e \mathbf U \\
\mathbf M \ddot {\mathbf U} + \mathbf S \mathbf U &= \mathbf F \\
\mathbf M &= \sum_e \mathbf B_e^\top \mathbf M_e \mathbf B_e \\
\mathbf S &= \sum_e \mathbf B_e^\top \mathbf S_e \mathbf B_e \\
\mathbf F &= \sum_e \mathbf B_e^\top \mathbf F_e + \mathbf F_n \\
\end{aligned}
$$
其中$\mathbf F\_n$是节点处的受力。

## 附录：常系数微分方程组的解

本章主要介绍求解常系数微分方程组，这是各种数值方法的重要一步。

对常系数微分方程组：
$$\mathbf X' = \mathbf {AX},\ \mathbf A \in \mathcal{M_n}$$
其基解矩阵为
$$\Phi(t) = \exp \mathbf At = \sum_{k=0}^\infty \frac{\mathbf{A}^k t^k}{k!}$$
这个矩阵级数对一切矩阵$\mathbf A$都是绝对收敛的。
该方程的所有解均具有
$$\phi(t) = (\exp \mathbf At) c$$
的形式，其中$c$是一个常数列向量。
{: .proposition}

一些情况下，例如$\mathbf A$为对角矩阵的情况下，$\exp \mathbf At$可以容易地求出。
而大部分情况下，该矩阵是很难直接得出的。
为此，我们需要使用其特征值和特征向量。

对常系数微分方程组：
$$\mathbf X' = \mathbf {AX},\ \mathbf A \in \mathcal{M_n}$$
如果矩阵$\mathbf A$可对角化，则具有$n$个线性无关的特征向量$\mathbf v_i$，设这些特征向量对应的特征值为$\lambda\_i$，则
$$\Phi(t) = \left[e^{\lambda_1 t} \mathbf v_1, \dots, e^{\lambda_n t} \mathbf v_n \right]$$
是原方程的一个基解矩阵。
{: .proposition}

代数上讲，这意味着将原方程变换为
$$\mathbf X' = \mathbf A \mathbf X = \mathbf P \mathbf D \mathbf P^{-1} \mathbf X \iff (\mathbf P^{-1} \mathbf X') = \mathbf D (\mathbf P^{-1} \mathbf X)$$
从而变化为求解$n$个无关的一阶线性微分方程。

对非齐次的情况，可使用类似的变换：
$$\mathbf X' = \mathbf A \mathbf X + \mathbf B \iff (\mathbf P^{-1} \mathbf X') = \mathbf D (\mathbf P^{-1} \mathbf X) + (\mathbf P^{-1} \mathbf B)$$

若该矩阵不可对角化，则可尝试在复数域上上三角化，然后从下往上求解。

试求解高阶微分方程：
$$\frac{d^4 x}{d t^4} - k^4 x = 0$$
我们将该方程重写：
$$
\left\{
\begin{aligned}
\frac{d}{dt} x &= \frac{d x}{d t} \\
\frac{d}{dt} \frac{d x}{d t} &= \frac{d^2 x}{d t^2} \\
\frac{d}{dt} \frac{d^2 x}{d t^2} &= \frac{d^3 x}{d t^3}  \\
\frac{d}{dt} \frac{d^3 x}{d t^3} &= k^4 x \\
\end{aligned}
\right.
\iff
\mathbf X' = \begin{pmatrix}
0 & 1 & 0 & 0 \\
0 & 0 & 1 & 0 \\
0 & 0 & 0 & 1 \\
k^4 & 0 & 0 & 0
\end{pmatrix} \mathbf X
$$
其中
$$
\mathbf X = \begin{pmatrix}
x \\ x^{(1)} \\ x^{(2)} \\ x^{(3)}
\end{pmatrix}, \quad
\mathbf X' = \begin{pmatrix}
x^{(1)} \\ x^{(2)} \\ x^{(3)} \\ x^{(4)}
\end{pmatrix}
$$
注意到该方程实际上可以非常容易地对角化。
该矩阵的特征方程——同时也是该微分方程的特征方程——为：
$$\lambda^4 - k^4 = 0$$
该方程具有四个不重复的复根：
$$\lambda_1 = k , \lambda_2 = -k , \lambda_3 = i k, \lambda_4 = - ik$$
我们只需要关注最高阶的解，不需要求出基解矩阵，只需要其最后一行即可，因此我们可以忽略所有常数，直接得到
$$x = A' e^{kt} + B' e^{-kt} + C' e^{ikt} + D' e^{-ikt}$$
重新组合化简，得到：
$$x = A \sin kt + B \cos kt + C \sinh kt + D \cosh kt$$
{: .exampl}

