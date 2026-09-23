import 'package:flutter_test/flutter_test.dart';
import 'package:zakadi_sdk_android/zakadi_sdk_android.dart';
import 'package:zakadi_sdk_android/zakadi_sdk_android_platform_interface.dart';
import 'package:zakadi_sdk_android/zakadi_sdk_android_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockZakadiSdkAndroidPlatform
    with MockPlatformInterfaceMixin
    implements ZakadiSdkAndroidPlatform {
  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final ZakadiSdkAndroidPlatform initialPlatform =
      ZakadiSdkAndroidPlatform.instance;

  test('$MethodChannelZakadiSdkAndroid is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelZakadiSdkAndroid>());
  });

  test('getPlatformVersion', () async {
    ZakadiSdkAndroid zakadiSdkAndroidPlugin = ZakadiSdkAndroid();
    MockZakadiSdkAndroidPlatform fakePlatform = MockZakadiSdkAndroidPlatform();
    ZakadiSdkAndroidPlatform.instance = fakePlatform;

    expect(await zakadiSdkAndroidPlugin.getPlatformVersion(), '42');
  });
}
