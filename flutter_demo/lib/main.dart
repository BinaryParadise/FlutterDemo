import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boost/flutter_boost.dart';
import 'package:flutter_demo/demo/expanded_demo.dart';
import 'package:flutter_demo/demo/gridview_demo.dart';
import 'package:flutter_demo/demo/native_demo.dart';
import 'package:flutter_demo/demo/tabbar_pageview.dart';
import 'package:one_context/one_context.dart';

import 'package:flutter_engine/flutter_engine.dart';

import 'demo/alignment_demo.dart';
import 'demo/network_demo.dart';
import 'demo/gridview_demo.dart';

void main() {
  MyFlutterBinding();
  runApp(const MyApp());
}

class MyFlutterBinding extends WidgetsFlutterBinding with BoostFlutterBinding {}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  Route<dynamic>? routeFactory(RouteSettings settings, String? uniqueId) {
    switch (settings.name) {
      case '/':
        return CupertinoPageRoute(
            settings: settings,
            builder: (context) => const MyHomePage(title: 'Flutter Demo'));
      default:
        return null;
    }
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FlutterBoostApp(
      routeFactory,
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
        return OneContext().builder(context, child);
      },
      navigatorKey: OneContext().navigator.key,
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
    routes.add(RouteData('MainAxisAlignment', () => MainAlignmentDemo()));
    routes.add(RouteData('CrossAxisAlignment', () => CrossAlignmentDemo()));
    routes.add(RouteData('Expanded', () => ExpandedDemo()));
    routes.add(RouteData('Network', () => NetworkDemo()));
    routes.add(RouteData('GridView', () => GridViewDemo()));
    routes.add(RouteData('Native', () => NativeDemo()));
  }

  @override
  Widget build(BuildContext context) {
    Widget current = GridView.builder(
        padding: EdgeInsets.all(12),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
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
                onPressed: () => OneContext().push(
                    CupertinoPageRoute(builder: (context) => item.child())),
                child: Text(
                  item.title,
                  style: TextStyle(fontSize: 15),
                )),
          );
        },
        itemCount: routes.length);
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
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
