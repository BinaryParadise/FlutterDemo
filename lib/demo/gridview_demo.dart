import 'package:flutter/material.dart';
import 'package:flutter_demo/model/timestamp.dart';
import 'package:fluttertoast/fluttertoast.dart';

class GridViewDemo extends StatelessWidget {
  const GridViewDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget current = GridView.builder(
        itemCount: 20,
        padding: EdgeInsets.all(12),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
            childAspectRatio: 1.0),
        itemBuilder: (context, index) {
          return Container(
            color: Colors.blue,
            alignment: Alignment.center,
            child: TextButton(
                onPressed: () {
                  Fluttertoast.showToast(
                      msg: '点击了: $index', gravity: ToastGravity.CENTER);
                },
                child: Text(index.toString(),
                    style: TextStyle(color: Colors.white))),
          );
        });
    current = Scaffold(
      appBar: AppBar(
        title: Text('GridView'),
      ),
      body: current,
    );
    return current;
  }
}
