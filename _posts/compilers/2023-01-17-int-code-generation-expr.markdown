---
layout: post
title: "中间代码生成——表达式与控制流"
---

本文中，我们主要研究表达式以及各种语句的中间代码生成。

## 表达式的翻译

在前文中，我们以及考虑过在翻译中进行隐式类型转换的问题了，因此，在本文中，我们假设所有运算都是同一类型的。

### 表达式中的运算

我们尝试为一个赋值语句（Statement）生成代码，其SDD为：

| 产生式 | 语义规则 |
|-------|----------|
| $ S \to \mathbf{id} = E ; $ | $ S.code = E.code; $ $ gen(top.get(\mathbf{id}) \; = \; E.addr); $ |
| $ E \to E_1 + E_2 $ | $E.addr = new \ Temp();$ $ E.code = E_1.code \Vert E_2.code \Vert gen(E.addr = E_1.addr + E_2.addr); $ |
| $ E \to - E_1 $ | $E.addr = new \ Temp();$ $E.code = E_1.code \Vert gen(E.addr = \mathbf{minus} \ E_1.addr); $ |
| $ E \to ( E_1 )$ | $E.addr = E_1.addr;$ $E.code = E_1.code;$ |
| $ E \to \mathbf{id} $ | $E.addr = top.get(\mathbf{id});$ $E.code = \text{''};$ | 

其中$top$表示当前的符号表，这和此前规定的记录中的字段处理是相同的。
我们使用$gen$函数来生成三地址指令，其生成的指令和括号内的内容相同。
我们约定，在语法制导定义中，$gen$函数把生成的三地址代码返回；
而在语法制导翻译方案中，$gen$函数增量地添加到指令流中（类似打印出来）。
比如，在翻译$E_1 + E_2$时，首先为$E$生成一个临时变量$t$，然后生成三地址代码$t = E_1.addr + E_2.addr$，此时$E_1.addr$等会被替换成对应的属性值。

对赋值语句`a = b + -c;`翻译的三地址代码为：
```
t1 = minus c
t2 = b + t1
a = t2
```
#### 增量地进行翻译

正如此前所述，把三地址代码作为属性进行传递是相当浪费时间和空间的。
为此，我们可以直接增量地生成代码，即在扫描时生成代码，而不用把它保存起来。
我们使用以下的翻译方案。

| 产生式 | 语义规则 |
|-------|----------|
| $ S \to \mathbf{id} = E ; $ | $ gen(top.get(\mathbf{id}) \; = \; E.addr); $ |
| $ E \to E_1 + E_2 $ | $E.addr = new \ Temp();$ $ gen(E.addr = E_1.addr + E_2.addr); $ |
| $ E \to - E_1 $ | $E.addr = new \ Temp();$ $ gen(E.addr = \mathbf{minus} \ E_1.addr); $ |
| $ E \to ( E_1 )$ | $E.addr = E_1.addr;$ |
| $ E \to \mathbf{id} $ | $E.addr = top.get(\mathbf{id});$ | 

这个翻译方案也可以生成抽象语法树，只需要把$gen$替换成生成结点的代码即可，此时$addr$属性中保存的不再是变量的地址，而是语法树结点的地址。

### 数组元素寻址

我们首先考虑一维数组的寻址。

现有的大多数程序设计语言中，数组的下标都是从零开始的，这意味着对一个一维数组的下标访问`A[i]`，其相当于访问地址$base + i \times width$，其中$base$是分配给数组的内存的首地址（基址），也是`A[0]`的地址，$width$是数组元素的宽度。

如果这个数组是多维的，那么有两种计算方法，我们以二维数组为例说明这种方法。
1. 如果我们知道每一维的宽度，比如在二维数组中知道一行的宽度，那么可以直接计算地址：
   $$
   address = base + i_1 \times w_1 + i_2 \times w_2
   $$
   其中$w_1$是一行的宽度，$w_2$是一行中一个元素的宽度。
   对更高维的数组，其公式为：
   $$
   address = base + i_1 \times w_1 + i_2 \times w_2 + \cdots + i_k \times w_k
   $$
