import 'package:flutter/material.dart';
import 'package:flutter_app/page/home_page.dart';

import 'router_map.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: getLightTheme(),
      // routes: RC.routerMap,
      onGenerateRoute: RC.routeFactory,
      home: HomePage(title: 'Flutter Demo Home Page'),
    );
  }

  ThemeData getLightTheme() {
    return ThemeData(
      brightness: Brightness.light,
      primaryColor: Colors.blue[300],
      textSelectionColor: Colors.black,
      textSelectionHandleColor: Colors.grey[400],
      buttonColor: Colors.grey[100],
      backgroundColor: Colors.white,
    );
  }

  ThemeData getDarkTheme() {
    return ThemeData(
      brightness: Brightness.dark,
      primaryColor: Colors.indigo,
      textSelectionColor: Colors.white,
      textSelectionHandleColor: Colors.white70,
      buttonColor: Colors.grey[600],
      backgroundColor: Colors.grey[850],
    );
  }
}
