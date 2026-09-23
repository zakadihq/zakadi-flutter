import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'zakadi_sdk_android_method_channel.dart';

abstract class ZakadiSdkAndroidPlatform extends PlatformInterface {
  /// Constructs a ZakadiSdkAndroidPlatform.
  ZakadiSdkAndroidPlatform() : super(token: _token);

  static final Object _token = Object();

  static ZakadiSdkAndroidPlatform _instance = MethodChannelZakadiSdkAndroid();

  /// The default instance of [ZakadiSdkAndroidPlatform] to use.
  ///
  /// Defaults to [MethodChannelZakadiSdkAndroid].
  static ZakadiSdkAndroidPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [ZakadiSdkAndroidPlatform] when
  /// they register themselves.
  static set instance(ZakadiSdkAndroidPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
