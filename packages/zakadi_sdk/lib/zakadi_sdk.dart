import 'zakadi_sdk_platform_interface.dart';

class ZakadiSdk {
  Future<String?> getPlatformVersion() {
    return ZakadiSdkPlatform.instance.getPlatformVersion();
  }
}