2. 如果我们知道每一维的大小以及元素的宽度，那么我们可以用以下公式计算地址：
   $$
   address = base + (i_1 \times n_2 + i_2) \times w
   $$
   其中$n_2$表示第二维中含第一维的元素个数。
   对更高维的数组，其公式为：
   $$
   address = base + (( \cdots ((i_1 \times n_2 + i_2) \times n_3 + i_3 ) \cdots ) \times n_k + i_k) \times w
   $$

对于上面这种寻址的方式，我们还需要解决几个问题。

首先，可能存在一些语言，其数组的下标并不是从零开始的。
这个时候，我们只需要把$i_j$替换成$i_j - low_j$，其中$low_j$表示起始下标，即可。

其次，虽然主流的程序设计语言中在储存数组时都是按行索引（Row-major）的，但是部分用于科学计算的语言是使用按列索引的。
这就是说，在C语言这种语言中，对二维数组，其内存中第一个元素是`A[0][0]`，而第二个元素是`A[0][1]`；
相对地，在Fortran中，对二维数组，其内存中第一个元素是`A[0][0]`，而第二个元素是`A[1][0]`。
采用第一种方式是因为其对应了`A[i][j] = (A[i])[j]`的语法，这要求数组在内存中必须以维数从左到右的方式索引。
而第二种方式有利于科学计算，因为数学中时常把矩阵的一列作为一个向量整体使用，因此列向量在内存中最好是连续的。
如果使用按列索引的内存安排方式，那么寻址的公式也要相应改变。

再次，数组的寻址可以在编译时计算出来，也可以拖延到运行时再计算。
显然，前者可以节约程序运行的时间，但是并不一定总是可用，因为语言可能支持动态数组。
此时，我们可能需要生成对应的三地址代码来在运行时计算对应的地址，而不能直接把常数写在程序里面。

最后，使用中间代码时，我们可能并不希望生成固定宽度的访问代码，因为对不同的指令集架构，同一类型的变量可能占用不同的内存空间。
此时，我们希望在中间代码中把这些信息留空，而等到链接时再填充这些信息，这样就可以降低前端与系统的耦合程度。
如果要这样做，我们需要在生成的三地址代码中用符号常量代替常数。

#### 翻译数组引用

在这一节中，我们以C语言的数组引用语法为例，介绍如何为数组引用生成代码。
其SDD如下（省略了相同的语义动作）：

| 产生式 | 语义动作 |
|-------|----------|
| $ S \to \mathbf{id} = E; $ | `gen(top.get(id) = E.addr);` |
| $ S \to L = E; $ | `gen(L.array.base[L.addr] = E.addr);` |
| $ E \to E_1 + E_2 $ | ... |
| $ E \to \mathbf{id} $ | ... |
| $ E \to L $ | `E.addr = new Temp(); gen(E.addr = L.array.base[L.addr]);` |
| $ L \to \mathbf{id} [E] $ | `L.array = top.get(id);` <br/> `L.type = L1.type.elem;` <br/> `L.addr = new Temp()` <br/> `gen(L.addr = E.addr * L.type.width` |
| $ L \to L_1 [E]$ | `L.array = L1.array;` <br/> `L.type = L1.type.elem;` <br/> `t = new Temp();` <br/> `L.addr = new Temp();` <br/> `gen(t = E.addr * L.type.width)` <br/> `gen(L.addr = L1.addr + t)` |

我们假设一个整数的宽度为4，`a`的类型为`int [3][2]`，或写为`array(2, array(3, integer))`，那么表达式`c + a[i][j]`被翻译为：
```
t1 = i * 12
t2 = j * 4
t3 = t1 + t2
t4 = a[t3]
t5 = c + t4
```

