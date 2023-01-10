---
layout: post
title: "语法分析——自底向上方法（SLR）"
---

## LR语法分析器简述

在接下来的文章中，我们将主要考虑**LR(k)**文法。
正如上一篇文章所讲，其中L表示从左至右，R表示最右推导，而k表示向前看k个符号。
通常我们要么向前看一个符号（LR(1)），要么一个符号也不看（LR(0)），因此我们只考虑这两种情况。

本文中我们将先介绍LR(0)文法相关内容，并以此为基础介绍简单LR文法分析技术（SLR）。

需要注意的是，实践当中通常利用程序生成LR分析器而非人工开发。

## LR(0)语法分析

始终记得我们的例子文法：
$$
\begin{aligned}
E \quad &\to \quad E + T \; | \; T \\
T \quad &\to \quad T * F \; | \; F \\
F \quad &\to \quad (E) \; | \; \mathbf{id}
\end{aligned}
$$

### 项和LR(0)自动机

我们首先介绍如何计算LR(0)语法分析中所用的句柄，即这种语法分析器如何进行移入还是规约的判断。

LR语法分析器维护一些状态，并通过进行状态之间的转移进行移入和规约的判定，就像自动机一样。
对于LR(0)语法分析器来说，这些状态是其文法的LR(0)**项**（Item）的集合，简称**项集**（Collection of items）。
所谓*项*，就是在产生式中添加一个点，用来表示当前的输入可能匹配的位置。
比如，产生式$A \to XY$就能产生三个项：
$$
\begin{aligned}
A \quad &\to \quad \cdot X Y \\
A \quad &\to \quad X \cdot Y \\
A \quad &\to \quad X Y \cdot \\
\end{aligned}
$$
而空产生式只产生一个项$A \to \cdot$。

我们可以用两个指针来表示一个项，第一个指针指向产生式，第二个指针指向点的位置（和C++ STL类似，我们规定指向点后的那个符号）。

我们说点表示当前输出可能匹配的位置，是因为如果状态（项集）中存在一个项$A \to X \cdot Y$，那么说明我们可能已经在输入中看到了$X$，从而期望接下来的输入可以规约出$Y$。
说“可能”是因为一个状态中可能存在多个项。

一组特别的项集，称为*规范LR(0)项集族*，构成了一个有穷自动机的状态。
这个有穷自动机称为*LR(0)自动机*，可以用来指导语法分析器的行为。
这个有穷自动机除了缺少死状态之外几乎是确定的，这就是说其中存在某些状态对某些输入没有对应的转移。
而正如我们将要看到的，前往“死状态”的转换往往对应规约，其他状态对应移入。

### 增广文法、“闭包（Closure）”和“前往（Goto）”函数

为了利用自动机（只能给出移入和规约两个行为）确定是否完成语法分析，我们提出**增广文法**的概念。

文法$G = (V, \Sigma, R, S)$的**增广文法**为$G^\prime = (V^\prime, \Sigma, R^\prime, S^\prime)$。
其中$V^\prime = V \cup \\\{ S^\prime \\\}$，$R^\prime = R \cup \\\{ S^\prime \to S \\\}$。
{: .definition}

增广文法相当于用新的开始符号$S^\prime$代替了原有的开始符号$S$。
当且仅当使用规则$S^\pirme \to S$规约时，才说明完成了语法分析。
接下来计算自动机时，我们会发现仅有输入为 $ \\\$ $ （即终止符）时才会采用这个规约，因此这与之前的定义不矛盾。

---

我们利用闭包（Closure）来构造LR自动机中的状态（即项集）。

设$I$为一项集，那么其闭包，记为$\mathrm{CLOSURE}(I)$，是其超集。
正如我们此前讲过的，如果当前项集含有项$A \to \alpha \cdot B \beta$，那么说明我们已经发现了$\alpha$，并且希望能从输入中发现某个能由$B \beta$推导出的串。
如果又有产生式$B \to \gamma$，我们就会期望发现$\gamma$，因此这个状态也会含有项$B \to \cdot \gamma$。
闭包就是利用这个思路来计算自动机的状态的。

具体而言，我们用以下算法计算某个项集的闭包：
1. 首先把项集中的每个项加入其闭包中；
2. 对每个闭包中的形如$A \to \alpha \cdot B \beta$的项（注意$\alpha$和$\beta$都可以为空），如果存在产生式$B \to \gamma$，且项$B \to \cdot \gamma$不在闭包中，就把它加入；
3. 重复直到不能再添加新的项为止。

我们用以下伪代码描述这个过程：
```cpp
// 计算项集I的闭包
closure = I;
do{
    bool unchanged = true;
    for(const auto & item : closure)
    {
        // 对所有 B -> γ ...
        for(const auto & prod : productions)
        {
            if(prod.head != *(item.dot))
                continue;
            // 将项 B -> . γ 加入闭包中
            auto new_item = {prod, prod.body.begin()};
            if(!closure.find(new_item))
                closure.insert(new_item), unchanged = false;
        }
    }
}while(!unchanged);
```

