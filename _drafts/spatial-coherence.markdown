---
title: "空间相干性与迈克耳孙干涉仪"
categories: "光学"
---

前文中我们已经解决了有限远和无限远处点光源的干涉问题，接下来我们来考虑拓展光源，即非点光源，在空间中的干涉。
拓展光源产生的干涉图样取决于光源以及分光器，对这些内容的研究称为空间相干性。

## 拓展光源的分波面干涉

这一节中，我们将解决有限大小的拓展光源通过杨氏干涉仪（即双孔或双缝）产生的干涉图样。

### 点光源干涉的非定域性

我们设光屏平行于两个无限小的孔放置，正如此前提到的直线干涉图样那样，那么此时光程差为：
$$\delta(M) = \mathcal L (SM)_2 - \mathcal L(SM)_2 = n \frac{ax}{D}$$
其中$x$是光屏上一点沿平行于两个小孔方向的坐标。
光屏上任意一点的辐照度从而可以表示为：
$$\mathcal E(M) = 2 \mathcal E_0 [1 + \Gamma \cos \left( \frac{2\pi}{\lambda_0} n \frac{ax}{D} \right)]$$
我们设两个孔大小相同，那么$\mathcal E_1 = \mathcal E_2 = \mathcal E_0$，$\Gamma = 1$。

如果光源通过分波面进行干涉，那么总是会形成这种*非定域*的干涉条纹：
干涉条纹可见于被两个细孔发出的光覆盖到的所有空间位置。
这些可见干涉条纹的位置的集合称为*干涉场*。

### 点光源移动的影响

现在我们考虑点光源移动对干涉图样的影响。
沿用之前的定义，我们在空间中建立一个三维右手直角坐标系，并把光屏放置在OXZ平面上。
在Y轴负方向距离原点为$D$的位置上放置一个遮光板，沿X正负方向分别钻两个小孔，记为$S\_1,S\_2$，使其连线的中垂线和Y轴重合。
两小孔之间的距离为$a$。
在Y轴负方向距离遮光板$D^\prime$的位置上放置一个点光源，记为$S$。

现在让点光源在垂直于Y轴的平面上移动至$S^\prime$，我们设$S^\prime$的X坐标和Z坐标分别为$x^\prime$和$z^\prime$。
由于$S$的X和Z坐标都是零，其位移向量就是$(x^\prime, 0, z^\prime)$。

假设$x,z \ll D$，$x^\prime, z^\prime \ll D^\prime$，$a \ll D^\prime$。
那么，从$S^\prime$到光屏上一点$M$的光程差为：
$$\delta_{S^\prime} = \frac{nax}{D} + \frac{nax^\prime}{D^\prime}$$
从干涉图样上看，这意味着同一阶的干涉条纹的位移向量为
$$- x^\prime \frac{D}{D^\prime} \vec e_x$$
注意方向相反。
{: .proposition}

从光源$S^\prime$到光屏上一点$M$的光程差等于从光源到遮光板的光程差加上遮光板到$M$的光程差。
而根据光路可逆的原理，从光源到光屏的光程差等于从光屏到光源的光程差，从而我们可以直接使用几何引理：
$$\delta = n \vec{S_2S_1} \cdot \frac{\vec{IM}}{|IM|}$$
有：
$$
\begin{aligned}
    \delta &= \delta_S + \delta_{S^\prime} \\
    &= n \vec{S_2S_1} \cdot \frac{\vec{IM}}{|IM|} + n \vec{S_2S_1} \cdot \frac{\vec{IS^\prime}}{IS^\prime} \\
    &= \frac{nax}{D} + \frac{nax^\prime}{D^\prime}
\end{aligned}
$$
从而其辐照度等于：
$$\mathcal E(M) = \mathcal E_0 (1 + \cos \left[ \frac{2n\pi}{\lambda_0} \left( \frac{ax}{D} + \frac{ax^\prime}{D^\prime} \right) \right])$$
{: .proof}

### 两个不相干点光源

我们总是设点光源处在OXZ平面之中。
若两个点光源不相干，那么其在光屏上的成像就是两个点光源的干涉图样的*简单相加*。
我们设一个点光源正好位于Y轴上，这样我们可以直接用上文所述的平移的点光源进行研究。

