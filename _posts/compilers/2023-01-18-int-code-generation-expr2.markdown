---
layout: post
title: "中间代码生成——表达式与控制流②"
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
