---
layout: post
title: "语法分析——自顶向下方法"
---

$$
\newcommand\qatoq{\quad &\to \quad}
\newcommand\qtoq{\quad \to \quad}
\newcommand\gor{\; | \;}
$$

## 总述

本文将介绍如何利用自顶向下方法进行语法分析。
所谓自顶向下，就是说在构造语法分析树时，按照深度优先先序遍历的方式进行构造。
也就是说，先构造根节点，然后递归地展开最左下的（非终止符）叶子节点。

解决自顶向下语法分析的关键在于如何选择正确的产生式：
一个非终止符通常是多个产生式的头部，如何选择正确的产生式来展开根节点？

对于有些文法，我们可以构造**向前看**k个符号就能确定选择产生式的预测分析器。
这种文法叫做`LL(k)`文法。
第一个`L`表示从左到右查看输入，第二个`L`表示进行最左推导。

我们先给出最通用的**递归下降法**，再研究几个可以用于预测分析的函数，最后给出针对`LL(1)`文法的**预测分析法**。

## 递归下降法

递归下降法非常简单，在人工编写的语法分析器里非常常见。
我们假设对每个非终结符都有一个函数用来展开以其为根节点的子树，那么每个函数都长成类似下面的样子：
```cpp
bool A()
{
    // 保存现在的输入指针便于回溯
    auto ptr = lexer.current_input_ptr();
    // 选择A为头部的产生式
    for(const auto & prod : A_productions)
    {
        bool succeeded = false;
        for(const auto & symb : prod.body)
        {
            if(!symb.isTerminal)
                succeeded = symb.process(); // 调用对应非终结符的处理函数
            else if(lexer.next_token() == symb)
                succeeded = true, lexer.consume_token();
            
            // 发生错误则尝试另一个产生式
            if(!succeeded)
                break;
        }
        
        if(succeeded)
            return true;
        lexer.reset_input_ptr(ptr);
    }
    return false;
}
```

这个回溯的递归下降的语法框架使用于所有上下文无关文法，但如果文法不是`LL(k)`的（比如含有左递归），那么可能会陷入无限递归中，最终栈溢出。
除此之外，带有回溯的递归下降的语法分析器的时间复杂度是指数级的，因此实际上很少使用这种分析器。
对大部分文法，我们不需要回溯，因此可以消去所有回溯的内容：
```cpp
void A()
{
    // 按照某种规则选择A为头部的产生式
    const auto & prod = select_A_production();
    
    for(const auto & symb : prod.body)
    {
        if(!symb.isTerminal)
            symb.process();
        else if(lexer.next_token() == symb)
            lexer.consume_token();
        else
            throw SyntaxError();
    }
}
```
在此处，我们没有给出选择选择产生式的规则。
实际上这个规则在基于表的预测分析器中也有使用，我们会在之后介绍这样的规则。

