import 'package:flutter/material.dart';
import 'package:flutter_demo/model/timestamp.dart';
import 'package:fluttertoast/fluttertoast.dart';

class GridViewDemo extends StatefulWidget {
  const GridViewDemo({Key? key}) : super(key: key);

  @override
  State<GridViewDemo> createState() => _GridViewDemoState();
}

class _GridViewDemoState extends State<GridViewDemo> {
  bool fixedCrossAxisCount = true;
  @override
  Widget build(BuildContext context) {
    Widget current;
    if (fixedCrossAxisCount) {
      current = GridView.builder(
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
    } else {
      current = GridView.builder(
          itemCount: 20,
          padding: EdgeInsets.all(12),
          scrollDirection: Axis.horizontal,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1, mainAxisSpacing: 8, mainAxisExtent: 222),
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
      current = Container(
        height: 200,
        child: current,
      );
    }
    current = Scaffold(
      appBar: AppBar(
        title: Text('GridView'),
      ),
      body: current,
      floatingActionButton: FloatingActionButton(
        onPressed: () => setState(() {
          fixedCrossAxisCount = !fixedCrossAxisCount;
        }),
        child: const Icon(Icons.swipe),
      ),
    );
    return current;
  }
}
