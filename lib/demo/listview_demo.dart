import 'package:flutter/material.dart';

class ListViewDemo extends StatefulWidget {
  ListViewDemo({Key? key}) : super(key: key);

  @override
  _ListViewDemoState createState() => _ListViewDemoState();
}

class _ListViewDemoState extends State<ListViewDemo> {
  ScrollController _controller = ScrollController();
  int count = 0;

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(microseconds: 200), () {
      _controller.jumpTo(_controller.position.maxScrollExtent);
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget current = ListView.separated(
        padding: EdgeInsets.fromLTRB(12, 8, 12, 50),
        controller: _controller,
        itemBuilder: (context, row) {
          return Container(
            padding: EdgeInsets.fromLTRB(12, 8, 12, 8),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(6)),
            height: 66,
            child: Text('t${row}'),
          );
        },
        separatorBuilder: (context, row) {
          return SizedBox(
            height: 8,
          );
        },
        itemCount: count);

    current = Scaffold(
      appBar: AppBar(
        title: Text('ListView'),
      ),
      body: current,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            count++;
          });
        },
        child: Icon(Icons.add),
      ),
    );

    current = Container(
      child: current,
    );
    return current;
  }
}
