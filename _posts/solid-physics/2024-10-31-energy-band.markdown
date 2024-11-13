---
title: "能带理论"
categories: ["固体物理"]
---

## 薛定谔函数的周期解

我们将在晶格产生的周期性势场中求解薛定谔函数，并得出方程的*布洛赫函数*(Bloch function)解。

利用波恩-奥本海默近似，我们研究的实际上仅是电子的薛定谔函数，而原子之间的互动由经典物理处理。

我们研究周期性势能的薛定谔方程，其哈密顿算符为
$$
\hat H = \sum_{j=1}^N \frac{\hat p_j^2}{2m} + \hat V(\mathbf r_1, \dots, \mathbf r_N).
$$
根据波-奥近似，认为电子之间的势能没有影响，即仅是单个电子的状态的函数，且是多个电子系统的平均场。
此外，还满足
$$
\hat V(\mathbf r + \mathbf R) = \hat V(\mathbf r), \quad \forall \mathbf r,
$$
其中$\mathbf R$是一个与晶格有关的常矢量，即正格矢，从而势场具有周期性。
根据我们选择的周期边界条件，波函数也具有周期性
$$
\psi(\mathbf r + \mathbf L) = \psi(\mathbf r), \quad \forall \mathbf r,
$$
其中$\mathbf L$是一个与整个材料有关的常数，即材料的大小。

虽然波函数的模方，即概率，也具有$\mathbf R$的周期，但其不一定是波函数本身的周期，需要区别两个不同的周期。
{: .remark}

### 布洛赫函数

利用周期性，可对波函数和势场进行傅里叶展开
$$
\psi(\mathbf r) = \sum_{\mathbf q} c_{\mathbf q} \exp[i\mathbf q \cdot \mathbf r], \, \hat V(\mathbf r) = \sum_{\mathbf G} V_{\mathbf G} \exp[i\mathbf G \cdot \mathbf r].
$$
$\mathbf q, \mathbf G$分别为$\mathbf R$与$\mathbf L$的傅里叶变换，其中$\mathbf G$即为倒格矢。
我们可进一步处理波函数的傅里叶展开
$$
\begin{aligned}
\psi(\mathbf r) &= \sum_{\mathbf q} c_{\mathbf q} \exp[i\mathbf q \cdot \mathbf r] \\
&= \sum_{\mathbf k} \sum_{\mathbf G} c_{\mathbf k + \mathbf G} \exp[i(\mathbf k + \mathbf G) \cdot r] \\
&= \sum_{\mathbf k} \exp[i \mathbf k \cdot \mathbf r] \sum_{\mathbf G} c_{\mathbf k + \mathbf G} \exp[i \mathbf G \cdot \mathbf r] \\
&= \sum_{\mathbf k} \underbrace{\exp[i \mathbf k \cdot \mathbf r] u_{\mathbf k} (\mathbf r)}_\text{布洛赫函数},
\end{aligned}
$$
即将$\mathbf q$分解为倒空间晶格内（即第一布里渊区内）与晶格外两部分。

称函数
$$
\psi(\mathbf r) = \exp[i\mathbf k \cdot \mathbf r] u_{\mathbf k}(\mathbf r)
$$
为*布洛赫函数*，其中$u$是一个与晶格具有相同周期的函数，即满足
$$u_{\mathbf k}(\mathbf r + \mathbf R) = u_{\mathbf k}(\mathbf r),$$
其中$\mathbf R$即为晶格向量。
{: .definition}

显然，布洛赫函数也具有类似周期性的性质，即
$$
\psi(\mathbf r + \mathbf R_n) = \exp[ik\mathbf R_n] \psi(\mathbf r).
$$

波函数即可视为布洛赫函数的级数和，根据傅里叶方程的线性，这意味着单个布洛赫函数也是原方程的解，这称为布洛赫定理，将在下一节证明。

布洛赫函数具有正交性，即
$$
\int \phi^*_{\mathbf k}(\mathbf r) \phi_{\mathbf k'}(\mathbf r) \, \mathrm d^3 r = \delta_{\mathbf k - \mathbf k', \mathbf G}
$$
{: .proposition}

### 布洛赫定理

布洛赫定理说明，布洛赫函数是周期晶格中电子的薛定谔方程的解。

