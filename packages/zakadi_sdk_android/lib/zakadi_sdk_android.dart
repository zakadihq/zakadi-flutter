import 'zakadi_sdk_android_platform_interface.dart';

class ZakadiSdkAndroid {
  Future<String?> getPlatformVersion() {
    return ZakadiSdkAndroidPlatform.instance.getPlatformVersion();
  }
}