我们考虑对例子文法的增广：
$$
\begin{aligned}
E^\prime \quad &\to \quad E \\
E \quad &\to \quad E + T \; | \; T \\
T \quad &\to \quad T * F \; | \; F \\
F \quad &\to \quad (E) \; | \; \mathbf{id}
\end{aligned}
$$
计算这个项集的闭包：$\\\{ E^\prime \to \cdot E \\\}$。
按照以上算法，我们先把$E \to \cdot E + T$和$E \to \cdot T$加入闭包；
然后再加入$T \to \cdot T * F$和$T \to \cdot F$；
最后加入$F \to \cdot (E)$和$F \to \cdot \mathbf{id}$。

考虑到闭包计算中的特殊性，我们发现，一个非终结符号的所有产生式对应的项$B \to \cdot \gamma$要么都在闭包中，要么都不在。
更进一步地，我们可以把所有项分成两类：
1. 内核项：所有点不在第一个位置的项和特殊的项$S^\prime \to \cdot S$；
2. 非内核项：处$S^\prime \to \cdot S$之外所有点在第一个位置的项。
所有非内核项都可以由内核项的闭包计算得出，由闭包计算得出的新的项都是非内核项。
上一个例子中除了$E^\prime \to \cdot E$中的所有项都是非内核项。

由于大量非内核项的存在，我们可以简单地用一个布尔数组表示项$B \to \cdot \gamma$在不在项集内。
而保存自动机的状态时，也不需要保存非内核项，因为它们都可以简单地用计算得出。

---

我们利用`GOTO`函数计算自动机的转移。

$\mathrm{GOTO}(I,X)$表示$I$中所有形如$A \to \alpha \cdot X \beta$的项对应的项$A \to \alpha X \cdot \beta$组成的项集的*闭包*。
通俗地说，这个函数表示了自动机在状态为$I$、输入为$X$时转换到的下一个状态。
我们知道自动机的状态实际上是由闭包运算产生的，所以$I$实际上一定是某个项集的闭包，这一点将在生成自动机时得到验证。

这个函数的计算较为简单。

考虑项集$I = \\\{ E^\prime \to E \cdot, E \to E \cdot + T \\\}$，不难发现这个项集的闭包是自己，因为点后要么为空要么为终结符号。
计算$\mathrm{GOTO}(I,+)$。
首先，对应的项为$E \to E + \cdot T$。
然后，计算闭包，得到结果：
$$
\begin{aligned}
E \quad &\to \quad E + \cdot T \\
T \quad &\to \quad \cdot T * F \\
T \quad &\to \quad \cdot F \\
F \quad &\to \quad \cdot (E)\\
F \quad &\to \quad \cdot \mathbf{id}
\end{aligned}
$$

特别地，对存在$S^\prime \to S \cdot$这一项的项集，其对终结符的$GOTO$会导致自动机进入一个特殊的状态，即接受状态，我们接下来会讨论这个问题。

### LR(0) 自动机的构造和使用

简单LR语法分析技术的基础就是LR(0)自动机，因此我们先介绍如何使用LR(0)自动机进行语法分析。

如果已经实现了$\mathbf{CLOSURE}$和$\mathbf{GOTO}$两个函数，那么生成规范LR(0)项集族（即自动机的状态集合）和状态转移都是非常简单的。
```cpp
// 以项 S' -> . S 作为开始
start_prod = *productions.begin();
start_item = {start_prod, start_prod.body.begin()}
canonical_collections = empty_set();
// 生成 {S' -> .S} 的闭包
canonical_collections.insert(CLOSURE(collection(start_item)));
do{
    bool unchanged = true;
    // 对于所有项集 I ...
    for(const auto & collection : canonical_collections)
    {
        // 对于所有文法符号 X ...
        for(const auto & symb : symbols)
        {
            // 计算 GOTO(I,X) 并加入项集族
            auto Goto = GOTO(collection, symb);
            if(Goto.empty()) continue;
            if(!canonical_collections.find(Goto))
                canonical_collections.insert(Goto), unchanged = false;
        }
    }
}while(!unchanged);
```
在向项集族插入一个项集时，也可以把对应的状态转移记录下来，这样之后就不用重新计算了。
这个自动机的开始状态就是$\mathbf{CLOSURE}(\\\{ S^\prime \to \cdot S \\\})$。

我们最开始向项集族中插入的是一个项集的闭包，而$\mathbf{GOTO}$生成的也是闭包，因此每个状态都是一个闭包。

下图就是上文的增广文法生成的自动机。

![](/assets/compilers/LR0-automaton.svg)
{: .center-image}

接下来我们将介绍如何使用这个自动机。
