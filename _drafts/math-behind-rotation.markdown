---
title: "旋转背后的数学"
---


## 李群和李代数

旋转变换中最令人迷惑的方面之一就是无穷小旋转——为什么无穷小旋转一定能和反对称矩阵联系起来？为什么旋转本身是不可交换的，而无穷小旋转是可交换的？轴角表示和无穷小旋转又有什么关系？

本节我们将介绍用于研究无穷小旋转的代数工具——李代数。

### 李群和李代数的定义

我们首先检查一下李群的定义。

*李群*（Lie group）是具有微分流形结构的群。
{: .definition}

具有微分流形结构实际上是说这个群具有非常良好的两点局部性质：
首先，群上任何一个元素附近都可和一有限维线性空间（欧几里得空间）近似，这就是说李群是一个*流形*；
其次，这个近似足够好，以至于可以用常规的微积分工具来研究该群中的微积分，这就是说李群是一个*微分流形*。

我们不加证明地认为，所有我们将要研究的矩阵群都是李群，包括但不限于：
可逆矩阵群$GL(n)$、正交矩阵群$O(n)$以及我们将要研究的特殊正交群$SO(n)$，即旋转矩阵的群。
正交群和特殊正交群是微分流形这一命题通常直接利用正则值原像定理（Regular Value Theorem）进行证明。

借助以上这两点性质，我们可以研究这个光滑映射：
$$S: [0,1] \to SO(3), \; S(0) = I.$$
对任何$t \in [0, 1]$，我们有
$$S(t)^T S(t) = I.$$
在$t=0$处求导，得到
$$\dot S(t)^T I + I \dot S(t) = \dot S(0)^T + \dot S(0)  = 0,$$
这意味着$S(t)$是一个反对称矩阵。
现在考虑一下$S$的几何意义：这实际上是一条$SO(3)$中的曲线，而$\dot S(0)$就是该曲线在原点附近的“切线的斜率”。
利用幂级数展开，注意到
$$S(t) = S(0) + t \dot S(0) + \cdots,$$
如果说$SO(3)$中的元素$S(t)$是旋转，那么这个“切线”，即$\dot S(0)$，就能够表征“无穷小”旋转的所有性质，因为任何无穷小旋转都能写成
$$S(\delta t) = S(0) + \delta t \cdot \dot S(0) = I + \delta t \cdot \dot S(0),$$
从而可由该切线乘上一个系数表示出来。

我们可使用李代数来研究这些切线组成的线性空间，即切空间，的性质。

设李群单位元处附近的切空间为$\mathfrak g$，若该切空间还装备有一个双线性映射
$$[\cdot, \cdot]: \mathfrak g \times \mathfrak g \to \mathfrak g,$$
满足交错性，即
$$\forall x \in \mathfrak g, \;[x, x] = 0,$$
与雅可比恒等式，即
$$\forall x, y, z \in \mathfrak g, \; [x, [y,z]] + [y, [z,x]] + [z, [x,y]] = 0,$$
那么称该空间为*李代数*（Lie algebra），这个映射称为李括号（Lie bracket）。
根据交错性和双线性，容易知道李括号一定满足反交换性[^characteristic]。
{: .definition}

[^characteristic]: 我们默认该代数一定在实数域上，从而其特征一定为零。若域的特征为二，则不一定满足反交换性。

李代数实际上可以定义在任何空间$\mathfrak g$上，并且一定具有对应的李群，但是这里我们只研究旋转矩阵这个李群和对应的反对称矩阵构成的李代数。
习惯上李代数由碎片体（Fraktur）表示，而旋转矩阵的李代数记为$\mathfrak{so}$。

对于由矩阵或线性变换构成的李代数，利用矩阵的对易子即可构造一个李括号：
$$[X,Y] = XY - YX.$$
容易验证两个反对称矩阵的对易子依然是反对称矩阵。

李括号表示了高阶导数导致的交换性的丢失，因为一阶无穷是线性的，从而是交换的。
仍以无穷小旋转为例，设$A, B \in \mathfrak{so}$，而$\delta a, \delta b$为无穷小量，则
$$
\begin{aligned}
& (I+\delta a \cdot A)(I + \delta b \cdot B) - (I+\delta b \cdot B)(I + \delta a \cdot A) \\
= & \delta a \cdot A + \delta b \cdot B - \delta b \cdot B - \delta a \cdot A + \delta a \delta b (AB - BA) \\
= & \delta a \delta b [A, B].
\end{aligned}
$$
若略去高阶无穷小量，则可得到无穷小旋转可交换的性质。

