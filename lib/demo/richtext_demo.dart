import 'package:flutter/material.dart';

class RichTextDemo extends StatelessWidget {
  const RichTextDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget current = RichText(
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        text: TextSpan(children: [
          WidgetSpan(child: Image.asset('images/ic_fatie@3x.png')),
          const TextSpan(
            text: '发一个',
            style: TextStyle(fontSize: 20, color: Colors.orange),
          ),
          const TextSpan(
              text: '帖子',
              style: TextStyle(fontSize: 16, color: Colors.greenAccent)),
          const TextSpan(
              text: '聊聊你最近的心里感受，最近有没有胡思乱想，',
              style: TextStyle(color: Colors.grey))
        ]));
    current = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [current, Text('在大就显示不下了在大就显示不下了在大就显示不下了在大就显示不下了在大就显示不下了')],
    );
    current = Column(
      children: [
        Row(
          children: [
            Expanded(
                child: Container(
              child: current,
              color: Colors.blue,
            )),
            LimitedBox(
                maxWidth: 150,
                child:
                    Container(color: Colors.orange, child: Text('右边的区域最大150，')))
          ],
        ),
      ],
    );
    current = Padding(
      padding: const EdgeInsets.all(12),
      child: current,
    );
    return Scaffold(
      appBar: AppBar(title: const Text('RichText')),
      body: current,
    );
  }
}
