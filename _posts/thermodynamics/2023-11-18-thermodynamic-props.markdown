---
title: "纯净物的热力学属性"
categories: ["热力学", "工程热力学"]
---

本文将阐述纯净物的热力学属性及其之间的关系。

## 不同相的热力学属性

我们主要研究不同相的纯净物。

### 纯净物的相

热力学中研究的相主要有三种：

1. 固相（Soild phase）。
2. 液相（Liquid phase）。
    - 饱和液体：即将汽化的液体称为饱和液体；
    - 压缩液体：不具有汽化倾向的液体称为压缩液体。
3. 气相（Gas phase）。
    - 饱和蒸汽：即将发生液化的气体称为饱和蒸汽；
    - 过热蒸汽：不具有液化倾向的气体称为过热蒸汽。

例如，日常生活中，在空气不太潮湿的情况下，敞口容器中的水通常就是饱和液体，其会不断地蒸发，即发生汽化。

处在液相和气相之间且平衡的纯净物的两个相一定分别为饱和液体和饱和蒸汽，此时该纯净物被称为处在*饱和气液混合态*。

#### 相变

在给定压力下，纯净物发生相变的温度称为*饱和温度*（Saturated temperature）；同理，在给定温度下，纯净物发生相变的压力称为*饱和压力*（Saturated pressure）。
对气液相变，饱和压力也称饱和蒸汽压。

饱和温度只与饱和压力有关，这意味着，对正发生相变的纯净物，只要饱和压力不改变，温度也不会改变。
例如，对于煮沸的水，其正发生汽化，而只要维持外界压力仍是大气压，沸水的温度就只能维持在其沸点处。

通常饱和温度和饱和压力是正相关的，增加施加在液体上的压力能够使其饱和温度上升。

相变会吸收或放出大量的热量，这些热量统称为*相变潜热*（Latent heat）。

#### 相变的图像

如果画出相变中物质的各种属性的图像，能够发现一些有趣的特点。

以T-v图为例，以系统的体积或单位质量体积为横坐标，温度为纵坐标，可见在相同压强下，随着温度上升，液相物质的体积先缓慢上升，然后开始相变并保持为饱和温度不变，最后变为气态，随温度上升体积快速上升。
随着压强的增大，表示相变的平台越来越短，最后消失。
在消失点，物质已经不能区分液相和气相，该点称为该物质的*临界点*（Critical point）。

### 不同相的属性

对于纯净物的属性，尤其是广延量，我们使用不同的下标来表示不同相下的值。
下标$f$表示饱和液体的属性，下标$g$表示饱和气体的属性，下标$fg$表示两个相的属性之差。
例如，相变潜热，即相变焓，就可以用下标的形式写为：
$$h_\mathit{fg} = h_g - h_f$$

我们使用质量分数$x$来表示不同相之间的质量关系。
以气液相变为例，质量分数常定义为：
$$ x = \frac{m_\text{气相}}{m_\text{总}} $$

双相纯净物系统的*任何广延量*（此处以焓为例）都可以用质量分数表示为：
$$ h_\text{系统} = h_f + x \cdot h_\mathit{fg} $$

#### 过热蒸汽和压缩液体

过热蒸汽相较于饱和蒸汽，其在相同温度下压强更小（$P < P\_\text{饱和}$）；在相同压强下温度更高；在给定温度或压强下比容、内能和焓都更高。

相较而言，由于液体具有很强的不可压缩性，温度对其性质的影响远大于压强的。
因此其属性往往可以用对应温度下的饱和液体的属性近似。

对于压缩液体的焓，有时可以通过增加对压强的修正项来取得更好的结果：
$$ h \approx h_{f} + v_f (P - P_\text{饱和}) $$

### 气体的状态方程

气体的状态方程就是描述气体的各个属性之间的关系的方程。
可能最为人所熟知的状态方程就是理想气体状态方程（Ideal gas equation）了：
$$ P V = n R T \iff P v = R_\text{spec} T $$
其中$R$是普适气体常数、$R\_\text{spec}$是特殊气体常数。

通常来讲，气体的压强不太大，温度较高时可以比较好地被理想气体状态方程近似。
满足理想气体状态方程的气体称为理想气体（Ideal gas）。

#### 压缩因子

气体的压缩因子（Compressibility factor）表征了气体偏离理想气体的程度，定义为：
$$ Z = \frac{Pv}{R_\text{spec} T} \iff Z = \frac{v_\text{实际}}{v_\text{理想}} $$
{: .definition}

