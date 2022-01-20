import 'package:flutter/material.dart';

class AnimatedTabBar extends StatefulWidget {
  List<Widget> tabs;
  AnimatedTabBarController controller;

  AnimatedTabBar({
    required this.tabs,
    required this.controller,
    Key? key,
  }) : super(key: key);

  @override
  State<AnimatedTabBar> createState() => _AnimatedTabBarState();
}

class _AnimatedTabBarState extends State<AnimatedTabBar>
    with TickerProviderStateMixin {
  late int currentIndex;
  late Animation<Offset> _animation;
  late AnimationController _animationController;
  List<double> dx = [0];

  @override
  initState() {
    super.initState();
    currentIndex = widget.controller.currentIndex;
    widget.controller.addListener(() {
      if (currentIndex != widget.controller.currentIndex) {
        animateTo(widget.controller.currentIndex);
      }
    });

    _animation = Tween(begin: Offset.zero, end: Offset.zero)
        .animate(AnimationController(vsync: this));
  }

  animateTo(int index) {
    if (index == currentIndex) {
      return;
    }
    setState(() {
      _animationController = AnimationController(
        duration: const Duration(milliseconds: 300),
        vsync: this,
      );
      // 原始位置作为原点（保持不变）
      _animation = Tween(
              begin: Offset(dx[currentIndex.clamp(0, dx.length - 1)], 0),
              end: Offset(dx[index.clamp(0, dx.length - 1)], 0))
          .animate(CurvedAnimation(
              parent: _animationController, curve: Curves.easeInOut));
      _animationController.forward().whenComplete(() {
        currentIndex = index;
      });
    });
  }

  /// 指示器
  Widget indicator() {
    return Container(
      width: 55,
      height: 2,
      color: const Color(0xFF0A62FF),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget current = byDart(context);
    return current;
  }

  Widget byDart(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    dx.clear();
    var x = (width / widget.tabs.length - 55) / 2.0;
    List<Widget> items = [];
    for (int i = 0; i < widget.tabs.length; i++) {
      Widget current = widget.tabs[i];
      dx.add(i * (width / widget.tabs.length) / 55);

      // 撑满父容器
      current = Expanded(
          child: Center(
        child: TextButton(
            onPressed: () {
              animateTo(i);
            },
            child: current),
      ));
      items.add(current);
    }
    Widget current = Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: items);
    current = Stack(
      children: [
        current,
        Positioned(
            bottom: 0,
            left: (width / widget.tabs.length - 55) / 2.0,
            child: SlideTransition(
              position: _animation,
              child: indicator(),
            ))
      ],
    );
    return current;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}

class AnimatedTabBarController extends ChangeNotifier {
  int viewId = 0;
  int _currentIndex = 0;

  int get currentIndex => _currentIndex;

  set currentIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }

  void animateTo(int index) {
    _currentIndex = index;

    notifyListeners();
  }
}
