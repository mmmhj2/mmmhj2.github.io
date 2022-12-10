---
layout: post
title: "用代数方法确定系统的性能"
categories: 
date: 2022-12-10 15:30:00 +0800
--- 

此前，我们已经知道线性时不变系统的性能可由几个物理量描述。
现在，我们希望通过某些方法确定系统的具体性能。

## 稳定性

我们知道，线性系统的稳定性通常指的是**有界输入有界输出稳定性**，通常简写为BIBO稳定性。
这就是说，线性系统对于任何有界的输入，其输出也应该是有界的。
我们以阶跃输入为例，来研究线性系统的稳定性。

### 极点条件

我们知道，线性是不变系统的函数可写为：
$$
\begin{aligned}
H(p) 
&= \frac{K \exp (-\tau p)}{p^\alpha} \frac{1 + b_1 p + \cdots + b_m p^m}{1 + a_{\alpha+1} p + \cdots a_n p^(n-\alpha)} \\
&= \frac{K \exp (-\tau p)}{p^\alpha} \frac{b_m \prod (p - z_i)}{a_n \prod (p - p_i)}
\end{aligned}
$$
如果输入为Heaviside阶跃函数，即$E(p) = 1/p$，那么输出可写为：
$$
\begin{aligned}
S(p) &= E(p) \times H(p) \\
&= \frac{K \exp (-\tau p)}{p^{\alpha+1}} \frac{b_m \prod (p - z_i)}{a_n \prod (p - p_i)}
\end{aligned}
$$
我们假设系统的延时$\tau = 0$，并且没有重根，那么为了进行拉普拉斯逆变换可将有理分式裂项：
$$
\begin{aligned}
S(p) 
&= \frac{A_1}{p} + \frac{A_2}{p^2} + \cdots + \frac{A_{\alpha+1}}{p^{\alpha+1}} + 
\frac{B_1}{p - p_1} + \cdots + \frac{B_{n-\alpha}}{p - p_{n-\alpha}} \\
&= \sum_{i=0}^\alpha \frac{A_{i+1}}{p^{i+1}} + \sum_{j=1}^{n - \alpha} \frac{B_j}{p - p_j}
\end{aligned}
$$
进行拉普拉斯逆变换（略去逆变换中的Heaviside函数）：
$$
s(t) = \sum_{i=0}^\alpha \frac{A_{i+1}}{i !} t^i + 
\sum_{p_j \in \mathbb R} B_j e^{p_j t} + 
\sum_{p_k \in \mathbb C} \left( B_k e^{p_k t} + \overline{B_k} e^{\overline{p_k} t} \right)
$$
这里需要注意，多项式要么有实根要么有共轭的虚根，因此我们将实根和虚根分开讨论。

对于虚根，我们设$p_k = \alpha_k + j \beta_k, \; B_k = a_k + j b_k$，从而有：
$$
\begin{aligned}
B_k e^{p_kt} + \overline{B_k} e^{\overline{p_k} t}
&= 2 e^{\alpha_n t} \left[ a_k \cos \beta_k t - b_k \sin \beta_k t \right] \\
&= 2 \left| B_k \right| e^{\alpha_k t} 
\left[ \frac{a_k}{\sqrt{a_k^2 + b_k^2}} \cos \beta_k t + \frac{b_k}{\sqrt{a_k^2 + b_k^2}} \sin \beta_k t \right] \\
&= 2 \left| B_k \right| e^{\alpha_k t}  \cos \left( \beta_k t + \varphi_k \right) 
\end{aligned}
$$
代入原式即可得到：
$$
s(t) = \sum \frac{A_{i+1}}{i!} t^i + \sum B_j e^{p_j t} + 2 \sum \left| B_k \right| e^{\alpha_k t}  \cos \left( \beta_k t + \varphi_k \right)
$$

现在我们要求输出在$\[0, \infty)$上有界，这就要求：
- $i < 1$
- $p_j < 0$
- $\alpha_k < 0$

现在我们尝试消去一些假设，看看这个判据能否广泛使用。

- $\tau > 0$：我们知道，系统的延迟对其稳定性没有影响，因此这个假设可以消去；
- 重根； 如果出现重根，则裂项后的会出现形如$\frac{B_l}{(p - p_l)^n}$的项，而不止一次项。
  这种项的拉普拉斯逆变换的结果为$B_k t^n e^{p_l t}$，以上结论仍然适用。

从而，我们得出以下结论：

线性系统稳定当且仅当其所有极点的实部小于零。
{: .theorem}

### 系数条件

通过极点判断线性系统的稳定性形式简单而优美，但是现实中的系统往往难以用这种方式进行判断，因为不借助计算机求解高次多项式的零点非常困难。

对于一阶、二阶和三阶的系统，有以下结论：

