---
title: "仿射网格粒子与物质点法"
categories: ["计算机图形学"]
author: "CaptainChen"
---
Material Point Method (MPM 物质点法)是一种混合欧拉-拉格朗日视角物理仿真方法。

欧拉视角即网格视角，将空间划分为网格，通过表示网格表示仿真物体的信息，比如用网格存储该格子内或格点附近是否有液体，以及液体的速度，质量等。
欧拉视角的优势在于其容易离散化，容易查找邻居网格，对于碰撞等处理更快速方便，但其精度受限于网格大小，并且空间开销很大，受限于格点信息的表示，容易造成能量损耗导致仿真精度问题。

拉格朗日视角即粒子视角，在物体上采样许多点作为粒子，通过仿真粒子的运动，模拟整个物体的运动。
这种方式优点在于粒子表示更精确，但更难以离散化，必须用特殊手段对仿真物体采样，并且需要数据结构查找邻居处理相关信息以及碰撞等。

MPM将两种视角结合起来，通过将信息顺着“粒子-网格-粒子”的方向传输，结合两者的优点进行仿真。
这种方法称作PIC (Particle-In-Cell)。

朴素的PIC方法仅传输粒子的动量$m\mathbf{v}$和质量$m$到网格，再传输回粒子，但这样传输仍存在信息损失，能量损失的问题，于是APIC (Affine Particle-In-Cell) 方法通过添加仿射速度矩阵$C\_p$改进了这一问题。
再基于APIC方法，改进为MPM方法（这里的MPM是指[2018年的MLS-MPM](https://yuanming.taichi.graphics/publication/2018-mlsmpm/mls-mpm-cpic.pdf)，其相比2013年MPM第一次被用在实际场景冰雪奇缘中更简单快捷先进）。

> 本文主要参考[GAMES201](https://www.bilibili.com/video/BV1ZK411H7Hc?p=7&vd_source=7394d56da1f1f4ebe9b75d4f030c98ed)的第7讲和第8讲，并结合原论文进行了部分补充和错误修正。

<div class="remark">
符号定义：
<ul>
<li>
在文中所有以$i$为下标的表示网格点的数据，如$m_i, \mathbf{v}_i$；
</li><li>
所有以 $p$ 为下标的表示粒子的数据，如$m_p, \mathbf{v}_p$；
</li><li>
右上角的$n$均表示算法迭代到第$n$步；
</li><li>
所有向量再没有转置的情况下默认为列向量；
</li>
</ul>
</div>

## Particle-In-Cell (PIC)

PIC算法需要的流程：

1. 对动量或速度进行时间积分（如$m\mathbf{v}^{n+1} = m\mathbf{v}^n + f \Delta t$）后，将粒子上的信息（如质量，动量等）传递到网格上；
2. 在网格上处理网格方便处理的事，如边界碰撞，液体不可压缩性等，计算好网格的数据（质量、动量）；
3. 将数据从网格传回粒子，并对粒子进行时间积分（如$\mathbf{x}^{n+1} = \mathbf{x}^n + \mathbf{v}^{n+1} \Delta t$）。

在传递数据时，粒子需要将自己的数据按照一定权重加到网格上，越远的粒子权重越低，并且需要保证每个粒子到其周围所有格点的权重之和为1。

B-Spline（B样条曲线）正好解决了这一问题。
B-Spline原本是用于通过函数插值若干个控制点得到一个平滑的曲线，这里的插值方法确保了曲线上每个点由周围控制点贡献的权重和一定为1，并且B-Spline的平滑性确保了离控制点越远，权重越小，权重导数也越小，使得数值计算更加稳定。

在这里我们一般使用2阶(Quadratic，下图红色)或3阶(Cubic，下图蓝色)的B-Spline核函数。

![](/assets/cg/mpm01.png)
{: .align-center}

这里的2阶B-Spline核函数实际上是通过3阶B样条参数改造得来，在使用Quadratic时：$N(x)=B\_{0,3}(\frac x 2+1)$。

Quadratic B-Spline:
$$
N(x) = \begin{cases}
   \frac 3 4 - {|x|}^2 & 0 \leq {|x|} < \frac 1 2 \\
   \frac 1 2 {\left (\frac 3 2 - {|x|} \right ) }^2 & \frac 1 2 \leq {|x|} < \frac 3 2 \\
   0 & \frac 3 2 \leq {|x|}
\end{cases}
$$
Cubic B-Spline:
$$
N(x) = \begin{cases}
   \frac 1 2 {|x|}^3 - {|x|} ^2 + \frac 2 3 & 0 \leq {|x|} < 1 \\
   \frac 1 6 {\left( 2 - {|x|} \right) } ^3 & 1 \leq {|x|} < 2 \\
   0 & 2 \leq {|x|}
\end{cases}
$$
其中$|x|$根据格点距离进行了归一化处理，即保证两个格点的距离为 1。

计算粒子到格点的权重时，需要将每一维(x,y,z轴)的距离按照B-Spline计算权重，再乘起来。
即令权重$w\_{ip}$即格子$i$对粒子$p$的权重，则$w\_{ip} = N\_i (\mathbf{x}\_p / \Delta x)$，$\Delta x$为格点距离。
因此B-Spline确保了$\sum\_i w\_{ip} = 1$。

于是PIC的流程为：
1. P2G：
$$\left( m \mathbf{v} \right)_i^{n+1} = \sum_p w_{ip} \left( m \mathbf{v} \right)_p^n$$
$$m_i^{n+1} = \sum_p w_{ip} m_p $$

2. Grid opertaions
$$\hat{\mathbf{v}}_i^{n+1} = \left( m \mathbf{v} \right)_i^{n+1} / m_i^{n+1} $$
处理网格操作，如边界等：
$$\mathbf{v}_i^{n+1} = \text {Project} \left(\hat{\mathbf{v}}_i^{n+1}\right)$$
边界处理的操作将在本文末尾讲述。

3. G2P
$$\mathbf{v} _p^{n+1} = \sum_i w_{ip} \mathbf{v}_i^{n+1}$$
$$\mathbf{x}_p^{n+1} = \mathbf{x}_p^n + \mathbf{v}_p^{n+1} \Delta t $$

## Affine Particle-In-Cell (APIC)

APIC原作者发了两篇文章，一篇在[2015年](https://dl.acm.org/doi/pdf/10.1145/2766996)，一篇在[2017年](https://arxiv.org/pdf/1603.06188)，2015年的简单易懂，2017年的详细证明但是复杂，建议一定要先从2015年那篇看。
{: .remark}

在PIC方法中，粒子的信息被传输到格点时，是一种加权平均的操作。在格点信息传回粒子时，同样是加权平均的操作。
多次平均的操作会使得信息在传输中损失，同时造成能量损耗。
在实践过程中可以看到PIC仅能维持整体动量守恒，但整体角动量守恒会损耗，因为相邻粒子之间的动量差在传输过程中变得更加平均。

要解决这一问题就需要一种表示方法来确保相邻粒子之间的动量差能够保持，APIC的解决方法是添加一个仿射速度矩阵$C\_p$。
对每一个粒子$p$，我们希望表示粒子以及其领域的速度：$\mathbf{v}(\mathbf{x}) = \mathbf{v}\_p +C\_p (\mathbf{x} - \mathbf{x}\_p)$，其中$\mathbf{x}$为粒子邻域内的一个位置，可以理解为$C\_p$为速度场关于位置的导数。

即我们求：
$$
C_p = \frac {\partial \mathbf{v}} {\partial \mathbf{x}}
$$
利用权重函数，对其做一些变换，使得他们$C_p$能够从格点上的速度表示出来
$$
C_p = \frac {\partial \mathbf{v}} {\partial w} \frac {\partial w} {\partial \mathbf{x}}
$$
在G2P时，我们有$\mathbf{v}_p \approx \sum_i w_{ip} \mathbf{v}_i$，所以可以认为$\frac {\partial \mathbf{v}} {\partial w} = w_{ip}$，于是：
$$
C_p = \sum_i \mathbf{v}_i \cdot \frac {\partial w} {\partial \mathbf{x}} = \sum_i \mathbf{v}_i (\nabla w_{ip})^T
$$

从直观上理解，2维情况下的该矩阵每个位置的意义如下图：

![](/assets/cg/mpm02.png)
{: .align-center}

通过B-Spline的一些性质，我们可以推导出$\nabla w_{ip}$：首先B-Spline满足$\sum_i w_{ip} = 1$，以及：
$$
\sum_i w_{ip} (\mathbf{x}_i - \mathbf{x}_p) = 0
$$
等式两边对 $\mathbf{x}_p$ 微分得到
$$
\sum_i (\mathbf{x}_i - \mathbf{x}_p) (\nabla w_{ip})^T + \sum_i w_{ip} \nabla (\mathbf{x}_i - \mathbf{x}_p) = 0 \\
 \sum_i (\mathbf{x}_i - \mathbf{x}_p) (\nabla w_{ip})^T - \sum_i w_{ip} \cdot I= 0 \\ 
 \sum_i (\mathbf{x}_i - \mathbf{x}_p) (\nabla w_{ip})^T = I
$$
我们直接给出[APIC文章](https://dl.acm.org/doi/pdf/10.1145/2766996)第6页5.3节最后一段给出的答案，很容易代入上面的推导验证正确性。
$$
\nabla w_{ip}=w_{ip} (D_p)^{-1} (\mathbf{x}_i-\mathbf{x}_p) \\
$$
 其中，$D_p = \sum_i w_{ip} (\mathbf{x}_i - \mathbf{x}_p) \cdot (\mathbf{x}_i - \mathbf{x}_p)^T$

> 对于 $D_p$ ，在使用二次即以上的B-Spline时有特殊性质，使其在我们这个条件下一定为常量对角矩阵（Quadratic
> B-Spline $D_p=\frac 1 4 \Delta x^2 I$，Cubic B-Spline $D_p=\frac 1 3
> \Delta x^2
> I$），证明过程涉及到B-Spline的矩(Moment)，极其复杂。这里我们给出其为对角矩阵的证明，但对角线上的系数，请参考更多资料（[维基百科：单变量B-Spline的矩](https://en.wikipedia.org/wiki/B-spline#Moments_of_univariate_B-splines)）
>
> 我们把向量展开，令$\mathbf{x}= [x,y,z]^T$。由于我们使用的是三线性插值，所以： 
> $$
> w_{ip} = N\left(\frac {x_i-x_p} {\Delta x}\right) N\left(\frac {y_i-y_p}
> {\Delta x}\right)N\left(\frac {z_i-z_p} {\Delta x}\right)
> $$
> $D_p$是一个张量积算出来的3x3矩阵，令$(D_p)_{kl}$是其第k行第l列元素，则 
> $$
> (D_p)_{kl} =
> \sum_i N\left(\frac {x_i-x_p} {\Delta x}\right) N\left(\frac {y_i-y_p}
> {\Delta x}\right)N\left(\frac {z_i-z_p} {\Delta x}\right)
> (\mathbf{x}_i - \mathbf{x}_p)_k (\mathbf{x}_i - \mathbf{x}_p)_l 
> $$
> 接下来，我们以二次B-Spline（Quadratic B-Spline）为例进行证明
>
> 1. 若$k \neq l$， 不妨设k, l分别代表x, y轴。注意到在Quadratic B-Sline下求和枚举 i 是在一个3x3x3的立方体里面枚举网格点，我们现在将27个网格点分为9组，每组3个点的x,
> y轴坐标是相等的，仅在z轴坐标不同。那么，每一组内求和为
> $$
> \begin{align} \text{Sum}&=N\left(\frac
> {x_i-x_p} {\Delta x}\right) N\left(\frac {y_i-y_p} {\Delta x}\right)
> (\mathbf{x}_i - \mathbf{x}_p)_k (\mathbf{x}_i - \mathbf{x}_p)_l \sum_j
> N\left(\frac {z_j-z_p} {\Delta x}\right) \\ &=N\left(\frac {x_i-x_p}
> {\Delta x}\right) N\left(\frac {y_i-y_p} {\Delta x}\right)
> (\mathbf{x}_i - \mathbf{x}_p)_k (\mathbf{x}_i - \mathbf{x}_p)_l \\
> &=N\left(\frac {x_i-x_p} {\Delta x}\right) N\left(\frac {y_i-y_p}
> {\Delta x}\right) (x_i - x_p) (y_i - y_p) \end{align}
> $$
> 然后，这9个Sum已经与z轴无关了。我们再将这9个Sum分为3组，每组的Sum保证他们涉及到的x轴相同，仅在y轴不同。那么新的3组里面，每组的和为：
> $$
> \text{Sum} = N\left(\frac {x_i-x_p} {\Delta x}\right) (x_i - x_p)
> \sum_j N\left(\frac {y_j-y_p} {\Delta x}\right)  (y_j - y_p) = 0
> $$
> 这里用到了B-Spline的性质 $\sum_j N\left(\frac {y_j-y_p} {\Delta x}\right) 
> (y_j - y_p) = 0$ 因此 $(D_p)_{kl} = 0 \ ,\text{if} \ k \neq l$
> 2. 若$k = l$，不妨设k, l都代表x轴，我们将3x3x3的立方体分为3组，每组9个点的x轴坐标相等，则每组内求和为
> $$
> \text{Sum} = N\left(\frac {x_i-x_p} {\Delta x}\right) (x_i - x_p)^2
> \sum_j N\left(\frac {y_i-y_p} {\Delta x}\right) N\left(\frac {z_j-z_p}
> {\Delta x}\right) = N\left(\frac {x_i-x_p} {\Delta x}\right) (x_i -
> x_p)^2
> $$
> 此时
> $$
> (D_p)_{kl} = \Delta x^2 \sum_i  N\left(\frac {x_i-x_p}
> {\Delta x}\right) \left(\frac {x_i - x_p} {\Delta x}\right)^2
> $$
> 这个形式被称为单变量B-Spline函数的二阶矩（Moments of univariate
> B-splines），其在二次即以上的B-Spline为常数，证明过于复杂，可以查阅相关资料（[维基百科：单变量B-Spline的矩](https://en.wikipedia.org/wiki/B-spline#Moments_of_univariate_B-splines)）
>
> 对于Cubic的B-Spline，我们需要对4x4x4的立方体分组，用类似上面的方法证明。
>
> 我们可以通过暴力展开式子，计算出Quadratic B-Spline的$(D_p)_{kk} = \frac 1 4 \Delta
> x^2$，Cubic B-Spline的$(D_p)_{kk} = \frac 1 3 \Delta x^2$
> 对于一次的B-Spline，对角元不是常量，而是$(D_p)_{kk} =  \left | \frac {x_i - x_p}
> {\Delta x} \right | \left(1- \left | \frac {x_i - x_p} {\Delta x}
> \right | \right)\Delta x^2$

综上，我们可以得出：
$$
C_p = \sum_i \mathbf{v}_i (\nabla w_{ip})^T = \sum_i  w_{ip}  \mathbf{v}_i  (\mathbf{x}_i-\mathbf{x}_p)^T (D_p)^{-T} \\
= 
\begin{cases}
\frac 4 {\Delta x^2} \sum_i w_{ip}  \mathbf{v}_i  (\mathbf{x}_i-\mathbf{x}_p)^T & \text{if use Quadratic B-Spline} \\ 
\frac 3 {\Delta x^2} \sum_i w_{ip}  \mathbf{v}_i  (\mathbf{x}_i-\mathbf{x}_p)^T & \text{if use Cubic B-Spline} \\ 
\end{cases}
$$

有了仿射矩阵$C\_p$后，将粒子动量传输到网格上时，就需要通过仿射矩阵计算邻域速度的形式，来计算粒子贡献给格点的速度

于是，APIC算法的流程如下：

1. P2G：
$$
\left( m \mathbf{v} \right)_i^{n+1} = \sum_p w_{ip} \left[m \mathbf{v}_p^n + m_p C_p^n \left(\mathbf{x}_i - \mathbf{x}_p^n \right) \right]
$$
$$
m_i^{n+1} = \sum_p w_{ip} m_p
$$
2. Grid opertaions
$$
\hat{\mathbf{v}}_i^{n+1} = \left( m \mathbf{v} \right)_i^{n+1} / m_i^{n+1} 
$$
处理网格操作，如边界等：
$$
\mathbf{v}_i^{n+1} = \text {Project} \left(\hat{\mathbf{v}}_i^{n+1}\right)
$$
3. G2P
$$
\mathbf{v} _p^{n+1} = \sum_i w_{ip} \mathbf{v}_i^{n+1}
$$
$$
C_p^{n+1} = \frac 4 {\Delta x^2} \sum_i w_{ip} \mathbf{v}_i^{n+1} (\mathbf{x}_i - \mathbf{x}_p^n)^T
$$
$$
\mathbf{x}_p^{n+1} = \mathbf{x}_p^n + \mathbf{v}_p^{n+1} \Delta t
$$

## Material Point Method (MPM)

现在我们在粒子-网格中添加仿真，即计算受力，进行时间积分。这一步骤主要发生在粒子-网格之间，可以放在网格操作上（Grid operation）里面。

网格的属性使其天然能够处理碰撞等复杂情况，而粒子更容易计算相关属性。为了结合他们的优势，MPM计算粒子对网格格点的施力，再在网格上进行时间积分计算速度，并在网格上处理碰撞等更新速度，最后传回粒子。

### 弹性体

#### 基础定义

首先定义弹性体初始每个点的位置为$X$，弹性体每个点变化后当前的位置为$\mathbf{x} = \phi(X)$，一个重要的参数是应变张量
$$
F = \frac {\partial \phi (X)} {\partial X} = \frac {\partial \mathbf{x}} {\partial X}
$$
对于弹性体，整体移动并不会产生内部弹力，所以函数$\phi$的梯度，即表示相邻位置移动的不同会产生形变，所以弹性体的内部能量一般根据$F$来定义。

定义弹性体的能量密度为$\Psi (\phi, X)$，即位置$X$在形变为$\phi$函数时的能量密度。在各种弹性物质模型下，往往直接用应变张量定义能量密度$\Psi(F)$。此时弹性体总能量为$U(\phi) = \int \Psi(F) \mathrm{d}X$.

在弹性力学中有时候为了表示某一截面微元上的应力，定义了PK1数（The First Piola-Kirchhoff stress tensor）
$$
P(F) = \frac {\partial \Psi(F)} {\partial F}
$$
这在3维下是一个3×3的矩阵，其乘一个法向量之后就可以表示$X$位置与法向量垂直截面微元的应力。PK1的推导是在计算内力时，用能量对位置求导的中间变量，不在这里详细叙述，只需知道许多弹性体模型会直接定义出$P(F)$，抄公式就可以了。

在MPM中，我们的粒子不仅存储质量$m_p$，动量$(m \mathbf{v})_i$，还需要存储应变张量$F_p$. 在迭代过程中，应变张量可以按如此迭代$F_p^{n+1} = (I + \Delta t \nabla \mathbf{v}) F_p^n$，即形变更新时我们只需要知道粒子$p$周围比上一个仿真步多了哪些形变就行。由于我们使用了$C_p$来近似粒子$p$邻域的速度梯度，则可以使用这个公式迭代：
$$
F_p^{n+1} = (I + \Delta t C_p^{n+1}) F_p^n
$$

#### 格点受力计算

一个反直觉的地方在于：虽然格点位置在$\mathbf{x}_i$是永远不变的，但是我们在计算受力时，需要将其看作在仿真物体上的某个点，只是在当前仿真步正好移动到了$\mathbf{x}_i$这个位置，可以用下图理解：

![](/assets/cg/mpm03.png)
{: .center-image}

计算内力一般用能力对位置的梯度来求，即：
$$
\mathbf{f} (\mathbf{x}) = - \frac {\partial U(\mathbf{x})} {\partial \mathbf{x}}
$$
我们令$\mathbf{f}_i$为格点$i$在当前仿真步的受力。为了求上面的梯度，我们需要定义

函数$\mathbf{f}_i (\mathbf{x})$为如果格点$i$所在材料上的点位置移动到$\mathbf{x}$，其所受到的力。

函数$U_i (\mathbf{x})$为如果格点$i$所在材料上的点位置移动到$\mathbf{x}$，整个材料的势能。

函数$F_{ip}^n(\mathbf{x})$为如果格点$i$所在材料上的点位置移动到$\mathbf{x}$，粒子$p$的形变梯度$F$. 需要确保$F_{ip}^n (\mathbf{x}_i) = F_p^n$

则总势能可以用所有粒子的体积乘以能量密度求和得到：
$$
U_i(\mathbf{x}) = \sum_p V_p^0 \Psi(F_{ip}^n(\mathbf{x})) \\
$$
对于粒子的形变梯度，我们可以仿照$F_p^n$的迭代公式写为：
$$
\begin{align}
F_p^{n+1}& = (I + \Delta t C_p^n) F_p^n \\
&= \left( I + \sum_i \Delta t\mathbf{v}^n_i \cdot \left(\nabla w^n_{ip}\right)^T \right) F_p^n \\
&= \left( I + \sum_i \left(\mathbf{x}_i^n - \mathbf{x}_i^{n-1}\right) \cdot \left(\nabla w^n_{ip}\right)^T \right) F_p^n \\
\text{仿照构造, }F_{ip}^n (\mathbf{x}) &= \left( I + \left(\mathbf{x} - \mathbf{x}_i\right) \cdot \left(\nabla w^n_{ip}\right)^T \right) F_p^n\\
\end{align}
$$
现在来推导格点受力：
$$
\begin{align}
\mathbf{f}_i (\mathbf{x}) & = - \frac {\partial U_i (\mathbf{x})} {\partial \mathbf{x}} \\
& = - \sum_p V_p^0 \frac {\partial \Psi(F_{ip}^n(\mathbf{x}))} {\partial \mathbf{x}} \\
& = - \sum_p V_p^0 \frac {\partial \Psi(F_{ip}^n(\mathbf{x}))} {\partial F_{ip}^n} \frac {\partial F_{ip}^n (\mathbf{x})} {\partial \mathbf{x}} \\
& = - \sum_p V_p^0 P\left(F_{ip}^n(\mathbf{x})\right) \left(F^n_p\right)^T \nabla w^n_{ip} \\
\end{align}
$$

### 流体

相比于弹性体，流体只需要考虑拉伸和压缩，而不需要考虑错切变换。我们不再需要为每个粒子更新应变张量$F$，而只需要一个体积变化分数$J = \text{det} (F)$.

那么更新体积变化分数时，用如下公式
$$
J_p^{n+1} = \left( 1 + \Delta t \cdot \text{tr}(C_p^{n+1}) \right) \cdot J_p^n
$$
同样类似弹性体可以构造一个：
$$
J_{ip}^n(\mathbf{x}) = \left(1 + \left[(\mathbf{x}-\mathbf{x}_i):\nabla w_{ip}^n\right]\right) \cdot J_p^n
$$
其中$[ : ]$表示内积。构造满足$J_{ip}^n(\mathbf{x}_i) = J_p^n$

流体使用的能量公式为：
$$
\Psi(J) = \frac 1 2 \lambda (J-1)^2
$$
可以推导出格点受力为：
$$
\mathbf{f}_i(\mathbf{x}) = - \sum_p V_p^0 \cdot \lambda (J_{ip}^n(\mathbf{x})-1) \cdot \nabla w_{ip}^n
$$

### 时间积分

*下面公式只考虑弹性体，流体可以类似推导出来*

#### 显式

$$
\begin{align}
\mathbf{x}_i^{n+1} & = \mathbf{x}_i^n + \Delta t \mathbf{v}_i^{n+1} \\
\mathbf{v}_i^{n+1} & = \mathbf{v}_i^n + \Delta t \cdot m^{-1} \mathbf{f}_i(\mathbf{x}_i^{n})
\end{align}
$$

显示时间积分视为格点不动，实际计算时只需要带入一个固定的格点位置$\mathbf{x}_i^n = \mathbf{x}_i$
$$
\begin{align}
\mathbf{f}_i(\mathbf{x}_i) & = - \sum_p V_p^0 P\left(F_{ip}^n(\mathbf{x}_i)\right) \left(F^n_p\right)^T \nabla w^n_{ip} \\
& \approx - \frac 4 {\Delta x^2}\sum_p V_p^0 \cdot P\left(F_p^n\right) \cdot \left(F^n_p\right)^T \cdot w_{ip}^n (\mathbf{x}_i - \mathbf{x}_p^n)\\
\end{align}
$$

#### 隐式

隐式时间积分公式如下：
$$
\begin{align}
\mathbf{x}_i^{n+1} & = \mathbf{x}_i^n + \Delta t \mathbf{v}_i^{n+1} \\
\mathbf{v}_i^{n+1} & = \mathbf{v}_i^n + \Delta t \cdot m^{-1} \mathbf{f}_i(\mathbf{x}_i^{n+1})
\end{align}
$$
此时$\mathbf{f}_i (\mathbf{x}_i^{n+1})$不能简单地带入，需要使用求解器求解方程

### 算法流程

1. P2G阶段，我们首先使用APIC的方法计算不考虑受力时，格点的动量和质量
   $$
   \begin{align}
   \left( m \hat {\mathbf{v}} \right)_i^{n+1} & = \sum_p w_{ip} \left[m \mathbf{v}_p^n + m_p C_p^n \left(\mathbf{x}_i - \mathbf{x}_p^n \right) \right] \\
    m_i^{n+1} & = \sum_p w_{ip} m_p 
   \end{align}
   $$
   对于处理受力，主要分为三部分：弹性内力，外力，边界碰撞。在这个版本的MPM中，我们将弹性内力处理为计算粒子对网格的施力，而边界碰撞只在网格上处理。至于外力，怎么方便怎么来（重力可以全加在粒子上或者全加在网格上）

   弹性内力在这一步处理：*若为隐式时间积分，则带入$\mathbf{f} (\mathbf{x}_i^{n+1})$* 
   $$
   \left( m \mathbf{v} \right)_i^{n+1} = \left( m \hat {\mathbf{v}} \right)_i^{n+1} + \Delta t \cdot \mathbf{f}_i (\mathbf{x}_i^{n})
   $$
   对于外力和边界碰撞，不再考虑隐式时间积分。

2. Grid Opertaions阶段，主要处理边界碰撞
   $$
   \begin{align}
   \hat{\mathbf{v}}_i^{n+1} & = \left( m \mathbf{v} \right)_i^{n+1} / m_i^{n+1} \\
   \mathbf{v}_i^{n+1} & = \text {Project} \left(\hat{\mathbf{v}}_i^{n+1}\right)
   \end{align}
   $$

3. G2P阶段，主要从网格信息重新计算回粒子信息
   $$
   \begin{align}
   \mathbf{v} _p^{n+1} & = \sum_i w_{ip} \mathbf{v}_i^{n+1}\\
   C_p^{n+1} & = \frac 4 {\Delta x^2} \sum_i w_{ip} \mathbf{v}_i^{n+1} (\mathbf{x}_i - \mathbf{x}_p^n)^T\\
   F_p^{n+1} & = (I + \Delta t C_p^{n+1}) F_p^n \\
   \mathbf{x}_p^{n+1} & = \mathbf{x}_p^n + \mathbf{v}_p^{n+1} \Delta t\\
   \end{align}
   $$

   *如果使用FLIP方法，可以考虑在这一阶段按一定比例结合网格计算的速度和粒子本来的速度*

## 关于边界投影等额外操作

对于边界，直接找到边界的格点，找到边界的法向量$\mathbf{n}$，把冲出边界的速度消掉即可$\mathbf{v}_i^{n+1} = \hat{\mathbf{v}}_i^{n+1} + \mathbf{n} \cdot \min(\mathbf{n}^T \hat{\mathbf{v}}_i^{n+1}, 0)$

或者使用各种动量守恒的反射操作也可以

对于外力，重力的添加，可以将其直接添加到粒子或者格点上：$\hat{\mathbf{v}}_i^{n+1} += \Delta t g$
