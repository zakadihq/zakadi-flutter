import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'zakadi_sdk_android_platform_interface.dart';

/// An implementation of [ZakadiSdkAndroidPlatform] that uses method channels.
class MethodChannelZakadiSdkAndroid extends ZakadiSdkAndroidPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('zakadi_sdk_android');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>(
      'getPlatformVersion',
    );
    return version;
  }
}