总结一下这一小节：
旋转矩阵组成的结构是一个李群，具有非常好的性质，能够研究其上的无穷小变化。
李群和李代数构成了类似函数和切线的关系，从而这些无穷小变化，即无穷小旋转，可由这个李群上的李代数表征。
这个李代数中的元素可视为旋转的无穷小生成元。

### 李代数的指数映射

我们以及有了李群和李代数的定义，接下来一个问题自然是如何利用李代数中的“切线”和从切线到函数的距离复原函数，即如何从反对称矩阵和一个实数复原出旋转矩阵。

对无穷小旋转，将两者相乘即可
$$\delta R = I + \delta t \cdot A,$$
而对于正常的旋转，我们可使用无穷个无穷小旋转近似：
$$R(t) = \lim_{N \to \infty} \left( I + \frac{t}{N} A \right)^N = \exp At.$$
这种映射实际上可以拓展到任意李代数上。

设$G$为一李群，$\mathfrak g$是单位元附近切空间构成的李代数，那么对李代数中任何元素$A \in \mathfrak g$，存在从数域到李群的唯一映射$S_A: \mathbb R \to G$，满足
$$S_A(a+b) = S_A(a) \cdot S_A(b), \, \forall a, b \text{ 且 } S_A'(0) = A.$$
这个映射也叫单参数子群（One-parameter subgroup）。
根据该函数与指数函数的相似性，定义李代数的指数映射为
$$
\begin{array}{cccc}
\exp: & \mathfrak g & \to & G \\
& A & \mapsto &  S_A(1)
\end{array}.
$$
这是一个从$\mathfrak g$的单位元附近的邻域到$G$的单位元附近邻域的微分同胚，且总是满足全微分方程：
$$\frac{\mathrm d}{\mathrm d t} \exp(tA) = \exp (tA) \cdot A.$$
{: .proposition}

指数映射满足
$$\exp(sA) \exp(tA) = \exp[(s+t)A],$$
但是
$$\exp(A)\exp(B) \eq \exp(A+B),$$
不一定总是成立。$[A,B] = 0$时上式一定是成立的。

可以发现，指数映射实际上是从“切线斜率”还原“曲线”的映射。
由于这个映射是满射，因此我们说李代数中的元素可视为李群的无穷小生成元。
更特别地，由于这个映射是双射，我们总是可以把无穷小旋转和一个李代数中的矩阵等价，甚至将任何旋转视作无穷多个李代数中的元素的乘积。

关于指数映射及其微分有一系列非常有趣且实用的结论，例如贝克-坎贝尔-豪斯多夫公式（Baker-Campbell-Hausdorff formula）等。
然而由于我们只关心旋转及其矩阵形式，其指数映射比较简单，因此这些结论不会大量出现。

方阵的指数映射等价地定义为
$$\exp X = I + X + \frac{1}{2} X^2 + \frac{1}{6} X^3 + \cdots,$$
根据凯莱-哈密顿定理，由于其特征多项式一定是零化多项式，因此方阵的指数映射实际上一定是有限次数的多项式，且次数最高等于矩阵的大小减一。
因此，对三维空间中的旋转矩阵，其和对应的反对称矩阵之间一定满足一个二次关系，这个关系实际上就是罗德里格斯旋转公式。

## 旋转的表示

我们已经研究了表示旋转的数学基础，接下来我们将考虑常见的旋转的表示形式。

### 矩阵表示

作为线性变换的子群，表示旋转最自然的形式自然是矩阵形式。
显然，任何旋转变换均可由正交矩阵表示，而正如上文所述，无穷小旋转则和反对称矩阵具有密切联系。
对正交矩阵的研究在互联网上随处可见，因此这里我们主要关注无穷小旋转和反对称矩阵。
值得一提的是绕三维直角坐标系三个轴旋转的正交矩阵，即
$$R_x = , R_y = , R_z = .$$
这三个矩阵在欧拉角表示中非常重要。

