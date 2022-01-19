import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:time_sync/time_sync.dart';

void main() {
  const MethodChannel channel = MethodChannel('time_sync');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await TimeSync.platformVersion, '42');
  });
}
