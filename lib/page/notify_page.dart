import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class TestNotifyPage extends StatefulWidget {
  @override
  _TestNotifyPageState createState() => _TestNotifyPageState();
}

class _TestNotifyPageState extends State<TestNotifyPage> {
  String _msg = "qqq";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        "notification 传递数据",
        style: TextStyle(color: Theme.of(context).textSelectionColor),
      )),
      body: NotificationListener<CustomNotification>(
        onNotification: (notification) {
          setState(() {
            _msg = "收到消息：${notification.message}";
          });
          return true;
        },
        child: Align(
          alignment: Alignment.center,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(_msg),
              CustomChild(),
            ],
          ),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

/// Notification用于子组件向父组件传递数据
class CustomNotification extends Notification {
  final String message;

  CustomNotification(this.message);
}

class CustomChild extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: Text("点击发送message"),
      onPressed: () =>
          CustomNotification(DateTime.now().toString()).dispatch(context),
    );
  }
}
