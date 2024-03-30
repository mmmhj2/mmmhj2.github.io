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
其中$\psi\_i$是一个*满足边界条件*的简单函数，通常是多项式函数。

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
$$E_k = \frac{1}{2} \begin{bmatrix} \dot \lambda_1 & \cdots & \dot \lambda_n \end{bmatrix} \cdot \mathbf M \cdot \begin{bmatrix} \dot \lambda_1 \\ \vdots \\ \dot \lambda_n \end{bmatrix} = \frac{1}{2} \dot\Lambda^\top \mathbf S \dot\Lambda$$
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
\frac{d^4 x}{d t^4} &= k^4 x \\
\frac{d^4 x}{d t^4} &= \frac{d}{dt} \frac{d^3 x}{d t^3} \\
\frac{d^3 x}{d t^3} &= \frac{d}{dt} \frac{d^2 x}{d t^2} \\
\frac{d^2 x}{d t^2} &= \frac{d}{dt} \frac{d x}{d t} \\
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