对旋转矩阵（以及任何变换矩阵）的研究，一个有益的视点是将其视为坐标系的变换而非物体的变换——线性变换，究其本质上而言，可以视作同一线性空间中不同基底，即坐标系，的变换。

我们考虑三维反对称矩阵，其可由以下三个典型的生成元生成：
$$
L_x = \begin{bmatrix}
0 & 0 & 0 \\
0 & 0 & -1 \\
0 & 1 & 0
\end{bmatrix}, 
L_y = \begin{bmatrix}
0 & 0 & 1 \\
0 & 0 & 0 \\
-1 & 0 & 0
\end{bmatrix}, 
L_z = \begin{bmatrix}
0 & -1 & 0 \\
1 & 0 & 0 \\
0 & 0 & 0
\end{bmatrix}.
$$
容易注意到由这些生成元产生的无穷小旋转，例如
$$I + \delta t \cdot L_x,$$
具有特别的不变子空间，即X轴。
因此，这些无穷小旋转的生成元正是绕某一轴的旋转的生成元，从而我们可以说$\mathfrak{so}$李代数可生成绕任何轴的无穷小旋转。
又因为左乘反对称矩阵等价于叉乘一个向量，这实际上是轴角表示的数学基础。

之前我们说明了无穷小旋转在忽略二阶小量的情况下可交换，利用这些生成元矩阵表示也能非常容易地证明这一点。
忽略二阶小量的行为在数学上称为构造了一个 Wigner-İnönü [^wicontraction] 收缩。

[^wicontraction]: 命名自 Eugene Wigner 和 Erdal İnönü。前者亦是 Wigner-Seitz 元胞的词源。后者曾任土耳其总理。

### 轴角表示

我们之前说过，任何旋转均可从$\mathfrak {so}(3)$中的矩阵（即表示某一轴旋转的无穷小生成元）的指数映射构造出来。
又因为这些矩阵均是反对称矩阵，因此等价于叉乘于某一向量，这自然提示我们可将任何旋转表示为和向量的叉乘。

左乘三维反对称矩阵
$$A = \begin{pmatrix}
0 & z & -y \\
-z & 0 & x \\
y & -x & 0
\end{pmatrix}$$
等价于叉乘向量
$$\Omega = \begin{pmatrix} x \\ y \\ z \end{pmatrix},$$
即
$$Av = \begin{pmatrix}
0 & z & -y \\
-z & 0 & x \\
y & -x & 0
\end{pmatrix} \cdot v = \begin{pmatrix} x \\ y \\ z \end{pmatrix} \times v$$
且该向量$\Omega$必然在反对称矩阵$A$的核空间中，从而在矩阵$I+\lambda A, \forall \lambda \in \mathbb R$的不变子空间中。
这个反对称矩阵也称为$\Omega$的叉乘矩阵，记为
$$A = [\Omega]^\times.$$
{: .proposition}

因此，向量的方向就表示了转轴（因为在反对称矩阵的核空间中），而长度自然就表示了旋转的强度，即转角。
这种表示旋转的方法就称为旋转的轴角表示（Axis-angle representation）。

既然旋转的强度由向量的长度表示，那么我们不妨只考虑“大小”为一的反对称矩阵，然后在其上乘上一个实数来表示旋转的转角。
因此接下来我们研究这种旋转表示：
$$A = \omega K = \omega [\Omega]^\times, \; | \Omega | = 1.$$
这意味着这个反对称矩阵的对角线同一侧的三个元素的平方和一定为一。

利用指数映射，我们可以给出旋转的罗德里格公式。

<small>（罗德里格公式）</small>
设$\omega K = \omega [\Omega]^\times$为绕长度为一的向量$\Omega$旋转的轴角表示，则其对应的旋转矩阵由矩阵指数给出：
$$R = \exp \omega K = I + \sin \omega K + (1 - \cos \omega) K^2,$$
从而任何向量在旋转后可写为
$$v_\text{rot} = R v = v + \sin \omega (\Omega \times v) + (1 - \cos \omega) (\Omega \times (\Omega \times v)).$$
{: .proposition}

