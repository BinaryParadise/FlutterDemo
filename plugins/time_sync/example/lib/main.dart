import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:time_sync/time_sync.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _platformVersion = 'Unknown';
  String _time = "未校准";

  @override
  void initState() {
    super.initState();
    initPlatformState();

    _calibrateTime();
  }

  void _calibrateTime() {
    TimeSync.calibrateTime.then((value) {
      Timer.periodic(const Duration(milliseconds: 10), (timer) {
        TimeSync.calibrateTime.then((value) => this.setState(() {
              _time = DateTime.fromMillisecondsSinceEpoch(value)
                  .toLocal()
                  .toString();
            }));
      });
    });
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String platformVersion;
    // Platform messages may fail, so we use a try/catch PlatformException.
    // We also handle the message potentially returning null.
    try {
      platformVersion =
          await TimeSync.platformVersion ?? 'Unknown platform version';
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Running on: $_platformVersion\n',
                style: TextStyle(color: Colors.grey),
              ),
              Text(
                '本地时间: ${DateTime.now().toLocal().toString()}',
                style: TextStyle(color: Colors.orange),
              ),
              SizedBox(
                height: 6,
              ),
              Text('校准时间: $_time', style: TextStyle(color: Colors.green))
            ],
          ),
        ),
      ),
    );
  }
}
