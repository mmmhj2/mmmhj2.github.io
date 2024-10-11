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

注意到原二次型函数的梯度为
$$\nabla F(x) = Ax + b$$
令$M = I - \rho A$，则梯度下降法的递推式变为
$$x^{k+1} = f(x^k) = Mx^k - \rho b$$
现在，考虑李普希茨连续的定义
$$\Vert f(x) - f(x') \Vert = \Vert M x - b - M x' + b \Vert = \Vert M (x - x') \Vert$$
考虑到$A$是对称的正定矩阵，从而$A,M$均一定可对角化（实际上，由于它们可交换，是同时可对角化），我们仅考虑$M$的最大的特征值即可：
$$\Vert M(x - x') \Vert \le \lambda_\max \Vert x - x' \Vert$$
又因为
$$\lambda_i = 1 - \rho \mu_i, \mu_i \in \mathrm{Spec}(A)$$
从而
$$|\lambda_i| < 1 \iff |1 - \rho \mu_i| < 1$$
从而当
$$\rho < \frac{2}{\mu_\max}$$
时，李普希茨常数小于一，从而根据不动点定理，该递推数列必收敛至唯一的不动点。
{: .proof}

这个命题尤其有用，因为在极小值点的邻域内，对原函数进行泰勒展开，总是能得到一个二次型函数：
$$F(x) = F(\overline x) + DL(\overline x) \cdot (x - \overline x) + \left< \mathbf H F(\overline x) (x - \overline x), x - \overline x \right> + \cdots$$

二次型函数的梯度下降法以速度
$$C = \frac{K-1}{K+1} = \frac{1 - \frac{1}{K}}{1 + \frac{1}{K}}$$
收敛，即
$$\Vert x^k - \overline x \Vert \le C^k \Vert x^0 - \overline x \Vert,$$
其中$K$是对称正定矩阵$A$的最大特征值与最小特征值之比，这个比值也叫条件数（Condition number），表征了该优化问题的容易程度：条件数越接近一，矩阵在各个方向上的变换就越均匀。
{: .proposition}

### 松弛法

松弛法总是沿固定方法前进，其伪代码如下：

1. 计算$g^0 = \nabla F(x^0)$；
2. 令$i \equiv k+1 \pmod{n}$；
3. 计算最优的$x\_i^{k+1}$：
$$F(x_1^k, \dots, x_i^{k+1}, \dots, x_n^k) \le F(x_1^k, \dots, x_i, \dots, x_n^k)$$
4. 当$i = n$，即处理最后一维时，更新梯度$g^{k+1} = \nabla F(x^k)$并自增$k$；
6. 若$\Vert g^{k+1} \Vert \le \epsilon \Vert g^0 \Vert$，则已找到局部最优解，否则令$k$自增并返回第二步。

### 预处理

我们可以通过在原问题的矩阵上乘另一个矩阵，通过将问题变换到另一个基底下以求解该问题。
然而，梯度算子的结构取决于坐标基底的选择，因此

设$A,B$为同一向量空间的两组基底，$x,y$为两个向量在$A$下的坐标表示；
设$\left< \cdot, \cdot \right>\_A$为一个坐标基底下的内积，$\left<\cdot, \cdot\right>\_B$为另一个坐标基底下的内积。
则必然存在一对称的正定矩阵$M$，使得
$$\left< x, y \right>_A = \left< Mx, y \right>_B$$
$M$可能是过渡矩阵与其转置的乘积：
$$M = P_{A \to B}^\top P_{A \to B}$$
{: .proposition}

借助以上命题，我们也可以将微分变到另一个坐标系下：
$$DF(x) \cdot h = \left< \nabla_A F(x), h \right>_A = \left< M \nabla_B F(x), h \right>_B$$

从而，固定步长的梯度下降法可以从
$$x^{k+1} = x^k - \rho \nabla_B F(x^k)$$
变为
$$Mx^{k+1} = M x^k - \rho M \nabla_B F(x^k)$$
而进一步变为
$$M\underbrace{(x^{k+1} - x^k)}_{g^{k+1}} = - \rho \nabla_A F(x^k)$$
这种通过预先乘一个矩阵来改进条件数的方法称为预处理法（Preconditioning），矩阵$M$称为预处理矩阵（Preconditioner）。
迭代时，一般不通过同时乘$M^{-1}$来求解$g^{k+1}$，而是利用高斯消元或LU分解等方法进行求解。
若$M$的选择较好（如上三角矩阵等），则这种方法的效率更高。

<div class="exampl">
<p>
利用预处理的梯度下降法求优化问题的解：
$$
\min_x F(x) = \frac{1}{2} \left< Ax, x \right> - \left<b, x\right> + \frac{1}{4} \Vert x \Vert_4^4
$$
其梯度为
$$
\nabla F(x) = Ax + x^3 - b
$$
</p>
<p>
使用$A$作为预处理矩阵，则有
$$A \delta^{k+1} = - \rho \nabla_A F(x^k),~ x^{k+1} = x^k + \rho \delta^{k+1}$$
</p>
</div>

## 牛顿迭代法

牛顿迭代法是求解非线性方程的解的有力方法。

### 一维情况

牛顿迭代法利用以下事实：
在第$k$步迭代的$x^k$附近，有
$$f(x) = f(x^k) + f'(x^k) (x - x^k) + \cdots$$
设$f(x^{k+1}) = 0$，利用以上展开，可得
$$f(x^k) + f'(x^k)(x^{k+1} - x^k) = 0$$
从而
$$x^{k+1} = x^k - \frac{f(x^k)}{f'(x^k)}$$

若待求解函数二阶可微，且解处微分非零，即
$$f \in \mathcal C^2, f'(\overline x) \neq 0$$
则牛顿迭代法以二次速度收敛：
$$|x^{k+1} - \overline x| \le C | x^k - \overline x |^2$$
其中$C$为某一常数。
{: .proposition}

### 高维情形

在高维情形下，展开变为
$$f(x) = f(x^k) + \mathbf J f(x^k) \cdot (x - x^k) + \cdots$$
从而递推式变为
$$x^{k+1} = x^k - (\mathbf J f(x^k))^{-1} \cdot f(x^k)$$

迭代算法如下：
1. $$M^k \gets \mathbf J f(x^k)$$
2. $$g^k \gets f(x^k)$$
3. 求解线性方程组$$M^k \delta ^k = - g^k$$
4. $$x^{k+1} \gets x^k + \delta^k$$

重复直到$\Vert g^k \Vert \le \epsilon \Vert g^0 \Vert$

计算雅可比矩阵并求解线性方程组较为费时，可在迭代次数足够大后使用固定的矩阵近似以进行估计。