考虑反对称矩阵
$$K = \begin{pmatrix}
0 & z & -y \\
-z & 0 & x \\
y & -x & 0
\end{pmatrix}, x^2 + y^2 + z^2 = 1.$$
其特征多项式为
$$\chi_K(\lambda) = - (\lambda^3 + (x^2 + y^2 + z^2) \lambda) = - \lambda(\lambda^2 + 1).$$
根据凯莱-哈密尔顿定理，有
$$\chi_K(K) = -K (K^2+1) = 0 \iff K^3 = -K.$$
现在代入矩阵指数，得到
$$
\begin{aligned}
\exp \omega K = & I + \omega K + \frac{1}{2} (\omega K)^2 + \frac{1}{6} (\omega K)^2 + \cdots \\
= & I + (\omega - \frac{\omega^3}{3!} + \frac{\omega^5}{5!} + \cdots) K + \\
& (\frac{\omega^2}{2!} - \frac{\omega^4}{4!} + \frac{\omega^6}{6!} + \cdots) K^2 \\
= & I + \sin \omega \cdot K + (1 - \cos \omega) \cdot K^2,
\end{aligned}
$$
这就完成了证明。
{: .proof}

### 欧拉角表示

### 四元数表示

四元数（Quaternion）是表示旋转的另一种方式，在计算机图形学中因其内存消耗较小、运算成本较低等原因受到广泛使用。
本节主要介绍四元数相关知识。

形如
$$q = a + b \mathbf i + c \mathbf j + d \mathbf k,$$
的数称为*四元数*，其中$a,b,c,d \in \mathbb R$，且乘法定义为
$$
\begin{aligned}
\mathbf i \mathbf j = - \mathbf j \mathbf i = \mathbf k, & \quad
\mathbf j \mathbf k = - \mathbf k \mathbf j = \mathbf i, \\
\mathbf k \mathbf i = - \mathbf i \mathbf k = \mathbf j, & \quad
\mathbf i^2 = \mathbf j^2 = \mathbf k^2 = \mathbf {ijk} = -1.
\end{aligned}
$$
四元数组成了一个$\mathbb R$上的四维向量空间，记为$\mathbb H$。
{: .definition}

四元数可视为虚数的扩展。
其上的加法和数乘自然定义为逐元素相加和相乘，两个四元数的乘法则和虚数乘法类似：
$$
\begin{aligned}
& (a_1 + b_1 \mathbf i + c_1 \mathbf j + d_1 \mathbf k) \times (a_2 + b_2 \mathbf i + c_2 \mathbf j + d_2 \mathbf k) \\
= & a_1 a_2 - b_1 b_2 - c_1 c_2 - d_1 d_2 + (a_1 b_2 + b_1 a_2 + c_1 d_2 - d_1 c_2) \mathbf i + \\
& (a_1 c_2 - b_1 d_2 + c_1 a_2 + d_1 b_2) \mathbf j +
(a_1 d_2 + b_1 c_2 - c_1 b_2 + d_1 a_2) \mathbf k.
\end{aligned}
$$
这个乘法也叫哈密顿乘法。
注意两个四元数之间的乘法满足结合性，但不满足交换性。
根据乘法的定义，某个四元数的逆为
$$q^{-1} = \frac{a - b \mathbf i - c \mathbf j - d \mathbf k}{a^2 + b^2 + c^2 + d^2}.$$

实部$a$为零的四元数也叫虚四元数、纯四元数（Pure quaternion）或向量四元数（Vector quaternion）。
容易发现，若将$\mathbf{i,j,k}$和三维空间中的三个坐标轴对应，那么纯四元数可以容易地和其中的向量一一对应[^bivector]。
根据这一点，我们可以将所有四元数分为标量部分和向量部分，即
$$q = q_s + \vec q_v = q_s + q_{v,x} \mathbf i + q_{v,y} \mathbf j + q_{v,z} \mathbf k.$$
在这种分解下，两个四元数的哈密顿积可写为
$$p \cdot q = (p_s q_s - \vec p_v \cdot \vec q_v) + (p_s \vec q_v + q_s \vec p_v + \vec p_v \times \vec q_v).$$
由于将标量与向量相加可能导致一些混淆，因此我们只在简化计算时才使用这种记法。

