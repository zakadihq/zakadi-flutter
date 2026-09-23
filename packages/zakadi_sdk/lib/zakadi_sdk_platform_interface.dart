import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'zakadi_sdk_method_channel.dart';

abstract class ZakadiSdkPlatform extends PlatformInterface {
  /// Constructs a ZakadiSdkPlatform.
  ZakadiSdkPlatform() : super(token: _token);

  static final Object _token = Object();

  static ZakadiSdkPlatform _instance = MethodChannelZakadiSdk();

  /// The default instance of [ZakadiSdkPlatform] to use.
  ///
  /// Defaults to [MethodChannelZakadiSdk].
  static ZakadiSdkPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [ZakadiSdkPlatform] when
  /// they register themselves.
  static set instance(ZakadiSdkPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
