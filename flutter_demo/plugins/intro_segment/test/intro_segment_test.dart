import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intro_segment/intro_segment.dart';

void main() {
  const MethodChannel channel = MethodChannel('intro_segment');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });
}