尽管气体的性质各不相同，其压缩因子只与两个参数密切相关：对比压强（Reduced pressure）和对比温度（Reduced temperature），定义为
$$ P_R = \frac{P}{P_\text{临界}}, \quad T_R = \frac{T}{T_\text{临界}} $$

只要气体的对比压强和对比温度相同，无论其种类是否相同，它们的压缩因子都是一样的。这一命题称为对应状态原理（principle of corresponding states）。

对比比容定义为
$$ v_R = \frac{v_\text{实际}}{\frac{R_\text{spec} T_\text{临界}}{P_\text{临界}}} $$
通常情况下，气体的压缩因子和对比比容都可以通过查表或查图求出。
我们可以利用对比比容在只知道温度和比容或压强和比容的情况下求出压缩因子，而不必知道压强或温度。

#### 其他状态方程

理想气体方程简单且估计精度很高，但是物理学家们仍然希望寻找更加准确的状态方程。
这节中将列出几个。

范德华状态方程为
$$ \left( P + \frac{an^2}{V^2} \right) (V - nb) = nRT $$
其中$ a,b $是两个待确定的常数。
理论确定的$ a,b $两个参数的精度不佳，因此往往使用拟合的值。

维里状态方程是理想气体方程的幂级数形式
$$ \frac{PV_m}{RT} = 1 + \frac{B}{V_m} + \frac{C}{V_m^2} + \cdots $$
这个方程能直接由统计力学方式得出。
只要恰当的选择系数，该方程能取得极高的精度。

## 热力学属性的关系

接下来我们关心这些热力学属性之间的关系。
首先我们引入两个偏微分恒等式：

设$ z(x,y) $是可微的函数，则
$$ \left( \frac{\partial x}{\partial z} \right)_y = \frac{1}{\left( \frac{\partial z}{\partial x} \right)_y} $$
对性质良好的函数$ z $，我们可将$ x $变为$y,z$的函数：$ x = x(y, z) $，从而得到
$$ \left( \frac{\partial z}{\partial x} \right)_y \left( \frac{\partial x}{\partial y} \right)_z = \textcolor{red}{-} \left( \frac{\partial z}{\partial y} \right)_x $$
{: .proposition}

注意到第二条命题和链式法则不同：设$z(x(y), k)$是一个可微的函数，且$k$与$x$无关，则
$$ \left( \frac{\partial z}{\partial y} \right)_k = \left(  \frac{\partial z}{\partial x} \right)_k \left(  \frac{\partial x}{\partial y} \right)_k $$
这两个命题在省略表示不变量的下标时容易混淆。

### 麦克斯韦关系

和描述电磁场的麦克斯韦方程不同，麦克斯韦关系表示了几个热力学属性之间的偏微分关系。

<small>（麦克斯韦关系，Maxwell relations）</small>
简单可压缩热力学系统满足
$$
    \begin{aligned}
    \left( \frac{\partial T}{\partial v} \right)_s &= - \left( \frac{\partial P}{\partial s} \right)_v \\
    \left( \frac{\partial T}{\partial P} \right)_s &= \left( \frac{\partial v}{\partial s} \right)_P \\
    \left( \frac{\partial s}{\partial v} \right)_T &= \left( \frac{\partial P}{\partial T} \right)_v \\
    \left( \frac{\partial s}{\partial P} \right)_T &= - \left( \frac{\partial v}{\partial T} \right)_P \\
    \end{aligned} 
$$
其中$T$是温度、$P$是压强、$v$是比容、$T$是单位质量的熵。
{: .proposition}

我们已经知道：
$$ 
    \def\d{\mathrm{d}}
    \d u = T \d S - P \d v, \quad
    \d h = T \d S + v \d P
$$
定义系统的亥姆霍次和吉布斯函数分别为
$$ a = u - T s, \quad g = h - T s $$
两者均是状态函数，因此具有恰当微分
$$ \d a = \d u - (T \d s + s \d T), \quad \d g = \d h - (T \d s + s \d T) $$
代入内能和焓的微分，可得
$$ \d a = - s \d T - P \d v, \quad \d g = - s \d T + v \d P $$
这两个方程和开头的两个方程合称吉布斯关系（Gibbs relations）。
这四个方程均具有全微分的形式，而我们知道
$$ \d z = \frac{\partial z}{\partial x} \d x + \frac{\partial z}{\partial y} \d y$$
同时
$$ \frac{\partial^2 z}{\partial x \partial y} = \frac{\partial^2 z}{\partial y \partial x} $$
从而，以亥姆霍次函数的微分为例，可得
$$ \frac{\partial s}{\partial v} = \frac{\partial P}{\partial T} $$
{: .proof}

