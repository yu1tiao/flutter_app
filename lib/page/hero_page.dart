import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class TestHeroPage extends StatefulWidget {
  @override
  _TestHeroPageState createState() => _TestHeroPageState();
}

class _TestHeroPageState extends State<TestHeroPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        "hero动画",
        style: TextStyle(color: Theme.of(context).textSelectionColor),
      )),
      body: _buildBody(context),
    );
  }

  // 原生方式引用动画，需要手动监听动画的状态刷新ui
  Widget _buildBody(BuildContext context) {
    return Center(
      child: Hero(
        tag: "hero_tag", // Hero包裹，设置相同tag的元素自动生成动画
        child: SizedBox.expand(child: FlutterLogo()),
      ),
    );
  }
}
