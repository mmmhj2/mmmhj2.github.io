---
title: "摄动与变分理论"
categories: ["量子力学"]
---

本文研究求解薛定谔方程的两种近似方法——摄动理论和变分方法。

## 摄动理论

摄动理论（Pertubation theory）是通过在简单系统的解上施加微小的扰动以求得新的更复杂系统的近似解的方法。
本节主要考虑不显含时间的哈密顿量，这种摄动理论称为不含时摄动理论。

### 摄动理论基础

假设我们为一个简单的哈密顿量$\hat H\_0$求解了一个简单的本征态$\psi\_j^{(0)}$，即
$$\hat H_0 \vert \psi_j^{(0)} \rangle = \varepsilon^{(0)} \vert \psi_j^{(0)} \rangle$$
其中$0$表示零阶摄动。

现在我们为哈密顿量施加一个小的摄动$\hat W = \eta \hat V$，$\eta \in [0,1]$是一个无量纲的参数，则新的哈密顿量为
$$\hat H = \hat H_0 + \hat W = \hat H_0 + \eta \hat V$$
则新的薛定谔方程为
$$\hat H \vert \psi \rangle = \hat H_0 \vert \psi \rangle + \eta \hat V \vert \psi \rangle = \varepsilon \vert \psi \rangle$$