我们在这里引入GCC的C语言语法分析器作为例子。
GCC原来使用自动工具（YACC）生成语法分析器。
但是鉴于C语言的二义性（如`x * y`既可以解释成乘法，也可以解释成指针声明），自动工具难以应付，因此在2004年前后便转为使用递归下降分析了。
以下是从[第一个版本](https://gcc.gnu.org/legacy-ml/gcc-patches/2004-10/msg01969.html)截取的部分代码，可以发现其结构正如上面所述。
```c
/* 处理“翻译单元”（translation unit）,其产生式为
    translation-unit ::= 
    external-definition 
    | translation-unit external-definition
    （注意此处的左递归）
*/
static void
c_parser_translation_unit (c_parser *parser)
{
  if (c_lexer_next_token_is (parser->lexer, CPP_EOF))
    {
      if (pedantic)
	pedwarn ("ISO C forbids an empty source file");
    }
  else
    {
      while (c_lexer_next_token_is_not (parser->lexer, CPP_EOF))
	{
	  void *obstack_position = obstack_alloc (&parser_obstack, 0);
	  ggc_collect ();
	  c_parser_external_declaration (parser); // 调用对应非终结符的处理函数
	  obstack_free (&parser_obstack, obstack_position);
	}
    }
}

/* 处理“外部定义”（external declaration）,其产生式为
   external-declaration ::=
    function-definition
    | declaration
*/

static void
c_parser_external_declaration (c_parser *parser)
{
  if (c_lexer_next_token_is_keyword (parser->lexer, RID_EXTENSION))
    {
      int ext;
      SAVE_EXT_FLAGS (ext);
      c_lexer_consume_token (parser->lexer);
      c_parser_external_declaration (parser); // 调用对应非终结符的处理函数
      RESTORE_EXT_FLAGS (ext);
    }
  else if (c_lexer_next_token_is_keyword (parser->lexer, RID_ASM))
    {
	  // 调用对应非终结符的处理函数（内联汇编，GCC拓展）
      c_parser_asm_definition (parser); 
    }
  else
    {
	  // 调用对应非终结符的处理函数（定义与函数定义）
      c_parser_declaration_or_fndef (parser, true, true, false, true); 
    }
}
```

## 预测分析法

$
\newcommand\FIRST{\mathrm{FIRST}}
\newcommand\FOLLOW{\mathrm{FOLLOW}}
$

### FIRST和FOLLOW函数

我们介绍两个用于预测分析的函数：$\FIRST$和$\FOLLOW$。

$\FIRST(\alpha)$是指所有能从指定文法符号中推导出的串的第一个符号的集合。
如果存在推导$\alpha \Rightarrow^\* c \gamma$，那么$c$就在$\FIRST(\alpha)$之中。
如果$\alpha$能够推导出空串，那么$\epsilon$也在$\FIRST(\alpha)$之中。

这个函数的应用也非常简单。
考虑文法$A \to \alpha \| \beta$。
如果$\FIRST(\alpha)$和$\FIRST(\beta)$的交集为空集，那么只要读取一个词法单元，并确定其在哪个集合之中，就可以确定采用哪个生成式了。

我们不断用下面这个算法计算$\FIRST(\alpha)$，直到没有新的元素加入为止：
1. 如果$X$是一个终结符号，那么$\FIRST(X) = \\\{X\\\}$。
2. 如果$X$是一个非终结符号，且存在一个产生式$X \to Y\_1 Y\_2 \dots Y\_k, \; k \ge 1$。
考虑所有$1 \le i \le k$，如果满足$\epsilon \in \FIRST(Y_1) \cap \FIRST(Y_2) \cap \cdots \cap \FIRST(Y_{i-1})$，
这就是说，$Y_1 Y_2 \dots Y_{i-1} \Rightarrow^\* \epsilon$，
那么就把$\FIRST(Y_i)$加入$\FIRST(X)$中。
3. 如果存在产生式$X \to \epsilon$，那么把$\epsilon$加入$\FIRST(X)$中。

这个算法可以用来计算任何串$Y = X_1 X_2 \dots X_n$的$\FIRST$集合。
首先把$\FIRST(X_1)$中的所有非$\epsilon$元素加入$\FIRST(Y)$中。
如果$\epsilon \in \FIRST (X_1)$，那么再把$\FIRST(X_2)$中所有非$\epsilon$元素加入$\FIRST(Y)$中。
如果$\epsilon \in \FIRST (X_2)$，那么再把$\FIRST(X_3)$中所有非$\epsilon$元素加入$\FIRST(Y)$中，以此类推。
最后，如果$\epsilon \in \FIRST(X_n)$，那么把$\epsilon$加入$\FIRST(Y)$中。

特别地，$\FIRST(\epsilon) = \\\{ \epsilon \\\}$，这可由定义推出。

---

接着我们介绍$\FOLLOW$函数。
这个函数$\FOLLOW(A)$表示在某些句型中可以紧跟在$A$后面的终结符号的集合。
如果$a \in \FOLLOW(A)$，那么说明存在推导$S \Rightarrow^\* \alpha A a \beta$，其中$\alpha$和$\beta$为任意文法符号串。
如果在某些句型中$A$位于最右边，那么我们把一个表示终结的特殊符号，记为$\\$ $，加入其中。

计算所有非终结符号$A$的$\FOLLOW(A)$时，不断应用以下方法直至不能在任何一个符号的$\FOLLOW$集合中加入新的符号为止。
1. 把结束符号$\\$ $加入$\FOLLOW(S)$中，其中$S$表示开始符号。
2. 如果存在产生式$A \to \alpha B \beta$（$\beta$非空），那么$\FIRST(\beta)$中所有除$\epsilon$之外的元素都加入$\FOLLOW(B)$中。
3. 如果存在产生式$A \to \alpha B$或$A \to \alpha B \beta$，其中$\FIRST(\beta)$包含$\epsilon$，那么将$\FOLLOW(A)$加入$\FOLLOW(B)$中。

### LL(1)文法

接下来我们介绍一种特别的文法，即`LL(1)`文法。
我们在上文中已经讲过，如果只需要一个向前看符号就能确定选择哪个产生式，就把这个文法称作`LL(1)`文法。
大部分程序语言足以用`LL(1)`文法描述，但是所有左递归及二义性的文法都不可能是`LL(1)`的。

我们形式化地描述`LL(1)`语言的判定方法：

一个文法$G$是`LL(1)`的，当且仅当对于其中每一对头部相同的产生式$A \to \alpha \| \beta$，满足以下条件：
一）不存在终结符号$a$使得$\alpha$和$\beta$都能推导出以$a$开头的串。
二）$\alpha$和$\beta$中只有至多一个可以推导出空串$\epsilon$。
三）如果$\beta \Rightarrow^\* \epsilon$，那么$\alpha$不能推导出任何以$\FOLLOW(A)$中的终结符号开头的串；
同理，如果$\alpha \Rightarrow^\* \epsilon$，那么$\beta$也不能推导出任何以$\FOLLOW(A)$中的终结符号开始的串。
{: .proposition}

第一条和第二条相当于说明$\FIRST(\alpha) \cap \FIRST(\beta) = \emptyset$，这样的话对任何文法符号都能确定使用哪个产生式。
第三条相当于要求如果一个推导能产生空串，那么不会发生采用空串的推导，相当于跳过这个符号，还是采用另一个推导的二义性。

#### 预测分析表

使用预测分析表，我们就能知道当前根节点为某个文法符号时，如果读入了某个词法单元，应该选择哪个产生式。
预测分析表表现为一个二维数组`M[A,a]`，表示当前文法符号为`A`时如果下一个词法单元为`a`选择的产生式。

我们用下面的算法构造预测分析表：

对文法的每个产生式$A \to \alpha$，其中$\alpha$为一串任意的文法符号：
1. 计算$\FIRST(\alpha)$，对其中每个终结符号$a$，将$A \to \alpha$加入`M[A,a]`中；
2. 如果$\epsilon \in \FIRST(\alpha)$，那么对$\FOLLOW(A)$中的每个终结符号$b$，将$A \to \alpha$加入`M[A,b]`中；
如果还有$\\$ \in \FOLLOW(A)$，那么也将$A \to \alpha$加入`M[A,$]`中。

完成以上步骤后留空的格子表示产生错误。

这个流程可以为所有文法生成预测分析表，但是只有`LL(1)`的文法的表中要么有且仅有一个表达式，要么为空（表示错误）。

#### 例子

我们考虑这个经典的消除了左递归的文法：
$$
\begin{aligned}
E \qatoq T E^\prime \\
E^\prime \qatoq + T E^\prime \gor \epsilon \\
T \qatoq F T^\prime \\
T^\prime \qatoq * F T^\prime \gor \epsilon \\
F \qatoq ( E ) \gor \mathbf{id}
\end{aligned}
$$

考虑产生式$E \to T E^\prime$。
首先计算$\FIRST(T E^\prime)$。
我们需要计算$\FIRST(T) = \FIRST(F, T^\prime)$，容易看出$\FIRST(F)=\\\{ (, \mathbf{id} \\\}$，其中不含空串，从而$\FIRST(T E^\prime)=\\\{ (, \mathbf{id} \\\}$。
因此我们在表的`[E,(]`和`[E,id]`格中填上这个产生式。

再考虑产生式$E^\prime \to \epsilon$。
显然$\epsilon \in \FIRST(\epsilon)$。
空串不是终结符号（也不是非终结符号），因此不加入预测表中。
然后我们需要计算$\FOLLOW(E^\prime)$。
产生$E^\prime$的产生式只有$E \to T E^\prime$一个，因此将$\FOLLOW(E)=\FOLLOW(E^\prime)$中。
我们接着计算$\FOLLOW(E)$，其产生式只有$F \to (E)$一个，因此将$\FIRST(()=\\\{ ( \\\}$加入其中。
又因为其为开始符号，所以把$\\$ $加入其中，因此$\FOLLOW(E)=\FOLLOW(E^\prime)=\\\{ ( , \\$ \\\}$。
从而我们在表的`[E', (]`和`[E', $]`格内填入此产生式。

这个文法的完整分析表如下：

| 非终结符号 | id | + | \* | ( | ) | \$ |
|-----------|----|---|----|---|---|----|
|E| $E \to T E^\prime$ | | | $E \to T E^\prime$ | | |
|E'| | $E^\prime \to \+ T E^\prime$| | | $E^\prime \to \epsilon$ | $E^\prime \to \epsilon$|
|T| $T \to F T^\prime$ | | | $T \to F T^\prime$ | | |
|T'| | $T^\prime \to \epsilon$ | $T^\prime \to \* F T^\prime$ | | $T^\prime \to \epsilon$ | $T^\prime \to \epsilon$ |
|F| $F \to \mathbf{id}$ | | | $F \to (E)$ | | |

我们知道，二义性的文法不是`LL(1)`的，但是我们依然可以生成这个表。
考虑文法：
$$
\begin{aligned}
S \qatoq i E t S S^\prime \; \vert \; a \\
S^\prime \qatoq e S \; \vert \; \epsilon \\
E \qatoq b
\end{aligned}
$$
这个表示了一个带有悬空-else问题的文法，其条目`M[S', e]`同时包含两个产生式：
$ S^\prime \to \epsilon $
和
$ S^\prime \to e S $。
出现这种情况时，语法分析器可以选择两个产生式的任意一个，因此是二义性的。
当然，我们可以手动干预语法分析，让它总是选择第二个，这相当于把`else`和最近的`if`关联起来。
需要注意的是，选择第一个产生式一定是错误的，这会导致输入中的$e$不能被处理。

### 非递归的预测分析器

利用预测分析法，我们可以取消自顶向下语法分析中的回溯环节。
除此之外，我们甚至还可以取消递归调用，而是用一个栈来模拟，提高程序的运行效率。
这种语法分析器的所有运行时信息可以用**格局**（Configuration）来表述，格局包括其栈和尚未读取的输入内容。

我们介绍一个利用预测分析表的非递归的语法分析方法：
```cpp
stk = empty_stack();
stk.push(S); // 开始符号入栈
while(!stk.empty())
{
    auto X = stk.top();
    auto token = lexer.next_token();
    if(X == token)
        stk.pop(), lexer.consume_token();
    else if(X.isTerminal)
        throw ExpectingTerminalSymbol();
    // 如果预测分析表中的条目为报错条目
    else if(M[X][token].isError)
        throw UnexpectedToken();
    else
    {
        auto prod = M[X][token];
        prod.process();
        stk.pop();
        // 将产生式体逆序压入栈中
        for(auto itr = prod.body.rbegin(); itr != prod.body.rend(); ++itr)
            stk.push(*itr);
    }
}
```

我们继续考虑上一个文法，假设输入的词法单元序列为`id + id * id`。

首先，栈中只有$E$一个符号，读入的符号为 $\mathbf{id}$ ，因此选择产生式 $ E \to T E^\prime $ ，式体从后往前入栈。
我们约定左侧表示栈的顶端，右侧表示栈的底端，并用特殊符号`$`表示栈底。
现在栈中从上往下分别为`T E' $`，栈顶符号为$T$，读入仍然为$\mathbf{id}$，因此选择产生式$T \to F T^\prime$。
现在栈中为`F T' E' $`，输入为$\mathbf{id}$，选择产生式$F \to \mathbf{id}$。
现在栈中为`id T' E' $`，输入为$\mathbf{id}$。
栈顶为终结符号，正好和输入对应，因此输入指针前移，`id`出栈。
现在栈中为`T' E' $`，输入为$\+$，以此类推。

不难发现，这种分析法正好相当于一个最左推导序列。

这种不使用回溯的分析器（无论隐式地利用调用栈还是显式地维护符号栈）的时间复杂度为$\mathcal O (n)$，因此得到广泛使用。

### 错误恢复

我们来讨论一下使用预测分析器时的错误处理。
我们知道预测分析表穷尽了所有可能的格局，因此对所有输入其在预测分析表中一定都有一个条目。
如果这个条目为空（或有错误标记），那么就说明发生了错误。

我们在这一节中主要讨论恐慌模式的错误恢复，在这种错误恢复方式下，我们需要指定一些同步词法单元（SYNCHronizing token）。
当语法分析器检测到语法错误时，会不断地从输入中消耗词法单元，直到到达同步词法单元为止。

我们为每个非终结符号都建立单独的同步词法单元集合。
如果一个符号在非终结符号$A$的同步词法单元集合中，那么当栈顶为$A$且发生错误时，就不断跳过符号直到当前词法单元属于这个集合，然后把$A$从栈中弹出。

没有数学上的方法来选择“最优的”同步词法单元集合，但是有一些启发式的方法可以帮助我们进行选择。

1. 首先把$\FOLLOW(A)$中的所有符号放到非终结符号$A$的同步词法单元集合中。
2. 其次，我们可以把较高层次的开始符号加入较低层构造的同步集合中。
比如，表达式通常出现在一个语句内部，那么我们可以把表示语句开头的符号加入生成表达式的非终结符号的同步集合中。
3. 可以考虑将$\FIRST(A)$中的所有符号加入非终结符$A$的同步集合中。
4. 如果一个非终结符号生成空串，那么可以考虑把推导出空串当作默认值使用。
这就是说如果发生错误就直接把这个符号从栈中弹出。
这会将错误的检测推迟，但不会接受错误的输入。
5. 如果栈顶是一个终结符号，而输入不能和终结符号匹配，那么可以考虑假装已经接受了这个终结符号，直接把它弹出栈。
这相当于把其他所有词法单元当作终结符号的同步单元。

下面是标记了同步词法单元的预测分析表。
这些同步单元都是用$\FOLLOW$集合得出的。

| 非终结符号 | id | + | \* | ( | ) | \$ |
|-----------|----|---|----|---|---|----|
|E| $E \to T E^\prime$ | | | $E \to T E^\prime$ | SYNCH | SYNCH |
|E'| | $E^\prime \to \+ T E^\prime$| | | $E^\prime \to \epsilon$ | $E^\prime \to \epsilon$|
|T| $T \to F T^\prime$ | SYNCH | | $T \to F T^\prime$ | SYNCH | SYNCH |
|T'| | $T^\prime \to \epsilon$ | $T^\prime \to \* F T^\prime$ | | $T^\prime \to \epsilon$ | $T^\prime \to \epsilon$ |
|F| $F \to \mathbf{id}$ | SYNCH | SYNCH | $F \to (E)$ | SYNCH | SYNCH |

如果`M[A,a]`中没有值，那么直接略过$a$，如果标记为`SYNCH`，那么就直接从栈中弹出`A`。

#### 短语层次的恢复

我们可以在错误的格子中填入指向错误处理程序的指针。
在这个程序中，我们可以操作输入串，向其中添加某些符号、从其中删除某些符号或是修改某些符号，以实现短语层次的恢复。
如果需要添加某些串，则一定要小心。
首先，添加某些串后仍然不能保证这个输入可以被识别；
其次，不停地添加词法单元可能导致无限循环。
我们可以规定任何恢复程序最终都会消耗某些词法单元，这样可以避免陷入无限循环。