我们着重介绍以下文法符号$L$的属性。
1. `addr`保存了一个临时变量，用于求出最后的偏移。
2. `array`保存了一个指向数组在符号表中条目的指针。其字段`base`表示基址。
3. `type`表示了这个数组的类型，其有两个字段。`elem`表示数组的元素类型，而`width`表示其宽度。

在翻译数组引用时，首先把`L.array`属性沿着语法分析树向下传递，直到使用产生式$L \to \mathbf{id} [E]$。
注意这个SDD是左递归的，因此其会向左子树不断传递这个属性。
然后，在向上回溯时，我们使用语义动作`L.type = L.type.elem`提取数组中的元素，然后用提取出的元素的宽度计算偏移，保存在`L.addr`中。
最后进行赋值时，直接用`L.addr`作为偏移即可。

对于Fortran风格的数组引用，我们需要注意沿子树传递信息的方向。
由于Fortran的数组存储是按列索引的，我们需要把属性沿右子树而非左子树传递。

## 控制流语句的翻译

在各种控制流语句中，常常能看到布尔表达式的出现。

布尔表达式通常具有两种作用：改变控制流和求逻辑值。
如果布尔表达式出现在诸如`if`或`while`这种语句之中，那么其很有可能是在起改变控制流的作用；
而如果其出现在赋值表达式的右边，那么大概率是用来求逻辑值的。

为了区别这两种布尔表达式，我们必须知道这个表达式的上下文。
为此，我们可以使用一个继承属性标记它或者为两种布尔表达式分配不同的非终结符号，还可以在语法分析中使用标记或者先建立语法分析树再进行分析。

在本章中，我们使用一个特别的非终结符号$B$来表示用于控制流的布尔表达式。

### 布尔表达式

我们类比C语言的语法，用以下文法来描述布尔表达式：
$$
\begin{aligned}
    B \quad &\to \quad B \Vert B \\
    &\vert \quad B \&\& B \\
    &\vert \quad ! B \\
    &\vert \quad (B) \\
    &\vert \quad E \; \mathbf{rel} \; E \\
    &\vert \quad \mathbf{true} \quad \vert \quad \mathbf{false}
\end{aligned}
$$

其中$\mathbf{relop}$表示关系运算符，包括小于、小于等于、等于、不等于、大于和大于等于。
我们规定两个二元运算符逻辑或和逻辑与都是左结合的，且或的优先级最低，其次为与，非的优先级最高。

我们假设这个语言中的逻辑运算是**短路的**。
这就是说，在程序执行中，如果已经有足够的信息判定一个布尔表达式的取值，那么就不再继续进行其剩余部分的求值了。
比如对布尔表达式`A && B`，如果已经知道`A = false`，那么无论`B`是真是假，整个表达式一定为假，所以不进行`B`的求值。
这允许我们（在C语言中）写出一些奇特的表达式，比如`(x > 0 && y++);`其实际上等价于`if(x > 0) y++;`。
在这种短路代码中，我们可能不得不将布尔运算符翻译成跳转指令，以避免执行额外的表达式求值。

比如对语句
```c
if(x < 100 || x > 200 && x != y)
    x = 0;
```
我们生成以下三地址代码：
```
    if x < 100 goto L2
    ifFalse x > 200 goto L1
    ifFalse x != y goto L1
L2: x = 0
L1: 
```
我们先研究控制流语句的翻译，再考虑布尔表达式的翻译。

### 控制流语句

我们使用如下SDD为`if`、`if-else`和`while`语句生成代码：

