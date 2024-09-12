---
title: "优化算法"
categories: ["建模与优化"]
---

## 基本原理

### 优化问题

无约束的优化问题（或称数学规划问题）是指以下问题：
设$F: V \to \mathbb R$，求$\overline x \in V$，使
$$F(\overline x) \le F(x), \quad \forall x \in V$$
即求解最小值点的问题。
其中$F$称为目标函数。
{: .definition}

本文主要聚焦较为简单的一种情况，即$V = \mathbb R^n$、$F$二阶可微且严格凸的情况。

若$F$可微，则其极小值点的一个充分条件是该处的梯度为零，这相当于求解一个$n$元的线性方程组；若$F$还是严格凸的，那么最小值点等价于梯度为零。
梯度为零的点不一定是极小值点，还可能是极大值点或鞍点。

### 下降法

如欲找到函数的最小值，可以考虑从高处向低处逐步逼近的算法，即下降法。

<div class="definition">
下降法（Descent method）是指以下迭代地求解最小值的算法：
<ol>
<li>选择起始点$x^0$；</li>
<li>对某一点$x^k$，选择一下降方向$d^k$，并计算下一点
$$x^{k+1} = \rho^k d^k + x^k, \quad F(x^{k+1}) \le F(x^k)$$</li>
<li>计算梯度$\nabla F(x^{k+1})$，若梯度低于精度$\epsilon$，则算法停止。</li>
</ol>
</div>

下降法求解最优解的速度与可行性与多种选择有关，其中包括起点、方向、步长和终止条件的选择。

对严格凸函数，起点可任意选择，而对一般的函数，则需要考虑在最小值点附近开始。
对于方向的选择，最常用的方法为沿负梯度方向（梯度下降法）和沿坐标基底方向（松弛法）。
步长可选用定步长或变步长。
终止条件一般选择梯度足够小，也可选择函数值保持不变，或者，在变步长的情况下，选择步长足够小。

如果方向已经确定，以下命题可助于确定步长。

直线$x^k + \rho d^k$上，$F(x)$的最小值在其梯度$\nabla F$与$d^k$正交的$\rho$处取得。
{: .proposition}

## 梯度下降法

### 固定步长

固定步长的梯度下降法的伪代码如下

1. 计算$g^0 = \nabla F(x^0)$，并设定常数$\rho$；
2. 令$d^k = -g^k$，$x^{k+1} = x^k + \rho d^k$；
3. 计算梯度$g^{k+1} = \nabla F(x^{k+1})$；
4. 若$\Vert g^{k+1} \Vert \le \epsilon \Vert g^0 \Vert$，则已找到局部最优解，否则令$k$自增并返回第二步。

该算法可简单地修改以成为变步长梯度下降法

1. 计算$g^0 = \nabla F(x^0)$；
2. 令$d^k = -g^k$；
3. 计算最优的$\rho^k$：
$$F(x^k + \rho^k d^k) \le F(x^k + \rho d^k), \quad \forall \rho \in \mathbb R$$
4. 令$x^{k+1} = x^k + \rho^k d^k$；
5. 计算梯度$g^{k+1} = \nabla F(x^{k+1})$；
6. 若$\Vert g^{k+1} \Vert \le \epsilon \Vert g^0 \Vert$，则已找到局部最优解，否则令$k$自增并返回第二步。

对固定步长法的分析更加简单，我们将以此为基础分析梯度下降法。

#### 收敛性

梯度下降法的收敛性依赖于不动点定理：

设$(B, \Vert \cdot \Vert)$为一巴拿赫空间，$f: V \to V$为一常数为$c$的李普希茨连续映射。
若$c < 1$，则递推数列$x^{k+1} = f(x^{k})$必然收敛至唯一的不动点$\overline x = f(\overline x)$。
{: .theorem}

对于二次型函数$F(x) = \frac{1}{2}\left<Ax, x\right> + \left<b,x\right>$，还有：

对二次型函数$F(x) = \frac{1}{2}\left<Ax, x\right> + \left<b,x\right>$，其中$A$是对称的正定矩阵，若
$$\rho < \frac{2}{\mu_\max}$$
则其在步长为$\rho$的梯度下降法中收敛，其中$\mu\_\max$是$A$最大的特征值。
{: .proposition}

$$M = I - \rho A$$
$\lambda\_i \in \mathrm{Spec}(M)$
$$\lambda_i = 1 - \rho \mu_i, \mu_i \in \mathrm{Spec}(A)$$
$$|\lambda_i| < 1 \iff |1 - \rho \mu_i| < 1$$
{: .proof}

这个命题尤其有用，因为在极小值点的邻域内，对原函数进行泰勒展开，总是能得到一个二次型函数：
$$F(x) = F(\overline x) + DL(\overline x) \cdot (x - \overline x) + \left< \mathbf H F(\overline x) (x - \overline x), x - \overline x \right> + \cdots$$

二次型函数的梯度下降法以速度
$$C = \frac{K-1}{K+1} = \frac{1 - \frac{1}{K}}{1 + \frac{1}{K}}$$
收敛，即
$$\Vert x^k - \overline x \Vert \le C^k \Vert x^0 - \overline x \Vert,$$
其中$K$是对称正定矩阵$A$的最大特征值与最小特征值之比，这个比值也叫条件数（Condition number），表征了该优化问题的容易程度。
{: .proposition}

### 松弛法

松弛法总是沿固定方法前进，其伪代码如下：

1. 计算$g^0 = \nabla F(x^0)$；
2. 令$i \equiv k+1 \pmod{n}$；
3. 计算最优的$x\_i^{k+1}$：
$$F(x_1^k, \dots, x_i^{k+1}, \dots, x_n^k) \le F(x_1^k, \dots, x_i, \dots, x_n^k)$$
4. 当$i = n$，即处理最后一维时，更新梯度$g^{k+1} = \nabla F(x^k)$并自增$k$；
6. 若$\Vert g^{k+1} \Vert \le \epsilon \Vert g^0 \Vert$，则已找到局部最优解，否则令$k$自增并返回第二步。
