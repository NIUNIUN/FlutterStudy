# fluttermyapp

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.


# 学习链接
## Dart 学习
https://juejin.cn/post/6844903878073253895#heading-27  
https://juejin.cn/post/6844903779318366215
## Flutter 学习
老孟CSDN: https://mengqd.blog.csdn.net/article/list/7  
老孟自开发网站：http://laomengit.com/guide/widgets/RichText.html  
Flutter 入门与实战：https://juejin.cn/column/6960631670378594311  
《Flutter实战·第二版》：https://book.flutterchina.club/preface.html#%E7%AC%AC%E4%BA%8C%E7%89%88%E5%8F%98%E5%8C%96  
Flutter 学习与总结： https://blog.csdn.net/qq_27948659/article/details/102721742?ops_request_misc=&request_id=&biz_id=102&utm_term=flutter%E5%AD%A6%E4%B9%A0&utm_medium=distribute.pc_search_result.none-task-blog-2~all~sobaiduweb~default-8-102721742.first_rank_v2_pc_rank_v29&spm=1018.2226.3001.4187




# Dart 学习笔记
    Dart 属于动态类型语言，支持闭包。  
Dart 中一切皆 **对象，甚至数字、方法和null** 都是对象。

标识符可以字母或（_）开始，或者是字符加数字的组合开头。
## 变量声明
    未初始化的变量初始值为null，数字也是。
- var，可定义任意类型变量，不过一旦赋值后，不能再更改类型。
- const ，是编译时常量
- final ，只能赋值一次。   **实例变量可以为 final 但不能为 const。**
- Object 是所有对象的根基类（包括 Function 和 Null）；Object 声明的对象只能使用 Object 的属性和方法。
- dynamic 和 var 一样是关键词； dunamic 后期可更改类型； dynamic 声明的对象编译器会提供所有可能的组合。
## 数据类型
### 基本数据类型
- var 可定义变量。
- number 类型分为 int 和 double，java 中 long 对应也是int。没有 float 类型。
- 只有 bool 可以用if等判断，和 java 语法一致。
- 可使用 assert 断言函数，先式的检查值。
### String 字符串
### List 数组
    声明：方括号 [] 或 定义 list。
    下标从 0 开始。
    定义编译时常量 list：var list = const [1,3,5];
### map
    声明：花括号{} 或 Map构造函数。

## 函数
- 可选参数，参数放在中括号[]内
- 命名参数：调用函数时必须指定参数名字。方式： 参数放在花括号{}内。  例子：flutter 中 Text widget。

      调用命名参数的函数时，没有指定参数的名字，则会出错。 
- 参数可设置默认值，但必须是可选参数或命名参数
- void 无返回值函数
- 匿名函数，可以将函数当参数传递给另一个函数。kotlin 也可以。

## 运算符
### 算术运算符
|操作符 |解释|
|---|---|
|+|加号|
|-|减号|
|-expr|负号|
|/|除号，返回值为double类型|
|~/|除号，返回值为整型|
|%|取模|
### 类型判断操作符
|操作符|解释|
|---|---|
|as|类型转换|
|is|如果对象是指定的类型返回true|
|is!|如果对象是指定的类型返回false|
### 级联操作符
级联操作符（..）可以在同一个对象上连续调用多个函数以及访问成员变量，避免创建临时变量。其实相当与 java 中的 builder 模式。
## 流程控制
- if-else
- for
- while,do-while
- break,continue
- switch
- assert

## 面向对象
    和 java 一样，有抽象类、静态方法、重载、重写、继承、泛型。
特别之处：
- 构造函数还可以这样写： Dog(this.name,this.age);  简洁，直接赋值了。
- 命名构造函数，给构造函数提供名称。例如： Dog.newBorn(Map json)。
- 访问权限，默认类中所有属性和方法都是public。  以下划线开头，表示私有。
## 语法
- 方法名或变量名以下划线开头，表示私有
- 方法返回值默认不能为null，如需返回null，在方法返回值类型后添加?

## 异常捕获
    和 java 一样，有try{}catch 、throw、finall。
特别之处：对于指定某种类型的异常，可以通过 on 关键字捕获。例如：try{ }on IntegerDivisionByZeroException{ print("") }。

## 枚举
    和 java 一样，

## 异步


# Flutter 学习笔记
## Widget 学习
    flutter 中，所有东西都是widget，与android中view不同。可见的（如图像、图标、文本等）是widget，不可见的（如排列、限制、行、列、网格）也是widget。

- SizedBox 一个有大小的盒子（占位），相当于在Android中View
- ListTile
- ListView  ，相当于Android中RecyclerView
- SafeArea 针对刘海屏，添加后会自动增加刘海屏的高度，不添加则无刘海屏的高度紧贴屏幕上边。
- 文字修饰 TextDecoration

  - lineThrough 删除线
  - underline  底部下划线
  - overline   顶部线
  - none  无
- Alignment 对齐

     Alignment(x,y) 表示矩形内的点，(0,0)表示矩形的中心。

- Text 文本，其中一个属性softWrap—— true表示文本将在填充满列宽后在单词边界处自动换行

### 布局widget

    对齐或限制可见widget的方式，那么从各种布局widget中选择。布局widget 的特性会传递给它所包含的widget。
    布局 widgets 具有一下任一项：
        - 一个 child 属性，如果它们只包含一个子项，例如 Center 和 Container。
        - 一个children 属性，如果它们包含多个子项，例如 Row、Column、ListView 和 Stack。

