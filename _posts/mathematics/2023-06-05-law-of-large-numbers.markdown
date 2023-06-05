---
title: "大数定律"
categories: "概率论"
---

本文中我们将研究数学期望的物理意义，以及将数学期望与其物理意义联系起来的定理：大数定律。

## 弱大数定律

（弱大数定律）记$(X\_n)\_n$为一列独立且同分布的离散随机变量。
设 $X\_n$具有二阶矩。
记：
$$S_n = X_1 + \cdots + X_n$$
则：
$$\forall \epsilon > 0, \quad \lim_{n \to \infty} \mathbf P (|\frac{S_n}{n} - E X_1| > \epsilon) = 0$$
或称离散随机变量的算术平均值依概率收敛至其期望。
{: .theorem}

弱大数定律实际上对于不具有二阶矩的随机变量也成立，但是其证明更加复杂，因此我们只证明更容易的情况。
这个定律对两两独立的变量也成立，对非离散的随机变量也成立，但我们只研究离散情况。
{: .remark}

不失一般性地，我们假设这一列随机变量的期望为零。
设$\delta > 0$，我们要证：
$$\mathbf P(|\frac{S_n}{n}| \ge \delta) \xrightarrow{n \to \infty} 0$$
写成ε-δ语言的形式，即对于任何$\varepsilon > 0$，都有：
$$\exists N, \; \forall n \ge N, \quad \mathbf P(|\frac{S_n}{n}| \ge \delta) < \varepsilon$$
证明的思路为利用一个实数$M$将随机变量二分为大于$M$和小于等于$M$两个部分，然后分别计算其上界，最后根据$\varepsilon$取$M$并构造$N$即可。\
设：
$$Y_n = X_n \cdot \mathbb{1}_{|X_n| \le M}, \quad M \in \mathrm R_+$$
那么$(Y\_n)$也是一列独立同分布的离散随机变量。
设$Z\_n = X\_n - Y\_n$，那么$(Z\_n)$也是独立同分布的。
现在记
$$\overline{X_n} = \frac{1}{n} \sum_{i=1}^n X_i$$
同理我们也能定义$\overline{Y\_n}, \overline{Z\_n}$，那么我们有：
$$
\begin{aligned}
\overline{X_n} &= \overline{X_n} - \underbrace{\mathbf E \overline{X_n}}_{= 0} \\
&= \overline{Y_n} + \overline{Z_n} - (\mathbf E \overline{Y_n} + \mathbf E \overline{Z_n}) \\
&= (\overline{Y_n} - \mathbf E \overline{Y_n}) + (\overline{Z_n} - \mathbf E \overline{Z_n}) \\
\implies | \overline{X_n} | &\le |\overline{Y_n} - \mathbf E \overline{Y_n}| + |\overline{Z_n} - \mathbf E \overline{Z_n}| \\
\implies \{ |\overline{X_n}| \ge \delta \} &\subset \{ |\overline{Y_n} - \mathbf E \overline{Y_n}| \ge \delta/2 \} \cup \{ |\overline{Z_n} - \mathbf E \overline{Z_n}| \ge \delta/2 \}
\end{aligned}
$$
最后一个包含关系可以由反证法验证。\
现在我们来分别计算两个部分的上界。
首先对第一个部分，注意到
$$\forall n, | Y_n | \le M \implies \mathbf V(Y_n) \le \mathbf E (Y_n)^2 \le M^2$$
使用切比雪夫不等式：
$$
\begin{aligned}
\mathbf P (|\overline{Y_n} - \mathbf E \overline{Y_n}| \ge \delta/2) 
& \le \frac{\mathbf V(\overline{Y_n})}{(\delta/2)^2}  = \frac{4 \mathbf V(\overline{Y_n})}{\delta} \\
& = \frac{4}{n^2 \delta} \mathbf V(\sum_{i=1}^n Y_n) \\
& \le \frac{4 M^2}{n \delta^2}
\end{aligned}
$$
对第二个部分，使用马尔可夫不等式：
$$
\begin{aligned}
\mathbf P (\overline{Z_n} - \mathbf E \overline{Z_n}| \ge \delta/2) 
& \le \frac{2 \mathbf E|\overline{Z_n} - \mathbf E \overline{Z_n}|}{\delta} \le \frac{4 \mathbf E| \overline{Z_n} |}{\delta} \\
& \le \frac{4}{n\delta} \mathbf E(\sum_{i=1}^n |Z_n|) = \frac{4}{\delta} \mathbf E(|Z_n|)
\end{aligned}
$$
现在我们需计算$\vert Z\_n \vert$的期望：
$$
\mathbf E |Z_n| = \mathbf E |Z_1| = \mathbf E(|X_1| \mathbb 1_{|X_1| > M}) = \sum_{x > M} |x| \mathbf P(X_1 = x)
$$
我们知道$|X\_1|$具有有限的期望，且：
$$
\begin{aligned}
\mathbf E |X_1| &= \sum_{x \in X_1(\Omega)} |x| \mathbf P(X_1 = x) \\
&= \sum_{x \le M} |x| \mathbf P(X_1 = x) + \sum_{x > M} |x| \mathbf P(X_1 = x) \\
&= \lim_{M \to \infty} \sum_{x \le M} |x| \mathbf P(X_1 = x)
\end{aligned}
$$
从而当$M$趋于无穷大时，$|Z\_n|$的期望可以任意小，这意味着我们可以通过选择足够大的$M$来限制$\mathbf E(|Z\_n|)$，从而限制第二个部分的上界。
现在，我们取$M$，使得$\mathbf E |Z\_n| < \frac{\delta \varepsilon}{8}$，代入第二个部分，可得：
$$ \mathbf P (|\overline{Z_n} - \mathbf E \overline{Z_n}| \ge \delta/2) \le \frac{\varepsilon}{2}$$
从而完成了第二个部分的限制。
对第一个部分，注意到不等式中存在$n$，因此我们可以通过选择$N$来完成第一个部分的限制。
取
$$N = \left\lfloor \frac{8 M^2}{\varepsilon \delta^2} \right\rfloor + 1$$
那么：
$$\forall n \ge N, \; \mathbf P (|\overline{Y_n} - \mathbf E \overline{Y_n}| \ge \delta/2)  \le \frac{\varepsilon}{2}$$
从而完成了对第一个部分的限制，这就完成了这一定理的证明。
{: .proof}

