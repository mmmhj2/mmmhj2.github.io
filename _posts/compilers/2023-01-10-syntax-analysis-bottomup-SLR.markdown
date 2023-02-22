---
layout: single
title: "语法分析——自底向上方法（SLR）"
category: "编译原理"
tags: ["语法分析"]
---

## LR语法分析器简述

在接下来的文章中，我们将主要考虑**LR(k)**文法。
正如上一篇文章所讲，其中L表示从左至右，R表示最右推导，而k表示向前看k个符号。
通常我们要么向前看一个符号（LR(1)），要么一个符号也不看（LR(0)），因此我们只考虑这两种情况。
只考虑这两种情况的原因，除了绝大多数语法只需要向前看至多一个符号就能处理之外，还有实际上任何LR(k)文法都可以转化成LR(1)文法。

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
当且仅当使用规则$S^\prime \to S$规约时，才说明完成了语法分析。
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
3. 
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
```cpp
// 计算 GOTO(I,X)
Goto = empty_set();
for(const auto & item : I)
{
    // 对每个项 A -> α . X β
    // 注意点在产生式末尾的情况
    if(*item.dot == X)
        // 把项 A -> α X . β 加入项集中
        Goto.insert({item.prod, item.dot+1});
}
Goto = CLOSURE(Goto);
```

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

如果已经实现了$\mathrm{CLOSURE}$和$\mathrm{GOTO}$两个函数，那么生成规范LR(0)项集族（即自动机的状态集合）和状态转移都是非常简单的。
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
这个自动机的开始状态就是$\mathrm{CLOSURE}(\\\{ S^\prime \to \cdot S \\\})$。

我们最开始向项集族中插入的是一个项集的闭包，而$\mathrm{GOTO}$生成的也是闭包，因此每个状态都是一个闭包。

下图就是上文的增广文法生成的自动机。

![](/assets/compilers/LR0-automaton.svg)
{: .center-image}

接下来我们将介绍如何使用这个自动机。

---

这个自动机的开始状态为$\mathrm{CLOSURE}(\\\{ S^\prime \to \cdot S \\\})$。
每当输入为一个词法单元$a$，就查找当前状态是否有标号对应的出边。
如果有，就移入这个词法单元并进行状态转移；
如果没有，就利用这个项集中的项进行规约。
如果一个文法是LR(0)的，那么可用的项只有一个。

和移入-规约语法分析不同，我们使用**状态**做为栈中的内容，而非文法符号。
因为状态含有比文法符号更多的信息。
进行状态转移时，直接把新的状态压入栈即可；
进行规约时，先把规约使用的符号出栈，并从栈顶状态把规约产生的非终结符号作为新的输入，重复上述步骤。
寻找新的状态时，总是从栈顶状态开始转移。

以上述自动机和输入`id * id`为例讲解这个自动机的使用。

- 首先，自动机位于开始状态，栈为`$ 0`，输入为`id * id $`。
下一个符号为`id`，开始状态有这条出边，因此转移到状态5。
现在栈为`$ 0 5`，输入为`* id $`。
- 状态5没有任何出边，因此选择项$F \to \mathbf{id} \cdot$进行规约。
自动机回到状态0，并沿`F`这条边转移。
因此，现在栈为`$ 0 3`，输入为`* id $`。
- 状态3也没有任何出边，因此选择项$T \to F \cdot$进行规约。
现在栈为`$ 0 2`，输入为`* id $`。
- 接着分别沿`*`和`id`进行状态转移，栈为`$ 0 2 7 5`，输入为空。
- 接着使用$F \to \mathbf{id} \cdot$进行规约。
首先把状态5出栈，然后沿状态7寻找标号为`F`的转移，进入状态10,
栈为`$ 0 2 7 10`。
- 状态10没有出边，因此使用$T \to T * F \cdot$进行规约。
把状态`2 7 10`弹出栈，然后寻找栈顶（状态0）上标号为`T`的出边，指向状态2。
现在栈为`$ 0 2`。
- 状态2没有对应`$`的出边，但是其有两个项：$E \to T \cdot$和$T \to T \cdot * F$。
显然第二个项对应的是一个状态转移而非规约，因为其点不在产生式末尾，所有我们使用第一个项进行规约。
现在栈为`$ 0 1`。
- 现在接受终止符并转移到接受状态。

## LR语法分析器

我们可以不显式地维护这个自动机，而是使用查表的方式进行语法分析。
这种分析方式和之前讲过的不使用递归的LL分析非常相似，又结合了移入-规约分析器的特点。
特别值得注意的是，在这种分析器中，栈中保存的实际上是**状态**而非单个文法符号。
在我们将要介绍的SLR、规范LR（Canonical LR, CLR）和向前看LR（Look-ahead LR, LALR）语法分析器中，栈中都只保存状态。
SLR、CLR和LALR共用上文所述的语法分析器的框架，即存在一个输入缓冲区、一个栈和一张表格。
这个表格都是由某种自动机构造得到的，三者的区别就是自动机的构造方式不同，这是因为CLR和LALR都是处理的LR(1)文法，因此需要保存向前看符号。

