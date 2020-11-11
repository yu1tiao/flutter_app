import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class TestAnimPage extends StatefulWidget {
  @override
  _TestAnimPageState createState() => _TestAnimPageState();
}

class _TestAnimPageState extends State<TestAnimPage>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation animation;

  @override
  void initState() {
    // 建立controller，用于控制动画执行
    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 2));

    // 设置一个动画的曲线，例如加速、减速、线性等，可选，不设置默认是线性的
    final curve = CurvedAnimation(parent: controller, curve: Curves.easeInOut);

    // Animation用于真正计算动画的值，需要在listener中setState才能更新ui
    // 类似于Android的属性动画，插值器用来计算值，然后需要把值设置到具体的属性播放动画
    animation = Tween(begin: 50.0, end: 200.0).animate(curve)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        // 添加监听，播放完成时反向执行
        if (status == AnimationStatus.completed) {
          controller.reverse();
        }
        // 反向完成时又正向执行
        if (status == AnimationStatus.dismissed) {
          controller.forward();
        }
      });

    controller.forward();

    // 以重复播放的形式开始动画，等价于addStatusListener的方式反复执行
    // controller.repeat();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        "动画",
        style: TextStyle(color: Theme.of(context).textSelectionColor),
      )),
      body: _buildBody(context),
    );
  }

  // 原生方式引用动画，需要手动监听动画的状态刷新ui
  Widget _buildBody(BuildContext context) {
    return Center(
      child: Container(
        child: FlutterLogo(),
        width: animation.value,
        height: animation.value,
      ),
    );
  }

  /// AnimatedBuilder，自动应用动画的值
  Widget _buildBodyByAnimBuilder(BuildContext context, Animation animation) {
    return Center(
      child: AnimatedBuilder(
        animation: animation,// 外部传入animation
        child: FlutterLogo(),// 应用动画的child
        builder: (context, child) => Container(
          child: child,// 这个child就是外部传进来的动画的目标widget
          width: animation.value,
          height: animation.value,
        ),
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

/// 框架提供的动画类，可以自动监听动画的属性，animation由外部传入，不用手动监听状态了
class MyAnimLogo extends AnimatedWidget {
  MyAnimLogo({Key key, @required Animation<double> animation})
      : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    final Animation animation = listenable;
    return Center(
      child: Container(
        height: animation.value,
        width: animation.value,
        child: FlutterLogo(),
      ),
    );
  }
}
