import 'package:flutter/material.dart';
import '../common/route_manager.dart';
import 'gridview_demo.dart';

class NavigatorDemo extends StatelessWidget {
  Object? data;
  NavigatorDemo({this.data, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget current = Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pushNamed('native://middle');
            },
            child: const Text('跳转Native'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pushNamed('flutter://middle');
            },
            child: const Text('跳转Flutter'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pushWidget(NavigatorDemo());
            },
            child: const Text('跳转匿名路由'),
          )
        ],
      ),
    );
    current = Scaffold(
      appBar: AppBar(
        title: const Text('Navigator'),
      ),
      body: current,
    );
    return current;
  }
}
