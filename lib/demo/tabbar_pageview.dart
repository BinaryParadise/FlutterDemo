import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intro_segment/intro_segment.dart';
import 'listview_demo.dart';

class TabbarPageViewPage extends StatelessWidget {
  final _pageController = PageController();
  SegmentController controller = SegmentController();

  TabbarPageViewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller.addListener(() {
      print('切换tab');
      _pageController.animateToPage(controller.currentIndex,
          duration: const Duration(milliseconds: 300),
          curve: Curves.linearToEaseOut);
    });

    Widget current;
    // 标签切换
    current = IntroSegment(
      datas: [
        SMSegmentItem<String>('待处理(5)'),
        SMSegmentItem<String>('已处理(20)')
      ],
      controller: controller,
      key: const Key('workbench_sg'),
    );

    // 分页视图
    PageView pageView = PageView(
      key: Key('warehousing'),
      controller: _pageController,
      physics: ClampingScrollPhysics(),
      onPageChanged: (page) {
        print('切换page');
        controller.animateTo(page);
      },
      children: [_PageViewItem(), _PageViewItem()],
    );
    current = Column(
      children: [current, Expanded(child: pageView)],
    );

    current = Scaffold(
      appBar: AppBar(title: Text('TabBar+PageView')),
      body: current,
    );
    return current;
  }
}

class _PageViewItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget current = ListView.separated(
        itemBuilder: (context, row) {
          return Text('  $row');
        },
        separatorBuilder: (context, row) {
          return Divider();
        },
        itemCount: 30);
    return current;
  }
}