我们需要两张表格来驱动LR语法分析器：
第一张表格，称为`ACTION`，用来决定语法分析器的采取的行动；
第二张表格，称为`GOTO`，用来决定发生规约后向栈顶推入的状态（即自动机转移到的状态）。

当语法分析器的栈顶状态为$s$，而下一个词法单元为$a$时，语法分析器查阅`ACTION[s,a]`以决定下一步行动：

1. 若`ACTION[s,a]`为“移入至状态`s'`”(简写为`ss'`，如`s1`)，那么语法分析器消耗这个词法单元并将状态`s'`压入栈中。
2. 若`ACTION[s,a]`为“利用`i`号产生式规约”（简写为`ri`,如`r4`），那么语法分析器从栈中弹出`i`号产生式$A \to \beta$的产生式体那么多的状态，然后查询`GOTO[s',A]`（**新状态**的`GOTO`）的值并将其压入栈中，其中`s'`为现在的栈顶的状态，`A`为产生式头部。
   此时不调用词法分析器消耗词法单元。
3. 若`ACTION[s,a]`为接受（简写为`acc`），那么语法分析器宣布语法分析顺利完成。
4. 若`ACTION[s,a]`为错误（通常留空），那么报告一个错误并进行错误恢复。

其代码框架如下：
```cpp
// 压入开始状态
stk = empty_stack();
stk.push(s0);
// 读取第一个词法符号
a = lexer.next_token();
lexer.consume_token();

while(true)
{
    auto s = stk.top();
    if(ACTION[s][a].isShift())
    {
        stk.push(ACTION[s][a].shiftTo);
        a = lexer.next_token();
        lexer.consume_token();
    }
    else if(ACTION[s][a].isReduce())
    {
        const auto & prod = ACTION[s][a].reduceTo;
        std::for_each(prod.body.begin(), prod.body.end(), [&stk]{stk.pop();});
        stk.push(GOTO[stk.top()][prod.head]);
        prod.process();
    }
    else if(ACTION[s][a].isAccept())
        return true;
    else
        throw SyntaxError();
}
```

## 构造SLR语法分析器

我们此前已经介绍过一个基于自动机的LR(0)语法分析方案了，接下来我们介绍一个基于这个自动机的LR(1)分析方案：SLR。

我们利用以下方法求出一个文法$G$的SLR`ACTION`与`GOTO`表：

1. 利用此前介绍的算法求出这个文法的每个非终结符的$\mathrm{FOLLOW}$函数。
2. 构造文法$G$的增广文法$G^\prime$，并构造其规范LR(0)项集族以及$\mathrm{GOTO}$函数。
3. 决定每个状态$I_i$的`ACTION`表：
   1. 对状态中每个形如$A \to \alpha \cdot a \beta$的项，其中$\alpha$和$\beta$可以为空，$a$为终结符号（即点在终结符号前的项），将`ACTION[i,a]`设为“移入至$\mathrm{GOTO}(I_i, a)$对应状态（即自动机中标号为$a$的边指向的状态）”。
   2. 对状态中每个形如$A \to \alpha \cdot$（$A \neq S^\prime$）的项（即点在末尾的项），对$\mathrm{FOLLOW}(A)$中的所有终结符号$a$，把`ACTION[i,a]`设为“利用$A \to \alpha$规约”。
   3. 如果项集中存在$S^\prime \to S \cdot$，那么把`ACTION[i,$]`设为“接受”。
4. 接着构造`GOTO`表：
   对状态$I_i$和每个非终结符号$A$，`GOTO[i,A]`所指向的状态和$\mathrm{GOTO}(I_i, A)$（即标号为$A$的边指向的状态）相同。
   我们在构造$\mathrm{GOTO}$函数的时候提到过，其原像和像都是项集的闭包，从而都是这个自动机的状态。
5. 所有在上两步中没有填入值的单元格都记为“报错”。
6. 开始状态为根据$S^\prime \to \cdot S$的闭包构造的状态。

如果在LR语法分析中，其表是用上面这个算法生成的，那么称其为SLR(1)分析表。
虽然这个算法是基于LR(0)自动机的，其使用了$\mathrm{FOLLOW}$函数作为向前看符号来生成分析表，因此其分析的实际上是LR(1)文法的子集。

我们接着考虑增广文法：
$$
\begin{aligned}
E^\prime \quad &\to \quad E \\
E \quad &\to \quad E + T \; | \; T \\
T \quad &\to \quad T * F \; | \; F \\
F \quad &\to \quad (E) \; | \; \mathbf{id}
\end{aligned}
$$
假设除$E^\prime \to E$以外的产生式已经按顺序标号（注意带有$\vert$的是两个产生式）。

