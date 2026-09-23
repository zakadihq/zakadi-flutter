import 'package:flutter_test/flutter_test.dart';
import 'package:zakadi_sdk/zakadi_sdk.dart';
import 'package:zakadi_sdk/zakadi_sdk_platform_interface.dart';
import 'package:zakadi_sdk/zakadi_sdk_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockZakadiSdkPlatform
    with MockPlatformInterfaceMixin
    implements ZakadiSdkPlatform {
  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final ZakadiSdkPlatform initialPlatform = ZakadiSdkPlatform.instance;

  test('$MethodChannelZakadiSdk is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelZakadiSdk>());
  });

  test('getPlatformVersion', () async {
    ZakadiSdk zakadiSdkPlugin = ZakadiSdk();
    MockZakadiSdkPlatform fakePlatform = MockZakadiSdkPlatform();
    ZakadiSdkPlatform.instance = fakePlatform;

    expect(await zakadiSdkPlugin.getPlatformVersion(), '42');
  });
}