- 一阶系统稳定，当且仅当其特征时间$\tau > 0$。
- 二阶系统稳定，当且仅当其特征多项式的所有系数大于零。
- 三阶系统稳定，当且仅当其特征多项式的所有系数大于零，且最高次与最低次系数之积小于其他两个系数之积。

对于更高阶的系统，我们有**劳斯–赫尔维茨稳定性判据**：

线性系统稳定当且仅当其特征多项式的所有系数同号，且劳斯表中主列的所有系数同号。
{: .theorem}

特征多项式就是传递函数分母上的多项式。

劳斯表是这样一张表：

|-----|-----|-----|-----|-----|
|$p^n$|$a_n$|$a_{n-2}$|$a_{n-4}$|$\cdots$|
|$p^{n-1}$|$a_{n-1}$|$a_{n-3}$|$a_{n-5}$|$\cdots$|
|$p^{n-2}$|$x_{3,1}$|$x_{3,2}$|$x_{3,3}$|$\cdots$|
|$\vdots$|$\vdots$|$\vdots$|$\vdots$|$\vdots$|
|$p^0$|$x_{n+1,1}$|$x_{n+1,2}$|$x_{n+1,3}$|$\cdots$|

其中每个未知元素可用以下公式求出
$$
x_{i,j} = - \frac{1}{x_{i-1, 1}} 
\begin{vmatrix}
x_{i-2,1} & x_{i-2, j+1} \\
x_{i-1,1} & x_{i-1, j+1}
\end{vmatrix}
$$
出界的元素视为0。

其主列就是除表头外的第一列，这一列的如果同号，则系统稳定；如果不同号，则其符号变换的次数等于不稳定极点的个数。

#### 主列含有零的处理办法

如果主列含有零的一行其他系数，那么可以采用一些简单的办法求解：
- 在原传递函数前加一个比例系数，然后构造闭环系统，研究新传递函数$H^\prime(p) = \frac{KH(p)}{1+KH(p)}$的稳定性；
- 在原特征多项式前乘一个根的实部为零多项式，如$R(X)=X+1$，然后研究新的特征多项式；
- 最常用的办法是把主列的零替换为微小量$\varepsilon$，算出其他值后取$0^+$或$0^-$。

如果劳斯表上存在一行全部为零，则其处理较为复杂。
若系统的劳斯表上存在全为零的行，那么这个系统要么是处于稳定界限的，要么是不稳定的。
我们可以通过构造一个辅助多项式并求导的方法计算其劳斯表的下一行。
即使如此，我们还是无法准确判定系统到底是处于稳定界限还是不稳定的，考虑这个特征多项式：
$$
Q(p) = p^5 + p^4 + 2p^3 + 2p^2 + p + 1
$$
其劳斯表为：

|---|---|---|---|
|$p^5$| 1 | 2 | 1 |
|$p^4$| 1 | 2 | 1 |
|$p^3$| 0 | 0 |   |
|$p^2$| 1 | 1 |   |
|$p^1$| 0 |   |   |
|$p^0$| 1 |   |   |

我们可以构造两个辅助多项式
$p^4 + 2 p^2 + 1$和$p^2 + 1$
然后求导得
$4p^3 + 4p^2$和$2p$，从而得到第三行为(4, 4, 0)，第五行为(2, 0, 0)。
然后，我们知道新的劳斯表中主列都是同号的，从而这个传递函数是处于稳定界限的。

但实际上，这个传递函数是不稳定的。

数学上可以证明，辅助多项式可以整除原特征多项式，从而我们尝试将$Q(p)$因式分解：
$$
Q(p) = (p - j)^2 (p + j)^2 (p+1)
$$
看上去似乎仍然满足稳定条件。

我们尝试将其放在分母上，乘上阶跃输入，然后进行拉普拉斯逆变换：
$$
\begin{aligned}
\frac{1}{Q(p)} * \frac{1}{p}
&= \frac{1}{(p - j)^2 (p + j)^2 (p+1) p} \\
&= \frac{1}{p} - \frac{1}{4} \frac{1}{p+1} + \frac{1}{4} \frac{3p+2}{p^2+1} + \frac{1}{4} \frac{p^2 - 2p - 1}{(p^2+1)^2} \\
\iff 
s(t) &= \frac{1}{4} \left( 4 - e^{-t} + 3 \cos t + 2 \sin t + t \cos t - t \sin t \right) u(t) 
\end{aligned}
$$
从而这个系统对有界输入产生了无界输出，因此是不稳定的。
这是由于$\pm j$处的重根导致的。

因此我们可以总结出以下注意事项：

以上判据只能确定系统**是否稳定**，但无法区别系统处于**稳定界限**还是**不稳定**。
要区别系统处于稳定界限还是不稳定，可以使用拉普拉斯逆变换的方法。
{: .remark}

