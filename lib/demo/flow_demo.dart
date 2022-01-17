import 'dart:math';
import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class FlowDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Size> children = [
      Size(93.5, 150),
      Size(93.5, 180),
      Size(93.5, 280),
      Size(93.5, 160),
      Size(93.5, 80),
      Size(93.5, 145),
      Size(93.5, 155),
      Size(93.5, 166),
      Size(93.5, 177),
      Size(93.5, 108),
      Size(93.5, 155),
      Size(93.5, 166),
      Size(93.5, 177),
      Size(93.5, 155),
      Size(93.5, 166),
      Size(93.5, 177),
      Size(93.5, 80),
      Size(93.5, 155),
      Size(93.5, 177),
      Size(93.5, 80),
      Size(93.5, 156),
    ];
    Widget current = Flow(
      delegate: MyFlowDelegate(4),
      children: List.generate(children.length, (index) {
        return Box(index, children[index]);
      }),
    );
    current = Scaffold(
      appBar: AppBar(
        title: Text('Flow'),
      ),
      body: current,
    );
    return current;
  }

  /*一个带渐变颜色的正方形*/
  Widget Box(index, Size size) => Container(
        padding: EdgeInsets.only(top: 8),
        width: size.width,
        height: size.height,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.orangeAccent, Colors.orange, Colors.deepOrange]),
        ),
        child: Text(
          index.toString(),
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      );
}

class Frame {
  Point<double> origin;
  Size size;

  get maxY {
    return origin.y + size.height;
  }

  get maxX {
    return origin.x + size.width;
  }

  static Frame zero = Frame(Point(0, 0), Size(0, 0));

  Frame(this.origin, this.size);
}

class MyFlowDelegate extends FlowDelegate {
  List<List<Frame>> columns = [];
  int clumnCount;
  double padding = 8; //间距

  MyFlowDelegate(this.clumnCount)
      : columns = List.generate(clumnCount, (index) => <Frame>[]);

  /// 获取高度最小的一列
  List<Frame> previousChild() {
    List<Frame> t = columns.first;
    print(columns.map((e) => e.length > 0 ? e.last.maxY : 0).toString());
    for (var element in columns) {
      if (element.length > 0) {
        if (element.last.maxY < t.last.maxY) {
          t = element;
        }
      } else {
        t = element;
        break;
      }
    }
    return t;
  }

  @override
  void paintChildren(FlowPaintingContext context) {
    /*屏幕宽度*/
    var maxWidth = context.size.width;

    double offsetX = padding; //x坐标
    double offsetY = 0; //y坐标

    for (int i = 0; i < context.childCount; i++) {
      var childSize = context.getChildSize(i)!;
      var list = previousChild();
      var item = list.length > 0 ? list.last : Frame.zero;

      if (list.length > 0) {
        print('目标y(${i}): ${list.last.maxY}');
      }
      if (offsetX + childSize.width < maxWidth) {
        offsetY = item.maxY + padding;
        if (list.length > 0) {
          offsetX = item.origin.x;
        }
        /*绘制子控件*/
        context.paintChild(i,
            transform: Matrix4.translationValues(offsetX, offsetY, 0));
        list.add(Frame(Point(offsetX, offsetY), childSize));
        offsetX += childSize.width + padding;
      } else {
        //超出宽度限制则换行
        offsetX = padding;
        if (list.length > 0) {
          offsetX = item.origin.x;
        }
        offsetY = item.maxY + padding;
        /*绘制子控件*/
        context.paintChild(i,
            transform: Matrix4.translationValues(offsetX, offsetY, 0));
        list.add(Frame(Point(offsetX, offsetY), childSize));
        offsetX += childSize.width + padding;
      }
    }
  }

  @override
  bool shouldRepaint(FlowDelegate oldDelegate) {
    return true;
  }
}