## 依概率收敛和几乎必然收敛

### 依概率和几乎必然收敛的定义

设$(X\_n)$为一列实值离散随机变量，记$C$：
$$C = \{ \omega \in \Omega \; | \; \lim_{n \to \infty} X_n(\omega) = 0 \} = \{ \lim_{n \to \infty} X_n = 0 \}$$
则$C$是一个良定义的事件。
{: .proposition}

把极限写成ε-δ语言的形式：
$$\omega \in C \iff \forall k \ge 1, \; \exists n \ge 0, \; \forall p \ge n, \quad |X_p(\omega)| < \frac{1}{k}$$
注意到这里我们不使用$\varepsilon$，这是因为实数域是不可数的，这会为我们的证明带来困难。
我们使用实数的*阿基米德性质*来用一个自然数限制$|X\_p(\omega)|$。
从而：
$$C = \bigcap_{k \ge 1} \bigcup_{n \ge 0} \bigcap_{p \ge n} \{ \omega \in \Omega \;|\; |X_p(\omega)| < \frac{1}{k} \}$$
由于σ-代数关于可数个并和交封闭，因此$C$是一个事件。
{: .proof}

称一列离散随机变量$(X\_n)$**几乎必然收敛**（to converge almost surely）至零，若：
$$\mathbf P ( \lim_{n \to \infty} X_n = 0) = 1 $$
简记为：
$$X_n \xrightarrow{\text{a.s.}} 0$$
称其**依概率收敛**（to converge in probability）至零，若：
$$\forall \varepsilon > 0, \; \lim_{n \to \infty} \mathbf P(|X_n| > \varepsilon) = 0$$
简记为：
$$X_n \xrightarrow{\mathbf P} 0$$
{: .definition}

我们已经说明了$\\\{ \lim\_{n \to \infty} X\_n = 0 \\\}$是一个事件，因此这些概念都是良定义的。

### 两种收敛的关系

若一列离散随机变量几乎必然收敛至零，那么它依概率收敛至零。
{: .proposition}

