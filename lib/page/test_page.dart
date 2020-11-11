import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class TestPage extends StatefulWidget {
  // TestPage({Key key, this.title}) : super(key: key);
  // final String title;

  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  void _incrementCounter() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        "布局练习",
        style: TextStyle(color: Theme.of(context).textSelectionColor),
      )),
      body: Center(
        child: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) => _buildItem(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }

  Widget _buildItem() {
    return Container(
      decoration: BoxDecoration(
          color: Theme.of(context).backgroundColor,
          borderRadius: BorderRadius.all(Radius.circular(8)),
          boxShadow: [
            BoxShadow(
                color: Colors.grey,
                offset: Offset(0, 2),
                blurRadius: 6,
                spreadRadius: 1)
          ]),
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.only(left: 10, top: 5, right: 10, bottom: 5),
      child: Column(
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                child: Image.network(
                  "https://static001.geekbang.org/resource/image/7d/eb/7d5a36a8727ed68f241719b7768262eb.jpg",
                  width: 68,
                  height: 68,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(left: 5, right: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Google maps - transition",
                        style: TextStyle(
                            color: Theme.of(context).textSelectionColor,
                            fontSize: 18),
                      ),
                      Text(
                        "2020-10-14",
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                    ],
                  ),
                ),
              ),
              FlatButton(
                child: Text(
                  "open",
                  style: TextStyle(color: Colors.blue, fontSize: 16),
                ),
                color: Theme.of(context).buttonColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                onPressed: _pressed,
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.only(top: 8),
            alignment: Alignment.topLeft,
            child: Text("考虑到需要适配不同尺寸的屏幕，中间部分的两个文本应该是变长可伸缩的"),
          ),
          Container(
            padding: EdgeInsets.only(top: 8),
            alignment: Alignment.topLeft,
            child: Text(
              "你就会发现还有 3 个问题待解决",
              style: TextStyle(color: Colors.grey),
            ),
          )
        ],
      ),
    );
  }

  _pressed() {}
}