之前我们已经计算过其LR(0)自动机了。

考虑项集$I_0$，这里只列出可以产生`ACTION`项的产生式：
$$
\begin{aligned}
F \quad &\to \quad \cdot ( E ) \\
F \quad &\to \quad \cdot \mathbf{id}
\end{aligned}
$$
根据自动机中的边，我们在`ACTION[0,(]`中填入`s4`；在`ACTION[0,id]`中填入`s5`。
然后计算`GOTO`。
根据自动机中的边，我们在`GOTO[0,E]`填入`1`，在`GOTO[0,T]`填入`2`，在`GOTO[0,F]`填入`3`。

接下来考虑项集$I_2$，作为例子，我们只考虑产生规约行为的项，即$E \to T \cdot$。
计算$\mathrm{FOLLOW}(E)=\\\{ \\$, \+, ) \\\}$，回忆一下这相当于计算所有可能跟在$E$后面的终结符号。
因此我们在`ACTION[2,$]`、`ACTION[2,+]`和`ACTION[2,)]`中填入`r2`，即使用$E \to T$规约。

每一个可用SLR(1)分析器分析的文法必然是无二义性的，但是存在无二义性却不能用SLR(1)分析器分析的文法。
这是因为SLR(1)分析器的状态划分过于粗大，因此一个状态中的信息不够进行判定。
我们说SLR(1)分析器分析的文法是LL(1)文法的一个子集。
需要注意的是，可能存在一些文法，尽管无二义性，但是不能用任何LR语法分析器分析。

## 可行前缀

我们知道，在进行LR语法分析时，栈中一定表示的是某个最右句型的前缀。
然而，并非所有最右句型的前缀都可以出现在栈中，考虑最右推导：
$$
E \Rightarrow^*_{rm} F * \mathbf{id} \Rightarrow_{rm} (E) * \mathbf{id}
$$
栈中不可能出现$(E)\*$，这是因为$(E)$是一个句柄，因此一旦出现就会被规约。
我们称可能出现在栈中的最右句型的前缀为**可行前缀**。

一个**可行前缀**是一个最右句型的前缀，且这个前缀没有越过该*最右句型*的*最右句柄*的*右端*。
{: .definition}

LR(0)自动机可以识别所有可行前缀，因此基于其的SLR分析方法也可以利用可行前缀进行判断。

如果存在推导$S \Rightarrow^\*\_{rm} \alpha A w \Rightarrow\_{rm} \alpha \beta\_1 \beta\_2 w$，那么我们称项$A \to \beta\_1 \cdot \beta\_2$对可行前缀$\alpha \beta\_1$有效，这样的项称为有效项。
通常一个项可以对多个可行前缀有效。
当我们在语法分析器的栈中找到$\alpha \beta\_1$时，如果$\beta\_2 \neq \epsilon$，那么说明句柄尚未完全进入栈中，我们应该继续移入。
如果$\beta\_2 = \epsilon$，那么我们应该选择规约。
如果有多个有效项要求对同一个可行前缀执行不同的操作，那么就会发生冲突。
有些这样的冲突可以通过向前查看更多的符号得到解决，有些则不能。
在SLR语法分析器中，我们通过查看下一个符号能不能出现在$A$的右边（即是否在$\mathrm{FOLLOW}$集合中）来做出这个决定。

LR语法分析的有效性依赖于下面这个定理：

如果在LR(0)自动机中，从初始状态沿着标号连接起来为可行前缀$\gamma$的路径到达某个状态，那么这个状态对应的项集就是这个前缀的所有有效项之集合。
{: .theorem}

### LR(0)自动机和NFA

如果我们把项本身，而非项集，看作一个状态，我们就可以构造出一个能识别所有可行前缀的NFA。

具体而言，对每个形如$A \to \alpha \cdot X \beta$的项，在其和$A \to \alpha X \cdot \beta$之间添加一个标号为$X$的边。
对每个形如$A \to \alpha \cdot B \beta$的项，在其和$B \to \cdot \gamma$之间添加一条标号为$\epsilon$的边。

那么，项集$I$的闭包*恰好对应这个NFA中项集中所有项对应的状态的ε-闭包*。
实际上，将子集构造法应用在NFA上，其形成的每一个新状态对应的都是LR(0)自动机种的一个项集的状态（假设文法已经增广）。
这可以利用归纳法说明。
首先，考察开始状态，NFA中开始状态的ε-闭包恰好对应LR(0)自动机中的起始项集，因此使用子集构造法构造的DFA的开始状态对应LR(0)自动机的起始项集。
然后，考察状态转移，不难发现计算LR(0)自动机时计算$\mathrm{GOTO}$函数的方法和子集构造法中构造DFA的方法一致，因此每个产生的子集也对应一个项集。
