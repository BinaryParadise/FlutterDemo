import 'package:flutter/material.dart';
import 'package:flutter_boost/flutter_boost.dart';
import '../common/route_manager.dart';
import 'gridview_demo.dart';

class NavigatorDemo extends StatelessWidget {
  const NavigatorDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget current = Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
            onPressed: () {
              BoostNavigator.instance.push('native://middle');
            },
            child: Text('跳转Native'),
          ),
          TextButton(
            onPressed: () {
              BoostNavigator.instance.push('flutter://middle');
            },
            child: Text('跳转Flutter'),
          ),
          TextButton(
            onPressed: () {
              BoostNavigator.instance.pushWidget(NavigatorDemo());
            },
            child: Text('跳转匿名路由'),
          )
        ],
      ),
    );
    current = Scaffold(
      appBar: AppBar(
        title: Text('Native'),
      ),
      body: current,
    );
    return current;
  }
}
