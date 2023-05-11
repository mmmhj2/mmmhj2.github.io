---
title: "闭环系统的阻尼与响应速度"
categories: "控制理论"
---

本章中我们将介绍由闭环系统的开环传递函数确定系统的阻尼等的方法。

## 确定系统的阻尼

如果我们知道整个系统的时域或频域响应，那么就可以直接从阶跃响应或波德图中看出系统的阻尼。
然而，对于复杂的系统，无论是开环还是闭环系统，求解整个系统的传递函数都是不现实的，因此这种方法并不能取得很好的效果。

相对地，对于闭环控制系统，其反馈环通常是人为设计的，因此可以容易地知道其开环传递函数。
为此，我们希望研究如何从开环传递函数取得整个系统的阻尼。

### 闭环系统的转化

我们继续考虑最一般的闭环控制系统：

![](/assets/system/block-diagram-precision.svg)
{: .align-center}

这个系统包含所有环节，但是其传递函数是：
$$
H(p) = A(p) \frac{C(p) G_1(p) G_2(p)}{1 + H_{BO}(p)} \neq \frac{H_{BO}(p)}{1 + H_{BO}(p)}
$$
这种形式上的不一致会给我们的研究带来很多困难，因此我们将系统转化为：

![](/assets/system/block-diagram-damping.svg)
{: .align-center}

对于几乎所有现实可行的系统，$A$和$\frac{1}{R}$都不可能影响阻尼。
实际上，$A$几乎总是常数，而$R$表示传感器，通常是一个常数和一个低通滤波器的结合，这些组分都不可能产生阻尼。
因此，我们只需要研究反馈环中的系统，这个系统的传递函数为：
$$
H^\prime = \frac{H_{BO}(p)}{1 + H_{BO}(p)}
$$

### 等增益与等相位线

现在我们知道原传递函数和闭环传递函数满足$H = \frac{Z}{Z + 1}$的关系，就可以在*开环传递函数*的尼柯尔斯图上画出两族曲线：

1. 等增益线（或等模长线）：$\left\| \frac{Z}{Z+1} \right\|$相等的曲线；
2. 等相位线：$\arg \frac{Z}{Z+1}$相等的曲线。

在这两族曲线的帮助下，我们就可以借用开环传递函数的尼柯尔斯图来研究整个系统。
这两组曲线的图像如下：

![](/assets/system/black-nichols.svg)
{: .full}

不难发现，等相位线总是从临界点出发，而等增益线总是围绕临界点。

### 奈奎斯特图上的等增益与等相位线

我们希望在**开环传递函数**的奈奎斯特图上画出闭环传递函数的等增益线与等相位线。
我们设：$H\_{BO} = \sigma + j \omega = Z$。

#### 等增益线

已知：$H\_{BF} = \frac{Z}{1 + Z}$，令$\| H\_{BF} \| = m$可得：
$$
\begin{aligned}
    [(\sigma + 1)^2 + \omega^2] m^2 - (\sigma^2 + \omega^2) &= 0 \\
    (m^2-1)\sigma^2 + 2m^2\sigma + (m^2-1)\omega^2 + m^2 &= 0
\end{aligned}
$$

设$m \neq 1$，可得：
$$
\begin{aligned}
    \sigma^2 + \frac{2m^2}{m^2-1}\sigma + \omega^2 + \frac{m^2}{m^2-1} &= 0 \\
    (\sigma + \frac{m^2}{m^2-1})^2 + \omega^2 &= \frac{m^2}{(m^2-1)^2}
\end{aligned}
$$
这说明其为圆心在$(-\frac{m^2}{m^2-1}, 0)$，半径为$\frac{m^2}{\| m^2-1 \|}$的一个圆。

若$m = 1$，那么有$2 \sigma + 1 = 0$，从而其为一根垂直的直线。

#### 等相位线

已知：
$$
\theta = \arg [\frac{Z}{1+Z}] = \arctan \frac{\omega}{\sigma} - \arctan\frac{\omega}{\sigma+1}
$$
从而有：
$$
\Theta = \tan \theta = \frac{\omega}{\sigma^2 + \sigma + \omega^2} 
\iff
(\sigma^2 + \sigma + \omega^2) \Theta = \omega
$$

