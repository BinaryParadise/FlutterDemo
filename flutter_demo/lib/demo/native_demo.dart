import 'package:flutter/material.dart';
import 'package:flutter_boost/flutter_boost.dart';

class NativeDemo extends StatelessWidget {
  const NativeDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget current = Center(
      child: TextButton(
        onPressed: () {
          BoostNavigator.instance.push('native://demo');
        },
        child: Text('跳转Native'),
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
