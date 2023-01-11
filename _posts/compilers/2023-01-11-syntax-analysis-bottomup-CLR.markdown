---
layout: post
title: "语法分析——自底向上方法（CLR、LALR）"
---

## 更强大的LR语法分析器

我们知道，尽管在从LR(0)自动机构造分析表时，SLR(1)文法分析器使用了$\mathrm{FOLLOW}$函数作为向前看符号，其仍不足以识别所有LR(1)文法。
在本文中，我们将继续介绍更强大的LR语法分析器，它们通过在构造自动机时向项中引入向前看符号，使自动机的状态可以保存更多信息。

本文将介绍两个LR语法分析器：
1. 规范LR(1)语法分析器（CLR），这种分析器使用一个很大的项集，即LR(1)项集，来进行处理。
   这种分析器可以处理所有LR(1)文法（更准确地说，实际上是这种分析器定义了LR(1)文法，因此才称为**规范**的）。
   这种分析器是由高德纳（Donald E. Knuth）在1965年首次提出的，他同时定义了LR(k)文法的概念。
   在当时，这种算法因其空间占用过大而未得到普遍应用。
2. 向前看LR语法分析器（LALR），这种分析器既可以使用缩小的LR(1)项集，也可以直接由向LR(0)项集中引入向前看符号构造。
   这种分析器处理的文法比SLR更多（但仍少于CLR），但语法分析表并不显著大于SLR的。
   这是语法分析器生成器常用的算法。

## 规范LR语法分析器

### LR(1)项

回忆一下SLR方法，在那里我们使用$\mathrm{FOLLOW}$函数作为向前看符号，即若当前状态$I_k$包含项$A \to \alpha \cdot$，且下一个符号$a$在$\mathrm{FOLLOW}(A)$中，那么我们就采用这个产生式进行规约并进行状态转移。
但是，我们设当前栈中的可行前缀为$\beta \alpha$，如果在任何最右句型中$\beta A$后面都不可能跟着$a$，也就是说规约后的栈在移入符号$a$后不再是一个可行前缀，那么就不能使用这个产生式进行规约。

我们希望进一步限制进行规约的条件，为此我们在项中额外加入一个向前看符号，现在项记作$[A \to \alpha \cdot \beta, a]$，其中$a$是一个终结符或结束标记，就是向前看标记。
这种项称为LR(1)项。
当$\beta$非空时，这个标记没有作用，因为向前看实际上是由$\mathrm{FOLLOW}$函数指定的。
而当$\beta$为空时，也就是说项形如$[A \to \alpha \cdot, a]$时，我们仅在下一个词法单元为$a$时执行利用这个项的规约。
在整个项集中，这样的$a$的集合一定是$\mathrm{FOLLOW}(A)$的子集，而且很可能是一个真子集。

我们称LR(1)项$[A \to \alpha \cdot \beta, a]$对一个可行前缀$\gamma$**有效**的条件是存在一个推导$S \Rightarrow_{rm}^\* \delta A w \Rightarrow_{rm} \delta \alpha \beta w$，其中$\gamma = \delta \alpha$且$a$是$w$的第一个符号（$w$为空时等于$ \\\$ $）。
相较于LR(0)项，LR(1)项有效的条件加上了对其表达式后面的终结符的约束。

### 构造LR(1)项集族

和构造LR(0)项集族的方法类似，我们仍然利用两个函数$\mathrm{CLOSURE}$和$\mathrm{GOTO}$分别构造“自动机”的状态和转移。

$\mathrm{GOTO}$和LR(0)中的基本相同，只是转移时需要保留项集中的向前看标记而已。
而$\mathrm{CLOSURE}$和LR(0)中最大的区别在于由闭包生成的项的向前看标记是从$\mathrm{FIRST}$中产生的。

我们考虑计算项$[A \to \alpha \cdot B \beta, a]$的闭包。
始终牢记，一个闭包构成了自动机的一个状态，从而对应了一组可行前缀，我们设一个可行前缀为$\gamma$。
由于项在这个闭包中，我们知道存在一个最右推导$S \Rightarrow^*\_{rm} \delta A a x \Rightarrow\_{rm} \delta \alpha B \beta a x$，其对应的可行前缀$\gamma = \delta \alpha$，因此$\delta \alpha B \beta a x = \gamma B \beta a x$。
现在，我们设$\beta a x$可以推导出一个**终结符号串**$by$（$b$是单个终结符号），并设存在产生式$B \to \eta$,那么我们可以继续上文的推导：
$$
S \Rightarrow^*_{rm} \delta A a x \Rightarrow_{rm} \gamma B \beta a x
\Rightarrow^*_{rm} \gamma B b y \Rightarrow_{rm} \gamma \eta b y
$$
回忆一下关于LR(1)有效项的定义，这说明$[B \to \cdot \eta, b]$也是可行前缀$\gamma$的有效项，从而应该出现在闭包中。

接下来我们考虑如何计算出所有的$b$。
不难发现，$b$可能是所有可以从$\beta a x$中推导出的第一个终结符号，因此我们有$b \in \mathrm{FIRST}(\beta a x)$。
根据$\mathrm{FIRST}$的计算规则，我们知道终结符号的集合只有其自身因此不含$\epsilon$，因此$\mathrm{FIRST}(\beta a x) = \mathrm{FIRST}(\beta a)$。

