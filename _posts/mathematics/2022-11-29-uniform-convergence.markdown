---
layout: single_legacy
title: "函数和级数的一致收敛"
categories: "分析"
date: 2022-11-29 13:30:00 +0800
tags: ["级数"]
--- 

对任何函数列，我们都可以研究其收敛性：
我们定义对函数列$(f_n)$，如果存在一个函数$f$
$$
\forall x \in X \quad \exists \varepsilon > 0 \quad \exists n \quad \forall p \quad
p \ge n \implies | f_p(x) - f(x) | < \varepsilon
$$
则称$(f_n)$简单收敛（或逐点收敛）至$f$。

这个定义非常简单，但是效果却不甚如人意。

考虑函数列$f_n: \[0,1\] \to \mathbb R, x \mapsto x^n$。
容易看出这个函数列逐点收敛至
$$
f(x) = \left\{
\begin{aligned}
0 \quad x < 1 \\
1 \quad x = 1
\end{aligned}
\right.
$$
函数列都是连续函数，但是其逐点收敛的极限却是一个不连续的函数。
这促使我们去寻找更加严格的条件来描述函数列的敛散性，这就是一致收敛。

## 一致收敛的判据

此节中我们假设$X$是一个非空集合。
{: .remark}

我们定义对函数列$(f_n)$，$f_n: X \to V$，如果存在一个函数$f:X \to V$
$$
\exists \varepsilon > 0 \quad \exists n \quad \forall p \quad \forall x \in X \quad
p \ge n \implies | f_p(x) - f(x) | < \varepsilon
$$
则称$(f_n)$**一致收敛**至$f$。
{: .definition}

注意到在定义中交换了$x$出现的位置，这说明我们选择的$\varepsilon$等不再取决于自变量。
这是一致收敛和*逐点*收敛的最本质区别。
我们不再只考虑*一个点*处的局部情况，而是考虑*整个*函数*一致*的情况。

这个定义等价于存在一个趋于零的正数列$(c_n)$满足：
$$
\exists n \quad \forall p \quad \forall x \in X \quad p \ge n \implies |f_p(x) - f(x)| \le c_p
$$
还等价于存在$n_0$使得$f_{n \ge n_0}-f_{n_0}$有界且数列$(f_n - f_{n_0})$在一致收敛范数（即全域上界）下收敛。
这也是上界范数也被称作一致范数的原因。

如果$(f_n)$逐点收敛，且存在一个有限的子集$A \subset X$，则$(f_n)$在$X$上一致收敛等价于在$X \backslash A$上一致收敛。

返回本章开头的例子，对于函数$f_n(x) = x^n$，在$\[0,1)$上其上确界为1，不趋于零，从而其不在$\[0,1)$上一致收敛。
但是，其在$\[0,a\],\forall a < 1$上一致收敛，因为$\mathrm{sup} \; f_n(x) = f_n(a) \to 0, \forall a < 1$。
{: .exampl}

### 函数级数的一致收敛

更进一步地，我们希望对函数列级数也有类似的定义。

假设$(u_n)$为一函数列，$u_n : X \to V$，若对于所有$x$，$\sum u_n(x)$收敛，则称函数列**逐点收敛**。
这等价于其部分和函数$f_n(x) = \sum_{k=0}^n u_n(x)$逐点收敛。
其极限
$$
f: X \to V, x \mapsto \sum_{n=0}^{\infty} u_n(x)
$$
称为这个函数级数的和，也记作$\sum_{n=0}^{\infty} u_n$。
若其部分和一致收敛至$f$，则也称这个级数**一致收敛**。

函数级数的一致收敛，即其部分和的一致收敛，等价于其**余项**的一致收敛（收敛至零）；
还等价于存在$n_0$使得$u_{n \ge n_0}$有界，且级数$\sum_{n \ge n_0} u_n$在绝对收敛范数（即全域的上确界）下收敛。

函数级数的一致收敛的**必要条件**是其每一项一致收敛至零，即$u_n$一致收敛至零。

---

函数级数一致收敛的判定较为复杂，为此我们引入正规收敛来辅助判断。

称函数级数$\sum u_n$**正规收敛**，若其满足以下有界条件：
存在一数列$(c_n)$满足
$$
\forall n \quad \forall x \in X \quad |u_n(x)| \le c_n
$$
且$\sum c_n < \infty$
{: .definition}

以下命题指明了正规收敛和绝对收敛之间的关系：

函数级数$\sum u_n$一致收敛的充分条件是其正规收敛。
{: .proposition}

--- 

类比交错级数，我们也能给出交错函数级数的敛散性。

设$u_n$为实值函数，假设$\forall x \in X$，级数$\sum u_n(x)$是交错的，且函数级数$|(u_n)|$单调递减且**一致收敛**至零函数。
则级数$\sum u_n$一致收敛。
{: .proposition}

对所有$x \in X$，$\sum u_n(x)$满足交错级数的收敛条件，从而收敛，因此$\sum u_n(x)$存在。
又$\|\sum_{k=n}^{\infty} u_k(x)\| \le \|u_n(x)\|$，从而其余项一致收敛至0，因此原级数收敛。
{: .proof}


## 连续性

此节中，我们假设$X$为一度量空间，$\mathbf d$表示其上的距离。
{: .remark}

从本文开头的例子，我们可以发现，一致收敛和逐点收敛的不同之处的重大表现就是其连续性。
因此我们希望研究一致连续前提下极限函数的连续性。

设$(f_n)$为一函数列，$f_n : X \to V$，设$x \in X$。
若对所有$n$，$f_n$在$a$处连续，且$(f_n)$在$X$上一致收敛至$f$，记为$f = \lim_{n \to \infty} f_n$。
则$f$一定在$a$处连续。
{: .proposition}

因此我们可以说，如果一列从$X$到$V$的映射连续且一致收敛，则其极限在$X$上连续。

---

在求函数列极限的计算中，有时我们希望可以颠倒极限符号的顺序。
一致收敛的条件足够强，因此可以保证颠倒顺序后结果不变。
具体来说，以下命题成立：

设$a \in E \backslash X$为$X$的闭包上的一点。
$(f_n)$为一列从$X$映射到$V$的函数。
若对所有$n$，$f_n$在$a$处有极限，记为$l_n = \lim_{x \to a} f_n(x)$；
且函数列$(f_n)$在$X$上一致收敛，记为$f = \lim_{n \to \infty} f_n$。
$f$在$a$处有极限，则$(l_n)$收敛，且收敛至$\lim_{n \to a} f(x)$。
即
$$
\lim_{x \to a} \lim_{n \to \infty} f_n(x) = \lim_{n \to \infty} \lim_{x \to a} f_n(x)
$$
{: .proposition}

这个定理在无穷处也成立。

---

对函数级数，有类似的命题：

设$(u_n)$为一列从$X$到$V$的函数。
若$u_n$对所有$n$在$X$上连续；
且$\sum u_n$在$X$上一致收敛。
则$\sum u_n$在$X$上连续。
{: .proposition}

设$X$为$E$的一个非空子集，$(u_n)$为一列从$X$到$V$的函数，$a \in E \backslash X$为$X$的闭包上的一点。
若对于所有$n$，$u_n$在$a$处有极限；
且函数级数$\sum u_n$在$X$上一致收敛。
则级数$\sum \lim_{x \to a} u_n(x)$收敛，函数级数$\sum u_n$在$a$处有极限，且：
$$
\lim_{x \to a} \left( \sum_{n=0}^{\infty} u_n(x) \right) = \sum_{n=0}^{\infty} \lim_{x \to a} u_n(x)
$$
{: .proposition}

这个定理在无穷处也成立。

## 积分与求导

我们已经知道，极限符号的顺序对一致收敛的函数并不重要。
这启发我们寻找其他可以颠倒顺序的运算。
自然的，和极限紧密相关的积分和求导很快进入我们的视野。
实际上，我们可以证明，对一致收敛的函数列，可以调换积分或求导和极限的顺序。

设$(f_n)$为一列定义在区间$\[a,b\]$上的函数。
若$f_n$连续，且在该区间上一致收敛，则有：
$$
\int_a^b \lim_{n \to \infty} f_n = \lim_{n \to \infty} \int_a^b f_n
$$
同理，对于定义在$\[a,b\]$上的函数列$(u_n)$，
若$u_n$连续且$\sum u_n$在区间上一致收敛，则有：
$$
\int_a^b \sum_{n=0}^{\infty} u_n = \sum_{n=0}^{\infty} \int_a^b u_n
$$
{: .proposition}

设$I$为$\mathbb R$上一区间，$(f_n)$为一定义在其上的函数列。
若$f_n$k阶可导，且导函数连续；
且$(f_n^{(i)}), \quad \forall i = 1, 2, \dots, k-1$逐点收敛；
且$(f_n^{(k)})$在$I$的所有闭区间上一致收敛。
则$(f_n)$的极限k阶可导，且
$$
\forall i = 1, 2, \dots, k \quad (\lim_{n \to \infty} f_n)^{(i)} = \lim_{n \to \infty} f_n^{(i)}
$$
同理，对于级数，有
若$u_n$k阶可导，且导函数连续；
且$\sum u_n^{(i)}, \quad \forall i = 1, 2, \dots, k-1$逐点收敛；
且$\sum u_n^{(k)}$在$I$的所有闭区间上一致收敛。
则$\sum u_n$的极限k阶可导，且
$$
\forall i = 1, 2, \dots, k \quad 
(\sum_{n = 0}^{\infty} u_n)^{(i)} = \sum_{n=0}^{\infty} u_n^{(i)}
$$
{: .proposition}

## 维尔斯特拉斯逼近

如果一个函数在某个闭区间上连续，那么我们一定可以用某个多项式逼近它，这个定理叫做维尔斯特拉斯逼近定理。

设$f: [a,b] \to V$为一连续函数，对所有$\varepsilon > 0$，都存在一多项式$\psi:[a,b] \to V$，满足：
$$
\forall t \in [a, b] \quad \left| f(t) - \psi(t) \right| < \varepsilon
$$
{: .proposition}

如果我们为向量空间$\mathcal C \left( [a,b]; V \right)$加上一致收敛范数$\Vert \cdot \Vert_\infty$（值为区间上像的范数的上确界），
那么这个定理等价于由多项式组成的该空间的子空间是稠密的。

维尔斯特拉斯逼近还有一条定理与三角多项式，而非常规意义下的多项式有关。
那条定理会在研究傅里叶级数时提到。
