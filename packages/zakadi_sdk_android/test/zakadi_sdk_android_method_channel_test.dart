import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:zakadi_sdk_android/zakadi_sdk_android_method_channel.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  MethodChannelZakadiSdkAndroid platform = MethodChannelZakadiSdkAndroid();
  const MethodChannel channel = MethodChannel('zakadi_sdk_android');

  setUp(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(channel, (MethodCall methodCall) async {
          return '42';
        });
  });

  tearDown(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(channel, null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}