设$\Theta \neq 0$并化简，可得：
$$
\left( \sigma + \frac{1}{2} \right)^2 + \left( \omega - \frac{1}{2\Theta} \right)^2 = \frac{1}{4} \frac{\Theta^2 + 1}{\Theta^2}
$$
从而其为圆心在$(-\frac{1}{2}, \frac{1}{2\Theta})$，半径为$\frac{1}{2} \sqrt{\frac{\Theta^2+1}{\Theta}}$的圆。

不难注意到这些圆的圆心总在$m=1$这条等增益线上，且圆总是经过原点和临界点$(-1,0)$。

若$\Theta = 0$，那么$\theta = -2\pi, -\pi, 0$。
从而$\omega = 0$，与X轴重合。

#### 综合

综合上文的讨论，可得图像：

![](/assets/system/nyquist-isogain-isophase.svg)
{: .align-center}

其中红色的为等相位线，蓝色的为等增益线。

### 倒奈奎斯特图上的等增益与等相位线

接下来我们研究*倒奈奎斯特图*，即$\frac{1}{H_{BO}}$的图像上的等增益与等相位线。
在接下来的讨论中，我们很快就能发现选择这个特殊图像的好处。

我们设：
$$
H_{BF} = \frac{H_{BO}}{1 + H_{BO}} = m \exp [j \theta]
$$
从而只需要固定$m$或$\theta$就可以画出这些曲线。

现在，取倒数，可得：
$$
\frac{1}{H_{BF}} = \frac{1}{H_{BO}} + 1 = \frac{1}{H_{BO}} - (-1) = \frac{1}{m} \exp [- j \theta]
$$

若我们固定$m$，可发现等相位线的方程：
$$
\Gamma (\theta) = \frac{1}{H_{BO}} - (-1) = \frac{1}{m} \exp[-j\theta]
$$
从而这表明倒奈奎斯特图上的等增益线是圆心在$(-1,0)$处、半径为$\frac{1}{m}$的圆。

同理，若固定$\theta$，不难发现等相位线是经过$(-1,0)$，与X轴成$-\theta$夹角的射线。

### 尼柯尔斯图上的等增益与等相位线

我们针对倒奈奎斯特图上的等增益与等相位线的研究给出了非常简单的几何形式，现在我们希望把这些结果转化到尼柯尔斯图上。
最后可以得出本章开头所得出的图像。

我们知道尼柯尔斯图是函数的增益与相角之间的关系，因此我们希望在固定闭环传递函数的增益$m$或辐角$\theta$的情况下求出开环传递函数的增益与相角之间满足的方程。

#### 等增益线与等相位线的方程

首先考虑等增益线的方程，在倒奈奎斯特图中，我们设$\frac{1}{H\_{BO}(j\omega)} = r \exp [j \lambda]$
从而有：
$$
\begin{cases}
    \sigma = r \cos \lambda \\
    \omega = r \sin \lambda
\end{cases}
$$
考虑等增益线的方程，注意闭环传递函数的增益是由$m$决定的，因此$m$为常量：
$$
\begin{aligned}
    (\sigma + 1)^2 + \omega^2 &= \frac{1}{m^2} \\
    (r \cos \lambda + 1)^2 + r^2 \sin^2 \lambda &= \frac{1}{m^2} \\
    m^2 r^2 + 2m^2 \cos \lambda r + m^2 - 1 &= 0
\end{aligned}
$$

这是一个关于$r$的二次方程，其判别式为：
$$
\Delta = 4m^4 \cos^2 \lambda - 4 m^2 (m^2 - 1)
$$
由于$r$是非负实数，我们要求判别式非负，求解可得：
$$
r = - \cos \lambda \pm \sqrt{\cos^2 \lambda - \frac{m^2 - 1}{m^2}}
$$

现在我们回到正常的开环传递函数上去，取：
$$
\begin{cases}
    \rho = \frac{1}{r} \\
    \varphi = - \lambda
\end{cases}
$$
则有$H\_{BO} = \rho \exp [j\varphi]$。
从而：
$$
\begin{aligned}
    G_{dB-BO} (\varphi) &= 20 \lg \rho = - 20 \lg r \\
    &= -20 \lg \left( - \cos \varphi \pm \sqrt{\cos^2 \varphi - \frac{m^2-1}{m^2}} \right) \\
    &= 20 \lg \frac{m^2 \cos \varphi \pm m \sqrt{1-m^2\sin^2\varphi}}{1-m^2}
\end{aligned}
$$

