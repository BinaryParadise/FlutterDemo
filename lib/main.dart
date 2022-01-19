import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boost/flutter_boost.dart';
import 'package:flutter_demo/demo/expanded_demo.dart';
import 'package:flutter_demo/demo/gridview_demo.dart';
import 'package:flutter_demo/demo/navigator_demo.dart';
import 'package:flutter_demo/demo/stack_demo.dart';
import 'package:flutter_demo/demo/tabbar_pageview.dart';
import 'package:flutter_demo/demo/videoplayer_demo.dart';
import 'package:flutter_demo/demo/wrap_demo.dart';

import 'demo/alignment_demo.dart';
import 'demo/flow_demo.dart';
import 'demo/network_demo.dart';
import 'demo/gridview_demo.dart';
import 'common/route_manager.dart';
import 'demo/textfield_demo.dart';
import 'demo/future_demo.dart';

void main() {
  MyFlutterBinding();
  runApp(const MyApp());
}

class MyFlutterBinding extends WidgetsFlutterBinding with BoostFlutterBinding {}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FlutterBoostApp(
      routeManager.routeFactory,
      appBuilder: appBuilder,
    );
  }

  Widget appBuilder(Widget home) {
    return MaterialApp(
      home: home,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        backgroundColor: const Color(0xFFF2F4F6),
        scaffoldBackgroundColor: const Color(0xFFF2F4F6),
      ),
      builder: (context, child) {
        return home;
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<RouteData> routes = [];

  @override
  void initState() {
    super.initState();
    routes.add(RouteData('Segment', () => TabbarPageViewPage()));
    routes.add(RouteData('MainAxisAlignment', () => const MainAlignmentDemo()));
    routes
        .add(RouteData('CrossAxisAlignment', () => const CrossAlignmentDemo()));
    routes.add(RouteData('Expanded', () => const ExpandedDemo()));
    routes.add(RouteData('Network', () => const NetworkDemo()));
    routes.add(RouteData('GridView', () => const GridViewDemo()));
    routes.add(RouteData('Navigator', () => NavigatorDemo()));
    routes.add(RouteData('Stack', () => const StackDemo()));
    routes.add(RouteData('Flow', () => FlowDemo()));
    routes.add(RouteData('Wrap', () => WrapDemo()));
    routes.add(RouteData('TextField', () => TextFieldDemo()));
    routes.add(RouteData('Future', () => const FutureDemo()));
    routes.add(RouteData('VideoPlayer', () => const VideoPlayerDemo()));
  }

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    var back = args['back'] as bool;
    Widget current = GridView.builder(
        padding: const EdgeInsets.all(12),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
            childAspectRatio: 1.5),
        itemBuilder: (context, index) {
          var item = routes[index];
          return Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: Colors.white.withOpacity(0.8)),
            child: TextButton(
                onPressed: () =>
                    BoostNavigator.instance.pushWidget(item.child()),
                child: Text(
                  item.title,
                  style: const TextStyle(fontSize: 15),
                )),
          );
        },
        itemCount: routes.length);
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        leading: back
            ? BackButton(
                onPressed: () => BoostNavigator.instance.pop(),
              )
            : null,
        title: Text(widget.title),
      ),
      body:
          current, // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class RouteData {
  String title;
  Widget Function() child;

  RouteData(this.title, this.child);
}
