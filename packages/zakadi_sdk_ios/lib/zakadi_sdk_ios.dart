import 'zakadi_sdk_ios_platform_interface.dart';

class ZakadiSdkIos {
  Future<String?> getPlatformVersion() {
    return ZakadiSdkIosPlatform.instance.getPlatformVersion();
  }
}
