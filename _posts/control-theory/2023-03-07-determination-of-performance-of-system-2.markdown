---
layout: single
title: "用代数方法确定系统的性能——准确性与健壮性"
categories: "控制理论"
---

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

不考虑微扰$P(t)$，因此其值永远为零：
$$
\left\{
    \begin{aligned}
        P(t) &= 0 \\
        e(t) &\neq 0
    \end{aligned}
\right.
$$

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

只有极点（分母的零点）才能算作积分次数，像一阶系统$\frac{K}{1 + \tau p}$就不能算作积分。
{: .remark}

## 健壮性

健壮性，也称鲁棒性（Robustness），是系统抵抗外界扰动的能力。
为了研究这个能力，我们设输入为零而扰动不为零：
$$
\left\{
    \begin{aligned}
        P(t) &\neq 0 \\
        e(t) &= 0
    \end{aligned}
\right.
$$
此时我们画出简化的框图，注意到因为$e(t) = 0$，所以$R$的输出直接变成$-\epsilon$，代替$u_r$。

![](/assets/system/block-diagram-robustness.svg)
{: .aligned-center}

我们依然要让$\epsilon(\infty) = 0$，所以需要求出这个系统的传递函数。
使用反馈环的传递函数公式，可知：
$$
\epsilon(p) = - \frac{G_2 \cdot R \cdot P}{1 + C \cdot G_1 \cdot G_2 \cdot R} = -\frac{G_2 \cdot R \cdot P}{1 + H_{BO}}
$$
我们根据传递函数在$P(t)$之前还是之后将这个函数分为两个部分，设：
$$
\begin{aligned}
    G_2 \cdot R &= \frac{K_1}{p^\alpha} \frac{N_1(p)}{D_1(p)} \\
    C \cdot G_1 &= \frac{K_2}{p^\beta} \frac{N_2(p)}{D_2(p)} \\
\end{aligned}
$$
其中$N\_1(0) = N\_2(0) = D\_1(0) = D\_2(0) = 1$，都是多项式。
从而
$$
\begin{aligned}
    \epsilon(t \to \infty) &= \lim_{p \to 0} p \epsilon(p) \\
    &= - \lim_{p \to 0} \frac{K_1 p^{\beta + 1} N_1 D_2}{p^{\alpha + \beta} D_1 D_2 + K_1 K_2 N_1 N_2} P(p) \\
    &= - \lim_{p \to 0} \frac{K_1 p^{\beta + 1}}{p^{\alpha + \beta} + K_1 K_2} P(p)
\end{aligned}
$$
不难看出，这个形式和准确性的形式非常相似，但是与准确性中不同，这里分子上的次数是$\beta$，也就是$C \cdot G\_1$的积分次数，而非整个反馈环的。
我们有：

若其反馈环内**在扰动之前**有$n$次积分，则系统对$n$次（及以下）扰动$e(t) = a t^n u(t)$是强健的。
{: .proposition}

## 使用表格计算误差

如果一个系统不是准确或强健的，那么我们可能需要求出其最后的误差，这种情况下，我们可以使用之前的计算得到的表格：

| 输入与$\alpha$ | $e_0 u(t)$ | $atu(t)$ | $\frac{\gamma}{2}t^2u(t)$ |
| 0 | $\frac{A e\_0}{1 + K\_{BO}}$ | $\infty$ | $\infty$ |
| 1 | $0$ | $\frac{Aa}{K\_{BO}}$ | $\infty$ |
| 2 | $0$ | $0$ | $\frac{A\gamma}{K\_{BO}}$ |
{: .aligned-center}

同样地，我们也可以为扰动计算表格：

| 扰动与$\beta$ | $e_0 u(t)$ | $atu(t)$ | $\frac{\gamma}{2}t^2u(t)$ |
| 0 | $\frac{A e\_0}{p^a + K\_1 K\_2}$ | $\infty$ | $\infty$ |
| 1 | $0$ | $-\frac{a}{K\_2}$ | $\infty$ |
| 2 | $0$ | $0$ | $-\frac{\gamma}{K\_2}$ |
{: .align-center}

然后，我们可以使用这两张表格来确定稳定态的误差。
