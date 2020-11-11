import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_app/router_map.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> _list = RC.routerMap.keys.toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: ListView.separated(
        itemCount: _list.length,
        itemBuilder: _buildItem,
        separatorBuilder: (context, index) =>
            Divider(height: 1, thickness: 1, color: Colors.grey[200]),
      ),
    );
  }

  Widget _buildItem(BuildContext context, int index) {
    final name = _list[index];
    if (name == RC.TEST_HERO) {
      return ListTile(
        leading: Hero(tag: "hero_tag", child: FlutterLogo()),
        title: Text(name),
        onTap: () => Navigator.pushNamed(context, name),
      );
    } else {
      return ListTile(
        leading: FlutterLogo(),
        title: Text(name),
        onTap: () => Navigator.pushNamed(context, name),
      );
    }
  }
}
