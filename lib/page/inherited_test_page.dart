import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class TestInheritedPage extends StatefulWidget {
  @override
  _TestInheritedPageState createState() => _TestInheritedPageState();
}

class _TestInheritedPageState extends State<TestInheritedPage> {
  int count = 0;

  void _incrementCounter() {
    setState(() {
      count++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        "InheritedWidget 传递数据",
        style: TextStyle(color: Theme.of(context).textSelectionColor),
      )),
      body: CountContainer(
        model: this,
        increment: _incrementCounter,
        child: CountText(),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class CountContainer extends InheritedWidget {
  /// 提供一个静态方法of来获取自己，子布局获取，用于共享数据
  /// 用于父组件向子组件传递数据
  static CountContainer of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType();
  }

  final _TestInheritedPageState model;
  final Function increment;

  CountContainer({
    Key key,
    @required this.model,
    @required this.increment,
    @required Widget child,
  }) : super(key: key, child: child);

  @override
  bool updateShouldNotify(CountContainer oldWidget) {
    return oldWidget.model.count != model.count;
  }
}

class CountText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 获取CountContainer，显示count
    _TestInheritedPageState model = CountContainer.of(context).model;
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(model.count.toString()),
          RaisedButton(
            child: Text("加一"),
            onPressed: model._incrementCounter,
          ),
        ],
      ),
    );
  }
}
