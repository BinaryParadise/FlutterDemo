import 'package:flutter/cupertino.dart';
import 'package:flutter_demo/demo/navigator_demo.dart';
import 'package:flutter_demo/main.dart';

final RouteManager routeManager = RouteManager._instance();

typedef FlutterBoostRouteFactory = Route Function(RouteSettings, String?);

class RouteManager {
  final Map<String, FlutterBoostRouteFactory> _routes = {
    'flutter://home': (settings, uniqueId) {
      return CupertinoPageRoute(
          settings: settings,
          builder: (context) => const MyHomePage(title: 'Flutter Demo'));
    },
    'flutter://middle': (settings, uniqueId) {
      return CupertinoPageRoute(
          settings: settings,
          builder: (context) => NavigatorDemo(
                data: settings.arguments,
              ));
    },
    'flutter://warmUpEngine': (settings, uniqueId) {
      return CupertinoPageRoute(
          settings: settings,
          builder: (context) => const Text('warmUpEngine'));
    }
  };

  RouteManager._instance();

  /// 是否匿名路由
  bool isAnonymousRoute(RouteSettings settings) =>
      (settings.name ?? '').startsWith('anonymous_route');

  Route<dynamic>? routeFactory(RouteSettings settings, String? uniqueId) {
    FlutterBoostRouteFactory? routeFunc = _routes[settings.name];
    if (routeFunc == null) {
      print('找不到路由映射: ${settings.name}');
      return null;
    }
    return routeFunc(settings, uniqueId);
  }
}

extension RouteExtension on NavigatorState {
  /// 打开匿名路由
  Future<T?> pushWidget<T extends Object?>(Widget widget,
      {Map<String, dynamic>? arguments}) {
    return push(CupertinoPageRoute(
        settings: RouteSettings(arguments: arguments),
        builder: (context) => widget));
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