同理，对等相位线，我们的方程为：
$$
\tan \theta + r \cos \lambda \tan \theta + r \sin \lambda = 0
\iff
r = - \frac{\tan \theta}{\cos \lambda \tan \theta + \sin \lambda}
$$
再取：
$$
\begin{cases}
    \rho = \frac{1}{r} \\
    \varphi = - \lambda
\end{cases}
$$
可得：
$$
 G_{dB-BO} (\varphi) = 20 \lg \left( \frac{\sin \varphi}{\tan \theta} - \cos \varphi \right)
$$

#### 绘制等增益线

首先我们要求上文所述的二次函数的判别式非负，从而有：
$$
\begin{array}{c}
    \Delta = 4m^4 \cos^2 \lambda - 4 m^2 (m^2 - 1) = 4m^2(1-m^2\sin^2\lambda) \ge 0 \\
    \implies - \frac{1}{m} \le \sin \varphi \le \frac{1}{m} 
\end{array}
$$

现在我们分三种情况进行讨论。

---

首先考虑$0 < m < 1$，即$G < 0$。此时由于$\frac{1}{m} > 1$，判别式恒非负，$\varphi$可任取。
考虑复数的约定，我们把研究范围限制在$[-2\pi, 0]$上。

由于要求$\rho > 0$，且不难发现存在$\varphi$使
$$m^2 \cos \varphi - m \sqrt{1-m^2\sin^2\varphi} < 0$$
因此我们要求正负号只取正，不取负。

从而最终结果为：
$$
\begin{aligned}
    &\forall m \in (0,1), \forall \varphi \in [-2\pi, 0], \\
    &\quad G_{dB-BO}(\varphi) = 20 \lg \frac{m^2 \cos \varphi + m \sqrt{1 - m^2 \sin^2 \varphi}}{1-m^2}
\end{aligned}
$$

---

若$m = 1$，那么方程变为：
$$r^2 + 2\cos\lambda r = 0 \iff r = -2 \cos \lambda \iff \rho = - \frac{1}{2\cos\varphi}$$

注意到$\rho \ge 0$，可得$\cos \varphi < 0$，从而$\varphi \in (-\frac{3\pi}{2}, -\frac{\pi}{2})$。
始终注意我们的研究范围限制在$[-2\pi, 0]$上。

从而结果为：
$$
\begin{aligned}
    & m = 1, \forall \varphi \in (-\frac{3\pi}{2}, -\frac{\pi}{2}), \\
    &\quad G_{dB-BO}(\varphi) = 20 \lg \left( -\frac{1}{2\cos\varphi} \right)
\end{aligned}
$$

---

现在考虑$m > 1$，我们必须仔细考察判别式非负这一条件，即$- \frac{1}{m} \le \sin \varphi \le \frac{1}{m}$。

我们设$\alpha \in [-2\pi, 0]$，满足：
$$
\begin{cases}
    \sin \alpha = -\frac{1}{m} \\
    \cos \alpha > 0
\end{cases}
$$
不难发现这个角在第四象限。
为满足判别式非负，$\varphi$ 只可能在四个区域上：
$$
\begin{aligned}
    \varphi &\in [-2\pi, -2\pi - \alpha] &(\text{第四象限}) \\
    &\cup [-\pi+\alpha, -\pi] &(\text{第三象限}) \\
    &\cup [-\pi, -\pi-\alpha] &(\text{第二象限}) \\
    &\cup [\alpha, 0] &(\text{第一象限})
\end{aligned}
$$

当这个角在一四象限时，注意到：
$$m^2\cos\varphi \pm m \sqrt{1 - m^2\sin^2\varphi} \ge 0$$，从而$\rho \le 0$，因此这个区域不可能产生可行的图像。

相对地，当这个角在二三象限时，$\rho \ge 0$，因此我们可以将其限制在区间
$$\varphi \in [-\pi + \alpha, -\pi - \alpha]$$上。

从而有：
$$
\begin{align*}
    &\forall m > 0, \forall \varphi \in \lbrack -\pi-\arcsin\frac{1}{m}, -\pi+\arcsin\frac{1}{m} \rbrack \\
    &\quad G_{dB-BO}(\varphi) = 20 \log \frac{m^2 \cos \varphi \pm m \sqrt{1 - m^2\sin^2\varphi}}{1-m^2}
\end{align*}
$$

---

这三种情况分别对应于文首的图像上增益小于零，等于零和大于零的情况。

#### 绘制等相位曲线

