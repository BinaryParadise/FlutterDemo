import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_boost/flutter_boost.dart';
import 'package:flutter_demo/demo/native_demo.dart';
import 'package:flutter_demo/main.dart';

final RouteManager routeManager = RouteManager._instance();

class RouteManager {
  Map<String, FlutterBoostRouteFactory> _routes = {
    'flutter://home': (settings, uniqueId) {
      return CupertinoPageRoute(
          settings: settings,
          builder: (context) => MyHomePage(title: 'Flutter Demo'));
    },
    'flutter://middle': (settings, uniqueId) {
      return CupertinoPageRoute(
          settings: settings, builder: (context) => NavigatorDemo());
    }
  };
  Map<String, FlutterBoostRouteFactory> _anonymousRoutes = {};

  RouteManager._instance();

  /// 是否匿名路由
  bool isAnonymousRoute(RouteSettings settings) =>
      (settings.name ?? '').startsWith('anonymous_route');

  Route<dynamic>? routeFactory(RouteSettings settings, String? uniqueId) {
    FlutterBoostRouteFactory? routeFunc;
    if (isAnonymousRoute(settings)) {
      routeFunc = _anonymousRoutes[settings.name];
    } else {
      routeFunc = _routes[settings.name];
    }
    if (routeFunc == null) {
      return null;
    }
    return routeFunc(settings, uniqueId);
  }
}

extension RouteExtension on BoostNavigator {
  /// 打开匿名路由
  Future<T> pushWidget<T>(Widget widget,
      {Map<String, dynamic>? arguments,
      bool withContainer = false,
      bool opaque = true}) {
    FlutterBoostRouteFactory func = (settings, uniqueId) {
      return CupertinoPageRoute(
          settings: settings, builder: (context) => widget);
    };
    var name = 'anonymous_route_${func.hashCode}';
    routeManager._anonymousRoutes[name] = func;
    return push(name,
        arguments: arguments, withContainer: withContainer, opaque: opaque);
  }
}

/// 监听路由跳转，同步侧滑手势状态
class MyRouteObserver extends NavigatorObserver {
  @override
  void didPush(Route route, Route? previousRoute) {
    // TODO: implement didPush
    super.didPush(route, previousRoute);
  }

  @override
  void didPop(Route route, Route? previousRoute) {
    // TODO: implement didPop
    super.didPop(route, previousRoute);
  }
}