[^bivector]: 准确来说，四元数对应的是二重向量（bivector），即两个向量叉乘产生的有向面积。这也是它们能表示旋转的原因之一。

为了定义四元数上的正交变换，我们需要首先定义四元数的范数。

设
$$q = a + b \mathbf i + c \mathbf j + d \mathbf k \in \mathbb H$$
为一四元数，则其共轭为
$$q^* = a - b\mathbf i - c \mathbf j - d \mathbf k.$$
该四元数的范数为
$$\Vert q \Vert = \sqrt{q q^*} = \sqrt{a^2 + b^2 + c^2 + d^2}.$$
范数为一的四元数称为单位四元数（Unit quaternion，或 Versor）。
{: .definition}

利用共轭和范数，某个四元数的逆可写为
$$q^{-1} = \frac{q^*}{\Vert q \Vert^2}.$$
此外，任何四元数均可拆分为一个表示方向的单位四元数和一个实数，这个拆分称为极分解。
特别地，四元数的范数满足乘法性，即
$$\Vert p q \Vert = \Vert p \Vert \cdot \Vert q \Vert.$$

对于纯四元数，其范数正是对应向量的长度，而纯四元数的逆可视为三位空间中向量的逆，从而给出向量除法的定义，这正是哈密顿引入四元数所希望解决的问题。

#### 单位四元数与旋转

对于某个指定的单位四元数$q$，考虑映射
$$\mathrm{Ad}_q: v \mapsto q v q^*, \; \Re(v) = 0.$$
这个映射将任何向量四元数映射到另一个向量四元数中，且保持该四元数的长度不变。
这个映射保持长度，因此显然是正交的。
现在的问题是，这个映射是否能够对应所有旋转？除此之外，是否还能对应反射和瑕旋转？

设某一单位四元数为
$$q = \cos \theta + (x \mathbf i + y \mathbf j + z \mathbf k) \sin \theta, \; x^2 + y^2 + z^2 = 1,$$
则对向量四元数$v$，变换后的向量四元数
$$v' = q v q^*$$
相当于将该向量绕$(x,y,z)^T$轴旋转$2\theta$角。
注意任何单位四元数均可分解为该形式，因此所有单位四元数均可以这种方式表示旋转。
{: .proposition}

设
$$v = v_x \mathbf i + v_y \mathbf j + v_z \mathbf k = \vec v,\; q = q_s + \vec q_v,$$
其中
$$q_s = \cos \theta, \vec q_v = \sin \theta \vec r = \sin \theta(x \mathbf i + y \mathbf j + z \mathbf k).$$
直接计算，得到
$$
\begin{aligned}
v' = & q v q^* \\
= & (q_s + \vec q_v) \cdot (\vec v) \cdot (q_s - \vec q_v) \\
= & (q_s^2 + \vec q_v \cdot \vec q_v)\vec v + 2 q_s \vec q_v \times v + 2 \vec q_v \times \vec q_v \times v \\
= & \vec v + 2 \cos \theta \sin \theta (\vec r \times v) + 2 \sin^2 \theta (\vec r \times \vec r \times v) \\
= & \vec v + \sin 2\theta (\vec r \times v) + (1 - \cos 2\theta) (\vec r \times \vec r \times v).
\end{aligned}
$$
这就是上文提到过的罗德里格公式。
{: .proof}

注意对同一个旋转，即使我们限制$2\theta \in [0, 2\pi]$，仍可选择两个不同的四元数：
我们可绕$\vec r$转过$2\theta$角，也可绕$- \vec r$转过$2\pi - 2\theta$角，因为
$$q v q^* = (-q) v (-q)^*.$$
这意味着单位四元数到三维旋转群$SO(3)$的映射是一个二对一的映射。
数学上讲，这就是说$SU(2)$是$SO(3)$的一个双重覆盖（Double cover）。

通过对不同四元数重复应用$\mathrm{Ad}\_q$这一映射，可将四元数的乘积视为旋转的符合。
例如，四元数
$$q' = q_3 q_2 q_1,$$
相当于依次应用$q\_1$、$q\_2$和$q\_3$三次旋转。

#### 特殊幺正群

一个自然的问题是，为何要选择
$$q = \cos \theta + (x \mathbf i + y \mathbf j + z \mathbf k) \sin \theta$$
这个特别的单位四元数？它是怎么构造出来的？
为了回答这个问题，我们需要回到李群中去。

