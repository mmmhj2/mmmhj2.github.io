---
layout: single
title: "中间代码生成——表达式与控制流②"
category: "编译原理"
---


## 回填技术

上文的SDD在实现上仍有几个问题。
首先，这个SDD生成了过多的标号，甚至对同一语句可能有多个标号；
其次，这个SDD只能确定跳转到的标号，而不能确定跳转到的地址。
考虑最简单的`S ::= if (B) S1`语句，如果一边扫描一边生成，那么我们必须在生成`B`的代码时确定`B.false`是什么。
原则上，我们通过继承属性`S.next`可以得知应该跳转至的标号，从而生成正确的代码。
但是此时`S`尚未完全生成，因此我们不可能确定跳转至的地址。

为此，我们将推迟跳转指令的生成，直到能够确定其地址为止。
这种推迟也可以降低跳转指令和标号指令的出现频数。

在本节中，我们使用一个标号列表来管理待回填的指令，这个列表中的每一个标号代表一条待填充目标标号的无条件转移或条件转移指令。
这个列表和三个管理函数关联：
1. `makelist(i)`表示创建一个只含有标号`i`的列表，返回该列表；
2. `merge(p1,p2)`表示把两个标号列表合并，返回合并后的列表；
3. `backpatch(p,i)`表示执行回填，把标号列表`p`中所有待填充的指令目标设置为`i`。

然后，我们为代表布尔表达式的非终结符号$B$赋予两个综合属性`truelist`和`falselist`。
当布尔表达式为真时，所有`truelist`中的指令都跳向某一地址，`falselist`同理。

### 布尔表达式的回填

如果我们要在布尔表达式中选择回填，一个重要的问题就是如何处理短路运算符。
我们知道，为了实现短路运算，需要跳转到两个进行运算的布尔表达式的后者，因此我们需要获得这个后面的表达式的指令地址。
然而，前面的表达式可能会生成更多的代码，因此我们不能仅仅把前表达式的地址加一。

为了记录后面的表达式的地址，我们引入一个特别的非终结符$M \to \epsilon$，其只有一个综合记录`M.instr = nextinstr;`，用来保存下一条指令的地址。
其中，`nextinstr`表示下一条指令的地址，也就是当前已经生成的最后指令的地址加一。

翻译方案如下：

| 产生式 | 语义动作 |
|-------|----------|
| $ B \to B_1 \ \Vert \ M \ B_2 $ | `backpatch(B1.falselist, M.instr)` <br/> `B.truelist = merge(B1.truelist, B2.truelist)` <br/> `B.falselist = B2.falselist` |
| $ B \to B_1 \  \&\& \  M \  B_2 $ | `backpatch(B1.truelist, M.instr)` <br/> `B.truelist = B2.truelist` <br/> `B.falselist = merge(B1.falselist, B2.falselist)` |
| $ B \to ! B_1 $ | `B.truelist = B1.falselist; B.falselist = B1.truelist;` |
| $ B \to (B_1) $ | `B.truelist = B1.truelist; B.falselist = B1.falselist;` |
| $ B \to E_1 \ \mathbf{relop} \ E_2$ | `B.truelist = makelist(instr)` <br/> `B.falselist = makelist(instr+1)` <br/> `gen(if E1.addr relop E2.addr goto __)` <br/> `gen(goto __)` |
| $B \to \mathbf{true}$ | `B.truelist = makelist(nextinstr); gen(goto __)` |
| $B \to \mathbf{false}$ | `B.falselist = makelist(nextinstr); gen(goto __)` |
| $M \to \epsilon$ | `M.instr = nextinstr` | 

不难注意到，和此前的SDD最大的不同在于对跳转代码的生成。
在此前的SDD中，每一个产生式都会生成跳转代码，而在这个SDD中，仅在确定会发生跳转时才生成跳转代码且将跳转的目标留空，直到确定跳转到的目标为止。
比如在产生式 $B \to B_1 \ \Vert \ M \ B_2$ 中，我们知道对$B_1$已经生成了跳转语句，且所有待回填的语句都保存在列表中了。
现在我们已经使用$M$记号确定了$B_2$的标号，因此可以使用回填来填充`B1.falselist`。

我们将在下一节讲解对控制流语句的回填，在此之前，用于控制流语句中的布尔表达式的SDD不能填充所有的空格，因为有些空格需要用控制流指定。

