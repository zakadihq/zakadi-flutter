import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:zakadi_sdk_ios/zakadi_sdk_ios_method_channel.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  MethodChannelZakadiSdkIos platform = MethodChannelZakadiSdkIos();
  const MethodChannel channel = MethodChannel('zakadi_sdk_ios');

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
