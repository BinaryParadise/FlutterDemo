import 'package:flutter/material.dart';

import 'package:intro_segment/intro_segment.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final SegmentController _segmentController1 = SegmentController();
  final SegmentController _segmentController2 = SegmentController();
  final PageController _pageController1 = PageController();
  final PageController _pageController2 = PageController();

  @override
  void initState() {
    super.initState();

    _segmentController1.addListener(() {
      _pageController1.animateToPage(_segmentController1.currentIndex,
          duration: const Duration(microseconds: 300), curve: Curves.easeInOut);
    });

    _segmentController2.addListener(() {
      _pageController2.animateToPage(_segmentController2.currentIndex,
          duration: const Duration(microseconds: 300), curve: Curves.easeInOut);
    });
  }

  Widget _eachRow(
      SegmentController c1, PageController c2, List<SMSegmentItem> datas) {
    return Column(
      children: [
        IntroSegment(
            controller: c1,
            datas: datas),
        SizedBox(
          height: 200,
          child: PageView(
            children: [
              Container(
                color: Colors.orange,
              ),
              Container(
                color: Colors.blueAccent,
              )
            ],
            controller: c2,
            onPageChanged: (index) {
              c1.animateTo(index);
            },
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget current = Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        _eachRow(_segmentController1, _pageController1,
            [SMSegmentItem('Playing'), SMSegmentItem('InRoom')]),
        _eachRow(_segmentController2, _pageController2,
            [SMSegmentItem('Learning'), SMSegmentItem('Makeing')]),
      ],
    );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: current,
      ),
    );
  }
}
