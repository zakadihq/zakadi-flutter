import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'zakadi_sdk_ios_method_channel.dart';

abstract class ZakadiSdkIosPlatform extends PlatformInterface {
  /// Constructs a ZakadiSdkIosPlatform.
  ZakadiSdkIosPlatform() : super(token: _token);

  static final Object _token = Object();

  static ZakadiSdkIosPlatform _instance = MethodChannelZakadiSdkIos();

  /// The default instance of [ZakadiSdkIosPlatform] to use.
  ///
  /// Defaults to [MethodChannelZakadiSdkIos].
  static ZakadiSdkIosPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [ZakadiSdkIosPlatform] when
  /// they register themselves.
  static set instance(ZakadiSdkIosPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