我们继续考虑表达式`x < 100 || x > 200 && x != y`。
其生成的代码为：
```
100:    if x < 100 goto _
101:    goto _
102:    if x > 200 goto _
103:    goto _
104:    if x != y goto _
105:    goto _
```
我们自底向上地考虑其翻译。
在使用逻辑与产生式时，有`B1.truelist = {102}, B1.falselist={103}, B2.truelist={104}, B2.falselist={105}`。
然后翻译逻辑与，首先把`B1.truelist`回填为`M.instr = 104`，即`B2`第一条指令的为止，然后求得`B.truelist={104}, B.falselist={103,105}`。
对逻辑或同理，最后回填产生：
```
100:    if x < 100 goto (T)
101:    goto 102
102:    if x > 200 goto 104
103:    goto (F)
104:    if x != y goto (T)
105:    goto (F)
```
其中`(T)`和`(F)`分别表示`B.truelist`和`B.falselist`，这些值将由控制流语句指定。

### 控制流语句的回填

为了翻译控制流语句，我们继续引入新的综合属性：`nextlist`。
这个属性，和`truelist`和`falselist`类似，指明了一些需要回填的属性。
这个列表中包含所有应该跳转到该文法符号代表的指令之后的跳转指令。

为了获取并保存下一条指令，我们仍然需要非终结符号$M$。
除此之外，为了实现`if-else`指令，我们还需要一个特殊的终结符号`N`，用来在执行表达式为真时的语句之后跳过`else`从句。

其SDD如下：

| 产生式 | 语义动作 |
|-------|----------|
| $S \to \mathbf{if}\ (B)\ M\ S_1$ | `backpatch(B.truelist, M.instr)` <br/> `S.nextlist = merge(B.falselist,S1.nextlist)` |
| $S \to \mathbf{if}\ (B)\ M_1\ S_1\ N\ \mathbf{else}\ M_2\ S_2$ | `backpatch(B.truelist, M1.instr)` <br/> `backpatch(B.falselist, M2.instr)` <br/> `S.nextlist = merge(S1.nextlist, N.nextlist, S2.nextlist)` |
| $S \to \mathbf{while}\ M_1\ (B)\ M_2\ S_1$ | `backpatch(S1.nextlist, M1.instr)` <br/> `backpatch(B.truelist, M2.instr)` <br/> `S.nextlist = B.falselist` <br/> `gen(goto M1.instr)` |
| $S \to \\\{ L \\\}$ | `S.nextlist = L.nextlist` |
| $S \to \mathbf{assign}$ | `S.nextlist = null` | 
| $M \to \epsilon$ | `M.instr = nextinstr` |
| $N \to \epsilon$ | `N.nextlist = makelist(nextinstr)`<br/>`gen(goto _)` |
| $L \to L_1\ M\ S$ | `backpatch(L1.nextlist, M.instr)` <br/> `L.nextlist = S.nextlist` |
| $L \to S$ | `L.nextlist = S.nextlist` | 

和此前的翻译方案相似，这些SDD几乎不生成跳转指令，因为大部分跳转指令都在布尔表达式中生成。

考虑这个语句`if(x < 100 || x > 200 && x != y) r = 1;`，其生成以下三地址代码：
```
100:    if x < 100 goto 106
101:    goto 102
102:    if x > 200 goto 104
103:    goto (N)
104:    if x != y goto 106
105:    goto (N)
106:    r = 1
```
其中`(F)`表示仍未回填的代码，其地址保存在`S.nextlist`中，这些如果接下来还有其他语句，这些代码可能在使用产生式$L \to L_1\ M\ S$时进行回填。

### 处理其他跳转语句

在大部分语言中，支持其他的控制流语句。

在C语言中，存在无条件跳转语句`goto`。
如果同一作用域中含有带有相同标号的指令，那么无条件跳转至那条指令。
为了实现这种指令，我们可以为每个指令标号维护一个列表，和上述待回填的指令列表相同，然后在发现标号时进行回填。

除此之外，大部分语言还支持在循环结构中使用`break`或`continue`来跳出或跳过循环。

为了实现`break`语句，我们可以生成跳转，并把这个指令添加到`S.nextlist`去。
为了找到应该添加到哪个`S`，我们需要追踪`S`的语法树结点或`S.nextlist`的地址。
我们可以把这两者之一添加到符号表去。

对`continue`语句，其通常应该跳转至布尔表达式的位置。
对于`while`类型的语句，生成`continue`语句的代码时，通常已经生成过了布尔表达式，因此不需要回填，只需要保存地址即可。
而对于`do-while`类型的语句，我们可以把它加到`do-while`循环体的`nextlist`中。

