---
layout: single_legacy
title: "语法分析——自底向上方法（CLR、LALR）"
category: "编译原理"
tags: ["语法分析"]
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
{: .align-center}

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

下面是这个文法的`ACTION`和`GOTO`表，我们假设产生式已经按顺序标好号。按照定义，表头是是终结符号表示`ACTION`，非终结符号表示`GOTO`。

| | c | d | $ | S | C |
|---|---|---|---|---|---|
|0|s3|s4||1|2|
|1|||ACC|
|2|s6|s7|||5|
|3|s3|s4|||8|
|4|r3|r3||
|5|||r1|
|6|s6|s7|||9|
|7|||r3|
|8|r2|r2||
|9|||r2|

## 构造LALR(1)语法分析表

LALR分析技术对CLR分析技术的简化基于以下这项显然的观察：
CLR比起SLR要使用更多的状态，但是这些多出来的状态是因为项的*向前看符号*不同而产生的，而不是因为项的**核心**（即产生式和点）不同而产生的。

比如，考虑上述例子中的状态$I_4$和$I_7$。
这两个状态的项集完全一样，而只有向前看符号不同，因此如果是LR(0)自动机，它们会在同一个状态之中。

那么，如果我们把这两个状态合并，是否会导致语法分析器不能进行分析呢？
为了回答这个问题，我们继续考虑上面的文法。

注意到这个文法实际上是正则的，对应的正则表达式为`c*dc*d`。
当输入为`cc...cdcc...cd`时，分析器首先读入第一组`cc...cd`，然后在读入`d`后进入状态4。
此时，当且仅当后面的词法单元为`c`或`d`时才进行规约，而如果输入终止了，由于向前看符号中没有`$`，因此会发生错误。
这是正确的，因为这个文法并不识别形如`cc...cd`的句型。
然后，语法分析器继续读入第二组`cc...cd`，并进入状态7。
此时，当且仅当下一个符号为`$`时，才利用这个产生式进行规约，否则报告错误。
这也是正确的，因为这个文法并不识别形如`cc...cdcc...cdcc...`的句型。

