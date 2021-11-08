import 'package:flutter/material.dart';

/**
 * 自定义实现AppBar
 */
class MyAppBar extends StatelessWidget {
  const MyAppBar({required this.title, Key? key}) : super(key: key);

  final Widget title;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      // Container 相当于View
      height: 50,
      padding: const EdgeInsets.symmetric(horizontal: 0.0),
      decoration: BoxDecoration(color: Colors.blue[500]),
      child: Row(
        children: [
          IconButton(onPressed: null, icon: Icon(Icons.menu)),
          Expanded(child: title),
          IconButton(onPressed: null, icon: Icon(Icons.search)),
        ],
      ),
    );
  }
}

class MyScaffold extends StatelessWidget {
  const MyScaffold({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        children: [
          MyAppBar(
              title: Center(
                  child: Text(
            "示例",
            style: Theme.of(context).primaryTextTheme.headline6,
          ))),
          const Expanded(
              child: Center(
            child: Text("中国"),
          ))
        ],
      ),
    );
  }
}

/**
 * 使用提供的组件Scaffold
 */
class TutorialHome extends StatelessWidget {
  const TutorialHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const IconButton(
          onPressed: null,
          icon: Icon(Icons.menu),
          tooltip: "Navigation menu",
        ),
        title: const Text("示例标题"),
        actions: const [
          IconButton(
            onPressed: null,
            icon: Icon(Icons.search),
            tooltip: "Search",
          )
        ],
      ),
      body: Center(
        // child: Text("中心"),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
        ),
      ),
      floatingActionButton: const FloatingActionButton(
        onPressed: null,
        tooltip: "Add",
        child: Icon(Icons.add),
      ),
    );
  }
}

/**
 * 处理手势，例如：点击事件
 */
class MyButton extends StatelessWidget {
  const MyButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /**
     * 出现了意想不到的画面，
     *  例如：- Container设置高度无效，全屏。
     *       - Text出现了基线。
     *  以上问题如果外层包装了Material、Scaffold，则是预期结果。
     *
     */
    return GestureDetector(
        onTap: () {
          print('MyButton was tapped!');
        },
        child: Container(
          height: 50,
          padding: const EdgeInsets.all(0.0),
          margin: const EdgeInsets.all(50.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.0),
            color: Colors.purpleAccent,
          ),
          child: const Center(
              child: Text(
            "Engine",
            style: const TextStyle(fontWeight: FontWeight.bold),
          )),
        ));
  }
}

/**
 * 根据用户输入改变widget。
 * 例子一：显示和改变在一起
 */
class Counter extends StatefulWidget {
  const Counter({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _CounterSate();
  }
}

class _CounterSate extends State<Counter> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(onPressed: _increment, child: const Text("自加")),
        const SizedBox(
          width: 10,
        ),
        Text('Count:$_counter')
      ],
    );
  }

  void _increment() {
    setState(() {
      _counter++;
    });
  }
}

/**
 * 根据用户输入改变widget。
 * 例子一：显示和改变在分离。责任的分离将更大的复杂性封装在各个widget中，保证了父级的简单性。 单一职责原则。
 * CounterDisplay：显示计数器；CounterIncrementor 改变计数器
 */
class CounterDisplay extends StatelessWidget {
  final int count;

  const CounterDisplay({Key? key, required this.count}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text('Count:$count');
  }
}

/**
 * 改变计数器
 */
class CounterIncrementor extends StatelessWidget {
  final VoidCallback onPressed;

  const CounterIncrementor({Key? key, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: onPressed, child: const Text("自加"));
  }
}

class Counter2 extends StatefulWidget {
  const Counter2({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _CounterState2();
  }
}

class _CounterState2 extends State<Counter2> {
  int _counter = 0;

  void _increment() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CounterIncrementor(onPressed: _increment),
        const SizedBox(width: 10),
        CounterDisplay(count: _counter)
      ],
    );
  }
}

void main() {
  runApp(
    MaterialApp(
      title: "My App",
      home: Counter2(),
      // home: Counter(),
      // home: MyButton(),
      // home: TutorialHome(),
      // home: SafeArea(child: MyScaffold()),
      // home: MyScaffold(),
    ),
  );
}