该列变量几乎必然收敛至零，则：
$$\mathbf P (C) = 1 \iff \mathbf P(C^\complement) = 0$$
又：
$$C^\complement = \bigcup_{k = 1} \bigcap_{n > 0} \bigcup_{p \ge n} \{ |X_p| \ge \frac{1}{k} \}$$
从而
$$\mathbf P (\bigcap_{n > 0} \bigcup_{p \ge n} \{ |X_p| \ge \frac{1}{k} \}) = 0, \; \forall k \ge 1$$
不难注意到$(\cup\_{p \ge n} \\\{ \vert X\_p \vert \ge \frac{1}{k} \\\})\_n$是一列*单减*的事件，这是因为随着$n$增加，被并起来的集合越来越少，因此我们可以使用概率的单调连续性：
$$
\begin{aligned}
0 = \mathbf P (\bigcap_{n > 0} \bigcup_{p \ge n} \{ |X_p| \ge \frac{1}{k} \}) 
&= \lim_{n \to \infty} \mathbf P (\bigcup_{p \ge n} \{ |X_p| \ge \frac{1}{k} \}) \\
&\ge \lim_{n \to \infty} \mathbf P(|X_n| \ge \frac{1}{k}) = 0
\end{aligned}$$
从而：
$$\forall k \ge 1, \quad \lim_{n \to \infty} \mathbf P(|X_n| \ge \frac{1}{k}) = 0$$
现在，利用实数的阿基米德性质，取$k = \lfloor \frac{1}{\varepsilon} \rfloor$，即有：
$$\{ |X_n| \ge \varepsilon \} \subset \{ |X_n| \ge \frac{1}{k} \}$$
从而
$$\mathbf P(|X_n| \ge \varepsilon) \xrightarrow{n \to \infty} 0$$
{: .proof}

若一列离散随机变量满足
$$\forall \varepsilon > 0, \; \sum \mathbf P(|X_n| > \varepsilon) < \infty$$
则其几乎必然收敛至零。
{: .proposition}

这里给出一个证明的框架。
首先，由博雷尔-坎特利第一引理，可知，若
$$\forall \varepsilon > 0, \; \sum \mathbf P(|X_n| > \varepsilon) < \infty$$
则：
$$\forall \varepsilon > 0, \mathbf P (\limsup_{n \to \infty} \{ |X_n| > \varepsilon \}) = 0$$
即：
$$\forall \varepsilon > 0, \mathbf P (\bigcap_{n>0} \bigcup_{p \ge n} \{ |X_n| > \varepsilon \}) = 0$$
现在用$k$替换$\varepsilon$，可得：
$$\forall k \ge 1, \mathbf P (\bigcap_{n>0} \bigcup_{p \ge n} \{ |X_n| \ge \frac{1}{k} \}) = 0$$
从而：
$$\mathbf P(\bigcup_{k \ge 1} \bigcap_{n>0} \bigcup_{p \ge n} \{ |X_n| \ge \frac{1}{k} \}) \le \sum_{k = 1}^\infty \mathbf P (\bigcap_{n>0} \bigcup_{p \ge n} \{ |X_n| \ge \frac{1}{k} \}) = 0$$
取补集，即可得：
$$\mathbf P(\bigcap_{k \ge 1} \bigcup_{n>0} \bigcap_{p \ge n} \{ |X_n| < \frac{1}{k} \}) = 1$$
即$\mathbf P(C) = 1$。
{: .proof}

设$(\varepsilon\_n)\_{n \in \mathbb N}$为一列收敛至零的实数列，且一列离散随机变量$(X\_n)$满足：
$$\sum_{n \in \mathbb N} \mathbf P(|X_n| \ge \varepsilon_n) < \infty$$
那么$X\_n$几乎必然收敛至零。
{: .proposition}

这个命题意味着，若我们能够将$\vert X\_n \vert$限制地足够小，那么其就能几乎必然收敛至零。

## 强大数定律

### 强大数定律的特殊情况

我们首先证明一个比较容易的情况。

设$(X\_n)$为一列独立同分布的离散随机变量，且：
$$\exists K \ge 0, \; \forall n, \; \mathbf E X_n^4 \le K$$
设：
$$S_n = (X_1 + \cdots + X_n)$$
则$\frac{S\_n}{n} - \mathbf E X$几乎必然收敛至零。
{: .proposition}