| 产生式 | 语义规则 |
|-------|----------|
| $P \to S$ | `S.next = new_label()` <br/> `P.code = S.code + label(S.next)` |
| $S \to \mathbf{assign}$ | `S.code = assign.code` |
| $S \to \mathbf{if} \; (B) \; S_1$ | `B.true = new_label()` <br/> `B.false = S1.next = S.next` <br/> `S.code = B.code + label(B.true) + S1.code` |
| $S \to \mathbf{if} \; (B) \; S_1 \; \mathbf{else} \; S_2$ | `B.true = new_label(), B.false = new_label()` <br/> `S1.next = S2.next = S.next` <br/> `S.code = B.code + label(B.true)` <br/> `+ S1.code + gen(goto S.next)` <br/> `+ label(B.false) + S2.code` |
| $S \to \mathbf{while} \; (B) \; S_1$ | `begin = new_label()` <br/> `B.true = new_label()` <br/> `B.false = S.next` <br/> `S1.next = begin` <br/> `S.code = label(begin) + B.code` <br/> `+ label(B.true) + S1.code` <br/> `+ gen(goto begin)` |
| $S \to S_1 S_2$ | `S1.next = new_label()` <br/> `S2.next = S.next` <br/> `S.code = S1.code + label(S1.next) + S2.code` |

我们使用`new_label()`来生成一个新的标号，然后用`label(x)`来把标号`x`附加到其后的指令上。
产生式中的$\mathbf{assign}$是一个占位符，用来标记赋值语句。

理解这个SDD的关键在于掌握标号的流向。
当我们识别到一个控制语句时，就生成新的标号，然后把这些标号作为继承属性传递给子节点。
正如我们此前所说，每个布尔表达式，因为其短路的性质，都必须翻译成跳转语句，所以我们需要给所有布尔表达式传递两个标号。
等所有的子表达式都处理完后，我们再生成控制流语句的结构，即使用条件跳转语句。
在这个SDD中，我们实际上把根据布尔表达式跳转这一步骤下放到每个布尔表达式的生成中了，因此在每个产生式中，看起来似乎缺少需要的跳转。

值得注意的是，尽管在`while`生成的代码最后附加了一条`goto`语句，我们仍然将`S1.next`设置为`begin`。
这样可以让从循环中跳出的语句仍然沿着原有的控制流执行。

`do-while`循环和`while`循环十分类似。
而对于`for`循环，我们可以把它简单地翻译成`while`循环：
$$
for(S_1;\ B;\ S_2)\ S_3 \iff S_1 \ while(B) \  \{S_3 \  S_2\}
$$

### 控制流中的布尔表达式

根据对短路的定义和上文的分析，我们要求布尔表达式根据其两个继承属性`B.true`和`B.false`生成正确的跳转指令。
下面的SDD可用于执行这个翻译：

| 产生式 | 语义规则 |
|-------|----------|
| $B \to B_1 \Vert B_2$ | `B1.true = B.true; B1.false = new_label()` <br/> `B2.true = B.true; B2.false = B.false` <br/> `B.code = B1.code + label(B1.false) + B2.code` |
| $B \to B_1 \&\& B_2$ | `B1.true = new_label(); B1.false = B.false` <br/> `B2.true = B.true; B2.false = B.false` <br/> `B.code = B1.code + label(B1.true) + B2.code` |
| $B \to ! B_1$ | `B1.true = B.false; B1.false = B.true; B.code = B1.code` |
| $B \to \mathbf{true}$ | `B.code = gen(goto B.true)` |
| $B \to \mathbf{false}$ | `B.code = gen(goto B.false)` |
| $B \to E_1 \mathbf{relop} E_2$ | `B.code = E1.code + E2.code` <br/> `gen(if E1.addr rel E2.addr goto B.true)` <br/> `goto B.false` |

注意在这里我们要求这个布尔表达式是用来进行控制流操作的，因此不为这个表达式求值，而是直接进行跳转。

我们仍以上面出现过的例子为例，生成`if(x < 100 || x > 200 && x != y) x = 0;`的三地址代码。
其代码为：
```
    if x < 100 goto L2
    goto L3
L3: if x > 200 goto L4
    goto L1
L4: if x != y goto L2
    goto L1
L2: x = 0
L1:
```

### 消除冗余的跳转

