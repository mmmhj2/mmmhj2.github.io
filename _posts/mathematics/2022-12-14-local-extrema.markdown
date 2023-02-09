---
layout: single
title: "多元函数的极值与反函数"
date: 2022-12-14 23:08:00 +0800
categories: 
---

$$
\newcommand{d}{\mathrm{d}}
\newcommand{RR}{\mathbb{R}}
\newcommand{NN}{\mathbb{N}}
$$

## 极值

若函数$f: U \to \RR$（U为开集）在一点$a \in U$处满足$\d f_a = 0$，则称其为**临界点**。
若该函数在一点$b \in U$处有极值，则必有：$\d f_b = 0$，即$b$为临界点。
反之，临界点处不一定为极值。
{: .proposition}

为了判定临界点的性质，我们提出以下定理：

设$f:U \subset \RR^n \to \RR$为一$\mathcal C^2$函数，且$a \in U$为一临界点，则根据泰勒展开，有：
$$
f(a+h) = f(a) + \frac{1}{2} Q(h) + o(\Vert h \Vert^2)
$$
其中$Q(h)$为二次型。
若其在$a$处取极小值，那么二次型为**正**；若二次型为**正定**的，那么其在$a$处取极小值。
若其在$a$处取极大值，那么二次型为**负**；若二次型为**负定**的，那么其在$a$处取极大值。
{: .theorem}

二次型为正，是指对所有$h$，$Q(h) \ge 0$；
二次型为正定，是指对所有$h$，$Q(h) > 0$。

这个二次型为正或负时，函数不一定在该点取极值，只有正定或负定时才能保证该点处取极值。
考虑$f(x) = x^3$，其在零点处的二次型就是正的（$f^\prime(x) = 3x^2 > 0$），但是该点不是极值点。
{: .remark}

称矩阵$\left( \frac{\partial^2 f}{\partial x_i \partial x_j} \right)_{1 \le i,j \le n}$为函数$f$的黑塞矩阵。
如果$f \in \mathcal C^2$，那么由Schwarz定理，这个矩阵是一个对称矩阵，且满足
$\forall h \in \RR^n, \; Q(h) = h^T A h$
{: .definition}

### 二阶情况

我们着重研究一下二阶的情况。
设某一函数的黑塞矩阵为：
$$
A = \begin{pmatrix}
r & s \\ s & t
\end{pmatrix}
$$
其行列式为$\det(A) = rt-s^2$，迹为$\mathrm{tr}(A) = r+t$，从而其特征值满足：$\lambda_1 \lambda_2 = rt-s^2, \; \lambda_1+\lambda_2 = r+t$。
我们知道，二次型的正负可由其特征值判定。
考虑以下四种情况：

- $rt-s^2>0, \; r>0$，那么$t>0$，从而$\lambda_1,\lambda_2 > 0$，该点是极小值点；
- $rt-s^2>0, \; r<0$，那么$t<0$，从而$\lambda_1,\lambda_2 < 0$，该点是极大值点；
- $rt-s^2=0$，这个方法不足以判定是否是极值点；
- $rt-s^2<0$，该点不是极值点。

### 约束极值

设$f,g_1,g_2,\dots,g_n : U \subset \RR^n \to \RR$为$\mathcal C^1$函数，设$\Gamma = \\\{ x \in U \| g_1(x) = g_2(x) = \cdots = g_n(x) = 0 \\\}$。
若$f_{\| \Gamma}$在约束后的一点$a \in \Gamma$上取极值，且$\d g_{1,a}, \d g_{2,a}, \dots , \d g_{n,a}$线性无关，那么存在一组实数$\lambda_1, \lambda_2, \dots , \lambda_n$，满足：
$$
\d f_a = \lambda_1 \d g_{1,a} + \lambda_2 \d g_{2,a} + \dots + \lambda_n \d g_{n,a}
$$
这组实数称为拉格朗日乘数。
{: .theorem}

## 反函数

我们知道，对一元实值函数，若该函数可导、导数连续且不为零，且存在反函数，有：
$$
\forall x , \; \left( f^{-1} \right)^\prime (f(x)) = \frac{1}{f^\prime(x)}
$$
我们可以利用这一性质来计算反函数的导数：
$$
\arccos^\prime \cos \theta = - \frac{1}{\sin \theta} = - \frac{1}{\sqrt{1 - \cos^2 \theta}}
\iff \arccos^\prime x = -\frac{1}{\sqrt{1-x^2}}
$$

现在，我们希望把这个命题推广到多维空间上。

设$E,F$两巴拿赫空间，$U \subset E$为一开集合，$f:U \to F$为$\mathcal C^1$映射。
我们设存在一点$a \in U$，使$\d f_a$为一线性同构（即$(\d f_a)^{-1}$存在，且两映射连续）。
那么存在$a$的邻域$V$和$f(a)$的邻域$W=f(V)$，满足：
1) $f_{\|V}$是从$V$到$W$的双射；
2) 反映射$f^{-1}: W \to V$连续；
3) $f^{-1} \in \mathcal C^1$，且$\forall x \in W, \d f^{-1}\_x \circ \d f\_{f^{-1}(x)} = \mathrm{Id}\_E$。
{: .theorem}

这个命题的反函数限制在开集$V$上，因此称为局部反函数。

考虑这个函数$f: \RR^2 \to \RR^2 \; (x,y) \mapsto (e^x \cos y , e^x \sin y)$。
其雅可比矩阵为：
$$
J_{f(x,y)} = \begin{pmatrix}
e^x \cos y & - e^x \sin y \\
e^x \sin y & e^x \cos y
\end{pmatrix}
\qquad
\det J_{f(x,y)} = e^{2x} > 0
$$
其行列式大于零，从而局部反函数存在。
根据上一命题，有：
$$
\d f^{-1}_{f(x,y)} = (\d f_{(x,y)})^{-1} = J_{f(x,y)}^{-1} =
e^{-2x}
\begin{pmatrix}
e^x \cos x & e^x \sin y \\
-e^x \sin x & e^x \cos y
\end{pmatrix}
$$
注意到$f(x,y) = f(x,y+2\pi)$，从而其全局反函数并不存在。
{: .exampl}

把这个命题推广到全局反函数上。

设$E,F$两巴拿赫空间，$U \subset E$为一开集合，$f:U \to F$为$\mathcal C^1$**单射**。
以下两个命题等价：
1) $\forall x \in U, \; \d f_x$同胚（可逆，连续且反函数连续）；
2) $V = f(U)$为开集，且$f^{-1}: V \to U \in \mathcal C^1$。
{: .proposition}

### 微分同胚

设$U, V \subset \RR^n$为两开集合，$f: U \to V$。
若其为双射，且其本身和其反函数都为$\mathcal C^k$的，那么称其为$\mathcal C^k$微分同胚。
{: .definition}

上面提到的几个命题都可以推广。

设$f: U \to \RR^m$，$U \subset \RR^n$为一开集合，$f \in \mathcal C^k$。
若存在一点$a \in U$使$\d f_a$可逆，那么就存在$a$的邻域$V$和$f(a)$的邻域$W$，满足$f_{\|V}$为一$\mathcal C^k$微分同胚。
且有$\d (f_{\|V}^{-1})_{f(x)} = (\d f_x)^{-1}$。
{: .proposition}