首先我们考虑几个最特殊的情况，即$\theta = -2\pi, -\pi, 0$。
此时方程退化为$r \sin \lambda = 0$，从而有$\sin \varphi = 0$，最终可得：
$$\varphi = -2\pi, -\pi, 0$$
这在尼科尔斯图上表现为三根垂直的直线，分别位于标识出的三个位置。

接下来考虑方程：
$$
G_{dB-BO}(\varphi) = 20 \lg \left( \frac{\sin \varphi}{\tan \theta} - \cos \varphi \right)
= 20 \lg \left( \cos \varphi (\frac{\tan\varphi}{\tan\theta} - 1) \right)
$$

我们需要研究$\theta$导致的函数的正负性变化，以确定这个曲线的值域。
由于这个参数仅出现在$\tan$函数内部，其周期为$\pi$，因此我们只在$(-2\pi, -\pi)$上进行研究。

我们继续进行分类讨论。

---

若$\theta \in (-2\pi, -\frac{3\pi}{2}]$，我们分别研究$\frac{\tan\varphi}{\tan\theta} - 1$和$\cos \varphi$的正负性。

首先设$\frac{\tan\varphi}{\tan\theta} - 1 \ge 0$，即$\tan\varphi \ge \tan\theta$。
根据$\tan(x)$的函数图像，可以看出：
$$\varphi \in [\theta, -\frac{3\pi}{2}) \cup [\theta+\pi, -\frac{\pi}{2})$$

接着考虑$\cos \varphi$的符号。
这个函数非常简单，此处不再赘述。

最后综合起来，可以发现$\rho \ge 0$，即函数有定义的区间为$[\theta, \theta+\pi]$。
我们设$\theta^\prime = \theta + \pi$，即区间转换为$[\theta, -\pi]\cup[-\pi, \theta^\prime]$。
由于整个函数的周期性，我们只需要一个区间即可。

最后注意到整个函数的周期性，我们也完成了对区间$\theta \in (-\pi, -\frac{\pi}{2}]$上的讨论，注意此时需要把区间倒过来。
从而我们可以得出结论：
当$\theta \in (-2\pi, -\frac{3\pi}{2}]$时，定义区间为$[\theta, -\pi]$；
当$\theta \in (-\pi, -\frac{\pi}{2}]$时，定义区间为$[-\pi, \theta]$

---

对$\theta \in (-\frac{3\pi}{2}, -pi]$和$(-\frac{\pi}{2}, 0]$的讨论完全同理。
前者的定义区间为$[\theta, -\pi]$；
后者的定义区间为$[-\pi, \theta]$。

---

因此，我们有：

- 当$\theta \in (-2\pi, -\pi)$时，
  $$ \forall \varphi \in (\theta, -\pi], \; G_{dB-BO}(\varphi) = 20 \lg \left( \frac{\sin \varphi}{\tan \theta} - \cos \varphi \right) $$
- 当$\theta \in (-\pi, 0)$时，
  $$ \forall \varphi \in (-\pi, \theta], \; G_{dB-BO}(\varphi) = 20 \lg \left( \frac{\sin \varphi}{\tan \theta} - \cos \varphi \right) $$

---

最后，我们可以尝试开始绘制$\theta$角的等相位曲线了。
从上面的讨论，不难注意到，除了取值范围不同之外，两个角$\theta \in [-2\pi, -\pi]$和$\theta + \pi \in [-\pi, 0]$的曲线应当完全一样。
因此我们只选择其中的一个进行研究，设$\theta \in [-2\pi, -\pi)$，由上所述，我们知道其图像应该在$(\theta, \theta + \pi)$之间。
简单变形整理可得：
$$G_{dB-BO} = 20 \lg \left[ \cos \varphi \left( \frac{\tan \varphi}{\tan \theta} - 1 \right) \right]$$

有几点值得注意。这个函数在$\varphi \to \theta^+$和$\varphi \to (\theta + \pi)^-$处取负无穷，而在$-\pi$处取零。
前者应证了上文所述的边界，后者则说明其图像*总是*通过临界点，即$(-\pi, 0)$。
根据以上信息，我们可以画出以下图像：

![](/assets/system/isophase-demostration.svg)
{: .align-center}

图像中红色部分表示$\theta \in [-2\pi, -\pi]$，而蓝色部分表示$\theta \in [-\pi, 0]$
这确实与文首所述的图像相同。


#### 等增益与等相位线的应用

