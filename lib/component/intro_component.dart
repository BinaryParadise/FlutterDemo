import 'package:flutter/material.dart';
import 'package:flutter_boost/flutter_boost.dart';

/// 导航栏复用组件
class AppNav {
  /// 导航栏标题
  static Widget title(String title) {
    return Text(
      title,
      style: const TextStyle(
          color: Color(0xFF222222),
          fontSize: 19.0,
          fontWeight: FontWeight.w500),
    );
  }

  /// 导航栏按钮
  static Widget action(String icon, VoidCallback onPressed,
      {double iconSize = 24}) {
    return IconButton(
      onPressed: onPressed,
      iconSize: iconSize,
      icon: Image.asset(icon),
    );
  }

  static Widget backButton() {
    Widget current = IconButton(
      onPressed: () {
        BoostNavigator.instance.pop();
      },
      iconSize: 24,
      icon: Image.asset('images/common/ic_nav_backarrow@3x.png'),
    );
    current = Container(
      padding: EdgeInsets.only(left: 12),
      child: current,
    );
    return current;
  }
}
