---
title: "非线性系统——第二部分"
categories: ["控制理论"]
---

本文主要考虑非线性系统的控制问题，即，对于局部李普希茨连续的系统：
$$\dot x = f(x, u), \, f(0,0) = 0, \, f: \mathbb R^n \times \mathbb R^m \to \mathbb R^n,$$
是否存在控制律$u = \gamma(x)$，使得系统的原点是闭环系统$f(x, \gamma(x))$的全局渐进稳定平衡点？

## 控制李雅普诺夫函数方法

通过将李雅普诺夫函数扩展到含有输入的空间上，我们可使用控制李雅普诺夫函数来证明被控系统的稳定性。

对系统$\dot x = f(x, u)$，若存在正定、径向无界的$C^1$函数$V:\mathbb R^n \to \mathbb R$，满足
$$\inf_{u \in \mathbb R^m} [\nabla V^\top \cdot f(x,u)] \le 0, \forall x \neq 0,$$
那么称该函数为系统的*控制李雅普诺夫函数*（Control Lyapunov Function，CLF）。
{: .definition}

这个定义是说，对任何非均衡状态$x$，均可以施加控制量$u$来使系统渐进稳定。

对于仿射控制（Control-affine）系统
$$\dot x = f(x) + g(x)u, \, f(0) = 0, u \in \mathbb R$$
等价的定义是满足：
$$\forall x \neq 0, L_g V(x) = 0 \implies L_f V(x) < 0,$$
或者
$$\forall x \neq 0, \exists u \in \mathbb R, \text{ s.t. } L_fV(x) + L_g V(x) \cdot u < 0,$$
或者
$$\forall x \neq 0, \inf_{u \in \mathbb R} [L_f V(x) + L_g V(x) \cdot u] < 0,$$
的正定、径向无界的$C^1$函数。
这里$L\_f, L\_g$是指李导数，即
$$L_f V(x) = \nabla V^\top f(x).$$

这三个定义是等价的，并为我们提供了寻找控制李雅普诺夫函数的一些思路：对系统的一个候选李雅普诺夫函数，若能够造出一个输入$u$使得其能满足
$$L_fV(x) + L_g V(x) \cdot u < 0,$$
那么这就是一个控制李雅普诺夫函数。
若已经有了闭环状态方程，计算这个式子时就不再需要分别求导再代入了，只需要按照定义将$\dot x$替换为闭环方程中的形式即可。

### 控制李氏函数的性质

控制李雅普诺夫函数有一个关键性质：

对系统
$$\dot x = f(x) + g(x)u, \, f(0) = 0,$$
存在反馈控制律$u = \gamma(x)$，其中$\gamma$是在零点意外连续的函数，使得闭环系统
$$\dot x = f(x) + g(x) \gamma(x) = f(x, \gamma(x))$$
的原点是全局渐进稳定的平衡点，当且仅当该系统的控制李雅普诺夫函数存在。
{: .theorem}

寻找控制李雅普诺夫函数可能非常复杂，但对于命题中这种特殊的仿射控制系统，只要找到控制李雅普诺夫函数，就能构造出控制率。
我们之后会介绍通过控制李雅普诺夫函数寻找反馈控制律的桑塔格方法。

并非所有控制李雅普诺夫函数都能给出理想的控制方法。
我们希望该函数具有小控制量性质，即无论控制量多小，都能找到一些能够被小控制量控制到渐近稳定至零点的状态。

若控制李雅普诺夫函数满足：
$$
\begin{multline}
\forall \epsilon > 0, \exists \delta > 0, \quad 0 < \Vert x \Vert < \delta \implies \\ 
\exists u, \Vert u \Vert < \epsilon, \text{ s.t. } L_f V(x) + L_g V(x) u < 0.
\end{multline}
$$
则称该函数满足*小控制量性质*（Small control property, SCP）。
{: .definition}