如果我们把这两个状态合并，结果是并不会影响识别的效果。
合并后的项集变为$[C \to d \cdot, c/d/\\$ ]$，也就是对任意输入进行规约。
看上去在有些时候这个语法分析器会错误地使用规约，比如在输入为`ccd`或`ccdccdc`时会错误地使用`上述产生式，但实际上错误仍会被发现。
实际上，可以证明，在语法分析器移入新的词法单元之前，错误一定会被发现，因为这不再是任何一个可行前缀。

更一般地说，我们可以寻找具有**相同核心**的项集，并把它们合并成一个新的项集，然后把所有状态转移也相应地修改。
这样的合并不会产生移入/规约冲突，因为移入和规约的决定和项中的向前看符号无关，但是可能会产生新的规约/规约冲突。
如果新构造的项集不产生规约/规约冲突，那么我们称这个文法是**LALR(1)**的。

我们使用下面这个算法，为输入文法$G$先构造规范LR(1)项集，然后转化成LALR项集。

1. 构造输入文法的增广文法$G^\prime$。
2. 构造LR(1)项集族。
3. 对项集族中的每个核心，找出所有相同核心的项集，并把它们替换为其并集。
4. 利用为LR(1)文法构造`ACTION`表的算法为新的项集构造这个表。
   如果存在冲突，那么这个文法就不是LALR的。 
   我们知道$\mathrm{GOTO}(I,X)$函数只由项集$I$的核心决定，因此合并的项集的$\mathrm{GOTO}$函数的值必然相同，因此我们可以在算法中安全地使用LR(1)项集族的$\mathrm{GOTO}$函数，只需要注意指向的状态为合并后的状态即可。
5. 构造`GOTO`表。
   和上一条的推论相同，我们也可以直接使用原项集族的$\mathrm{GOTO}$函数，只需要注意指向的状态为合并后的状态（即应指向的状态是原指向状态的所有有相同核心的状态的合并状态）即可。

比如对于那个已经生成了LR(1)项集的文法，我们可以把状态3、6合并，4、7合并，8、9合并，然后生成语法分析表。

下面是例子文法的LALR分析表：

||c|d|$|S|C|
|---|---|---|---|---|---|
|0|s36|s47||1|2|
|1|||ACC|||
|2|s36|s47|||5|
|36|s36|s47|||89|
|47|r3|r3|r3|
|5|||r1|||
|89|r2|r2|r2|

### 高效构造方法

我们知道SLR语法分析器的状态数和分析表远小于CLR的。
可以证明，SLR语法分析器的分析表总是和LALR的一样大。
因此，相较于CLR，LALR的分析表小得多。
对于C语言这样的典型例子，CLR的状态数能比LALR的大上一个数量级。
因此，我们希望有一种算法可以直接计算出LALR的分析表，而不用先生成LR(1)项集族。
我们把这个方法分成几个步骤：
1. 首先我们只用**内核项**（即点不在产生式最左边，且不为$S^\prime \to \cdot S$或$[S^\prime \to \cdot S, \\$]$的项）来表示一个项集。
   我们可以用这种办法表示任何LR(0)或LR(1)项集，因为其余的项都可以用对应的闭包运算生成。
2. 使用一个过程生成这些内核项的向前看符号，从而把LR(0)项集的内核转化为LALR(1)项集的内核。
3. 生成内核项的闭包，并把它们当作LALR(1)项集。
4. 把这些项集当作LR(1)项集，并利用上述算法生成语法分析表。

#### 确定向前看符号

我们考虑如何为LALR项集J中的LR(0)项$B \to \gamma \cdot \delta$构造向前看符号。
我们将介绍可以把向前看符号添加到LR(0)项上的条件，并把向前看符号的产生分成两种类型：“自发生成”的和“传播”的。

如果存在一个包含内核项$[A \to \alpha \cdot \beta, a]$的项集$I$，满足$J = \mathrm{GOTO}(I,X)$，
且$[B \to \gamma \cdot \delta, b]$始终包含在$\mathrm{GOTO}(\mathrm{CLOSURE}([A \to \alpha \cdot \beta, a]),X)$中，
此时，若$a \neq b$，那么称这个向前看符号$b$是**自发生成的**。
否则，若$a = b$，那么称这个向前看符号$b$是从$[A \to \alpha \cdot \beta, a]$**传播的**。

值得注意的是所有具有相同核心的项的向前看符号要么都从一个项传播到另一个项，要么都不传播。
我们可以利用这个性质来确定哪些向前看符号是生成的，哪些是传播的。
算法非常简单，我们用一个向前看符号不在字母表中的项生成闭包进行检测即可。
下面这个算法用一个LR(0)项集的内核以及一个给定的文法符号$X$计算出所有$\mathrm{GOTO}(I,X)$中的向前看符号是传播的还是生成的，如果是自发生成的，则给出生成的符号。
```cpp
// 对LR(0)内核中每个项 A -> α . β
for(const auto & lr_item : kernel)
{
    // 生成LALR项[A -> α . β， #]，其中#是一个不在字母表中的特殊符号
    closure = CLOSURE({lr_item.prod, lr_item.dot, symbols.end()});
    // 对于所有形如 B -> γ . X δ 的项......
    for(const auto & lalr_item : closure)
    {
        if(*lalr_item.dot != X) continue;
        // 如果向前看符号为#，说明发生了传播
        if(lalr_item.lookahead == symbols.end())
            declare_propagation(lr_item, lalr_item);
        // 否则发生了生成
        else
            declare_generation(lr_item, lalr_item, lalr_item.lookahead);
    }
}
```

在这个算法中，我们没有显式地计算$\mathrm{GOTO}(I,X)$，而是直接检查闭包中的每一项后面是否为$X$。

现在，我们可以给出添加向前看符号的方法了。
我们从$[S^\prime \to \cdot S, \\$]$开始，生成所有的“自发生成”的向前看符号，然后不断传播它们即可。

#### 生成LALR内核

下面给出了一个这样的算法，生成文法$G$的LALR项集族的内核：
1. 首先进行增广，生成增广文法$G^\prime$。
2. 构造其LR(0)项集族的内核。
   可以用之前的方法生成其全部项集族，然后删去非内核项，也可以只保留内核项，然后在需要时再计算其闭包。
3. 用此前确定向前看符号的方法，对每一对内核和文法符号确定自发生成的向前看符号和传播关系。
4. 利用动态规划进行向前看符号的传播：
   1. 初始化表格，以每个项为一行，第一列填上所有该项自发生成的向前看符号；
   2. 沿着传播关系，在第二列填上所有自发生成的和由第一列传播来的符号；
   3. 用第二列代替第一列，重复第二步直至不能再更新向前看符号为止。

生成内核之后，计算闭包即可得到所有LALR项集，然后利用之前提到的方法即可构造出语法分析表。

## 使用二义性文法

我们在这节中介绍不消除文法二义性而允许LR语法分析器处理二义性文法的几个技巧。
我们可以限制语法分析器的行为，从而使其不再陷入冲突，而不用修改文法以消除其二义性。

### 利用优先级和结合性

我们在之前以及介绍过利用优先级和结合性修改文法以消除其二义性的方法。
现在，我们可以通过直接指明运算的优先级和结合性在不修改文法的情况下消除LR分析器的冲突。

考虑文法
$$
E \to E + E \; \vert \; E * E \; \vert \; (E) \; \vert \; \mathbf{id}
$$
这个文法是具有二义性的。

当输入为$\mathbf{id} + \mathbf{id} * \mathbf{id}$时，SLR语法分析会在下一格局中产生移入/规约冲突：
栈为`$ E + E`，输入为`* id $`。
我们直接用文法符号代替了状态。
此时语法分析器既可以选择移入，也可以选择规约。
如果`+`的优先级高于`*`，那么应该选择规约；
而若`*`的优先级高于`+`，那么应该选择移入。
我们可以手动干预语法分析表以解决这个冲突。

其次，当输入为$\mathbf{id} + \mathbf{id} + \mathbf{id}$，语法分析器仍陷入移入/规约冲突。
如果`+`是左结合的，那么应该选择规约；
而若其为右结合的，那么应该选择移入。

### 悬空-else问题

回忆一下，悬空else问题实际上对应下面这个格局：
栈为`$ ... if stmt then stmt`，输入为`else ... $`。
此时仍然产生了一个移入/规约冲突。

如果我们规定`else`总是和最近的`if...then`匹配（这是最常见的情况），那么我们应该选择移入`else`。

## 错误处理

对于LR语法分析器，其总是在查询`ACTION`表时发现语法错误。
对CLR语法分析器，其发现语法错误时不会进行任何多余的动作；
而对SLR和LALR分析器，其可能进行多余的规约动作，但绝对不会把错误的符号移入栈中。

恐慌模式的错误恢复可以用以下方法实现：
我们规定一组非终结符号，通常表示表达式、语句或语句块。
如果发生语法错误，那么从栈顶向下扫描，并不断弹出栈顶，栈顶为一种特殊的状态。
这种状态的`GOTO`表项在对应规定的那组符号之一的位置应该有值。
然后我们丢弃输入符号直到发现一个可以出现在那个符号后面的词法单元为止（通常为逗号、分号或各种右括号）。
然后将`GOTO`目标压入栈，继续进行语法分析。
这种恢复方式相当于消除所有当前正在分析的状态和其后可能的输出，并假装以及分析完了那个非终结符号。

短语层次的错误恢复自由度较大，此处不再阐述。

总的说来，在LR语法分析中，通过查看语法分析表，很容易确定语法分析器期望找到哪些词法单元，而输入又是哪些词法单元，从而针对性地构造错误恢复程序。
