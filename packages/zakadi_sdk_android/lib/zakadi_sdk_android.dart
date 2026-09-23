/// The Android implementation of the `zakadi_sdk` plugin, bridged to Kotlin by
/// Pigeon (spec 08 8.3).
library;

import 'package:zakadi_sdk_platform_interface/zakadi_sdk_platform_interface.dart';

import 'src/messages.g.dart';

/// The Android implementation of [ZakadiSdkPlatform].
class ZakadiSdkAndroid extends ZakadiSdkPlatform {
  final ZakadiHostApi _hostApi = ZakadiHostApi();

  /// Registers this class as [ZakadiSdkPlatform.instance]; Flutter calls it as
  /// the plugin's `dartPluginClass`.
  static void registerWith() {
    ZakadiSdkPlatform.instance = ZakadiSdkAndroid();
  }

  @override
  Future<void> initialize(String isolateEpoch) =>
      _hostApi.initialize(isolateEpoch);
}
