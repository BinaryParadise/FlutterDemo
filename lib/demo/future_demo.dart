import 'dart:isolate';

import 'package:flutter/material.dart';

class FutureDemo extends StatelessWidget {
  const FutureDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget current = StatusLabel();
    print('build -> ${Isolate.current.debugName}');
    current = Scaffold(
      appBar: AppBar(
        title: Text('Future'),
      ),
      body: Center(
        child: current,
      ),
    );
    return current;
  }
}

class StatusLabel extends StatefulWidget {
  const StatusLabel({Key? key}) : super(key: key);

  @override
  _StatusLabelState createState() => _StatusLabelState();
}

class _StatusLabelState extends State<StatusLabel> {
  String title = '';
  @override
  Widget build(BuildContext context) {
    if (title == '') {
      changeStatus().then((value) => this.setState(() {
            title = value;
          }));
    }
    return Container(
      child: Text(title),
    );
  }

  Future<String> changeStatus() async {
    title = '初始化准备';
    print('初始化准备 -> ${Isolate.current.debugName}');
    await Future.delayed(Duration(seconds: 3),
        () => print('初始化完成 -> ${Isolate.current.debugName}'));
    return '初始化完成';
  }
}