利用能量这一量纲可以容易地记忆麦克斯韦关系，注意到
$$ [u] = [T][s] = [P][v] $$
从而
$$ \frac{[T]}{[v]} = \frac{[P]}{[s]},\ \frac{[T]}{[P]} = \frac{[v]}{[s]},\ \frac{[s]}{[v]} = \frac{[P]}{[T]},\ \frac{[s]}{[P]} = \frac{[v]}{[T]}$$
现在为所有$[T], [v]$出现在同一侧的方程加上负号并将量纲替换为偏导即可。

### 克拉佩龙方程

<small>（克拉佩龙方程[^1]，Clapeyron equation）</small>系统饱和压强和温度的微分和相变焓具有以下关系：
$$ \left( \frac{\d P}{\d T} \right)_\text{饱和} = \frac{h_{12}}{T v_{12}} $$
下标$12$表示两相之间属性的差。
{: .proposition}

考虑麦克斯韦方程：
$$ \left( \frac{\partial s}{\partial v} \right)_T = \left( \frac{\partial P}{\partial T} \right)_v $$
我们已经知道，相变中的压力就是饱和压力，而其只是饱和温度的函数，因此可将偏微分替代为全微分。
这个微分的值与比容没有关系，因此直接对上式积分可得
$$ \int \d s = \left( \frac{\d P}{\d T} \right)_\text{饱和} \int \d v \implies s_{12} = \left( \frac{\d P}{\d T} \right)_\text{饱和} v_{12}$$
相变过程的压力和温度维持不变，根据热力学基本关系
$$ \int \d h = \int T \d s + \cancel{v \d P} \implies h_{12} = T s_{12} $$
代入即可得到欲证的方程。
{: .proof}

[^1]: 克拉佩龙方程有时也指理想气体状态方程，他于1834年合并了玻意耳-马略特定律、查理定律和盖-吕萨克定律等经验定律，提出了理想气体状态方程。

#### 克-克方程

对于理想气体的气液相变，我们还可以进一步地进行近似。

<small>（克劳修斯-克拉佩龙方程，Clausius–Clapeyron relation）</small>
若发生气液相变的气体能被视为理想气体，则有
$$\ln \left( \frac{P_2}{P_1} \right)_\text{饱和} = \frac{h_\mathit{fg}}{R_\text{spec}} \left( \frac{1}{T_1} - \frac{1}{T_2} \right)_\text{饱和}$$
{: .proposition}

注意到通常而言气体的体积远大于液体的，因此$v\_\mathit{fg}$可用气体的体积$v\_\text{g}$代替。
然后利用理想气体状态方程，可得
$$ \left( \frac{\d P}{\d T} \right)_\text{饱和} = \frac{h_\mathit{fg}}{T v_\text{g}} = \frac{P h_\mathit{fg}}{T^2 R_\text{spec}} $$
简单变换可得
$$\left( \frac{\d P}{P} \right)_\text{饱和} = \frac{h_\mathit{fg}}{R_\text{spec}} \left( \frac{\d T}{T^2} \right)_\text{饱和} $$
积分即可得到原式。
{: .proof}

克-克方程联系了饱和蒸汽压、温度和相变焓（即相变潜热）。
不需要比容的数据，就可以估算饱和蒸汽压随温度变化的关系。 

### 内能、熵和焓的变化

简单可压缩系统的内能、熵和焓的变化具有以下关系
$$
\begin{aligned}
\d u &= c_v \d T + \left[ T \left( \frac{\partial P}{\partial T} \right)_v - P \right] \d v \\
\d h &= c_p \d T + \left[ v - T \left( \frac{\partial v}{\partial T} \right)_P \right] \d P \\
\d s &= \frac{c_v}{T} \d T + \left(\frac{\partial P}{\partial T}\right)_v \d v \\
&= \frac{c_p}{T} \d T - \left(\frac{\partial v}{\partial T}\right)_P \d P
\end{aligned}
$$
其积分形式为
$$
\begin{aligned}
u_2 - u_1 &= \int_{T_1}^{T_2} c_v \d T + \int_{v_1}^{v_2} \left[ T \left( \frac{\partial P}{\partial T} \right)_v - P \right] \d v \\
h_2 - h_1 &= \int_{T_1}^{T_2} c_p \d T + \int_{P_1}^{P_2} \left[ v - T \left( \frac{\partial v}{\partial T} \right)_P \right] \d P \\
s_2 - s_1 &= \int_{T_1}^{T_2} \frac{c_v}{T} \d T + \int_{v_1}^{v_2} \left(\frac{\partial P}{\partial T}\right)_v \d v \\
&= \int_{T_1}^{T_2} \frac{c_p}{T} \d T - \int_{P_1}^{P_2} \left(\frac{\partial v}{\partial T}\right)_P \d P
\end{aligned}
$$
{: .proposition}