对仿射控制系统，以下命题可用来检验小控制量性质。

对仿射控制系统，控制李雅普诺夫函数满足小控制量性质，当且仅当
$$\limsup_{\Vert x \Vert \to 0} \frac{L_f V(x)}{\vert L_g V(x)\vert} \le 0.$$
{: .proposition}

### 桑塔格定理

只要知道系统的控制李雅普诺夫函数，就可以利用桑塔格定理给出一个控制律：

<small>（Sontag）</small>对形如
$$\dot x = f(x) + g(x) u$$
的系统，若知道其控制李雅普诺夫函数，则可使用以下控制律：
$$
\gamma(x) = \begin{dcases}- \frac{L_f V(x) + \sqrt{[L_f V(x)]^2 + [L_g V(x)]^4}}{L_g V(x)}, & L_g(V) \neq 0 \\
0, &L_g(V) = 0
\end{dcases},
$$
来将原点控制为全局渐近稳定的平衡点。
该控制律在除零以外的区域至少与$L\_fV, L\_gV$一样光滑；
若$V$还满足小控制量性质，那么该函数在零点处也连续。
{: .theorem}

被控系统的李雅普诺夫函数的导数为
$$\dot V = L_f V + L_g V \gamma = - \sqrt{[L_f V(x)]^2 + [L_g V(x)]^4} \le 0.$$

这个控制律有许多优良的性质，除了较为复杂之外，当状态趋于无穷时，如果系统本身就有趋于稳定的特性，该控制律影响下的系统不会浪费额外的控制量来使系统稳定。

然而，寻找控制李雅普诺夫函数是比较困难的。
为此，我们可以寻找局部控制李雅普诺夫函数，即先将系统线性化再寻找控制律：
1. 首先将系统线性化，并为线性化后的系统寻找一个稳定控制律。
   - 由于该系统是线性的，寻找控制律比较简单，可使用极点配置法等方法。
2. 给出闭环的线性化系统的一个李雅普诺夫函数。
   - 这个李雅普诺夫函数就是一个局部控制李雅普诺夫函数。
3. 利用桑塔格定理设计一个控制律来替换线性控制律。

## 反馈线性化方法

若系统是非线性的，一个简单的思路就是将系统转化为线性系统，然后使用线性系统的控制方法进行控制。
有些时候，可以通过设计系统的控制律来消去系统中的非线性部分，这种控制方法称作反馈线性化方法。

对于具有仿射控制SISO系统，即具有以下形式的SISO系统：
$$\dot x = f(x) + g(x) u, \; y = h(x),$$
其中$f, g, h$都是足够光滑的映射；
若存在一双射$T: X \to \mathbb R^n$，
满足
$$T, T^{-1} \in C^1, \; 0 \in T(X),$$
且应用在系统上后（$z = T(x)$）满足
$$\dot z = A z + Bq(x)(u - \alpha(x)),$$
其中$A,B$是两个矩阵且$(A,B)$能控，$q(x) \neq 0$，即该换元能够将系统变为能控的线性时不变系统，那么这个系统是*可反馈线性化的*（Feedback linearizable）。
{: .definition}