简单的定性研究不难说明，如果平移后的点光源所成的干涉图样和原光源重合，那么干涉图样不会改变；
相对地，如果平移后的点光源所成的干涉图样的亮条纹恰好和平移前光源的暗条纹重合，那么干涉图样就会变得更加模糊。

我们使用以下命题来定量地描述这个问题。

两个点光源形成的干涉图样的对比度为：
$$\Gamma(M) = \left| \cos \left[ \frac{\pi}{\lambda_0} (\delta_{S^\prime}(M) - \delta_S(M)) \right] \right|$$
{: .proposition}

$$
\begin{aligned}
    \mathcal E(M) 
    &= 2[1 + \cos (\frac{2\pi}{\lambda_0} \delta_S(M))] + 2[1 + \cos (\frac{2\pi}{\lambda_0} \delta_{S^\prime}(M))] \\
    &= 2[2 + \cos (\frac{2\pi}{\lambda_0} \delta_S(M)) + \cos (\frac{2\pi}{\lambda_0} \delta_{S^\prime}(M))] \\
    &= 2[2 + 2\cos(\frac{\pi}{\lambda_0}(\delta_S - \delta_{S^\prime})) \cos(\frac{\pi}{\lambda_0}(\delta_S + \delta_{S^\prime}))] \\
    &= 2[2 + 2\cos(\frac{\pi}{\lambda_0} \frac{nax^\prime}{D^\prime}) \cos(\frac{\pi}{\lambda_0}(2\frac{nax}{D} + \frac{nax^\prime}{D^\prime}))]