我们用以下算法构造**增广文法**$G^\prime$的$\mathrm{CLOSURE}$：
```cpp
closure = I;
do
{
    bool unchanged = true;
    // 对闭包中每一个项 [A -> α . B β, a] ...
    for(const auto & item : closure)
    {
        // 对每个产生式 B -> γ ...
        for(const auto & prod : productions)
        {
            if(prod.head != *item.dot)
                continue;
            // 构造 βa
            auto str = item.prod.substr(item.dot+1, item.prod.end()) + item.lookahead;
            // 对 FIRST(βa) 中所有终结符号 b...
            for(const auto & symb : FIRST(str))
                // 把项 [B -> . γ, b] 加入闭包中
                closure.insert({prod, prod.body.begin(), symb}), unchanged = false;
        }
    }
}while(!unchanged);
```

用以下算法构造$\mathrm{GOTO}$：
```cpp
// 计算 GOTO(I,X)
Goto = empty_set();
for(const auto & item : I)
{
    // 对每个项 [A -> α . X β, a]
    // 注意点在产生式末尾的情况
    if(*item.dot == X)
        // 把项 [A -> α X . β, a] 加入项集中
        Goto.insert({item.prod, item.dot+1, item.lookahead});
}
Goto = CLOSURE(Goto);
```

最后用以下算法构造项集族：
```cpp
// 以项 [S' -> . S, $] 作为开始
start_prod = *productions.begin();
start_item = {start_prod, start_prod.body.begin(), EOF()}
collections = empty_set();
// 生成 {[S' -> .S, $]} 的闭包
collections.insert(CLOSURE(collection(start_item)));
do{
    bool unchanged = true;
    // 对于所有项集 I ...
    for(const auto & collection : collections)
    {
        // 对于所有文法符号 X ...
        for(const auto & symb : symbols)
        {
            // 计算 GOTO(I,X) 并加入项集族
            auto Goto = GOTO(collection, symb);
            if(Goto.empty()) continue;
            if(!collections.find(Goto))
                collections.insert(Goto), unchanged = false;
        }
    }
}while(!unchanged);
```

我们以一个简单的文法为例模拟这个算法：
$$
\begin{aligned}
    S^\prime \quad &\to \quad S \\
    S \quad &\to \quad C C \\
    C \quad &\to \quad c C \; \vert \; d
\end{aligned}
$$

我们来计算一下 $\\\{ [ S^\prime \to \cdot S, \\$ ] \\\}$ 的闭包：
首先考虑$S$的产生式：$S \to C C$，对应的项为$[S \to \cdot C C, a]$。
然后计算$a$，也就是原产生式点后面的部分（只有结束符 $ \\$ $ ）的$\mathrm{FIRST}$集合中的所有非终结符，只有$ \\$ $。
因此我们把$[S \to \cdot C C, \\$]$加入项集。

然后考虑新加入的项。
考虑$C$的产生式$C \to c C \vert d$。
考虑原来的项点后面的部分，即$C \\$ $。
显然$C$不能产生空串，因此$\mathrm{FIRST}(C\\$) = \mathrm{FIRST}(C) = \\\{ c, d \\\}$。
所以把四个项
$$
\begin{aligned}
    [C \to \cdot c C, c] \\
    [C \to \cdot c C, d] \\
    [C \to \cdot d, c] \\
    [C \to \cdot d, d] \\
\end{aligned}
$$
加入项集中。

新加入的项的点后面都是终结符，没有产生式，因此不能产生新的项了。

这样我们构造出了第一个项集，也是起始项集：
$$
\begin{aligned}
    S^\prime &\to \cdot S &, $ \\
    S &\to \cdot C C &, $ \\
    C &\to \cdot c C &, c/d \\
    C &\to \cdot d &, c/d
\end{aligned}
$$
我们省略了方括号并把产生式和点相同的项缩写在一起。

下面是这个文法的所有项集及其转移。

![](/assets/compilers/LR1-automaton.svg)
{: .center-image}

### 构造LR(1)语法分析表

和LR(0)语法分析表相似，我们也需要利用上面的“自动机”生成一个语法分析表以用于语法分析。
接下来介绍这个算法，其和LR(0)的几乎完全一致，只在规约时有所不同。

我们利用以下方法求出一个文法$G$的LR(1)`ACTION`与`GOTO`表：

1. 构造文法$G$的增广文法$G^\prime$，并构造其LR(1)项集族以及$\mathrm{GOTO}$函数。
2. 决定每个状态$I_i$的`ACTION`表：
   1. 对状态中每个形如$[A \to \alpha \cdot a \beta, b]$的项，$a$为终结符号（即点在终结符号前的项），将`ACTION[i,a]`设为“移入至$\mathrm{GOTO}(I_i, a)$对应状态（即自动机中标号为$a$的边指向的状态）”。
   2. 对状态中每个形如$[A \to \alpha \cdot, a]$（$A \neq S^\prime$）的项（即点在末尾的项），把`ACTION[i,a]`设为“利用$A \to \alpha$规约”。
   3. 如果项集中存在$[S^\prime \to S \cdot, \\$ ]$，那么把`ACTION[i,$]`设为“接受”。
3. 接着构造`GOTO`表：
   对状态$I_i$和每个非终结符号$A$，`GOTO[i,A]`所指向的状态和$\mathrm{GOTO}(I_i, A)$（即标号为$A$的边指向的状态）相同。
4. 所有在上两步中没有填入值的单元格都记为“报错”。
5. 开始状态为根据$[S^\prime \to \cdot S, \\$]$的闭包构造的状态。

我们在构造规约动作时，把向前看符号从$\mathrm{FOLLOW}$中的所有符号变成了项中指定的向前看符号，除此之外几乎完全一致。

## 构造LALR(1)语法分析表