注意像这种原函数和反函数均可微的双射也叫[微分同胚]({% post_url mathematics/2022-12-14-local-extrema %}#微分同胚)。

若一个系统是能反馈线性化的，那么直接使用控制律
$$u = \alpha + \frac{v}{q(x)},$$
该系统的状态方程就变为
$$\dot z = Az + Bv,$$
从而可以利用线性系统的方法设计控制器。

### 输入输出线性化

寻找微分同胚$T$是比较困难的，不过我们有一些近似方法可以取得较好的结果。

对于具有仿射控制SISO系统，若存在一自然数$r$，使得
$$L_g L_f^{r-1} h(x) \neq 0, \text{ 且 } L_g L_f^{i-1} h(x) = 0, \; \forall i \in [\![ 1, r-1 ]\!],$$
那么称该系统是*可输入输出线性化*的，自然数$r$称为该系统的*相对度*（Relative degree）。
{: .definition}

回忆$L\_f$是指李导数，在这里就是先将$h(x)$对时间求导，然后用$\dot x = f(x)$替换式子中所有$\dot x\_i$项。
相对度其实描绘了输入对输出的影响：只有在输出的第$r$阶导数处，输入$u$才显式地出现。
确定相对度的简单方法就是不断地对时间求导并将$\dot x$替换为
$$\dot x = f(x) + g(x) u,$$
直到$u$出现。

这个系统是可输入输出线性化的，因为只要选择输入为
$$u = \frac{v - L_f^r h(x)}{L_g L_f^{r-1} h(x)},$$
那么输出就变为纯积分器，其状态变量就是输出的各阶积分，从而其$r$阶导数一定为$v$：
$$y^{(r)} = v,$$
因此可定为系统的输出。
如果我们希望控制$u$来跟踪$v$，则可代入$u$的表达式，得到：
$$v = y^{(r)} = -q(x) \alpha(x) + q(x) u.$$
这个式子可用来在完成线性控制器设计后从$v$得到$u$的表达式，也可在其上施加变换来操作追踪点。
例如，若我们希望追踪$y\_\text{ref}$，那么可进行替换
$$v = e^{(r)} = y^{(r)} - y_\text{ref}^{(r)} = -q(x) \alpha(x) + q(x) u - y_\text{ref}^{(r)},$$
并将$e$及其各阶导数定为状态变量，这样将系统变换后，如果系统渐进稳定至原点，那么误差就趋于零。

### 部分线性化

利用相对度，我们可以实现系统的部分线性化。

若SISO系统
$$\dot x = f(x) + g(x) u, \; y = h(x),$$
在状态空间的一个开子集$X \subset \mathbb R^n$上具有相对度$r \le n$，那么对$X$上所有点$x$，其邻域中存在一微分同胚$T$，定义为
$$T: x \mapsto \begin{bmatrix} \eta(x) \\ \xi(x) \end{bmatrix} = \begin{bmatrix} \eta_1(x) \\ \vdots \\ \eta_{n-r}(x) \\ \xi_{1}(x) \\ \vdots \\ \xi_{r}(x) \end{bmatrix},$$
满足
$$\eta_i(0) = 0; \; L_g \eta_i(x) = 0, \; \forall x;$$
且
$$\xi_i = L_f^{i-1} h(x).$$
{: .theorem}

计算$\xi$比较简单，但确定$\eta$可能较为复杂，一般来说，对$\eta\_i$，需要找到或猜测一个满足
$$\nabla \eta_i^\top \cdot g(x) = 0$$
的函数，然后确认$T$的确是微分同胚。
通常情况下这些函数都是多项式函数，因此不必确认函数的光滑性，只需要保证这个映射是双射即可。

在这个换元下，该系统变为
$$
\begin{aligned}
    \dot \eta &= f_0(\eta, \xi) \\ 
    &= \left(J \eta(x)\right) \cdot f(x) \Big|_{x = T^{-1}(z)} \\
    \dot \xi &= \hat f(\eta, \xi) + \hat g(\eta, \xi) u\\
    &= A_c \xi + B_c \left( L_g L_f^{r-1} h(x) \right) \left(u + \frac{L_f^r h(x)}{L_g L_f^{r-1} h(x)} \right) \\
    y &= C_c \xi,
\end{aligned}
$$
这是该系统的正则形（Normal form），$J\eta$是雅可比矩阵：
$$
J\eta = \begin{pmatrix}
\frac{\partial \eta_1}{\partial x_1} & \cdots & \frac{\partial \eta_1}{\partial x_n} \\
\vdots & \ddots & \vdots \\
\frac{\partial \eta_{n-r}}{\partial x_1} & \cdots & \frac{\partial \eta_{n-r}}{\partial x_n}
\end{pmatrix},
$$
而$A\_c, B\_c$和积分器相同：
$$
A_c = \begin{pmatrix}
0 & 1 & 0 & \cdots & 0 \\
0 & 0 & 1 & \cdots & 0 \\
\vdots & \vdots & \ddots & \ddots & \vdots \\
0 & 0 & 0 & \cdots & 1 \\
0 & 0 & 0 & \cdots & 0
\end{pmatrix},
B_c = C_c = \begin{pmatrix}
0 \\ 0 \\ \vdots \\ 0 \\ 1
\end{pmatrix}.
$$
对应上文的线性化定义，这就是说
$$
q(x) = L_g L_f^{r-1} h(x), \; \alpha(x) = - \frac{L_f^r h(x)}{L_g L_f^{r-1} h(x)}.
$$
计算这些式子看似吓人但实则并不复杂。
若已经求出了相对度，那么$L\_f^{r-1} h(x)$应该已经算出了，
只需要对其求导然后分别代入
$$\dot x = f(x), \dot x = g(x),$$
即可。

为了计算系统最终的状态方程，即$\dot \eta$和$\dot \xi$满足的方程，可使用两种方法，其一可以直接计算上文提到的矩阵，其二可以计算$T$的逆映射，然后直接对$\eta$和$\xi$求导，将$\dot x$替换为$f(x) + g(x) u$，然后最后逆映射将所有$x\_i$替换为$\eta$和$\xi$。

#### 零动态系统

这个系统的子系统
$$\dot \eta = f_0 (\eta, 0)$$
称为零动态系统（Zero dynamics）。
若零动态系统在某个定义域内具有渐近稳定点，那么这个系统就是最小相（Minimum phase）系统。
显然零动态系统意味着$\xi = 0$，从而
$$y = h(x) = L_f h(x) = \cdots = L_f^r h(x) = 0,$$
即使用控制律
$$u = \alpha(x) = -\frac{L_f^r h(x)}{L_g L_f^{r-1} h(x)}.$$
因此，要在原坐标系下研究零动态系统，我们并不需要求解整个正则形，而只需要将系统的轨迹限制在
$$M = \{ x \in X : h(x) = L_f h(x) = \cdots = L_f^{r-1} h(x) = 0 \}$$
上即可，因此零动态系统的状态方程为
$$\dot x = f(x) + g(x) \alpha(x),\; x \in M.$$

零动态系统的$\xi$为零，这意味着线性化系统的一部分状态变量为零，而这一部分状态变量实际上是输出的各阶积分。
如果系统被控制为跟踪某个目标，那么这些状态变量一般是误差及其各阶导数。
如果系统是最小相的，这意味着误差能够渐进稳定到某一点，因此在这种跟踪控制下才能取得渐进稳定。

## 反步法

在非线性系统中，有一类特别的系统，称作严格反馈系统，利用反步法可比较简单地为这类系统设计一个控制器。

若系统的状态方程具有以下形式：
$$
\begin{array}{ccccc}
\dot x & = & f(x) &+& g(x) \xi_1 \\
\dot \xi_1 &=& f_1(x, \xi_1) &+& g_1(x, \xi_1) \xi_2 \\
& \vdots \\
\dot \xi_n &=& f_n(x, \xi_1, \dots, \xi_{n}) &+& g_n(x, \xi_1, \dots, \xi_{n}) u,
\end{array}
$$
即状态变量按相互依赖构成的拓扑序排序，$f\_i$在非零处取值不为零，且$g\_i \neq 0$，那么称该系统是*严格反馈系统*（Strict feedback system）。
{: .definition}

既然状态变量已按照拓扑序排序，那么自然的思路就是逐个让其稳定，这正是反步法的思路。

### 双状态变量的反步法

我们首先考虑最简单的可应用反步法的系统：
$$\dot x = f(x) + g(x) \xi, \; \dot \xi = u.$$
若需使用反步法，首先我们要将$\xi$视作控制变量，并研究子系统
$$\dot x = f(x) + g(x) \xi.$$
这个系统一般来说比较简单。
假设我们已经找到了一个控制律$\xi = \gamma(x)$使得该系统渐进稳定，并且还找到了一个更严格的控制李雅普诺夫函数$V\_0$，满足
$$L_f V_0 (x) + (L_g V_0(x)) \cdot \gamma(x) \le -W(x),$$
其中$W$是一个正定的函数，那么直接进行换元：
$$z = \xi - \gamma(x),$$
得到状态方程
$$\dot x = f(x) + g(x) \gamma(x) + g(x) z,\; \dot z = u - \dot \gamma = v.$$
这个状态方程给出的系统一定是渐进稳定的，因为考虑候选控制李雅普诺夫函数：
$$V_1(x,z) = V_0(x) + \frac{z^2}{2},$$
这个函数显然是正定的，其导数为
$$
\begin{aligned}
\dot V_1 &= L_f V_0 + L_g V \gamma + L_g V z + zv \\
& \le -W(x) + z(L_g V_0 + v).
\end{aligned}
$$
现在选择控制律
$$v(x) = - L_g V_0(x) - cz, \; c > 0,$$
即可使其导数负定，这样该函数就形成了原系统的一个控制李雅普诺夫函数，从而原系统渐进稳定至原点。
完整的控制律为
$$
\begin{aligned}
u 
& = v + \dot \gamma \\ 
& = \dot \gamma - L_g V_0(x) - cz. \\
& = \nabla \gamma^\top (f(x) + g(x) \xi) - L_g V_0(x) - c(\xi - \gamma(x)).
\end{aligned}
$$

若$W$不是正定的，而是半正定的，那么仍可能可以利用拉萨尔不变集原理说明被控制系统能够渐进稳定至原点。

### 一般的反步法

对严格反馈系统
$$
\begin{array}{ccccc}
\dot x & = & f_0(x) &+& g_0(x) \xi_1 \\
\dot \xi_1 &=& f_1(x, \xi_1) &+& g_1(x, \xi_1) \xi_2 \\
& \vdots \\
\dot \xi_n &=& f_n(x, \xi_1, \dots, \xi_{n}) &+& g_n(x, \xi_1, \dots, \xi_{n}) u,
\end{array}
$$
可使用迭代的方法构造控制器。

假设我们已经通过某些方法为$\dot \xi\_1$构造了控制律$\gamma\_0$，那么我们可按照反步法构造一个候选控制李雅普诺夫函数：
$$V_1 (x,\xi_1) = V_0(x) + \frac{1}{2} (\gamma_0 - \xi_1)^2,$$
并寻找使该函数的导数负定的$\xi\_2$，从而得到$\xi\_2$的控制律$\gamma\_1$：
$$
\begin{multline}
\xi_2 = \frac{1}{g_1(x, \xi_1)} \Big[ \nabla_x \gamma_0(x)^\top \big(f_0(x) + g_0(x) \xi_1\big) \\ -
\nabla_x V_0(x)^\top g_0(x) - c_1 (\xi_1 - \gamma_0(x)) - f_1(x, \xi_1) \Big], \quad c_1 > 0.
\end{multline}
$$

得出控制律$\gamma\_1$后，则可进一步迭代，令
$$V_2(x, \xi_1, \xi_2) = V_1(x, \xi_1) + \frac{1}{2}(\xi_2 - \gamma(x, \xi_1))^2,$$
然后重复直到得出$u$的控制律。

## 滑动模式控制法

滑动模式是一类特别的非线性控制方法。
在这种方法中，我们首先选择状态空间的一个子空间，称为*滑动流形*（Sliding manifold）。
对于状态空间中的任何一个状态，滑动模式控制器首先让其在*有限时间内*收敛至滑动流形上，然后再在滑动流形上施加控制使其收敛至原点。

设计滑模控制器的一个问题在于如何使状态在有限时间内收敛至流形上。
我们知道，任何李普希茨连续的系统，收敛的速度不能快于指数收敛，因此滑模控制器必然带来控制系统的不连续性。

为验证一个系统能否有限时间内收敛，我们可以使用以下命题：

考虑系统
$$\dot x = f(t, x), \; f(t,0) = 0, \; x \in \mathbb R^n,$$
若有一正定径向无界的李雅普诺夫函数$V \in C^1$，且存在两常量$k > 0$、$\alpha \in (0,1)$，使得对所有时间与状态均有
$$\dot V(x) = \nabla V(x)^\top f(t,x) \le -k V(x)^\alpha,$$
那么系统的所有轨迹在有限时间内收敛至原点。
{: .proposition}

### 滑动模式控制器设计

滑模控制器的设计遵守一套比较固定的程序。
假设系统可表示为：
$$\dot \eta = f_a(x), \quad \dot \xi = f_b(x) + G(x) u + \delta(x),$$
其中$x = (\eta, \xi)$是整个状态变量，而$G$和$\delta$是某两个未知的参量，其中$G$是对角矩阵且对角线上第$i$项记为$g_i(x)$、$\delta$是一个矢量场。
我们还要求该系统该系统在零点处是一个平衡点，即$f\_a(0) = f\_b(0) = 0$；还要去对角矩阵$G$中每一项均大于零。

滑模控制器设计可按以下步骤设计：
1. 确定滑动流形：
   1. 寻找控制律$\xi = \gamma(\eta) \in C^1$使$\eta$的动力学渐进稳定，即要求$\gamma(0) = 0$，且闭环子系统$\dot \eta = f\_a(\eta, \gamma(\eta))$渐进收敛至原点；
   2. 选择滑动流形
   $$S = \{ x = (\eta, \xi) : \sigma(x) = \xi - \gamma(\eta) = 0 \}。$$
2. 确定滑动流形外的基本控制律：
   1. 计算候选控制李雅普诺夫函数：
   $$V_i = \frac{1}{2}\sigma_i^2, \quad \dot V_i = \sigma_i \big(a_i + \delta_i(x) + g_i(x) u_i \big), $$
   其中
   $$a_i = [f_b(x) - J\gamma(\eta) \cdot f_a(x)]_i$$
   2. 选择控制律
   $$u_i = - \frac{a_i}{\hat g_i(x)} + v_i,$$
   其中$\hat g\_i(x)$是对$g\_i(x)$的估计。
   此时候选控制李雅普诺夫函数为
   $$\dot V_i = \sigma_i [\Delta_i (x) + g_i(x) v_i], \Delta_i = \left( 1 - \frac{g_i(x)}{\hat g_i(x)} \right)\alpha_i(x) + \delta_i(x),$$
3. 确定离散项$v\_i$:
   1. 选择向量场$\rho$，使其满足
   $$ \left\vert \frac{\Delta_i(x)}{g_i(x)} \right\vert \le \rho_i(x).$$
   2. 构造$v\_i$
   $$v_i = -\beta_i(x) \mathrm{sgn}(\delta_i),$$
   其中$\beta\_i$是一个满足
   $$\beta_i(x) \ge \rho_i(x) + \beta_0,\quad \beta_0 > 0$$
   的函数。
   3. 计算控制李雅普诺夫函数：
   $$\dot V_i = \sigma_i(x) [\Delta_i(x) + g_i(x) v_i] \le g_0 \beta_0 \sqrt{2 V_i},$$
   从而状态有限时间内收敛至滑动流形。
4. 给出最终的控制律：
   $$u_i = \frac{1}{\hat g_i(x)} a_i(x) - \beta_i(x) \mathrm{sgn}(\sigma_i(x)).$$