\end{aligned}
$$
注意到：
$$\mathcal E(M) = 2(1 + \Gamma \cos(\frac{2\pi}{\lambda_0} \delta(M))$$
从而
$$\Gamma = |\cos \frac{\pi}{\lambda_0}(\delta_S - \delta_{S^\prime})|$$
{: .proof}

#### 细线光源

根据之前的研究，不难看出，如果光源沿Z轴移动，即沿垂直于两光源连线的方向移动，那么条纹不会发生变化，只是辐照度增加。
因此，如果细线光源平行于Z轴，或垂直于两光源的连线，那么衍射图样不会发生变化。

### 拓展光源

现在，我们让细线光源沿X轴平移，形成一个拓展光源。
我们设这个光源的中心位于Z轴上，X坐标为零，宽度为$2b$。
显然，拓展光源形成的衍射图样会有所变化。
![](/assets/optics/extended-light-source.png)
{: .aligned-center}
上图展示了这种变化，其中横轴表示光源的宽度，纵轴表示光屏上的X坐标。
不难发现，随着光源宽度上升，对比度先是下降，然后发生反转，我们马上就能证明这个结论。

设光源宽度为$2b$，那么对比度满足：
$$\Gamma(b) = |\mathrm{sinc}(\frac{2\pi}{\lambda_0} \frac{nab}{D^\prime})|$$
其中$\mathrm{sinc}(x) = \frac{\sin x}{x}$表示辛格函数。
随着辛格函数变号，干涉图样也会发生一次反转。
{: .proposition}

设在X坐标$x^\prime$和$x^\prime + \mathrm d x^\prime$之间的光源的辐照度为
$$\mathrm d \mathcal E_0 = \frac{\mathcal E_0}{2b} \mathrm d x^\prime$$
有：
$$
\begin{aligned}
    \mathrm E(M) &= \int_{-b}^b \mathrm d \mathcal E_0 (1 + \cos \frac{2\pi}{\lambda_0} (\frac{nax}{D} + \frac{nax^\prime}{D^\prime})) \\
    &= \frac{\mathcal E_0}{b} \int_{-b}^b (1 + \cos \frac{2\pi}{\lambda_0} (\frac{nax}{D} + \frac{nax^\prime}{D^\prime})) \mathrm d x^\prime \\
    &= 2 \mathcal E_0 + \frac{\mathcal E_0}{b} (\cos \frac{2\pi}{\lambda_0} \frac{nax}{D} \left[ \frac{\sin \frac{2\pi}{\lambda_0} \frac{nax^\prime}{D^\prime}}{\frac{2\pi}{\lambda_0} \frac{na}{D^\prime}} \right]_{-b}^b + \sin \frac{2\pi}{\lambda_0} \frac{nax}{D} \left[ \frac{\cos \frac{2\pi}{\lambda_0} \frac{nax^\prime}{D^\prime}}{\frac{2\pi}{\lambda_0} \frac{na}{D^\prime}} \right]_{-b}^b) \\
    &= 2 \mathcal E_0 + \frac{\mathcal E_0}{b} \cos \frac{2\pi}{\lambda_0} \frac{nax}{D} \left( 2 \frac{\sin \frac{2\pi}{\lambda_0} \frac{nab}{D^\prime}}{\frac{2\pi}{\lambda_0} \frac{na}{D^\prime}} \right) \\
    &= 2 \mathcal E_0 (1 + \mathrm{sinc} \frac{2\pi}{\lambda_0} \frac{nab}{D^\prime} \cos \frac{2\pi}{\lambda_0} \frac{nax}{D})
\end{aligned}
$$
从而
$$\Gamma = \mathrm{sinc} \frac{2\pi}{\lambda_0} \frac{nab}{D^\prime}$$
{: .proof}

## 空间相干性

### 空间相干性的半定量判据

对于实际的光源，可以看作是许多不相干的点光源的集合，因为初相位几乎总是不相同。
然而，正如我们上文所述，如果光源过宽，那么对比度就会变低甚至反转。
我们提出以下判据，用来让干涉图样保持清晰。

设$S$为拓展光源的中心，该光源由一系列不相干的单色点光源组成，其中一个为$S^\prime$。
对于光屏上的一点$M$，该处的干涉图样保持清晰，若：
$$\forall S^\prime, \, |\delta_{S^\prime}(M) - \delta_S(M)| < \frac{\lambda_0}{2}$$
空间相干性和光源与遮光板组成的整个系统有关，因为$\delta(M)$是由遮光板的位置决定的。
{: .theorem}

### 局域性定理

考虑任何一个产生干涉的分光器，无论其产生的是分波面干涉还是分振幅干涉，该分光器的输入为一个点光源$S$。
设$M$为光屏上的一点，用来观察干涉。
记$\vec u\_1$和$\vec u\_2$为两束进入干涉仪的光线的单位方向向量。

在$M$点的光程差可以写为：
$$\delta(M) = \mathcal L(SM)_1 - \mathcal L(SM)_2$$
下标表示光到达该点的两条不同的路径。

若我们希望干涉图样不模糊，那么不同的点光源到达该位置的光程差应该为波长的整数倍。
考虑到拓展光源可以看成多个空间上相邻点光源的组合，由于连续性，这意味着光程差只能为零。

我们使用以下定理来判定光程差是否为零：

对两个点光源$S$和$S^\prime$，有：
$$\delta(S,M) = \delta(S^\prime, M) \iff \vec {SS^\prime} \cdot (\vec u_2 - \vec u_1) = 0$$
{: .proposition}

有：
$$\delta(S^\prime M) = \delta(SM) + n \frac{\vec{SS^\prime}}{D^\prime} \cdot \vec {S_2S_1}$$
其中$S\_1$和$S\_2$是遮光板上的两个孔，和光程的下标不同。
又：
$$\vec{S_2 S_1} = \vec{S_2S} + \vec{SS_1} = S_2S \vec u_2 - S_1S \vec u_1 \approx D^\prime(\vec u_2 - \vec u_1)$$
代入即可。
{: .proof}

要达成这种情况，只有两种可能。

- 光源的扩展正交于干涉光线的方向，比如在上文中提到的让光源在垂直于两孔的连线方向上拓展；
- 干涉的光线方向相同，这种情况*只见于分振幅干涉*。

从而我们提出下面这条定理：

*分振幅干涉*的设备被一*拓展光源*照亮时，干涉是**定域**的。
存在一个平面使干涉图样的对比度最大，该平面就是从同一入射光产生的两束干涉光相交的平面。
{: .theorem}
