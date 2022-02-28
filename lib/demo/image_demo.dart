import 'package:flutter/material.dart';

class ImageDemo extends StatefulWidget {
  const ImageDemo({Key? key}) : super(key: key);

  @override
  State<ImageDemo> createState() => _ImageDemoState();
}

class _ImageDemoState extends State<ImageDemo>
    with SingleTickerProviderStateMixin {
  BoxFit fit = BoxFit.fill;
  late TabController _tabController;
  void changeFit(BuildContext context) {}

  @override
  void initState() {
    _tabController = TabController(length: BoxFit.values.length, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Image')),
      body: Column(
        children: [
          Text(fit.toString()),
          Container(
            height: 50,
            color: Colors.grey,
            child: TabBar(
              tabs: BoxFit.values
                  .map((e) => Tab(text: e.toString().split('.').last))
                  .toList(),
              controller: _tabController,
              onTap: (index) => setState(() {
                fit = BoxFit.values[index];
              }),
            ),
          ),
          LimitedBox(
            maxHeight: 399,
            child: Container(
              margin: const EdgeInsets.all(6),
              decoration: BoxDecoration(border: Border.all(color: Colors.blue)),
              clipBehavior: Clip.none,
              child: Image.network(
                'https://img0.baidu.com/it/u=603405083,1124611431&fm=26&fmt=auto',
                fit: fit,
                width: 300,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 12),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.blue), color: Colors.grey),
            child: Image.asset(
              'images/asset/ic_duihuan.png',
              width: 64,
            ),
          ),
          const SizedBox(
            height: 50,
          )
        ],
      ),
    );
  }
}
