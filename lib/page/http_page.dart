import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/entity/GankBanner.dart';
import 'package:flutter_app/util/sp_util.dart';

class TestHttpPage extends StatefulWidget {
  @override
  _TestHttpPageState createState() => _TestHttpPageState();
}

class _TestHttpPageState extends State<TestHttpPage> {
  String text = "---";

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
      child: Column(
        children: [
          Image.network(
            text,
            width: 400,
            height: 300,
          ),
          RaisedButton(
            child: Text("请求接口"),
            onPressed: _requestHttp,
          ),
          RaisedButton(
            child: Text("保存当前时间到sp，然后取出时间弹出toast"),
            onPressed: _put2sp,
          ),
          RaisedButton(
            child: Text("native toast"),
            onPressed: () => {_nativeToast("这是来自flutter的toast")},
          ),
        ],
      ),
    );
  }

  void _nativeToast(String message) async {
    // 调用原生的toast，需要注册MethodChannel，
    const channel = MethodChannel("com.yu1tiao.test.toast");
    try {
      var code = await channel.invokeMethod("nativeToast", message);
      print("调用nativeToast成功：code = $code");
    } catch (e) {
      print("调用nativeToast失败");
    }
  }

  void _put2sp() {
    saveValue("key", "2020-11-11").then((value) => print("保存成功")).whenComplete(
        () => getString("key")
            .then((value) => _nativeToast("获取数据成功: value = $value")));
  }

  void _requestHttp() async {
    Dio dio = new Dio();
    var response = await dio.get<String>("https://gank.io/api/v2/banners",
        options: Options(headers: {"header1": "header1"}));

    if (response.statusCode == HttpStatus.ok) {
      print("request success: ${response.data}");
      var banner = GankBanner.fromJson(json.decode(response.data));

      setState(() {
        text = banner.data[1].image;
      });
    } else {
      print("Error: ${response.statusCode}");
    }
  }
}
