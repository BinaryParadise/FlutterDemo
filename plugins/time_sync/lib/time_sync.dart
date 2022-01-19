import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// 单位（毫秒）
class TimeSync {
  static const MethodChannel _channel = MethodChannel('time_sync');
  static int serverTime = 0;
  static int btime = 0;
  static bool ignoreDelay = false;

  static Future<void> _setup() async {
    var prefs = await SharedPreferences.getInstance();
    serverTime = prefs.getInt('_serverTime') ?? 0;
    btime = prefs.getInt('_bootTime') ?? 0;
    var nowbootTime = await _bootTime;
    if (serverTime == 0 || nowbootTime < btime) {
      // 时间尚未校准或设备已重启
      var delta = DateTime.now().millisecondsSinceEpoch;
      var request = await HttpClient().getUrl(Uri.parse(
          'http://api.m.taobao.com/rest/api3.do?api=mtop.common.getTimestamp'));
      var response = await request.close();
      delta = DateTime.now().millisecondsSinceEpoch - delta;
      print('请求耗时: $delta');

      var responseBody = await response.transform(utf8.decoder).join();
      try {
        btime = await _bootTime;
        var time = int.parse((json.decode(responseBody)
            as Map<String, dynamic>)['data']['t'] as String);
        prefs.setInt('_serverTime', time); //服务器时间
        prefs.setInt('_bootTime', btime); //设备启动经过的时间
        serverTime = time + (ignoreDelay ? 0 : delta / 2).toInt();
      } catch (e) {
        serverTime = DateTime.now().millisecondsSinceEpoch;
        print(e);
      }
    }
  }

  static Future<String?> get platformVersion async {
    final String? version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  /// 获取校准后的时间
  static Future<int> get calibrateTime async {
    if (serverTime == 0) {
      await _setup();
    }
    var time = await _bootTime;
    return serverTime + (time - btime);
  }

  static Future<int> get _bootTime async {
    final int time = await _channel.invokeMethod('getBootTimeInterval');
    return time;
  }
}
