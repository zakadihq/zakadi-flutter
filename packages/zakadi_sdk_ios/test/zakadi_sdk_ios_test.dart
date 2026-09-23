import 'package:flutter_test/flutter_test.dart';
import 'package:zakadi_sdk_ios/zakadi_sdk_ios.dart';
import 'package:zakadi_sdk_ios/zakadi_sdk_ios_platform_interface.dart';
import 'package:zakadi_sdk_ios/zakadi_sdk_ios_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockZakadiSdkIosPlatform
    with MockPlatformInterfaceMixin
    implements ZakadiSdkIosPlatform {
  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final ZakadiSdkIosPlatform initialPlatform = ZakadiSdkIosPlatform.instance;

  test('$MethodChannelZakadiSdkIos is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelZakadiSdkIos>());
  });

  test('getPlatformVersion', () async {
    ZakadiSdkIos zakadiSdkIosPlugin = ZakadiSdkIos();
    MockZakadiSdkIosPlatform fakePlatform = MockZakadiSdkIosPlatform();
    ZakadiSdkIosPlatform.instance = fakePlatform;

    expect(await zakadiSdkIosPlugin.getPlatformVersion(), '42');
  });
}
