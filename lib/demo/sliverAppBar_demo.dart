import 'package:flutter/material.dart';

class SliverAppBarDemo extends StatelessWidget {
  const SliverAppBarDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          flexibleSpace: Container(
            color: Colors.orange,
          ),
          pinned: true,
          expandedHeight: 200,
        ),
        SliverList(
            delegate: SliverChildBuilderDelegate(
                ((context, index) => Container(
                    color: Colors.white, child: Text(index.toString()))),
                childCount: 20))
      ],
    );
  }
}