对于 Material App， Scaffold widget 提供默认的 banner 背景色，还有用于添加抽屉、提示条和底部列表弹窗的API。

对于非 Material App，可以将Center widget 添加到 app 的 build()里。默认情况下，不包含 AppBar、标题和背景颜色，可自己构建。

- 横向或纵向widget Row\Column
- Align
  - MainAxisAlignment 控制行如何对齐其子项。   主轴水平延伸，交叉轴垂直延伸。
    - start
    - center
    - end
    - spaceAround
    - spaceBetween
    - spaceEvenly   剩余空间均匀划分
  - CrossAxisAlignment 控制列如何对齐其子项。  主轴垂直延伸，交叉轴水平延伸。
    - start
    - center
    - end
    - baseline
    - stretch
- 调整 widgets 大小：Expanded widget；还可以使用flex属性，确定 widget 的弹性系数，默认的弹性系数是1。
- AspectRatio 让子级以指定的比例进行布局。
- ConstrainedBox
- CustomSingleChildLayout
- Expanded和Flexible
- FractionallySizedBox 基于剩余空间的比例限定子级的大小
- LayoutBuilder  让子级可以基于父级的尺寸重新调整其布局。
- SingleChildScrollow 为单一的子级添加滚动，配合Row或Column使用。

### 通用widget
- 标准widgets
  - Container 向widget 增加padding、margins、borders、background color 或其他装饰  
    属性clipBehavior：Clip.antiAlias - 抗锯齿；Clip.hardEdge - 裁剪效率最快；Clip.antiAliasSaveLayer - 最精细的裁剪，效率慢。；Clip.none - 默认值，内容没有超出容器边界，不做任何裁剪，内容超出边界则使用别的裁剪方式防止内容溢出。
  - GridView
  - ListView
  - Stack 将widget覆盖在另一个的上面
  - IndexedStack：管理页面显示层架的容器。
  - TextField：文本输入框。
- Material widgets
  - Card
  - ListTile 专用的行 widget，将最多三行的文本、可选的导语以及后面的图标组织在一行中。

## 创建响应式和自适应的应用
    响应式和自适应的区别？
    响应式：应用的布局会根据可用的屏幕大小而调整。例如旋转屏幕。
    自适应：应用以自适应的方式在不同的设备上运行，需要同时处理鼠标、键盘和触控输入。例如：移动端和桌面端。

## 理解约束布局
Flutter的布局方式规则：

    - 上层widget向下层widget传递约束条件
    - 下层widget向上层widget传递大小信息
    - 上层widget决定下层widget的位置。

Flutter的布局引擎有一些重要限制：

    - 一个widget只能在父级给其约束的情况下才能决定自身大小。 意味着不能任意获得想要的大小。
    - 一个widget的位置由父级决定，它无法知道、也不需要决定在屏幕中的位置。
    - 父级的位置和大小，取决于它自身的父级。在不考虑整棵树的情况下，几乎不可能精确定义任何widget的大小和位置。
    - 子级想要拥有和父级不同的大小，而父级没有足够的空间对齐进行布局，那么子级设置的大小可能不会生效。请明确指定它的对齐方式。

ConstrainedBox：有约束的盒子，仅对其从其父级接收到的约束下施加其他约束。  

UnconstrainedBox：无约束的盒子，允许其子级的 Container 可以变为任意大小。  子级超出父级约束空间，报异常。

OverflowBox：和 UnconstrainedBox 类似，不同的是：子级超出父级约束的空间，它将不会显示任何警告。

LimitedBox：它的限制，只能在获取无限约束时才起作用。  放在 UnconstraintedBox 起作用，放在Center不起作用。

FittedBox：可以让Text变为任意大小，缩放其文本直到填满所有可用宽度。  
    FittedBox 只能在由限制宽高中对子 widget 进行缩放（宽高不会变得无限大）。否则，它将无法渲染任何内容并报错。

Row：和 UnconstrainedBox 一样，不会约束子级，子级超出父级约束空间，报异常。
    Row 的子级被包裹了 Expanded，那么Row不会再让其决定自身的宽度，而是根据所有Expanded的子级来计算其该有的宽度。也就是说：使用了Expand，子级自身的宽度变得无关紧要，会被忽略。  
    Flexible 会让子级具有与Flexible相同或者更小的宽度，而Expanded会强制子级具有和Expanded相同的宽度。


屏幕会强制约束它直接子级 widget 宽高与其一致，它的直接子级可以变成任意大小，但是不能超时屏幕。  
Container被包含在Center中，Center被屏幕强制约束宽高，而Center告诉Container可以任意大小，如果Container没有固定大小和子级，那么和父级一样宽高，如果由子级，则由子级决定大小。

* Flutter 无法渲染无限大的东西，所以出抛出异常错误信息。


## 有状态和无状态的 widgets

无状态的 widget 自身无法改变。  
有状态的 widget 自身是可动态改变（基于State）。

### 状态管理
- widget 管理自己的状态
    使用 GestureDetector 捕获 Container 上的用户动作。
- 父 widget 管理此 widget 的状态
    父 widget 管理状态并告诉其子 widget 何时更新通常是最合适的。  从官网例子上看，父 widget 管理状态，会导致重新创建子 widget。

- 混搭管理


## 其他
- 获取屏幕的尺寸：MediaQuery.of(context).size属性。

# Flutter 的生命周期