对于`for`循环，如果我们把它翻译成等价的`while`循环，那么需要注意使用`continue`时不应该直接跳转到布尔表达式，而是应该跳转到迭代语句。
此时可能需要使用额外的属性用来回填。
如果直接翻译`for`循环，那么可以参考[这个回答](https://stackoverflow.com/q/50201689)。

## 翻译其他控制流语句

### 翻译`switch`语句

许多语言中还支持使用`switch`语句进行控制流转移，对下述语句，我们期望三个动作：
```c
switch(E)
{
    case V1:
        S1;
    case V2:
        S2;
    /* ... */
    default:
        Sn;
}
```

1. 计算表达式$E$的值；
2. 跳转到标号$V_i$下的语句，其中$V_i = E$，如果没有匹配的值则跳转至`default`；
3. 执行下一条语句。

有一些使用`switch`语句的语言只进行一次跳转，这就是说如果没有`break`语句，那么则会依次执行所有剩下的语句，而不会跳出`switch`语句块。
这种语法可以降低跳转指令的频数。
处于展示考虑，我们假设控制流不会发生这样的下落，即每个`switch`语句只会执行对应标签下的语句。

在一部分语言中，限制$E$只能是能转换成整数的类型，且标签一定是整数，这种`switch`的翻译比较简单。
我们在此考虑$E$可以为所有类型的情形。
此时有三种翻译的方式：
1. 直接翻译成条件跳转语句，每次测试一个常量$V_i$。这种翻译方式简单，但是对分支较多或$E$的类型复杂时（尤其是比较不是常数时间时）效率较低。
2. 使用哈希表进行跳转，为标号$V_i$创建哈希表，其中保存跳转到的指令地址。
3. 使用跳转表。这种实现的效率最高，但是要求也最为苛刻。必须要求$E$的类型为整数，且其取值范围和标签个数对应，否则会造成较大的空间浪费。

我们依次介绍三种实现`switch`语句的方式：

```
        # 计算表达式E的值，保存在t中
        t = ...
        goto test
L1:     # S1的代码
        goto next
L2:     # S2的代码
        goto next
        # ...
test:   if t = V1 goto L1
        if t = V2 goto L2
        # ...
        goto Ln
next:   # ...
```
这种翻译方式把条件判断语句放在一起，方便优化器进行优化。
除此之外，所有负责`switch`语句的条件跳转都出现在标号后面，因此不需要使用复杂的回填技术。

总的来说，这种代码的生成最为简单。
当我们发现`switch`关键字时，就生成两个标号`test`和`next`，以及用来保存表达式值的临时变量，然后生成求值代码和`goto test`。
然后我们每次发现一个标号，就生成新的标号，同时在一个单独的队列中生成值-标号对，用来保存每个常数值对应的标号。
然后，我们为每个语句生成`goto next`。
最后，生成条件跳转指令。

---

```
        t = ...
        if t != V1 goto L1
        # S1的代码
        goto next
L1:     if t != V2 goto L2
        # S2的代码
        goto next
        # ...
```
这种翻译方式把条件判断语句放在每一段代码之前。
这会为翻译（尤其是一趟式翻译）带来一些困难，因为生成跳转指令时还不知道跳转的目标。

---

```
        # 计算表达式E的值，保存在t中
        t = ...
        goto test
L1:     # S1的代码
        goto next
L2:     # S2的代码
        goto next
        # ...
test:   case t V1 L1
        case t V2 L2
        # ...
        goto Ln
next:   # ...
```
这种翻译方式和第一种没有本质区别，只是把条件跳转指令替换成专门的分支指令而已。
这允许链接器执行针对`switch`语句的特殊优化，比如实现跳转表。

### 翻译函数调用

函数调用和运行时环境密切相关，因此此处我们不对其做详细的讨论，只给出如何翻译的一些提示。

1. 函数类型。在符号表中，我们需要为每个函数赋予一个类型。这种类型中需要指明参数个数及类型和返回值类型。
2. 符号表。设编译器处理到函数定义时当前的符号表为$s$，那么函数名需要被放入$s$中以在其他部分使用。在处理函数内的语句前，我们需要把当前函数表压栈并使用新的符号表。在新的符号表中，可能需要保存一个指向上层符号表的指针，以便于引用上层的数据。
3. 类型检查。在表达式中，函数调用和运算符的处理相同，因此此前讨论的类型检查规则，尤其是隐式转换规则，仍然适用。
4. 函数调用。为函数调用`id(E,E,...,E)`生成三地址代码时，首先为每个表达式生成三地址代码，将其值保存在临时变量中，然后使用`param`指令指定所有参数，最后使用`call`指令执行调用。

以上内容均假设该语言的所有表达式的类型被直接确定。
如果不能，那么可能需要使用类型推导来确定函数和参数的类型。

函数调用的大部分内容实际上属于运行时环境，此处我们不加介绍。
