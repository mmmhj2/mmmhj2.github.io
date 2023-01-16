---
layout: post
title: "中间代码生成——类型检查"
---

本文将概述类型检查的两个大类：类型综合和类型推导。

类型综合（Type synthesis）比较简单，常见于静态类型语言，它要求所有名字（变量、函数等）先声明自己的类型，再使用。
它通过递归地计算子表达式的类型来确定整个表达式的类型。
典型的类型综合规则具有以下形式：

> 若 $f$ 的类型为 $s \to t$，且$x$的类型为$s$，
> 那么 $f(x)$ 的类型为 $t$。

类型推导的基本原理在前文中已经展示过了。

类型推导（Type inference）是指通过语言结构的使用方式来推导结构的类型，常见于函数式编程语言（如Lisp、Haskell等）中。
我们用类型变量来表示未知的类型，通常把它们写成希腊字母的形式。
典型的类型推导规则具有以下形式：

> 若存在表达式$f(x)$，
> 那么对某些$\alpha$和$\beta$，$f$的类型为$\alpha \to \beta$，且$x$的类型为$\alpha$

在本文中，我们只考虑表达式的类型检查，因为表达式的类型规则检查和检查其他语句的检查大同小异。
比如，对条件判断语句`if (expr) stmt;`，我们只需要把`if`看作是从$boolean \times void$映射到无类型$void$的函数即可。

## 类型转换与类型综合

考虑常见的浮点数乘整数的运算。
在计算机中，整数和浮点数的实现非常不同，因此其中一者的类型会发生变化。
在大多数程序设计语言中，这会导致整数被转换成浮点数。

我们假设存在一个单目的运算符，表示强制类型转换，其语法与C中的转型相同，那么类似`2 * 3.14`的三地址代码可以写成：
```
t1 = (float) 2
t2 = t1 * 3.14
```
我们也可以引入新的运算符来区分浮点之间和整数之间的算数运算。