对于复数空间，行列式为一的幺正矩阵组成的群，称为特殊幺正群$SU(n)$，也是李群，其对应的李代数记为$\mathfrak{su}$。
二维特殊幺正群$SU(2)$和单位四元数有特别的关系：
特殊幺正矩阵
$$
\begin{pmatrix}
a + bi & c + di \\ - c + di & a - bi
\end{pmatrix}
$$
和四元数
$$a + b \mathbf i + c \mathbf j + d \mathbf k$$
一一对应并构成群同构，即保持了群的乘法关系。
更特别地，由于幺正矩阵的行列式为一，还有
$$a^2 + b^2 + c^2 + d^2 = 1,$$
这意味着这些矩阵以及四元数实际上构成了$\mathbb R^4$上的单位球。
和实数情况类似，构成李代数$\mathfrak{su}(2)$的矩阵是迹为零的反厄米矩阵
$$
\mathfrak{su}(2) = \left\{
    \begin{pmatrix}
     a i & - b + c i \\
     b - ci & - ai
    \end{pmatrix} : a,b,c \in \mathbb R
\right\}
$$
其生成元（认为标量为实数）为
$$
u_1 = \begin{pmatrix}
0 & i \\ i & 0
\end{pmatrix},
u_2 = \begin{pmatrix}
0 & -1 \\ 1 & 0
\end{pmatrix},
u_3 = \begin{pmatrix}
i & 0 \\ 0 & -i
\end{pmatrix}.
$$
熟悉量子力学的读者能够发现，这些生成元正是[泡利矩阵]({% post_url quantum-mechanics/2024-04-07-quantum-rotational-moment %}#自旋算符与泡利矩阵)。
现在，由于这$\mathfrak{so}(3)$和$\mathfrak{su}(2)$的生成元数量相等，从而维数相等，这两个空间是同构的，这也是四元数能够表示旋转的原因之一。

另外，注意李代数$\mathfrak{su}(2)$的三个生成元满足
$$u_1 u_2 = u_3, u_2 u_3 = u_1, u_3 u_1 = u_2,$$
和纯四元数三个基底的关系完全一致，这意味着$\mathfrak{su}(2)$中的元素实际上和纯四元数一一对应：
$$
v_x \mathbf i + v_y \mathbf j + v_z \mathbf k \mapsto 
\begin{pmatrix}
    i v_z & - v_y + iv_x \\ v_y - iv_x & - i v_z
\end{pmatrix},
$$
并且这个双射还能保持李括号关系，这意味着纯四元数和$\mathfrak{su}(2)$李代数同构。
自然，这个纯四元数正是转轴。

现在考虑指数映射
$$\exp: \mathfrak{su}(2) \to SU(2), \theta h \mapsto \exp \theta h,$$
其中$h$是单位纯四元数：

李代数$\mathfrak{su}(2)$的指数映射为
$$\exp \theta h = \cos \theta + h \sin \theta,$$
其中$h$是单位纯四元数。
{: .proposition}

我们利用指数的幂级数定义来进行计算：
$$\exp \theta h = 1 + \theta h + \frac{(\theta h)^2}{2} + \frac{(\theta h)^3}{3!} + \cdots.$$
注意到对单位纯四元数，有
$$h^2 = -1,$$
从而
$$\exp \theta h = (1 - \frac{\theta^2}{2} + \cdots) + h(\theta - \frac{\theta^3}{3!} + \cdots) = \cos \theta + h \sin \theta.$$
{: .proof}

这个命题和证明均和复数的欧拉公式非常相似，并且也给出了前文构造的旋转四元数的来源：这实际上就是四元数空间中的轴角表示。
显然，共轭的单位四元数的轴角表示中的角度是相反数。

最后一个问题是：公式$q v q^\*$是如何得到的？
简单的几何的回答是，$q$并不代表旋转。
前文提到过，$q$代表的实际上是一个二重向量或有向面积，而两个四元数相乘，不仅需要将虚部向量旋转，还需要将实部标量在复数空间旋转一次，因此为了得到需要的旋转，我们需要再乘其共轭，来将实部再旋转一次，从而消去实部来得到一个纯四元数。
根据这个思路，我们还可以构造映射
$$v \mapsto q v q, \; v \in \mathfrak{su}(2), q \in SU(2)$$
这个映射实际上表示了将$v$沿$\vec q\_v$轴进行反射。

一个更加复杂的说法是这个共轭映射实际上构成了$SU(2)$的伴随表示。
考虑映射：
$$\mathrm{Ad}_q: v \mapsto q v q^*, \; q = \exp \theta h \in SU(2), h \in \mathfrak{su}(2),$$
其在单位元（零）处的导数为
$$\mathrm{ad}_q : h \mapsto \left. \frac{\mathrm d}{\mathrm d \theta} \right|_{\theta = 0} \exp(\theta h) \cdot v \cdot \exp(- \theta h) = h v - v h = [h,v].$$
这个映射是$\mathfrak{su}(2)$上的自同态，而且保持李括号，因此是李代数自同态。
这样的映射：
$$\mathrm{Ad} : SU(2) \to (\mathfrak{su}(2) \to \mathfrak{su}(2)), q \mapsto \mathrm{Ad}_q,$$
称为李群的伴随表示，而
$$\mathrm{ad} : \mathfrak{su}(2) \to (\mathfrak{su}(2) \to \mathfrak{su}(2)), h \mapsto \mathrm{ad}_q,$$
则称为李代数的伴随表示。

重要的一点是$\mathrm{Ad}\_q$不仅是$\mathfrak{su}(2)$上的*自同态*，还是$SO(3)$中的*元素*，因为我们已经知道$\mathfrak{su}(2)$，即纯四元素，同构于$\mathbb R^3$，即三维空间中的向量，而这个映射$\mathrm{Ad}\_q$保持向量的长度和手性，因此一定是特殊正交变换，即旋转。
这也是为何四元数能够表示旋转的原因：它们统一了$SO(3)$和$\mathfrak{so}(3)$、$SU(2)$和$\mathfrak{su}(2)$四个不同的代数结构。

四元数表示旋转的很多性质均能从李群的伴随表示中得出，例如根据同态的性质，有
$$\mathrm{Ad}_{q_2 q_1} = \mathrm{Ad}_{q_2} \circ \mathrm{Ad}_{q_1},$$
这就是四元数乘法与旋转复合的关系。此外，由于$\mathrm{Ad}$是一个二对一的满射，且其核（指像为单位元，即全同映射）为
$$\ker \mathrm{Ad} = \{ 1, -1 \},$$
因此根据群上同态保持乘法的性质，有
$$\mathrm{Ad}_q = \mathrm{Ad}_{-q}.$$

#### 球面插值

四元数的指数映射并非只是一个复杂的数学工具，而确实具有一些特别的用途，尤其是在动画插值时。
假设我们需要在两个单位四元数$p, q \in SU(2)$之间进行插值，满足
$$\mathrm{Slerp}(p, q; 0) = p, \; \mathrm{Slerp}(p, q; 1) = q,$$
如何构造这个函数？

考虑从$p$到$q$的变换四元数，即$qp^\*$，显然有
$$(q p^*) p = q (p^* p) = q.$$
由于$qp^\* \in SU(2)$，利用指数映射，我们可以将其写为：
$$qp^* = \exp(\theta_{pq^*} h_{pq^*})$$
这里要注意
$$\exp(\theta_p h_p) \exp(-\theta_q h_q) \neq \exp(\theta_p h_p - \theta_q h_q)$$
那么我们就可以构造这个映射：
$$\mathrm{Slerp}(p,q;t) = \exp(t \theta_{pq^*} h_{pq^*}) p.$$
这个映射就称为四元数的球面线性插值（Spherical linear interpolation）。
我们知道，从几何意义上讲，指数映射是从“切线斜率”复原“切线”的变换，在这里，我们相当于从旋转的角速度复原了两个四元数之间的最短路径（测地线）。

值得注意的是由于同一个旋转可由两个四元数$q$和$-q$表示，因此虽然球面线性插值能够复原两个四元数之间的最短路径，但是不一定能复原两个旋转之间的最短路径。
如果$-q$相距$p$比$q$更近，那么球面线性插值形成的旋转运动就不再是最短的旋转路径。
