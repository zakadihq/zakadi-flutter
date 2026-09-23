/// The iOS implementation of the `zakadi_sdk` plugin, bridged to Swift by
/// Pigeon (spec 08 8.3).
library;

import 'package:zakadi_sdk_platform_interface/zakadi_sdk_platform_interface.dart';

import 'src/messages.g.dart';

/// The iOS implementation of [ZakadiSdkPlatform].
class ZakadiSdkIos extends ZakadiSdkPlatform {
  final ZakadiHostApi _hostApi = ZakadiHostApi();

  /// Registers this class as [ZakadiSdkPlatform.instance]; Flutter calls it as
  /// the plugin's `dartPluginClass`.
  static void registerWith() {
    ZakadiSdkPlatform.instance = ZakadiSdkIos();
  }

  @override
  Future<void> initialize(String isolateEpoch) =>
      _hostApi.initialize(isolateEpoch);
}