尼柯尔斯图上的等增益线和等相位线为我们提供了将开环传递函数与闭环传递函数联系起来的有力工具。
图上的每一个点的横纵坐标表征了开环传递函数的增益与相位，而通过查找等增益与等相位线，我们就可以非常迅速地找出其闭环传递函数的性质。

### 利用尼柯尔斯图确定系统的阻尼

通常，如果一个系统的相对最大超调量满足
$$(D_\%)_\text{max} \le 23 \%$$
那么我们认为这个系统就不再是欠阻尼的。
因此，我们需要确定其最大超调量。

我们知道，一个线性时不变系统在过渡态的行为主要是尤其主极点，即实部的绝对值最小的极点，决定的，因为实部的绝对值越小说明这个极点对应的时间越长。
如果主极点是一个实数，那么系统在过渡态不会发生振荡，因此没有超调，所以一定不是欠阻尼的；
相对地，如果其是一个共轭的复数，那么这个极点的行为可表示为一个二阶系统，而其超调可由以下公式确定：
$$D_\% = 0.23 \iff \exp \left( - \frac{\xi \pi}{\sqrt{1 - \xi^2}} \right) = 0.23 \iff \xi \approx 0.42$$
注意到$\xi < \frac{\sqrt{2}}{2}$，那么这个系统会出现共振，而在共振时，其增益又有：
$$G_{dB-R} = 20 \lg K - 20 \lg (2\xi \sqrt{1 - \xi^2})$$
我们知道，对这个极点而言，若增益为$1$，有$G\_{dB-R} \approx 2.3 \text{dB}$。

注意到这是对闭环系统传递函数的研究，因此这正好对应尼柯尔斯图上的一条等增益线。
我们可以得出结论，如果开环传递函数的图像穿过了$2.3 \text{dB}$这条等增益线，那么闭环系统就是欠阻尼的；
否则，系统就不是欠阻尼的。

值得一提的是，系统的稳定裕度也可以非常容易地从尼柯尔斯图上看出。
开环传递函数与X轴的交点若在临界点右侧，那么这两点之间的距离就表示了系统的幅值裕度；
开环传递函数在$G\_{dB}$等于1的时候位于临界点下方，那么这两点之间的距离就是系统的相角裕度。


## 确定系统的准确性、强健性和相应速度

### 利用开环传函的辐角确定准确性

我们知道，系统的准确性和强健性与开环传递函数的积分次数密切相关。
对开环传递函数的频域相应，我们有：
$$H_{BO}(j \omega) = \frac{K_{BO}}{(j\omega)^\alpha} \frac{N_{BO}(j \omega)}{D_{BO}(j \omega)}$$
其中$N\_{BO}$和$D\_{BO}$是常数项为$1$的多项式。

研究其辐角，可得：
$$\varphi_{BO}(\omega) = \arg H_{BO}(j \omega) = - \alpha \frac{\pi}{2} + \arg N_{BO} + \arg D_{BO}$$
现在取$\omega \to 0$，可得：
$$\varphi_{BO}(0) = - \alpha \frac{\pi}{2}$$
从而其积分次数$\alpha$与$\omega = 0$时的开环传递函数的辐角密切相关。

更准确地说，若其在$\omega = 0$时，开环传递函数的辐角是$\frac{\pi}{2}$的$n+1$倍，那么其反馈环内有$n+1$次积分，则系统对$n$次（及以下）输入$e(t) = a t^n u(t)$准确。

在尼柯尔斯图上，$\omega \to 0$通常意味着曲线趋向一个端点。

不幸的是，我们无从得知这些积分的位置，因此也无法用任何方法判定系统的强健性。

### 系统的响应速度

我们只使用一个实证的方法来确定系统的响应速度，而不进行数学证明。

闭环系统增益为$0\text{dB}$的带宽越宽，那么系统的响应速度就越快。
增益为$0\text{dB}$的带宽表示集合
$$\{ \omega \,|\, G_{dB}(\omega) > 0 \text{dB} \}$$
的长度（测度），从而这和闭环系统的临界点密切相关。

若闭环系统对应的*开环传递函数*在$0 \text{dB}$的带宽越宽，且系统*没有欠阻尼*，那么系统的响应速度就越快。

从结果上看，系统满足：
$$\omega_{C0,BO} t_{BF} \approx 3$$
这意味这系统的开环临界频率越大，即增益为$0 \text{dB}$时的频率越大，系统就越快速。

考虑到决定系统响应速度的正是其对高频输入的敏感性，这个结论是符合直觉的：
系统允许通过的高频分量越多，响应就越快。