## 准确性

我们考虑下面这个典型系统的准确性：

![](/assets/system/block-diagram-precision.svg)
{: .center-image}

通常我们要求的准确性是指输出于期望的输入指令相同。
但是一般情况下，输入和输出的物理量并不相同，比如在常见的速度控制杆系统中，输入是杆的位置，而输出是速度。
因此，我们把思路转换一下，要求$u_a(t)$和$u_r(t)$相同。
通常来讲，这两个物理量是相同的，因为我们需要这两个物理量做减法来求出误差。
在电子系统中通常为电势（电压），在液压系统中通常为压力等。
这两个物理量相同，那么误差自然趋近于零。
根据拉普拉斯变换的性质，我们有：
$$
\lim_{t \to \infty} \varepsilon(t) = \lim_{p \to 0} p \varepsilon(p)
$$

不考虑微扰$P(t)$，因此其值永远为零。
我们假设传递函数$A(p)$为常数。
这个传递函数通常表示传感器等，因此一般可以当作常数。
接下来计算误差对输入的传递函数：
$$
\begin{aligned}
\varepsilon(p) 
&= u_a(p) - u_r(p) \\
&= AE(p) - R(p) \cdot G_2(p) \cdot G_1(p) \cdot C(p) \cdot \varepsilon(p) \\
\implies
\varepsilon(p)  
&= \frac{A}{1 + C(p) \cdot G_1(p) \cdot G_2(p) \cdot R(p)} E(p) \\
&= \frac{A}{1 + H_{BO}(p)} E(p)
\end{aligned}
$$
我们此前已经指出，反馈环内所有传递函数的积叫做**开环传递函数**，$H_{BO}(p) = C(p) \cdot G_1(p) \cdot G_2(p) \cdot R(p)$。
现在我们把开环传递函数写成多项式的形式：
$$
\begin{aligned}
H_{BO}(p) 
&= \frac{b_0 + b_1 p + \cdots + b_m p^m}{a_0 + a_1 p + \cdots + a_n p^n} \\
&= \frac{K_{BO}}{p^\alpha} 
\frac{1 + b_1^\prime p + \cdots + b_m^\prime p^m}{1 + a_{\alpha+1}^\prime p + \cdots + a_n^\prime p^{n-\alpha}} \\
&= \frac{K_{BO}}{p^\alpha} \frac{N_{BO}(p)}{D_{BO}(p)} \qquad N_{BO}(0) = 1 \quad D_{BO}(0) = 1
\end{aligned}
$$
从而我们有：
$$
\begin{aligned}
\varepsilon(p)
&= \frac{A}{1 + \frac{K_{BO}}{p^\alpha} \frac{N_{BO}(p)}{D_{BO}(p)}} E(p) \\
&= \frac{A p^\alpha D_{BO}(p)}{p^\alpha D_{BO}(p) + K_{BO} N_{BO}(p)} E(p) \\
\lim_{p \to 0} p \varepsilon(p)
&= \lim_{p \to 0} \frac{A p^{\alpha+1} D_{BO}(p)}{p^\alpha D_{BO}(p) + K_{BO} N_{BO}(p)} E(p) \\
&= \lim_{p \to 0} \frac{A p^{\alpha+1}}{p^\alpha + K_{BO}} E(p)
\end{aligned}
$$

不难看出，这个极限到底是否趋于零和输入有很大的关系，因此我们分类讨论一下。

--- 

阶跃输入：$e(t) = e_0 u(t) \iff E(p) = \frac{e_0}{p}$
$$
\varepsilon(t = \infty) = \lim_{p \to 0} \frac{A e_0 p^\alpha}{p^\alpha + K_{BO}}
$$
当且仅当$\alpha \ge 0$时此极限为零，从而系统准确。

---

斜坡输入：$e(t) = a t u(t) \iff E(p) = \frac{a}{p^2}$
$$
\varepsilon(t = \infty) = \lim_{p \to 0} \frac{A a p^{\alpha-1}}{p^\alpha + K_{BO}}
$$
当且仅当$\alpha \ge 1$时此极限为零，从而系统准确。

---

二次输入：$e(t) = \gamma \frac{t^2}{2} u(t) \iff E(p) = \frac{\gamma}{p^3}$
$$
\varepsilon(t = \infty) = \lim_{p \to 0} \frac{A \gamma p^{\alpha-2}}{p^\alpha + K_{BO}}
$$
当且仅当$\alpha \ge 2$时此极限为零，从而系统准确。

---

从而我们可以得出以下结论：

若其反馈环内有$n$次积分，则系统对$n$次（及以下）输入$e(t) = a t^n u(t)$准确。
{: .proposition}

这条定理说明了为何PID控制系统中，如果缺少积分环节，则会存在稳态误差。
