import 'package:flutter/material.dart';

class WrapDemo extends StatelessWidget {
  WrapDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> list = [
      '肥皂，香皂及其他人用洗洁物品',
      '清洁、去渍用制剂',
      '抛光、擦亮制剂',
      '研磨用材料及其制剂',
      '香料，香精油',
      '化妆品（不包括动物用化妆品）',
      '牙膏，洗牙用制剂',
      '熏料',
      '动物用洗涤剂，化妆品',
      '室内芳香剂]'
    ];
    Widget current;
    current = Wrap(
      spacing: 8,
      runAlignment: WrapAlignment.start,
      runSpacing: 8,
      children: list.map((e) {
        return Container(
          // height: 30,
          padding: EdgeInsets.fromLTRB(4, 2, 4, 2),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            color: Colors.black.withOpacity(0.1),
          ),
          child: Text(
            e,
            style: TextStyle(
              color: Color(0xFF333333),
            ),
          ),
        );
      }).toList(),
    );
    current = Container(
      margin: EdgeInsets.all(8),
      child: current,
    );
    current = Scaffold(
      appBar: AppBar(
        title: Text('Wrap'),
      ),
      body: current,
    );
    return current;
  }
}