只需要稍稍修改一下翻译方案就可以实现类型综合了。
对产生式$E \to E_1 + E_2$，我们使用以下语义动作来确定$E$的类型：
```cpp
if(E1.type == INTEGER && E2.type == INTEGER) E.type = INTEGER;
else if(E1.type == FLOAT && E2.type == INTEGER) E.type = FLOAT;
else if(E1.type == INTEGER && E2.type == FLOAT) E.type = FLOAT;
else if(E1.type == FLOAT && E2.type == FLOAT) E.type = FLOAT;
```
然而，当类型增多时，这样的语义动作会以二次的速度膨胀，因此在设计语言时需要小心地设计其类型系统。
在C++中，标准使用[浮点优先和转换等级并用](https://zh.cppreference.com/w/cpp/language/operator_arithmetic)的规则实现类型转换。
在Java中，转换规则区别了拓宽转换和窄化转换。
拓宽转换不会损失原有的信息，而窄化转换可能丢失信息。

如果类型转换由编译器自动进行，那么称为隐式类型转换（Implicit type conversion，也称Coercion）。
如果程序员必须手动执行类型转换，那么称为显式类型转换（Explicit type conversion，也称Casting）。
在很多语言中，隐式的类型转换只会在不损失信息（即拓宽）的情况下发生。

为了实现自动化的类型综合，而不用使用大量的条件判断语句，我们使用两个函数：`max`和`widen`。
对绝大部分语言来说，拓宽转换的类型构成了树形，最宽的类型（通常是`double`）是树的根。
而`max`函数返回这棵树上两个结点（类型）的最近公共祖先（Least common ancestor，LCA）。
考虑到类型树一般比较矮，可以直接查表而不用真的构造这棵树。
`widen`则是生成类型转换代码所用的函数，它接受一个地址（或符号表条目，用来表示变量），该地址的类型和将要转换到的类型，然后产生类型转换指令。
其实现可能如下所示：
```cpp
Address widen(Address a, Type t, Type w)
{
    if(t == w)  return a;
    else if(t == INTEGER && w == FLOAT)
    {
        temp = new Temp();
        // 生成类型转换代码
        generate_code(temp + " = (float) " + a);
        return temp;
    }
    else /* ...... */
        ;
}
```
而对应的语义动作也修改为：
```
E.type = max(E1.type, E2.type);
a1 = widen(E1.addr, E1.type, E.type);
a2 = widen(E2.addr, E2.type, E.type);
E.addr = new Temp();
generate_code(E.addr + " = " + a1 + " + " + a2);
```

### 运算符与函数的重载

有一些语言支持运算符或函数的重载，这就是说，根据符号所在的上下文不同，同一个符号（函数名）可能具有不同的意义。
在此处，我们只考虑只需要查看函数的参数就可以解决的函数重载，比如Java中的函数重载。

这种重载的类型综合规则也是容易描述的：
> 若 $f$ 可能的类型为 $s_i \to t_i$（$1 \le i \le n$），其中$\forall i \neq j, \; s_i \neq s_j$，
> 且 $x$ 的类型为$s_k$（$1 \le k \le n$），
> 那么 $f(x)$ 的类型为 $t_k$

如果我们用和表达式相同的方式，利用DAG来表示类型表达式，那么可以利用此前的方法（哈希表）来高效地解决重载问题。

有些时候，仅仅通过查看一个函数调用的参数类型可能不能决定使用哪个重载。
比如在 Ada 中，一个子表达式可能具有多种可能的类型，我们需要根据其上下文决定多种可能类型的一个，然后确定整个表达式的类型，进而确定子表达式的类型。
然而，这样的SDD可能不是L属性的，因为由子表达式确定整个表达式的类型需要用到产生式头的一个综合属性，而再由整个表达式的类型确定子表达式的类型需要产生式体的继承属性。
从而每个结点的继承属性依赖于产生式头的综合属性，这违反了L属性的定义。

## Hindley–Milner类型系统

在研究类型推导之前，我们首先介绍[**Hindley–Milner类型系统**](https://en.wikipedia.org/wiki/Hindley%E2%80%93Milner_type_system)。
这是当前最常用的用于推导的类型系统，其基于λ运算，用来描述**参数多态**的类型。

### λ运算简述

不正式地讲，所谓λ运算，就是*代入*或*置换*（Substitution）运算。
对于一个典型的λ函数，写作$\lambda x . x$，表示对任意$x$，把点后的内容随$x$一起替换掉。
比如，当$x = 3$时，$(\lambda x.x)(3) = 3$。
在不引起歧义的情况下，可以把括号省略，从而写成$\lambda x.x \; 3 = 3$。

对于有多个参数的函数，λ运算使用一种叫做“柯里化”的技巧。
比如对常见的平方和函数$f(x,y) = x^2 + y^2$，其λ表达式写为$\lambda x \lambda y . x^2 + y^2$。
在代入时，首先用$x = 4$取代$x$，变成$\lambda y.16+y^2$。
然后再带入$y=3$，变成$16+9 = 25$。
这种把多元函数变成一连串一元函数的技巧就称为“柯里化”。

λ运算的重要之处在于其允许我们*匿名地*表示一个函数，即我们不再需要给每个函数命名。
这就是为什么许多语言中的匿名函数也被叫做λ函数。

在λ运算中，我们区别两种不同的变量：出现在λ之后的（称为**受限**变量、约束变量、虚变量或被绑定的变量）和没有出现在λ之后的（称为**自由**变量）。
比如对于$\lambda x . x+y$，$x$就是受限变量，而$y$就是自由变量。
我们可以任意替换受限变量而不改变该表达式的意义，比如$\lambda a . a + y$就和上一式子完全相同。
然而对自由变量，这样的变换就会导致表达式的意义不同。
这一名称来自更早的数学运算，比如考虑导数的定义：
$$
f^\prime(x) = \lim_{\delta \to 0} \frac{f(x + \delta) - f(x)}{\delta} = \lim_{h \to 0} \frac{f(x + h) - f(x)}{h}
$$
其中$\delta$和$h$就是受限变量，可以任意替换。
然而，仅仅替换一个式子中的$x$就会导致含义发生变化。

λ运算，和其他数学运算一样，相较于程序语言最大的问题就在于其缺少**类型**。
比如无论$x$是什么类型，$\lambda x.x$总是返回$x$自身。
为此，数学家们首先研究出了**简单类型λ运算**，其中只含有原子类型$T$和类型构造算子$\to$（表示映射）。
但是这种类型不能处理参数多态，因此又引入了各种其他的类型系统，其中最广泛使用的就是Hindley–Milner类型系统。

### 多态

术语“多态”（Polymorphism）指为不同数据类型的实体提供统一的接口，或使用一个单一的符号来表示多个不同的类型。 
多态分为三种：特设多态、参数多态和子类多态。

#### 特设多态

特设多态指人为地为多个类型提供不同的接口，且对不同的类型，实现的操作通常是不同的。
这种多态通常通过重载来实现。
这种多态称为“特设的”（Ad hoc），是因为，不同于参数多态和子类多态，这种多态不是类型系统的特征，而是使用语言的技巧，因此我们不研究这种多态。

比如考虑以下C++的两个运算符：
```cpp
int x = 1 + 2;
std::string y = std::string{"1"} + std::string{"2"};
```
其中，第一个运算是内建的整数运算，第二个则是字符串拼接。
这两个运算对程序员来说用法是相同的，因此是多态的一种表示形式。
然而，既不同于模板（参数多态）又不同于继承（子类多态），在编译时编译器仅仅是查找不同的函数而已，并不为这种多态做出其他的特殊处理。

#### 参数多态

如果我们可以用一种“参数”来指代类型，并借此为不同的类型书写相同的代码，那么这种多态就是参数多态。
这种多态允许在保持通用性的同时实现静态检查，因此也是本章的重点。
这种多态常见于函数式编程语言中，在C++中也以模板的形式出现。

#### 子类多态

子类多态通过继承关系实现，是面向对象编程中最常见的多态形式。
这种多态通常是在运行时实现的，因此本章不研究这种多态。

### Hindley–Milner类型系统简述

我们先简单介绍Hindley-Milner类型系统，然后说明如何用其实现类型推导。
从下面的描述中不难注意到其和λ运算的相似性。

#### 单一类型和聚合类型

在HM类型系统中，我们区别两种类型：单一类型（Monotype）和聚合类型（Polytype）。

单一类型总是表示一个具体的类型，比如类型常量$\mathrm{integer}$或$\mathrm{float}$等。
除此之外，具体类型的聚合也是单态类型，比如映射$\mathrm{integer} \to \mathrm{integer}$、列表$\mathrm{List}[\mathrm{integer}]$等。
我们默认单独出现的类型变量也是单一类型，注意这和单态类型不同，单态类型只允许具体的类型而不允许类型变量。

两个单一类型相等，当且仅当它们*完全一致*。

聚合类型，就是指类型变量可以被零或多个全称量词绑定的类型。
比如$\forall \alpha . \alpha \to \alpha$就是一个聚合类型，全同函数$\mathbf{id}$就是这个类型的。
$\forall \alpha . (List [\alpha]) \to \alpha$也是一个聚合类型，求一个列表的元素个数的函数就是这个类型的。
注意$\forall$量词只能出现在最左侧。
单一类型可以看作是聚合类型的特例，因此所有类型都可以写为
$$
\forall \alpha_1 \dots \forall \alpha_n . \tau \; n \ge 0
$$
其中$\tau$为一个单一类型。
如果量词绑定的类型变量不在$\tau$中出现，那么可以删去这些变量。

如果通过重排$\forall \alpha_i$的顺序、重命名这些变量或删去多余的变量可以使两个多态类型完全相同，那么称这两个类型相等。

#### 受限类型与类型序

类比λ运算，在聚合类型中，我们称被全称量词$\forall$限定的类型变量为受限类型，而未被限定的称为自由类型。
比如对类型$\forall \alpha. \alpha \to \beta$，$\alpha$就是受限类型。
和受限变量一样，如果同时替代所有受限变量，那么这个聚合类型和替代前的仍然相等。

特别地，如果我们把一个受限类型用一个单一类型**置换**或代入（Substitute）并消去全称量词，那么就生成了一个聚合类型的**实例**。
比如，对多态类型$\forall \alpha. \alpha \to \alpha$，应用置换$S = \\\{\alpha \mapsto \mathrm{integer}\\\}$，那么生成的单态类型$\mathrm{integer} \to \mathrm{integer}$就是这个多态类型的实例。

这一运算构成了一个偏序关系。
如果类型$\sigma$是$\sigma^\prime$的一个实例，或称$\sigma^\prime$比$\sigma$更一般，就可以记作$\sigma^\prime \sqsubseteq \sigma$

用逻辑语言，可以写成：
$$
\frac{\tau^\prime = S(\tau) \quad \beta_i \notin \mathrm{free}(\forall \alpha_1 \dots \forall \alpha_n . \tau)}{\forall \alpha_1 \dots \forall \alpha_n . \tau \sqsubseteq \forall \beta_1 \dots \forall \beta_m . \tau^\prime}
$$
表示若$\tau^\prime$是把置换$S$应用到$\tau$上产生的，且$\beta_i$都是$\forall \alpha_1 \dots \forall \alpha_n . \tau$的受限变量，那么有：
$$
\forall \alpha_1 \dots \forall \alpha_n . \tau \sqsubseteq \forall \beta_1 \dots \forall \beta_m . \tau^\prime
$$
对这个偏序关系，最小（最一般）的聚合类型为$\forall \alpha . \alpha$。

若存在一个置换使得对两个聚合类型$\tau_1$和$\tau_2$，满足$S(\tau_1) = S(\tau_2)$，那么我们称这个置换是**合一置换**（Unifier）。
对$\tau_1$和$\tau_2$之间的两个合一置换$S$、$S^\prime$，如果满足$\forall \tau, \forall S^\prime, S(\tau) \sqsubseteq S^\prime(\tau)$，那么称$S$是$\tau_1$和$\tau_2$的最一般合一置换。

#### 合一与类型推导

我们考察多态函数的类型推导，从而考察合一在类型推导中的作用。

我们只考察单变量的函数，其类型可写为$s \to t$。
对多变量函数，我们可以用笛卡尔积生成其值域，即`f(x,y)`的类型可写为$s_1 \times s_2 \to t$，也可以使用柯里化技巧。

假设这个语言中所有变量声明时不指明类型，我们给出这个推导算法：
1. 对一个函数定义`fun id1 (id2) = E`，其中`id1`为函数名，`id2`为参数名，我们创建新的类型变量$\alpha$和$\beta$，然后用$\alpha \to \beta$表示`id1`的类型，$\alpha$表示`id2`的类型，然后尝试推导`E`的类型。
   假设对`E`进行推导之后，确定$\alpha$的类型为$s$，$\beta$的类型为$t$，那么`E`的类型为$s \to t$。
   如果还存在不能确定的类型（即仍然存在类型变量），就用全称量词限定它们。
2. 对函数应用（调用）`E1 (E2)`，推导`E1`和`E2`的类型。
   首先对`E1`，因为其是被调用的函数，所以其一定具有$s \to s^\prime$的形式（或者与$\theta \to \gamma$合一，其中$\theta$和$\gamma$是新的类型变量）。
   其次对`E2`，假如其推导得到的类型为$t$，那么对$s$和$t$进行合一处理，这里可能需要递归处理。
   如果合一失败，那么表达式的类型错误；如果合一成功，那么`E1 (E2)`的类型为$s^\prime$。
3. 对多态函数的每次出现，将其所有受限变量替换成互不相同的新变量，并移除全称量词。
   这个新类型就是此处多态函数出现的类型。
4. 对第一次碰到的变量，引入一个新的类型变量来代表它的类型。

我们尝试对下列函数推导其类型：
```
fun length(x) = 
    if null(x) then 0 else length(tl(x)) + 1;
```
这个函数对于一个列表返回其长度。
`null(x)`表示一个列表是否为空，`tl(x)`移除一个列表的第一个元素。

对`if`这一控制语句类比C语言中的问号表达式，我们假设其具有$\forall \alpha . \mathrm{boolean} \times \alpha \times \alpha \to \alpha$这个类型。
对`null`这一内建函数，我们假设其类型为$\forall \alpha . \mathrm{list}[\alpha] \to \mathrm{boolean}$。

1. 首先，我们假设`length`函数具有类型$\beta \to \gamma$，而`x`的类型为$\beta$。
2. 然后对`if ... then ... else`，我们设其类型为$\mathrm{boolean} \times \alpha_i \times \alpha_i \to \alpha_i$，注意此时我们已经把全称量词消去，并用独特的类型变量替换了，我们需要递归地确定其类型。
3. 现在处理多态函数的调用`null(x)`。
   1. 首先对`null`，我们设其类型为$\mathrm{list}[\alpha_n] \to \mathrm{boolean}$。
   2. 现在处理函数调用`null(x)`。我们尝试将$\beta$与$\mathrm{list}[\alpha_n]$合一，使用置换$\beta \mapsto \mathrm{list}[\alpha_n]$即可。
   进行合一后，我们可以得出`null(x)`的类型为$\mathrm{boolean}$。
4. 对常量`0`，其类型为$\mathrm{integer}$。
5. 对运算`length(tl(x)) + 1`，我们把它看作对函数`+`的调用，自底向上地处理这个表达式，首先处理`length(th(x))`。
6. 现在处理多态函数调用`length(tl(x))`。
   1. 首先对多态函数`tl`，我们设其类型为$\mathrm{list}[\alpha_t] \to \mathrm{list}[\alpha_t]$。
   2. 然后处理函数调用`tl(x)`，进行$\mathrm{list}[\alpha_t]$和$\mathrm{list}[\alpha_n]$的合一，注意此时$\beta$已经被置换了。
      此时使用置换$\mathrm{list}[\alpha_t] \mapsto \mathrm{list}[\alpha_n]$。
   3. 现在处理函数调用`length(tl(x))`，我们此前已经假设其类型为$\beta \to \gamma = \mathrm{list}[\alpha_n] \to \gamma$，从而其类型为$\gamma$。
7. 现在处理对`+`的调用，其类型为$\mathrm{integer} \times \mathrm{integer} \to \mathrm{integer}$。
   进行$\gamma$和$\mathrm{integer}$的合一，使用置换$\gamma \mapsto \mathrm{integer}$。
8. 最后回到`if ... then ... else`，使用合一可得出其类型为$\mathrm{integer}$。
9. 我们用这个算法得出`length(x)`的类型为$\mathrm{list}[\alpha_n] \to \mathrm{integer}$，现在用全称量词限定它，得到最终结果$\forall \alpha . \mathrm{list}[\alpha] \to \mathrm{integer}$。

#### 合一算法的实现

如果我们使用图论工具来描述合一算法，可以发现合一操作可以容易地用**并查集**的原理实现。

每当尝试进行一次合一，就执行一次并查集的合并。
我们知道，并查集实际上是一棵树，而在此处树的根就是置换后的类型变量。
需要注意一点，即合一代表了一次置换，而置换是有方向性的，因此这个并查集中不能使用按秩合并优化，但是仍可以使用路径压缩优化。

我们接下来详细描述这个算法：
首先，我们假设结点用记录（结构体）实现，每个结点中保存指向其左右子节点（若有）的指针。
除此之外，每个结点还保存一个指针，用来指向其在并查集中的父节点；对根节点，这个指针指向自己。
最开始，所有结点都是并查集中的根节点，从而表示其各不相交。

我们假设类型表达式也按此前所述的方法组成了DAG，那么可以给出合一算法：
```cpp
bool unify(node m, node n)
{
    auto s = find(m);
    auto t = find(n);
    if(s == t)
        return true;
    // 如果s和t表示相同的基本类型
    else if(s.basicType == t.basicType)
        return true;
    // 如果s和t表示一个运算符，从而有两个子节点
    else if(s.hasChildren && t.hasChildren)
    {
        union(s, t);
        return unify(s.lch, t.lch) && unify(s.rch, t.rch);
    }
    // 如果s和t都表示类型变量
    else if(s.isVariable == t.isVariable)
    {
        union(s, t);
        return true;
    }
    return false;
}
```
其中`union`和`find`都是并查集中的操作。
我们约定，如果`union`操作中有一个为类型变量，而另一个为非变量（类型常量，即基本类型，或类型构造算子），则**总是把变量合并到非变量的等价类**里，因此不能使用按秩合并优化。
注意此时每个结点记录既代表了DAG中的一个结点，又代表了并查集中的一个结点。

成功完成该算法后，每个类型变量的等价类的代表元，即其所在并查集中的根结点所代表的类型，就是其应该被置换成的类型。
这个根节点可能仍是一个类型变量或类型常量（即DAG上的叶子节点），也可能是一个复杂的类型表达式（即DAG上的内部节点）。
