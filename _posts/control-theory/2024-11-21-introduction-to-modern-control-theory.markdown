---
title: "现代控制理论概观"
categories: ["控制理论"]
---

本文将聚焦于大规模使用线性代数来研究线性系统的现代控制理论。

## 状态空间与矩阵

在之前的研究中，我们通常通过传递函数来研究线性系统的性质。
然而，传递函数往往是复杂的非线性函数，且只能研究单输入、单输出系统，这为我们研究其性质带来诸多不利。
随着以线性代数为代表的应用数学的进一步发展，我们现在可使用向量空间中的诸多工具来研究系统。

### 状态与状态方程

对一个系统，若其全部状态都可由最小的一组系统中的变量来表示，则这组变量称为该系统的*状态变量*（State variables）。
状态变量的集合构成一个线性空间，称为系统的*状态空间*（State space），力学中也称相空间（Phase space）。
{: .definition}

对$n$阶的线性系统，状态空间通常为$n$维；
若线性系统的传递函数约分后分母为$m$次，则状态空间为$m$维。

线性系统在$n$维状态空间中可由以下两个方程组成的动力系统完全描述：
$$
\left\{
\begin{aligned}
\dot x(t) & = A(t) x(t) + B(t) u(t) \\
y(t) &= C(t) x(t) + D(t) u(t)
\end{aligned}
\right.
$$
其中$x \in \mathbb R^n$是状态空间中系统的状态向量，$u \in \mathbb R^m$是系统的输入向量，也称控制向量，$y \in \mathbb R^p$是系统的输出向量。
这两个方程中，第一个方称为*状态方程*，第二个方程称为*输出方程*。
这种表示方式称为系统的*状态空间表示*（State-space representation）。
{: .definition}

矩阵$A,B,C,D$分别称为状态矩阵（state matrix，也称系统矩阵，system matrix）、输入矩阵（input matrix）、输出矩阵（output matrix）和前馈矩阵（feedforward matrix）。
这四个矩阵的维度分别为$n \times n$、$n \times m$、$n \times p$和$m \times p$。

![](/assets/system/Typical_State_Space_model.svg){: .center-image}

上图展示了典型的状态空间表示的系统的方块图。

若系统是离散时的，那么状态方程将由微分方程变为差分方程。
若系统是时不变的，那么四个矩阵将均与时间无关，此时状态方程可写为
$$
\left\{
\begin{aligned}
\dot x(t) & = A x(t) + B u(t) \\
y(t) &= C x(t)+ D u(t)
\end{aligned}
\right.
$$
我们一般研究这种形式的状态方程。

注意，对同一系统，状态变量的选择并不是唯一的，而即使状态变量的选择固定了，状态方程的矩阵也不是唯一的。
例如，简单地对矩阵和向量进行初等变换，即可得到等价的新的状态变量和矩阵。

### 状态空间表示的转化

本节中我们将研究线性系统的状态空间表示与其他表示方式的转化。

#### 微分方程

首先考虑由微分方程定义的系统
$$
\begin{multline}
x^{(n)} + a_{n-1} x^{(n-1)} + \cdots + a_1 \dot x + a_0 x = u \\
\iff x^{(n)} = - a_{n-1} x^{(n-1)} - \cdots - a_1 \dot x - a_0 x + u
\end{multline}
$$
该系统的传递方程为
$$
H(p) = \frac{1}{p^n + a_{n-1} p^{n-1} + \cdots + a_0}
$$

利用微分方程递降的技巧，我们可取状态向量为
$$
\mathbf x = \begin{bmatrix}
x & \dot x & \cdots & x^{(n-1)}
\end{bmatrix}^T
$$
于是整个微分方程可写为
$$
\mathbf {\dot x} = \begin{bmatrix}
0 & 1 & 0 & \cdots & 0 \\
0 & 0 & 1 & \cdots & 0 \\
\vdots & \vdots & \vdots & \ddots & \vdots \\
-a_0 & -a_1 & -a_2 & \cdots & a_{n-1}
\end{bmatrix} \mathbf x + u \begin{bmatrix} 0 \\ \vdots \\ 0 \\ 1 \end{bmatrix}
$$
这就是系统的状态方程。
该系统的输出为$x$，因此输出方程为
$$
y = \begin{bmatrix} 1 & 0 & \cdots & 0 \end{bmatrix} \mathbf x
$$

不难注意到，系统矩阵$A$正是传递函数分母多项式的伴随矩阵的转置。

#### 一般的传递函数

考虑一般的传递函数
$$
H(p) = \frac{N(p)}{D(p)} = \frac{b_m p^m + b_{m-1} p^{m-1} + \cdots + b_1 p + b_0}{p^n + a_{n-1} p^{n-1} + \cdots + a_1 p + a_0},
$$
对因果系统，要求$m \le n$。
我们将该传递函数拆成两个部分：
$$
H_1(p) = \frac{1}{D(p)},\; H_2(p) = N(p),
$$
从而在时域上，令整个系统的输入和输出为$e(t)$和$s(t)$，有，
$$
\begin{aligned}
e(t) &= s_1^{(n)}(t) + a_{n-1} s_1^{(n-1)}(t) + \cdots + a_1 s_1 + a_0 \\
s(t) &= b_m s_1^{(m)}(t) + b_{m-1} s_1^{(m-1)}(t) + \cdots + b_1 s_1 + b_0
\end{aligned}
$$
其中$s\_1$是第一个系统$H\_1$的输出。

我们取$s\_1$及其高阶导数为状态变量，即
$$
\mathbf x = \begin{bmatrix}
s_1 & \dot s_1 & \cdots & s_1^{(n-1)}
\end{bmatrix}^T
$$
则状态方程与上一节介绍的微分方程的矩阵是完全一致的，即
$$
\mathbf {\dot x} = \begin{bmatrix}
0 & 1 & 0 & \cdots & 0 \\
0 & 0 & 1 & \cdots & 0 \\
\vdots & \vdots & \vdots & \ddots & \vdots \\
-a_0 & -a_1 & -a_2 & \cdots & -a_{n-1}
\end{bmatrix} \mathbf x + e \begin{bmatrix} 0 \\ \vdots \\ 0 \\ 1 \end{bmatrix},
$$
但输出方程有所不同，有
$$
y = \begin{bmatrix}b_0 & b_1 & \cdots & b_m & 0 & \cdots\end{bmatrix} \mathbf x.
$$

一个传递函数可对应无穷多的状态空间表示，而此处给出的状态空间表示称为*可控正则型*（Controllable canonical form），因为其给出的所有状态都是可控的，因此在设计控制器时尤其有用。
若给出一个拉普拉斯域中表示的系统（即一个传递函数），可以得到一个对应的状态空间表示，那么该系统称作是可实现的，四元组$(A,B,C,D)$叫做该系统的一个*实现*（Realization）。

利用拉普拉斯变换即可将状态空间表示还原为传递函数：
$$
H(p) = C(s \mathbf I - A)^{-1} B + D
$$

##### 裂项的传递函数

若传递函数是已经裂项的，即具有
$$
H(p) = \sum_{i=1}^n\frac{a_i}{p - \lambda_i}
$$
的形式，那么整个系统可视为多个一阶系统的求和，此时系统的状态可由所有一阶系统的输出组成。

![](/assets/system/additive-and-cascade-system.svg){: .align-center}
此图展示了裂项的传递函数（左）和分解的传递函数（右）对应的一阶系统的组合。

而状态空间表示可简单地写为
$$
\left\{
    \begin{aligned}
        \dot{\mathbf x} &= \begin{bmatrix} \lambda_1 & 0 & \cdots & 0 \\
        0 & \lambda_2 & \cdots & 0 \\
        \vdots & \vdots & \ddots & \vdots \\
        0 & 0 & \cdots & \lambda_{n}
        \end{bmatrix} \mathbf x + e \begin{bmatrix} 1 \\ 1 \\ \vdots \\ 1
        \end{bmatrix} \\
        y &= \begin{bmatrix} a_1 & a_2 & \cdots & a_n \end{bmatrix} \mathbf x
    \end{aligned}
\right..
$$

##### 分解的传递函数

若传递函数已经被因式分解了，即具有
$$
H(p) = \frac{1}{\prod_{i=1}^n (p - \lambda_i)}
$$
的形式，那么原系统可看作$n$个一阶系统的级联。
此时我们将这些一阶系统的输出视为状态变量，则系统的状态空间表示为
$$
\left\{
    \begin{aligned}
        \dot{\mathbf x} &= \begin{bmatrix} \lambda_n & 1 & 0 & \cdots & 0 \\
        0 & \lambda_{n-1} & 1 & \cdots & 0 \\
        \vdots & \vdots & \vdots & \ddots & \vdots \\
        0 & 0 & 0 & \cdots & \lambda_1
        \end{bmatrix} \mathbf x + e \begin{bmatrix} 0 \\ \vdots \\ 0 \\ 1
        \end{bmatrix} \\
        y &= \begin{bmatrix} 1 & 0 & \cdots & 0 \end{bmatrix} \mathbf x
    \end{aligned}
\right..
$$

### 状态空间表示的时域响应

欲求解状态空间表示的系统的时域响应，则需要求解由状态方程表示的微分方程组。

首先考虑没有输入的情况。
[之前的文章]({% post_url structure-mechanics/2024-03-30-rayleigh-ritz-method %}#附录常系数微分方程组的解)中，我们介绍过，微分方程
$$
\mathbf {\dot x} = A \mathbf x
$$
的解与基解矩阵
$$
\exp [At] = \sum_{k=0}^{\infty} \frac{A^k t^k}{k!}
$$
密切相关，这个矩阵也叫做系统的*状态转移矩阵*（State transition matrix）。
若该矩阵能够求出，则方程的解可写为
$$
x(t) = \exp [A(t - t_0)] x(t_0),
$$
而这就是系统对空输入的时域响应。

对非空输入的时域响应，我们可使用以下命题。

设系统的输入为$u(t)$，其在某一时刻$t\_0$的状态$x(t\_0)$已知，则在状态空间表示中系统的时域响应为
$$x(t) = \Phi(t, t_0) x(t_0) + \int_{t_0}^t \Phi(t, \tau) B u(t) \, \mathrm d \tau,$$
输出为
$$
\begin{multline}
y(t) = Cx(t) + Du(t) \\ 
= C \Phi(t, t_0) x(t_0) + C\int_{t_0}^t \Phi(t, \tau) B u(t) \, \mathrm d \tau + Du(t),
\end{multline}
$$
其中
$$
\Phi(t, t_0) = \exp [A(t - t_0)]
$$
是系统的状态转移矩阵。
{: .proposition}

考虑状态方程
$$\dot x(t) = A x(t) + B u(t)$$
移项，两边同时乘$\exp[-At]$，得到
$$\exp[-At] \dot x(t) - \exp[-At] A x(t) = \exp[-At]Bu(t)$$
注意到
$$\exp[-At] \dot x(t) - \exp[-At] A x(t) = \frac{\mathrm d}{\mathrm d t}\exp[-At] x(t)$$
从而原方程可改写为
$$\frac{\mathrm d}{\mathrm d t}\exp[-At] x(t) = \exp[-At]Bu(t)$$
两边同时积分，原式即得证。
{: .proof}

### 系统矩阵的特征值

若系统已具有状态空间表示，则其大量性质可由系统矩阵的特征值推出，尤其是稳定性。

线性时不变系统是（渐进）稳定的，当且仅当其所有特征值的实部小于零。
{: .theorem}

根据上文中我们对线性时不变系统的系统矩阵的构造，我们知道系统矩阵的特征值与传递函数的极点一一对应，因此该判据与经典的判据是等价的。

考虑状态方程及其拉普拉斯变换：
$$
\mathcal L[\dot x] = \mathcal L[Ax(t) + Bu(t)] \iff sX(s) = AX(s) + BU(s).
$$
移项，可得
$$(s \mathbf I - A) X(s) = BU(s).$$
不妨认为$(s\mathbf I - A)$是可逆的，则原式可写为
$$X(s) = (s \mathbf I - A)^{-1} B U(s) = \frac{\mathrm{adj}(s \mathbf I - A) B}{\det(s \mathbf I - A)} U(s),$$
其中$\mathrm{adj}$表示矩阵的伴随矩阵，即代数余子式的转置。
考虑新的传递函数
$$H(s) = \frac{\mathrm{adj}(s \mathbf I - A) B}{\det(s \mathbf I - A)}$$
这里，注意到该传递函数的分母多项式恰为系统矩阵的特征多项式。
由于传递函数$H$的系统稳定当且仅当其极点均在负平面上，因此该系统稳定，当且仅当系统矩阵的所有特征值的实部均为负。
{: .proof}

根据上面的证明，我们已经知道了状态空间表示与拉普拉斯域表示的一致性。
根据这样的一致性，我们也可以确定系统的准确性和响应时间。
在拉普拉斯域中，系统的准确性仅与零极点的个数（即积分次数）有关，而在状态空间表示中，这被替代为系统矩阵的特征多项式的零根的个数，即特征值零的代数重数。
而系统的响应时间则可使用与拉普拉斯域相同的主极点近似，即将距实轴最近的极点视为主极点（Dominant pole），响应时间取该极点实部倒数的相反数。

### 能控性与能观性

系统的状态空间表示中，重要的两个性质为*可控制性*（Controllability）与*可观测性*（Observability）。

#### 可控制性

若通过改变系统的输入$u$，可以改变状态向量$x$的值，那么称该系统是*可控制的*（Controllable），数学上讲，即对所有可能的状态$x^\*$，均存在一时间$T$与输入向量$u(0 < t \le T)$，使得系统能从初始状态$x(0)$运动到$x(T) = x^\*$。
{: .definition}

线性时不变系统的可控制性可由可控制性矩阵的秩确定。

线性时不变系统是可控的，当且仅当其可控性矩阵
$$
\mathcal C(A,B) = \begin{bmatrix} B & AB & \cdots & A^{n-1} B \end{bmatrix} \in \mathbb R^{n \times n\cdot m}
$$
的秩为$n$，即满秩。
{: .proposition}

证明该命题前，我们先证明一个引理。

设$f$为一解析函数，即
$$f(x) = \sum_{k=0}^\infty a_k x^k,$$
那么该解析函数关于方形矩阵$A \in \mathbb R^{n\times n}$的值，是矩阵的多项式函数，且该多项式的次数小于$n$。
{: .lemma}

设方阵$A$的特征多项式为$\chi\_A(x)$，对解析函数应用长除法，可得
$$f(x) = \chi_A(x) q(x) + r(x)$$
其中$r$是一个次数小于$n$的多项式，即余数。
现在，根据哈密顿-凯莱定理，方阵的多项式也是零化多项式，从而带入，得到
$$f(A) = \cancel{\chi_A(A) q(A)} + r(A)$$
{: .proof}

现在，由于矩阵指数也是解析函数，我们可将其写为次数小于$n$的多项式函数，即
$$
\exp[At] = \sum_{i=0}^{n-1} w_i(t) A^i 
$$
其中$w\_i$是一个函数。
利用这一结论，我们即可完成可控制性的证明。

考虑系统的时域响应，取$t\_0 = 0$，由于$x(0) = 0$，有
$$x(t) = \int_{0}^t \Phi(t, \tau) B u(t) \, \mathrm d \tau $$
换元，令$\tau' = t - \tau$，得
$$x(t) = -\int_0^t \exp[A\tau'] B u(t - \tau') \; \mathrm d \tau'.$$
将指数函数重写，得到
$$x(t) = - \sum_{i=0}^{n-1} \left(A^i B  \int_0^t w_i(\tau) u(t - \tau') \; \mathrm d \tau'\right) = - \sum_{i=0}^{n-1} A^i B \alpha_i(t)$$
这意味着$x(t)$在$A^iB$张成的子空间中，这个子空间称为系统的能控子空间（Controllable subspace）。
若该子空间的秩与状态空间相同，则所有状态均可达，从而原系统可控。
{: .proof}

#### 可观测性

若系统的一个初始状态$x(t\_0)$可由一段时间内观测的输出$y(t\_0 < t \le t\_f)$计算出，那么称该初始状态是*可观测的*（Observable）。
若系统的所有初始状态均可由这种方式计算出，那么称该系统是*完全可观测的*，也简称可观测的。
{: .definition}

可观测性也可由矩阵确定。

线性时不变系统是观测的，当且仅当其能观性矩阵
$$
\mathcal O(A,B) = \begin{bmatrix} C \\ CA \\ \vdots \\ C A^{n-1} \end{bmatrix} \in \mathbb R^{p\cdot n \times n}
$$
的秩为$n$，即满秩。
{: .proposition}

其证明与可控性大体相同。

#### 对偶关系

能控性与能观性之间具有以下的对偶关系：

线性时不变系统$(A,B,C,D)$能控，当且仅当系统$(A^T, C, B^T, D)$能观。
{: .proposition}

带入能控性与能观性矩阵即可证明。

#### 状态空间变换

同一传递函数$H(p)$可具有无穷多的实现，然而其中的一些实现在某些情况下可能比其他实现更易于分析。
我们可通过*相似变换*（Similarity transformation）来在状态空间表示中转化。

对任何状态空间变量$x$，我们均可在其上应用一个可逆的变换$T$，得到新的状态变量
$$\hat x = T x.$$
而新的状态空间表示为
$$
\left\{
    \begin{aligned}
        \dot{\hat x} &= TAT^{-1} \hat x + TB u = \hat A \hat x + \hat B u \\
        y &= CT^{-1} \hat x + Du = \hat C \hat x + Du
    \end{aligned}
\right..
$$

容易验证新的状态空间表示的传递函数与原传递函数相同。

## 状态空间的控制器设计

本节中我们将说明常见的状态空间中的控制器的设计方法。

### 状态反馈控制器

我们已经知道，系统状态空间表示中的系统矩阵的特征值与传递函数的极点密切相关，因此我们可以通过设计一个利用状态$x$进行控制的控制器，来调整系统矩阵及其极点，从而实现控制。
这种控制器称为*状态反馈控制器*（State feedback controller），这种设计方法叫做*极点配置法*（Pole placement）。

状态反馈控制器的控制律非常简单。
我们只考虑单输入的系统，则系统的输入$u$由以下线性方程决定：
$$
u = - K x + G r
$$
其中$r$称为参考输入，$G$是参考输入的增益。

考虑引入该控制器的系统的状态方程，有
$$
\begin{aligned}
\dot x &= A x + B u \\
&= A x + B(-Kx + Gr) \\
&= (A - BK) x + BG r
\end{aligned}
$$
设系统的初始状态为零，进行拉普拉斯变换，得到
$$
sX(s) = s(A-BK)X(s) + BGR(s)
$$
从而其特征方程为
$$\det(s \mathbf I - A + BK) = 0$$
当系统的所有极点均已给定时，利用待定系数法求解多项式方程即可得到$K$向量的所有值。

若系统的状态空间表示恰好是可控标准型，则矩阵$A - BK$为
$$
A-BK = \begin{bmatrix}
0 & 1 & 0 & \cdots & 0 \\
0 & 0 & 1 & \cdots & 0 \\
\vdots & \vdots & \vdots & \ddots & \vdots \\
-(a_0 + k_0) & -(a_1+k_1) & -(a_2+k_2) & \cdots & (a_{n-1}+k_{n-1})
\end{bmatrix},
$$
利用这个矩阵可以容易地算出所有极点。

### 积分反馈控制器

状态反馈控制器无法解决系统的稳态误差问题，我们可通过引入积分项来修正稳态误差。

积分反馈的思想是比较简单的，我们可通过引入一个额外的状态变量来保存误差的积分信息。
对单输入单输出系统，这个状态对应的状态方程写作
$$
\dot z(t) = r - y(t) = r - C x(t) - D u(t) = r - Cx(t)
$$
其中$r$是被控制器控制的新系统的输入。
一般系统的前馈矩阵为零，因此最后一项可省略。

新的系统的状态向量则为
$$
\mathbf x' = \begin{bmatrix} \mathbf x & z \end{bmatrix}^T
$$
这个系统称为增广系统（Augmented system）。
该系统的状态方程为
$$
\dot {\mathbf x'} = \begin{bmatrix}
A & 0 \\
C & 0
\end{bmatrix} \mathbf x' + u \begin{bmatrix} B \\ D \end{bmatrix} + \begin{bmatrix} 0 \\ r \end{bmatrix},
$$
输出方程为
$$
y = \begin{bmatrix} C & 0 \end{bmatrix} \mathbf x'.
$$

对控制器的设计，则使用与状态反馈控制器相同的方式，只是此时还要考虑新的状态：
$$
u = - F \mathbf x' = - \begin{bmatrix} F_1 & F_2 \end{bmatrix} \begin{bmatrix} \mathbf x \\ z \end{bmatrix}.
$$
从而整个系统的状态方程变为
$$
\dot {\mathbf x'} = \begin{bmatrix} A - B F_1 & - B F_2 \\ -C & 0 \end{bmatrix} \mathbf x' + \begin{bmatrix} 0 \\ r \end{bmatrix}.
$$
之后通过放置极点即可完成控制器的设计。

### 观测器

有些时候，系统的状态不能直接被观测到，此时可使用*观测器*（Observer）来估计系统的状态。

最常见的观测器设计为龙倍格观测器（Luenberger observer），该观测器以系统状态的估计$\hat x$作为状态变量，系统的状态方程为
$$
\dot {\hat x} = A \hat x + B u - L(\hat y - y),
$$
其中$\hat y = C \hat x + D u$为估计的系统的输出。

观测器的误差，定义为$\epsilon = x - \hat x$，的状态方程为
$$
\begin{aligned}
\dot \epsilon &= \dot x - \dot{\hat x} \\
&= Ax + Bu - (A\hat x + Bu - L(\hat y - y)) \\
&= (A + LC) (x - \hat x) \\ &= (A + LC) \epsilon
\end{aligned}
$$
我们希望，当$t \to \infty$时，观测器的误差趋近于零，这等价于系统渐进稳定，即矩阵$A+LC$稳定。
这可以通过配置矩阵$A+LC$的极点实现，而这样的极点存在的一个充分条件是系统可观测。
若$\mathcal O\_{A,C}$满秩，则可任意选定稳定的极点来构造$L$。

实践上，一般通过系统的稳定极点（即位于负平面的极点）乘一个大系数（如$10$）来构造$L$。
这样选择能够保证观测器收敛且响应速度较快。