<small>（布洛赫定理）</small>
周期性晶格中的电子的薛定谔方程的解，总可以由布洛赫函数组成的基底表出，即基函数中的每一个函数均具有以下性质：
$$\psi(\mathbf r) = \exp[i\mathbf k \cdot \mathbf r] u_{\mathbf k}(\mathbf r),$$
且
$$u_{\mathbf k}(\mathbf r) = u_{\mathbf k}(\mathbf r + \mathbf R).$$
{: .theorem}

接下来求解定态薛定谔方程的特征值$\epsilon$，并证明布洛赫函数确为原傅里叶方程的解。
直接代入，可得
$$
\begin{multline}
\sum_{\mathbf k} \sum_{\mathbf G} \left( \frac{\hbar^2}{2m} |\mathbf k + \mathbf G|^2 - \epsilon \right) c_{\mathbf k + \mathbf G} \exp[i (\mathbf k + \mathbf G) \cdot \mathbf r] + \\
\sum_{\mathbf G} \sum_{\mathbf G'} \sum_{\mathbf k} V_{\mathbf G'} c_{\mathbf k + \mathbf G} \exp[i(\mathbf k + \mathbf G + \mathbf G') \cdot r] = 0
\end{multline}
$$
修改势能项的求和指标，得到
$$
\begin{multline}
\sum_{\mathbf k} \sum_{\mathbf G} \left( \frac{\hbar^2}{2m} |\mathbf k + \mathbf G|^2 - \epsilon \right) c_{\mathbf k + \mathbf G} \exp[i (\mathbf k + \mathbf G) \cdot \mathbf r] + \\
\sum_{\mathbf G} \sum_{\mathbf G'} \sum_{\mathbf k} V_{\mathbf G - \mathbf G'} c_{\mathbf k + \mathbf G'} \exp[i(\mathbf k + \mathbf G) \cdot r] = 0
\end{multline}
$$
合并同类项，得到
$$
\exp[i(\mathbf k + \mathbf G) \cdot r] \sum_{\mathbf k} \sum_{\mathbf G} \Big[\left( \frac{\hbar^2}{2m} |\mathbf k + \mathbf G|^2 - \epsilon \right) c_{\mathbf k + \mathbf G} +
\sum_{\mathbf G'} V_{\mathbf G - \mathbf G'} c_{\mathbf k + \mathbf G'} \Big] = 0
$$
即
$$
\sum_{\mathbf k} \sum_{\mathbf G} \left[\left( \frac{\hbar^2}{2m} |\mathbf k + \mathbf G|^2 - \epsilon \right) c_{\mathbf k + \mathbf G} +
\sum_{\mathbf G'} V_{\mathbf G - \mathbf G'} c_{\mathbf k + \mathbf G'} \right] = 0
$$
我们需要求解$\epsilon$，根据以上等式，可写出矩阵形式
$$
\hat M \begin{pmatrix}
c_{\mathbf k + \mathbf G_1} \\
\vdots \\
c_{\mathbf k + \mathbf G_n}
\end{pmatrix} = \epsilon \begin{pmatrix}
c_{\mathbf k + \mathbf G_1} \\
\vdots \\
c_{\mathbf k + \mathbf G_n}
\end{pmatrix}
$$
这意味着特征值$\epsilon$也具有关于$\mathbf G$的周期性：
$$
\epsilon(\mathbf k + \mathbf G) = \epsilon(\mathbf k).
$$
对同一$\mathbf k$，可能具有多个本征能量$\epsilon\_n$，这些能量即称为*能带*(Energy band)。
一维的能带可由一系列曲线表示，二维则是曲面，对三维空间中的能带则通常通过在布里渊区内选择一条指定的路径画图得出。

## 近自由电子近似

我们应用微扰理论研究薛定谔方程的非定态情况，构成近自由电子近似(Nearly free electron approximation / Quasi-free electron approximation)。

### 微扰理论

首先考虑势能为常数的零阶微扰解，此时电子不受势能影响，可视为*自由电子*。
此时薛定谔方程的解，以及本征值为
$$
\phi^{(0)}_{\mathbf q} (\mathbf r) = \frac{1}{\sqrt V} \exp[i \mathbf q \cdot \mathbf r], \quad \epsilon^{(0)}_{\mathbf q} = \frac{\hbar^2 q^2}{2m}.
$$

利用非简并的微扰理论进行一阶和二阶修正：
$$
\begin{aligned}
\epsilon^{(1)}_{\mathbf q} &= \left< \phi^{(0)} \right| \hat V \left| \phi^{(0)} \right> \\
\epsilon^{(2)}_{\mathbf q} &= \sum_{\mathbf q'} \frac{\left| \left< \phi^{(0)} \right| \hat V \left| \phi^{(0)} \right> \right|^2}{\epsilon^{(0)}_{\mathbf q} - \epsilon^{(0)}_{\mathbf q'}} \\
&=\sum_{\mathbf G} \frac{\left| \left< \phi^{(0)} \right| \hat V \left| \phi^{(0)} \right> \right|^2}{\epsilon^{(0)}_{\mathbf q} - \epsilon^{(0)}_{\mathbf {q - G}}}
\end{aligned}
$$
最后一步是根据布洛赫定理得出的。

若$\mathbf q$的能量与$\mathbf q - \mathbf G$的过于接近，即
$$
\frac{\hbar^2 q^2}{2m} = \frac{\hbar^2 |\mathbf q - \mathbf G|^2}{2m} \iff q^2 = |\mathbf q - \mathbf G|^2
$$
此时有
$$
\mathbf q \cdot \frac{\mathbf G}{G} = \frac{G}{2},
$$
即在第一布里渊区的边界（$\mathbf G$的垂直平分线）上，此时由于能量接近，不能使用非简并的微扰理论，而要使用简并的微扰进行计算。

简并的微扰计算较复杂，此处直接给出结论：
$$
\epsilon^{(1)}_{\mathbf q, \pm} = \frac{\hbar^2}{2m} \left[ \frac{G^2}{4} + \delta^2 \pm \sqrt{(G\delta)^2 + \left(\frac{V_G}{\hbar^2/(2m)}\right)^2} \right],
$$
其中$V\_G$是该状态的势能，
$$
\delta = \frac{G}{2} - q.
$$
可见在该点附近有两个分立的能量，且两个能量之间不连续，这种能带叫做*禁带*，禁带的能量大小称为能隙，其中不能存在电子。

## 紧束缚模型

紧束缚模型(Tight binding model)用于描述原子中非价电子（外层电子）的电子状态，这些电子也称为芯层电子、内电子或离子实。
当多个原子复合在一起，形成更加复杂的结构时，这些电子才会发挥作用。

紧束缚模型的基本思想是使用孤立原子的电子波函数的线性组合对复合的电子进行近似，这在化学上称为*轨道杂化*(Hybrid orbital)。
以甲烷分子为例，设碳原子在原点处，而一个氢原子的位置为$(1,1,1)$，则其对应的sp3杂化轨道的波函数可写为
$$
\left|\psi\right> = \frac{1}{2} \left[ \left| \psi_s\right> +  \left|\psi_{px}\right> + \left|\psi_{py}\right> + \left|\psi_{pz}\right>\right].
$$
注意此处展示的是成键杂化轨道，与之对应的还有反键轨道，两者共计八条。
化学中使用这种方式进行计算的模型称为原子轨道线性组合（Linear Combination of Atomic Orbitals, LCAO）模型。

当多个原子成键形成分子时，原子之间的轨道也会发生杂化，形成分子轨道。
最高的被占据的分子轨道(Highest Occupied Molecular Orbital, HOMO)在分子中具有和原子中费米面相似的性质，而该轨道与最低未占据分子轨道（Lowest Unoccupied Molecular Orbital，LUMO）之间的间距，若存在，即为这种分子的能隙（Gap）。

### 紧束缚电子的计算

本节简要说明紧束缚电子模型的计算方式。

在紧束缚模型中，认为电子紧紧围绕在一个原子核附近，因此仅受一个原子核的影响，而晶格中其他原子对其的影响可视为微扰。
对于每个*孤立的*原子，通过[之前的计算]({% post_url quantum-mechanics/2024-04-20-hydrogenic-atoms %})，我们已经知道围绕它的电子是按轨道分立的，即
$$
\hat H_0 \phi_j(\mathbf x) = \epsilon_j \phi_j(\mathbf x), \quad j = s, p, \dots
$$

利用微扰的假设，电子总的波函数可所有远处原子的轨道波函数的线性叠加组成
$$
\psi_{j,k}(\mathbf x) = k \sum_n \phi_j(\mathbf x - n\mathbf a) \exp[i\mathbf k \cdot n\mathbf a],
$$
其中$k$是归一化系数。
每一项具有额外的相位，这是由布洛赫定理给出的。
其解取一阶近似，则具有类似
$$
\epsilon_j(\mathbf k) \approx \epsilon_s + V_{jj} \cos \mathbf k \cdot \mathbf a
$$
的形式，其中
$$V_{jj} = V_{ss} = V_{pp} = \cdots,$$
表示轨道成键对应的势能，即键能。

值得注意的是，在孤立自由原子的情况下，每个原子轨道形成了分离的能级。
而当多个原子形成晶体等更加复杂的结构时，由于不同原子之间的微扰，能量的分布变为连续的，形成了能带。

我们可利用该模型计算一维单原子链中形成的 s-s σ 键的能量。
设原子之间间距为$a$，原子链中共有$N$个原子，则某处的电子波函数为
$$\psi_k(x) = \frac{1}{\sqrt{N}} \sum_{n=1}^N \exp[i k n a] \phi_n(x - n a),$$
其中$k$是倒空间晶格中的位置，我们假设$N$的值很大，因此能够连续取值；此外，根据周期边界条件，$k$应在区间$[-\frac{\pi}{a}, \frac{\pi}{a}]$中。
我们可将其写成本征态的形式，即
$$\left| k \right> = \frac{1}{\sqrt{N}} \sum_{n=1}^N \exp[i k n a] \left| n \right>.$$
现在我们定性的研究哈密顿矩阵中的元素。
我们认为，仅有相邻的两个原子之间能够相互影响，则哈密顿矩阵必为三对角矩阵，根据其物理意义，有
$$\left< n \right| \hat H \left| n \right> = E_0 = E_i - U,\, \left< n + 1 \right| \hat H \left| n \right> = E_1 = V_{ss\sigma}$$
其中$E\_i$是该层的电离能，即电子的势能，而$U$是由于原子相互作用产生的微扰项，$V\_{ss\sigma}$是该σ键的键能。
从而
$$
\begin{aligned}
\left< k \right| \hat H \left| k \right> &= \frac{1}{N} \sum_{n=1}^N \sum_{m=1}^N \exp[ik(n-m)a] \left< m \right| \hat H \left| n \right> \\
&= E_i - U + 2 V_{ss\sigma} \exp[ika] \\
&= E_0 + 2 V_{ss\sigma} \cos ka.
\end{aligned}
$$
{: .exampl}

根据以上计算，有两个特别的轨道值得注意：当$k = 0$时，该处的能量最高，电子很难进入该轨道，这条轨道称为*反键轨道*（Anti-bonding orbital）；当$k = \frac{\pi}{a}$时，能量最低，电子通常位于该轨道中，这条轨道称为*成键轨道*（Bonding orbital）。

在更加复杂的计算中，$E\_1$可能被多种轨道影响，此时该值可通过查表得出，该表格称为*原子间矩阵*（Interatomic matrix）。

## 能带

在零阶微扰下，我们有
$$\epsilon = \frac{\hbar^2 k^2}{2m}$$
多数情况下，需要对该能量进行修正，而我们希望被修正的能带仍然具有简单的形式，此时我们定义*有效质量*(Effective mass)为：
$$
\frac{1}{m_{i,j}^*} = \frac{1}{\hbar^2} \frac{\partial^2 \epsilon(k)}{\partial k_i \partial k_j},
$$
此时修正的能带在一点附近依然具有
$$
\epsilon = \frac{\hbar^2 k^2}{2m^*}
$$
的形式，此时能量是关于$k$的二次函数，故称为局部抛物线能带。

现在研究一维的材料，设材料长度为$L$，单个原胞的长度为$a$，材料中有$N$个原胞，即
$$L = N a.$$
根据正空间与倒空间的关系，这意味着倒空间中具有$N$个$k$点，而由于电子的自旋，其中总共对应的电子数必为偶数。
从而，若单个原胞中的价电子是奇数，则电子必定不能填满最高层能带，从而存在电子与空穴，均能作为载流子，使得该材料能够导电，即形成导体；
相对的，若价电子是偶数，则能够填满能带，而由于禁带的原因，电子不能容易地进入更高的能带而自由移动，这种物质称为绝缘体。

若某绝缘体的能隙较小，则电子在一定情况下能够自发地从价带跳向导带，从而形成半导体。
若半导体在自然条件下即能够发生这种转变，则称为本征半导体(intrinsic semiconductor)。

通过在晶体中掺杂电子数不同的原子，可提供额外的电子以填充其他能带，这种掺杂的物质称为*施主*(donor)，而由于载流子是电子，则形成N型半导体；反之，若掺杂电子数更少的原子，则由空穴承担载流子的作用，这种物质称为*受主*（acceptor），形成P型半导体。