不难看出，相较于我们此前手动生成的三地址代码，这个代码有过多的跳转。
我们注意到，有很多时候其实并不需要执行跳转，因为程序总是按一定的顺序从上至下执行。
为此，我们引入一个特殊的标号`fall`，表示不进行跳转，而是直接执行下一条指令。
我们需要在`if`、`if-else`和`while`语句中，把`B.true`设置成`fall`，这样布尔表达式为真时就不用执行跳转了。
除此之外，我们还需要消除生成代码时的`label(B.true)`，对于`if`语句，修改后的语义规则如下：
```
B.true = fall
B.false = S1.next = S.next
S.code = B.code + S1.code
```

同样，让我们来考察布尔表达式的翻译。
对比两串三地址代码，不难注意到除了以这种方式可以降低跳转数之外，我们还可以通过用`ifFalse`替代`if`达成此目标。
我们修改`E1 relop E2`的语义规则如下：
```
test = E1.addr relop E2.addr
s = 
    if(B.true != fall && B.false != fall)
        gen(if test goto B.true) + gen(goto B.false)
    else if(B.true != fall && B.false == fall)
        gen(if test goto B.true)
    else if(B.true == fall && B.false != fall)
        gen(ifFalse test goto B.false)
    else 
        ''
B.code = E1.code + E2.code + s
```

在修改短路的逻辑运算的时候尤其注意，以$B \to B_1 \Vert B_2$为例，尽管`B.true`可能为`fall`，`B1.true`不能简单的执行下一条语句即可。
相对地，其必须**跳过**`B2.code`，否则便不是短路的。
因此，我们必须为其分配额外的标签才行。
修改后的语义动作如下：
```
B1.true = (B.true != fall ? B.true : new_label())
B1.false = fall
B2.true = B.true
B2.false = B.false
B.code = (B.true != fall ? B1.code + B2.code : B1.code + B2.code + label(B1.true))
```
对逻辑与运算，其思路类似，只是需要检查的从`B.true != fall`变成了`B.false != fall`，从`B1.true`变成`B1.false`而已。

### 产生值的布尔表达式

我们如何区别处理产生值和进行流控制的布尔表达式呢？
更一般地，我们知道，对大部分语言，任何数值表达式实际上都可以转换成布尔表达式，如何进行这种转换呢？

实现这一点，主要有两种方法：
1. 基于两遍扫描的方法。在这种方法中，语法分析器首先扫描一遍以确定每个表达式是控制流的表达式还是求值的表达式，并建立整个程序的抽象语法树，然后再根据对应的翻译方案生成中间代码。
2. 基于分别扫描的方法。在这种方法中，语法分析器一边扫描一边翻译，然后在进行翻译时，根据表达式的类型生成表达式的抽象语法树再遍历。

这两者的区别在于第一种方法扫描整个程序两次，而第二种方法只扫描表达式的部分两次。

无论使用哪种方法，如果我们在产生式中不去区别两种表达式，那么它们的抽象语法树结点都是同一类型的。
为此，我们需要实现两个不同的函数，一个用来生成控制流代码，称为`jump`，因为代码中带有跳转，一个用来赋值，称为`rvalue`，因为代码生成一个右值。

`jump`函数利用此前的SDD进行代码生成（可能需要额外的规则以实现其他类型向布尔类型的转换），其调用`jump(t,f)`有两个参数，分别代表`B.true`和`B.false`。
比如在翻译$S \to \mathbf{while}(E) S_1$时，`t`中就填入$S_1$的第一条代码的地址（通常为`fall`），而`f`就填入`S.next`。

而`rvalue`函数用来生成右值，不填入参数。
比如在翻译$S \to \mathbf{id} = E$时，如果$E$是布尔表达式，那么我们仍按照此前的方法生成代码，只是生成一个新的临时变量$t$，在布尔表达式为真时添加指令`t = true`，为假时执行指令`t = false`，然后执行`E.addr = t`即可。
比如`x = a < b && c < d`可翻译成三地址代码：
```
    ifFalse a < b goto L1
    ifFalse c < d goto L1
    t = true
    goto L2
L1: t = false
L2: x = t
```

如果一个表达式的类型不是布尔型，但是仍出现在了控制流语句中，那么可能需要进行隐式类型转换。
