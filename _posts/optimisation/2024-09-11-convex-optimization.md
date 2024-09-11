---
title: "凸函数优化"
categories: ["组合优化"]
---

## 凸函数

### 一元凸函数

若某一元函数$F: \mathbb R \to \mathbb R$对定义域上的所有$x,y$满足
$$F(\lambda x + (1-\lambda) y) \le \lambda F(x) + (1 - \lambda) F(y), \ \forall \lambda \in [0,1]$$
则称该函数是凸函数（Convex）；若满足
$$F(\lambda x + (1-\lambda) y) < \lambda F(x) + (1 - \lambda) F(y), \ \forall \lambda \in ]0, 1[$$
则称其为严格凸函数。
{: .definition}

若函数$F \in \mathcal C^1$，则其是凸函数当且仅当$F'$单增；是严格凸函数当$F'$严格单增。
若$F \in \mathcal C^2$，则其是凸函数当且仅当$F'' \ge 0$；是严格凸函数当$F'' > 0$。
{: .proposition}

凸函数$F \in \mathcal C^1$在$x$处取最小值，当且仅当$F'(x) = 0$；
若$F$是严格凸函数，则该最小值是唯一的。
{: .proposition}

### 多元凸函数

设函数$F: V \to \mathbb R$定义在向量空间$V$上，若对所有$x, y \in V$，有
$$F(\lambda x + (1-\lambda) y) \le \lambda F(x) + (1 - \lambda) F(y), \ \forall \lambda \in [0,1]$$
则称该函数是凸函数（Convex）；若满足
$$F(\lambda x + (1-\lambda) y) < \lambda F(x) + (1 - \lambda) F(y), \ \forall \lambda \in ]0, 1[$$
则称其为严格凸函数。
{: .definition}

从图像上看，这意味着向量空间$V$中端点在函数$F$上的任何两点之间的线段均在函数图像的上方。

## 凸优化

### 极小值

设$F$为向量空间$V$上一可微的凸函数，则其微分为零的点就是极（最）小值点：
$$DF(\overline x) = 0 \iff F(\overline x) \le F(y), \quad \forall y \in V$$
凸函数的极小值点就是最小值点。
{: .proposition}

凸函数不一定存在最小值，其存在性可由以下命题判定：

有限维空间上的连续强凸函数一定具有至少一个最小值点。
若函数是严格凸的，则该最小值是唯一的。
强函数（Coercive function）指在无穷处极限为无穷的函数：
$$\lim_{\Vert x \Vert \to \infty} f(x) = +\infty$$
{: .proposition}

以上命题不能推广至无限维空间。

<div class="exampl"><p>
设$F: \mathbb R^n \to \mathbb R$为
$$F(x) = \frac{1}{2} \left< Ax, x \right> - \left< b, x\right> = \sum_{i, j} A_{i, j} x_i x_j - \sum_i b_i x_i$$
其中$A \in M\_n$是一个对称的正定矩阵。
设
$$f(x) = \nabla F(x) = Ax - b$$
证明函数$F$的最小值点正是方程组$Ax = b$的解。 </p><p>
首先证明凸性，设$g(\lambda) = F(x + \lambda h)$，则
$$\begin{aligned}
g(\lambda) &= \frac{1}{2} \left< A(x+\lambda h), x+h \right> - \left< b, x + \lambda h\right> \\ 
&= \frac{1}{2} \left<Ax,x\right> - \left<b, x\right> + \lambda\left<Ax-b, h\right> + \frac{\lambda^2}{2}\left<Ah,h\right>
\end{aligned}$$
这是一个关于$\lambda$的二次函数，若$A$正定，则其导数严格单增，从而$F$严格凸。
因此原$F$严格凸，其最小值点在梯度（弗雷彻微分）为零处取得。
</p>
</div>
