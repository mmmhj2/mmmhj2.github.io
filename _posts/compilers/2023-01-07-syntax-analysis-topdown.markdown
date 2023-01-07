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
/* Parse a translation unit.
   translation-unit:
     external-declaration
     translation-unit external-declaration
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

/* Parse an external declaration
   external-declaration:
     function-definition
     declaration
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
	  // 调用对应非终结符的处理函数（内联汇编）
      c_parser_asm_definition (parser); 
    }
  else
    {
	  // 调用对应非终结符的处理函数（函数定义）
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
1. 如果$X$是一个终结符号，那么$\FIRST(X) = X$。
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
