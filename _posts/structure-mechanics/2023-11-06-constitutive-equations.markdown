---
title: "本构方程"
categories: "结构力学"
tags: ["连续介质力学", "固体力学"]
---

在之前的介绍中，我们引入了十五个未知数（位移的三个分量、应力的六个分量和应变的六个分量），但是只引入了九个方程（应变的定义和局部平衡方程）。
本文中我们将寻找剩余的六个方程——本构方程。

## 不同材质的特点

为了寻找不同材质的特点，人们设计了拉伸试验（Tensile testing）。

通过在均匀的材料上施加拉力并测量其形变，我们可以取得以下几个物理量之间的关系：
- 应力：$$\sigma = \frac{|\vec F|}{S}$$
- 应变：$$\varepsilon_L = \frac{\Delta L}{L}, \quad \varepsilon_T = \frac{\Delta D}{D}$$
其中$L$表示长度，$D$表示直径，两个应变分别称为纵向应变（Longitudinal strain）和横向应变（Transversal strain）。

### 延性材料

若某种材料在受到拉伸应力时，先发生弹性应变，再发生塑性应变，则称该材料为延性材料（Ductile material）。

延性材料的应力与纵向应变的曲线如下所示。
![](/assets/structmech/Metal_yield.svg)

在1、2点之间的线性区称为弹性区，此外的区域称为塑性区，该区域中直线的斜率称为*杨氏模量*（Young's modulus），记为$E$。
该区域中横向与纵向应变的比值称为泊松系数（Poisson's ratio），记为$\nu$。
$$\sigma = E \cdot \varepsilon_L, \quad \varepsilon_T = - \nu \varepsilon_L$$


### 脆性材料

若某种材料在受到拉伸应力时，只能发生弹性应变，不能发生塑性应变，而是在加大应力时破碎，则称其为脆性材料（Brittle material）。

材料能承受的最大应力称为断裂强度。

## 线性弹性本构方程

### 应力与应变向量

当研究线性弹性时，我们常常与各种线性变换打交道，此时将应力和应变写成一个行向量或列向量有助于我们对其进行线性操作。

我们记：
$$
\tilde \sigma = \begin{bmatrix}
\sigma_{11} \\ \sigma_{22} \\ \sigma_{33} \\ \sigma_{23} \\ \sigma_{13} \\ \sigma_{12} \\ 
\end{bmatrix} \quad
\tilde \varepsilon = \begin{bmatrix}
\varepsilon_{11} \\ \varepsilon_{22} \\ \varepsilon_{33} \\ 2\varepsilon_{23} \\ 2\varepsilon_{13} \\ 2\varepsilon_{12} \\ 
\end{bmatrix}
$$

而当应力与应变满足线性关系时，则有：
$$\tilde \sigma = \mathbf A \tilde \varepsilon$$

$\mathbf A$称为刚度张量或刚度矩阵。

### 胡克定律

我们先研究最简单的一种本构关系——线性、均匀且各向同性的弹性变化。

线性、均匀且各向同性的弹性变化中，应力和应变满足的关系称为胡克定律，此时：
$$\tilde \sigma = \mathbf A \tilde \varepsilon, \quad \mathbf A = \begin{pmatrix}
\lambda + 2\mu & \lambda & \lambda & 0 & 0 & 0 \\
\lambda & \lambda + 2\mu & \lambda & 0 & 0 & 0 \\
\lambda & \lambda & \lambda + 2\mu & 0 & 0 & 0 \\
0 & 0 & 0 & \mu & 0 & 0 \\
0 & 0 & 0 & 0 & \mu & 0 \\
0 & 0 & 0 & 0 & 0 & \mu \\
\end{pmatrix}$$
$\lambda$和$\mu$称为拉梅参数（Lamé parameters）。
{: .proposition}

使用矩阵的形式，可以记为：
$$\sigma = \lambda \mathrm{Tr}(\varepsilon) \mathbf I + 2 \mu \varepsilon$$

### 柔度张量

若已知应力而需要求解应变，则需要用到刚度矩阵的逆矩阵——柔度矩阵或柔度张量。

$$
\mathbf S = \mathbf A^{-1} = \frac{1}{E} \begin{pmatrix}
1 & -\nu & -\nu & 0 & 0 & 0 \\
-\nu & 1 & -\nu & 0 & 0 & 0 \\
-\nu & -\nu & 1 & 0 & 0 & 0 \\
0 & 0 & 0 & 2(1 + \nu) & 0 & 0 \\
0 & 0 & 0 & 0 & 2(1 + \nu) & 0 \\
0 & 0 & 0 & 0 & 0 & 2(1 + \nu) \\
\end{pmatrix}
$$

或直接使用张量形式
$$\varepsilon = \frac{1 + \nu}{E} \sigma - \frac{\nu}{E} \mathrm{Tr}(\sigma) \mathbf I$$

### 二维弹性方程

若物体所受的应力是二维的，那么刚度矩阵简化为：
$$\mathbf A = \frac{E}{1-\nu^2} \begin{pmatrix} 1 & \nu & 0 \\ \nu & 1 & 0 \\ 0 & 0 & \frac{1-\nu}{2} \end{pmatrix}$$

若物体所受的应变是二维的，那么刚度矩阵简化为：
$$\mathbf A = \begin{pmatrix} \lambda + 2\mu & \lambda & 0 \\ \lambda & \lambda + 2\mu & 0 \\ 0 & 0 & \mu \end{pmatrix}$$

### 几种常见应力与应变

### 形变能

形变能的体积密度可由应力和应变的向量形式表示：
$$w = \frac{1}{2} \tilde \sigma^\top \tilde \varepsilon$$
或者写成张量的形式：
$$w = \frac{1}{2} \sigma : \varepsilon$$
{: .definition}

形变能在之后的数值方法中会得到大量的使用。

## 弹性限度

若需要确定某种弹性区的限度，那么这个限度必须是与坐标系的选择无关的，尽管应力和应变张量的表示方法都与坐标系有关。

### 冯·米塞斯判据

对延性材料，冯·米塞斯给出了如下判据。

延性材料处于弹性区域中，当：
$$s : s \le \frac{2}{3} \sigma_e^2$$
其中$s$是偏应力张量，$\sigma_e$是弹性限度。
{: .proposition}

定义冯·米塞斯等效应力为：
$$\sigma_\text{VM} = \sqrt{\frac{3}{2} s : s}$$

则该判据也可写为

延性材料处于弹性区域中，当其冯·米塞斯等效应力小于等于弹性限度：
$$\sigma_\text{VM} \le \sigma_e$$
{: .proposition}

### 朗肯判据

对脆性材料，朗肯给出了如下判据。

脆性材料处于弹性区域中，当其第一主应力小于实验测得的弹性限度：
$$\sigma_1 \le \sigma_r$$
{: .proposition}