我们知道，简单可压缩系统的状态可由两个状态函数完全确定。
当研究内能时，我们选择温度和比容，则
$$\d u = \frac{\partial u}{\partial T} \d T + \frac{\partial u}{\partial v} \d v = c_v \d T + \frac{\partial u}{\partial v} \d v$$
由于温度和比容是两个仅有的独立的变量，因此对一个求偏导时另一个一定维持不变，此处我们省去了括号。
对于熵，有
$$\d s = \frac{\partial s}{\partial T} \d T + \frac{\partial s}{\partial v} \d v$$
代入热力学基本关系：
$$\d u = T \d s - P \d v = T \left( \frac{\partial s}{\partial T} \d T + \frac{\partial s}{\partial v} \d v \right) - P \d v $$
运用待定系数法，可得
$$c_v = T \frac{\partial s}{\partial T}, \quad \frac{\partial u}{\partial v} = T \frac{\partial s}{\partial v} - P$$
再使用麦克斯韦关系，可得
$$\frac{\partial u}{\partial v} = T \frac{\partial P}{\partial T} - P$$
从而
$$\d u = c_v \d T + \left( T \frac{\partial P}{\partial T} - P \right) \d v$$
对焓变同理，选择温度和压强两个变量即可。
对熵变，我们注意到
$$\d s = \frac{\partial s}{\partial T} \d T + \frac{\partial s}{\partial v} \d v = \frac{c_v}{T} \d T + \frac{\partial P}{\partial T} \d v$$
另一个方程同理。
{: .proof}

注意到根据定义有
$$h_2 - h_1 = u_2 - u_1 + (P_2 v_2 - P_1 v_1)$$
我们可由上一个命题的任意一个方程求出内能变化和焓变之一，然后用该方程求出另一个，而不必进行四次积分。

#### 真实气体的变化

利用内能、焓和熵作为状态从而与路径无关的性质，我们可以以任何中途状态的组合计算它们的变化。
对于真实气体，我们可以通过先将其近似为理想气体，然后在理想气体上进行状态变化，最后再回到真实气体来进行计算。

以从状态$(P\_1, T\_1)$到状态$(P\_2, T\_2)$为例，我们以如下方式计算焓变：计算相同温度的理想气体焓变，计算理想气体在不同温度的焓变，最后保持温度不变并回到现实气体状态。
$$
\begin{aligned}
h_2 - h_1 &= (h_2 - h_2^*) + (h_2^* - h_1^*) + (h_1^* - h_1) \\
h_2 - h_2^* &= \int_{P_2^*}^{P_2} \left[ v - T \left( \frac{\partial v}{\partial T} \right)_P \right]_{T = T_2} \d P \\
h_2^* - h_1^* &= \int_{T_1}^{T_2} c_p \d T\\
h_1^* - h_1 &= \int_{P_1}^{P_1^*} \left[ v - T \left( \frac{\partial v}{\partial T} \right)_P \right]_{T = T_1} \d P
\end{aligned}
$$
标星号的表示理想气体的状态。

第二项理想气体之间的焓变容易计算，因为理想气体的比热只是温度的函数。
而计算真实气体和理想气体之间的差则需要知道气体的$P\ v\ T$关系，这往往需要复杂的表格或计算。
我们使用*偏离因数*（Departure factor）来简化这样的计算。

焓的偏离因数定义为相同温度下理想气体和真实气体焓的差距的无量纲量
$$Z_h = \frac{(h^* - h)_T}{R T_\text{临界}}$$
熵的偏离因数定义为
$$Z_s = \frac{(s^* - s)_{T,P}}{R}$$
{: .definition}

