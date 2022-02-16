import 'package:flutter/material.dart';
import 'package:intro_segment/animated_tabbar.dart';

class AnimatedDemo extends StatelessWidget {
  AnimatedDemo({Key? key}) : super(key: key);
  final AnimatedTabBarController _controller = AnimatedTabBarController();

  GlobalKey gk = GlobalKey();

  @override
  Widget build(BuildContext context) {
    Widget current;
    current = Center(
      child: Container(
        key: gk,
        color: Colors.pink,
        child: Text("TODO"),
      ),
    );
    current = Scaffold(
      appBar: AppBar(
        title: Text('AnimatedBuilder'),
      ),
      body: current,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          RenderBox renderBox =
              gk.currentContext?.findRenderObject() as RenderBox;
          print('${renderBox.size} ${renderBox.localToGlobal(Offset.zero)}');
        },
        child: Icon(Icons.done),
      ),
    );
    return current;
  }
}
