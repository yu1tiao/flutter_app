import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class TestPlatformPage extends StatefulWidget {
  @override
  _TestPlatformPageState createState() => _TestPlatformPageState();
}

class _TestPlatformPageState extends State<TestPlatformPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        "platform view",
        style: TextStyle(color: Theme.of(context).textSelectionColor),
      )),
      body: Container(
        color: Colors.lightBlue,
        width: 200,
        height: 200,
        child: _buildBody(context),
      ),
    );
  }

  // 引用原生的view
  Widget _buildBody(BuildContext context) {
    // if (defaultTargetPlatform == TargetPlatform.android) {
    //   return AndroidView(viewType: "test_platform_view");
    // } else {
    //   return UiKitView(viewType: "test_platform_view");
    // }
    return Text("测试");
  }
}