利用修正的理想气体状态放方程$Pv = Z R\_\text{spec} T$，这两个偏离因数可以用如下积分计算
$$
\begin{aligned}
Z_h &= T_R^2 \int_0^{P_R} \left( \frac{\partial Z}{\partial T_R} \right)_{P_R} \d (\ln P_R) \\
Z_s &= \int_0^{P_R} \left[ Z - 1 + T_R \left( \frac{\partial Z}{\partial T_R} \right)_{P_R} \right] \d (\ln P_R)
\end{aligned}
$$

而求出这两个系数之后，对应的焓变、内能变和熵变可以表示为
$$
\begin{aligned}
h_2 - h_1 &= (h_2^* - h_1^*) - R_\text{spec} T_\text{临界} ({Z_h}_2 - {Z_h}_1) \\
u_2 - u_1 &= (h_2^* - h_1^*) - R_\text{spec} (Z_2 T_2 - Z_1 T_1) \\
s_2 - s_1 &= (s_2^* - s_1^*) - R_\text{spec} ({Z_s}_2 - {Z_s}_1)
\end{aligned}
$$

### 压缩性与体积膨胀系数

气体的*等温压缩性*（Isothermal compressibility）定义为
$$\beta = -\frac{1}{v} \left( \frac{\partial v}{\partial P} \right)_T$$
这个值总是不小于零。
*体积膨胀系数*（Volume expansivity）定义为
$$\gamma = \frac{1}{v} \left( \frac{\partial v}{\partial T} \right)_P$$
这个值可能小于零。
{: .definition}

<small>（迈耶关系，Mayer's relation）</small>
气体的比热满足
$$c_p - c_v = \frac{v T \gamma^2}{\beta}$$
对理想气体，有
$$c_p - c_v = R_\text{spec}$$
{: .proposition}

根据上文的命题，我们有
$$
\begin{aligned}
s_2 - s_1 &= \int_{T_1}^{T_2} \frac{c_v}{T} \d T + \int_{v_1}^{v_2} \left(\frac{\partial P}{\partial T}\right)_v \d v \\
&= \int_{T_1}^{T_2} \frac{c_p}{T} \d T - \int_{P_1}^{P_2} \left(\frac{\partial v}{\partial T}\right)_P \d P
\end{aligned}
$$
其微分形式为
$$\d s = \frac{c_v}{T} \d T + \frac{\partial P}{\partial T} \d v = \frac{c_p}{T} \d T - \frac{\partial v}{\partial T} \d P$$
从而
$$\d T = \frac{T \frac{\partial P}{\partial T}}{c_p - c_v} \d v + \frac{T \frac{\partial v}{\partial T}}{c_p - c_v} \d P = \frac{\partial T}{\partial v} \d v + \frac{\partial T}{\partial P} \d P$$
因此
$$c_p - c_v = T \left(\frac{\partial P}{\partial T}\right)_v \left(\frac{\partial v}{\partial T}\right)_P = - T \left( \frac{\partial P}{\partial v} \right)_T \left(\frac{\partial v}{\partial T}\right)_P^2$$
然后代入定义即可。
对理想气体，代入理想气体状态方程即可得证。
{: .proof}

这个命题说明：等压比热总是不小于等容比热，而对完全不可压缩的物质，两者总是相同，因此对压缩性小的相如固相和液相两者可近似相等；此外，当温度靠近绝对零度时，两者的差距也会缩小。

### 焦耳-汤姆逊系数

在等焓过程中，温度对压强的偏导称为*焦耳-汤姆孙系数*（Joule-Thomson coefficient），有时简称焦-汤系数。
$$\mu_\text{JT} = \left( \frac{\partial P}{\partial T} \right)_h$$
{: .definition}

对节流这一典型压强下降的等焓过程，焦汤系数小于零的工质的温度会上升，而大于零的温度会下降。

上文中我们提到计算焓的方法：
$$\d h = c_p \d T + \left[ v - T \left( \frac{\partial v}{\partial T} \right)_P \right] \d P $$
取焓变为零，移项即可得
$$\mu_\text{JT} = \frac{\partial T}{\partial P} = - \frac{1}{c_p} \left[ v - T \left( \frac{\partial v}{\partial T} \right)_P \right]$$

代入理想气体状态方程，不难发现理想气体的焦耳-汤姆逊系数为零，因此其焓只是温度的函数，从而内能也只是温度的函数。
满足这种性质，即内能只是温度的函数，的气体称为焦耳气体，而理想气体正是最常见的焦耳气体。