若摄动足够微小，则可将新的解写为$\eta$的幂级数的形式
$$
\begin{array}{rllll}
\vert \psi \rangle &= \vert \psi^{(0)} \rangle &+ \eta \vert \psi^{(1)} \rangle &+ \eta^2 \vert \psi^{(2)} \rangle &+\cdots \\
\varepsilon &= \varepsilon^{(0)} &+ \eta \varepsilon^{(1)} &+ \eta^2 \varepsilon^{(2)} &+\cdots 
\end{array}
$$
将该幂级数形式代入原薛定谔方程，可得
$$
\hat H_0 \sum_n \eta^n \vert \psi^{(n)} \rangle + \eta \hat V \sum_n \eta^n \vert \psi^{(n)} \rangle = \sum_{n} \left( \eta^{n} \varepsilon^{(n)} \sum_{n'} \eta^{n+n'} \vert \psi^{(n')} \rangle \right)
$$
移项化简可得
$$\hat H_0 \sum_n \eta^n \vert \psi^{(n)} \rangle + \hat V \sum_n \eta^{n+1} \vert \psi^{(n)} \rangle - \sum_{n} \left( \eta^{n} \varepsilon^{(n)} \sum_{n'} \eta^{n+n'} \vert \psi^{(n')} \rangle \right) = 0$$

现在进行次数匹配。
首先考虑$\eta^0$，得到
$$\hat H_0 \vert \psi^{(0)} \rangle - \epsilon^{(0)} \vert \psi^{(0)} \rangle = 0$$
这就是未经摄动的系统的薛定谔方程。
接下来考虑$\eta^1$，得到
$$
\begin{aligned}
& \eta \hat H_0 \vert \psi^{(1)} \rangle + \eta \hat V \vert \psi^{(0)} \rangle - \eta \left(\varepsilon^{(0)} \vert \psi^{(1)} \rangle + \varepsilon^{(1)} \vert \psi^{(0)} \rangle \right) = 0 \\
\implies & \hat H_0 \vert \psi^{(1)} \rangle + \hat V \vert \psi^{(0)} \rangle - \left(\varepsilon^{(0)} \vert \psi^{(1)} \rangle + \varepsilon^{(1)} \vert \psi^{(0)} \rangle \right) = 0
\end{aligned}
$$
这是一阶摄动薛定谔方程，我们考虑对其进行化简。
两边同时内积于$\langle \psi^{0} \vert$，得到
$$\langle \psi^{(0)} \vert \hat V \vert \psi^{(0)} \rangle = \varepsilon^{(1)}$$
这意味着施加摄动$\hat W$约使得原系统的能量增加$\langle \psi^{(0)} \vert \hat V \vert \psi^{(0)} \rangle$。
然而这些增加的能量只考虑了摄动的一阶项，若希望求出更精确的解，则需要考虑高阶摄动并施加相应的修正。

### 非简并态一阶修正

我们考虑对一阶摄动进行进一步修正。

在进行修正之前，必须先考虑解向量的正规化问题，即
$$\left\Vert \vert \psi^{(0)} \rangle + \eta \vert \psi^{(1)} \rangle \right\Vert^2 = 1$$
注意到$\langle \psi^{(0)} | \psi^{(0)} \rangle = 1$，展开化简并忽略高阶无穷小项$\eta^2$后可得
$$\langle \psi^{(0)} \vert \psi^{(1)} \rangle + \langle \psi^{(0)} \vert \psi^{(1)} \rangle = 0$$
这意味着一阶摄动解与对应的摄动前的解正交。

利用投影恒等式，注意到
$$ \sum_i \vert \psi^{(0)}_i \rangle \langle \psi^{(0)}_i \vert = \sum_i \vert i^{(0)} \rangle \langle i^{(0)} \vert = \hat{\mathbf 1}$$
从而
$$
\begin{aligned}
\hat V \vert i^{(0)} \rangle &= \sum_j \vert j^{(0)} \rangle \langle j^{(0)} \vert \hat V \vert i^{(0)} \rangle \\
&= \sum_{i \neq j} \vert j^{(0)} \rangle \langle j^{(0)} \vert \hat V \vert i^{(0)} \rangle + \vert i^{(0)} \rangle \langle i^{(0)} \vert \hat V \vert i^{(0)} \rangle \\
&= \sum_{i \neq j} \vert j^{(0)} \rangle \langle j^{(0)} \vert \hat V \vert i^{(0)} \rangle + \varepsilon_i^{(1)} \vert i^{(0)} \rangle
\end{aligned}
$$
回代入一阶摄动方程，可得
$$(\varepsilon_i^{(0)} - \hat H_0) \vert i^{(1)} \rangle = \sum_{i \neq j}  \vert j^{(0)} \rangle \langle j^{(0)} \vert \hat V \vert i^{(0)} \rangle$$
现在将方程左乘$\langle k^{(0)} \vert$，即在该向量上投影，若$k \neq i$，则可得到
$$(\varepsilon_i^{(0)} - \hat H_0) \langle k^{(0)}\vert i^{(1)} \rangle = (\varepsilon_i^{(0)} - \varepsilon_k^{(0)}) \langle k^{(0)}\vert i^{(1)} \rangle = \langle k^{(0)} \vert \hat V \vert i^{(0)} \rangle$$
若能级是非简并的，即其能量各不相同，则可从投影构造原向量，注意到$\vert i^{(1)} \rangle$与$\vert i^{(0)} \rangle$正交，因此不考虑此项，可得
$$\vert i^{(1)} \rangle = \sum_{i \neq j} \frac{\langle j^{0} \vert \hat V \vert i^{(0)} \rangle}{\varepsilon_i^{(0)} - \varepsilon_j^{(0)}} \vert j^{(0)} \rangle$$
因此
$$\vert i \rangle \approx \vert i^{(0)} \rangle + \eta \vert i^{(1)} \rangle = \vert i^{(0)} \rangle + \eta \sum_{i \neq j} \frac{\langle j^{0} \vert \hat V \vert i^{(0)} \rangle}{\varepsilon_i^{(0)} - \varepsilon_j^{(0)}} \vert j^{(0)} \rangle$$
同时其能量为
$$\varepsilon \approx \varepsilon^{(0)} + \eta \varepsilon^{(1)} = \varepsilon^{(0)} + \eta \langle i^{(0)} \vert \hat V \vert i^{(0)} \rangle$$

更高阶的情况可使用类似的步骤算出，而其计算相当复杂。
此处仅给出二阶能量修正：
$$\varepsilon \approx \varepsilon^{(0)} + \eta \langle i^{(0)} \vert \hat V \vert i^{(0)} \rangle + \eta^2 \sum_{i \neq j} \frac{\left\vert \langle i^{(0)} \vert \hat V \vert j^{(0)} \rangle \right\vert^2}{\varepsilon_i^{(0)} - \varepsilon_j^{(0)}}$$

### 简并态一阶修正

现在考虑存在简并态的情况，特别地，考虑摄动解就在简并态张成的空间中的情况，此时方程
$$(\varepsilon_i^{(0)} - \varepsilon_k^{(0)}) \langle k^{(0)}\vert i^{(1)} \rangle = \langle k^{(0)} \vert \hat V \vert i^{(0)} \rangle$$
没有解，因为$\varepsilon\_i^{(0)}$可能等于$\varepsilon\_k^{(0)}$。
设所有简并的本征态张成的子空间为$D$，现在我们只考虑简并空间中的一阶摄动，此时
$$\vert i \rangle = \sum_{j \in D} \alpha_{ij} \vert j^{(0)} \rangle + \eta \vert i^{(1)} \rangle$$
我们希望求解该摄动对应的能量$\varepsilon^{(1)}$，这等价于求解以下特征值问题
$$\hat V \vert i^{(0)} \rangle = \varepsilon_i^{(1)} \vert i^{(0)} \rangle$$
在简并态的基底中写出坐标形式，即
$$
\begin{bmatrix}
\langle 0^{(0)} \vert \hat V \vert 0^{(0)} \rangle & \cdots & \langle 0^{(0)} \vert \hat V \vert d^{(0)} \rangle \\
\vdots & \ddots & \vdots \\
\langle d^{(0)} \vert \hat V \vert 0^{(0)} \rangle & \cdots & \langle d^{(0)} \vert \hat V \vert d^{(0)} \rangle 
\end{bmatrix} \vert i^{(0)} \rangle = \varepsilon_i^{(1)} \vert i^{(0)} \rangle
$$
而在简并空间$D$外的修正，则可使用非简并态的方法找到。

## 变分方法

我们也可以使用变分方法求解薛定谔方程，这是基于以下变分原理实现的。

设$\psi$是一归一化的函数，则泛函
$$\langle H \rangle = \frac{\langle \psi \vert \hat H \vert \psi \rangle}{\langle \psi \vert \psi \rangle}$$
取极值时的函数$\psi$就是哈密顿算符表示的系统的定态本征函数。
{: .theorem}

这可视为是最小作用量原理的量子力学表述。
特别注意，由于归一化的要求，其分母必须为一。

通常使用变分方法求解问题时，我们选择几个满足约束的多项式函数作为基函数，然后为其附上一个常系数，构成试探函数（Test function）$\psi$，最后直接求解哈密顿量并取极值即可。
具体方法参见[结构力学中的瑞利-里兹法](/结构力学/2024/03/30/rayleigh-ritz-method.html)一文。

### 例子：无限势阱中的粒子

考虑困在$[-1,1]$之间的一维无限深势阱中的粒子，验证试探函数
$$\psi(x) = a_1 f_1(x) + a_2 f_2(x) = a_1 (x^2-1) + a_2 (x^4-1)$$
的可行性并利用瑞利-里兹法求近似解。<br/>
实现验证边界条件：在$-1$和$1$处，试探波函数确为零。
利用积分计算作用量的分子和分母
$$
\begin{aligned}
\langle \psi \vert \hat H \vert \psi \rangle &= \int_{-1}^1 \psi^*(x) \left( -\frac{\hbar^2}{2m} \frac{\partial^2}{\partial x^2} \psi(x)\right) \,\mathrm d x \\
&= \frac{\hbar^2}{2m} \left( \frac{8}{3} a_1^2 + \frac{32}{5} a_1 a_2 + \frac{32}{7} a_2^2 \right) \\
\langle \psi \vert \psi \rangle &= \int_{-1}^1 \psi^*(x) \psi(x) \,\mathrm d x \\
&= \frac{16}{15} a_1^2 + \frac{256}{105} a_1 a_2 + \frac{64}{25} a_2^2
\end{aligned}
$$
现在我们希望在满足归一化约束的同时取$\langle \psi \vert \hat H \vert \psi \rangle$的极值，考虑使用拉格朗日乘数法，令：
$$
\begin{aligned}
g(a_1, a_2, \lambda) &= \frac{\hbar^2}{2m} \left( \frac{8}{3} a_1^2 + \frac{32}{5} a_1 a_2 + \frac{32}{7} a_2^2 \right) \\ &+ \lambda (\frac{16}{15} a_1^2 + \frac{256}{105} a_1 a_2 + \frac{64}{25} a_2^2 - 1)
\end{aligned}
$$
然后使
$$\frac{\partial g}{\partial a_1} = \frac{\partial g}{\partial a_2} = \frac{\partial g}{\partial \lambda} = 0$$
即可得出解。
{: .exampl}