首先，我们只研究期望为零的随机变量，设$X^\prime\_n = X\_n - \mathbf E X\_n$。
我们马上证明这个变量满足题设。
首先不难验证这一列变量也是独立同分布的，因为其只是为每个变量减去一个常数。
然后，我们验证其四次方有界：
$$
\begin{aligned}
\mathbf E(X_n^\prime)^4 &\le \mathbf E(|X_n| + | \mathbf E X_n|)^4 \\
&\le 2^4 \mathbf E \max (|X_n|, |\mathbf E X_n|)^4 \\
&\le 2^4 \mathbf E (X_n^4 + (\mathbf E X_n)^4) \\
&\le 2^4 (K^4 + (\mathbf E X)^4) \le K^\prime
\end{aligned}
$$
接下来我们只需要求出$S\_n$的上界即可。
$$\mathbf E(S_n^4) = \mathbf E ((X_1 + \cdots + X_n)^4) = \sum_{i,j,k,l} \mathbf E(X_i X_j X_k X_l)$$
设$i \not \in \\\{j,k,l\\\}$，那么由独立性，可知：
$$\mathbf E (X_i X_j X_k X_l) = \mathbf E X_i \mathbf E(X_j X_k X_l) = 0$$
从而这个乘法展开后只有两种情况：
$$\mathbf E(S_n^4) = \sum_{1\le i \le n} \mathbf E(X_i^4) + \binom{4}{2} \sum_{1 \le i < j \le n} \mathbf E(X_i^2 X_j^2)$$
利用琴生不等式（或方差非负）：
$$E(X_i^4) \ge (\mathbf E (X_i^2))^2 \implies \mathbf E(X_i^2) \le \sqrt{\mathbf E(X_i^4)} \le \sqrt{K}$$
从而：
$$ \mathbf E(X_i^2 X_j^2) \le K$$
原等式可放缩为：
$$\mathbf E(S_n^4) \le n K + 3 n(n-1) K \le 3 n^2 K$$
利用马尔可夫不等式：
$$\mathbf P(|\frac{S_n}{n}| \ge \varepsilon) = \mathbf P (|\frac{S_n}{n}|^4 \ge \varepsilon^4) \le \frac{\mathbf E(\frac{S_n}{n})^4}{\varepsilon^4} \le \frac{3K}{n^2 \varepsilon^4}$$
从而$\sum \mathbf P(|\frac{S_n}{n}| \ge \varepsilon) < +\infty$，因此其几乎一定收敛至零。
{: .proof}

### 强大数定律

（强大数定律）设$(X\_n)$为一列*两两独立*的同分布离散随机变量，且具有二阶矩，那么
$$\frac{S_n}{n} - \mathbf E X \xrightarrow{\text{a.s.}} 0$$
{: .theorem}

和弱大数定律一样，强大数定律并不要求具有二阶矩，这里加入这个条件只是为了降低证明难度。
{: .remark}

我们知道，一个实值函数可以写成其正部分和负部分之和：
$$X_n = X_n^+ - X_n^-, \; |X_n| = X_n^+ + X_n^-$$
注意到$X\_n^+$和$X\_n^-$都是满足题设的正随机变量，我们可以只对正随机变量证明这个命题，因此我们设$X\_n \ge 0$。
设$\varepsilon > 0$，构造函数：
$$\varphi(n) = \lfloor (1+\varepsilon)^n \rfloor + 1$$
满足：
$$(1+\varepsilon)^n \le \varphi(n) \le (1+\varepsilon)^n + 1$$
利用切比雪夫不等式：
$$
\begin{aligned}
\mathbf P \left( \left|\frac{S_{\varphi(n)}}{\varphi(n)} - \mathbf E X_1 \right| \ge \frac{1}{(1+\varepsilon)^\frac{n}{4}} \right) 
&\le \mathbf V \left(\frac{S_{\varphi(n)}}{\varphi(n)}\right) (1+\varepsilon)^{n/2} \\
&= \mathbf V(S_{\varphi(n)}) \frac{(1+\varepsilon)^{n/2}}{\varphi^2(n)} \\
&= \sum_{i=1}^{\varphi(n)} \mathbf V(X_i) \frac{(1+\varepsilon)^{n/2}}{\varphi^2(n)} \\
&= \mathbf V(X_1) \frac{(1+\varepsilon)^{n/2}}{\varphi(n)} \\
&\le \mathbf V(X_1) (1+\varepsilon)^{-n/2}
\end{aligned}
$$
从而：
$$\sum \mathbf P \left( \left|\frac{S_{\varphi(n)}}{\varphi(n)} - \mathbf E X_1 \right| \ge \frac{1}{(1+\varepsilon)^\frac{n}{4}} \right) \le +\infty$$
从而：
$$\frac{S_{\varphi(n)}}{\varphi(n)} - \mathbf E X_1 \xrightarrow{\text{a.s.}} 0$$
现在，我们注意到$\forall k \in [\varphi(n), \varphi(n+1)]$，都有：
$$\frac{S_\varphi(n)}{\varphi(n+1)} \le \frac{S_k}{k} \le \frac{S_\varphi(n+1)}{\varphi(n)}$$
简单的变换之后，我们可以用$\frac{S\_\varphi(n)}{\varphi(n)}$和$\frac{S\_\varphi(n+1)}{\varphi(n+1)}$限制$\frac{S\_k}{k}$，从而使其也满足这个不等式，因此也几乎必然收敛。
这就完成了对原命题的证明。
{: .proof}
