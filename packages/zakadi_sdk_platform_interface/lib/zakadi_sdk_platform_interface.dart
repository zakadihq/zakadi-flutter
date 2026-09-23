/// The platform interface of the federated `zakadi_sdk` plugin (spec 08 8.1).
///
/// Platform packages extend [ZakadiSdkPlatform] and register an instance; the
/// app-facing package calls [ZakadiSdkPlatform.instance]. This package holds no
/// channel code.
library;

import 'package:plugin_platform_interface/plugin_platform_interface.dart';

/// The interface each platform implementation of `zakadi_sdk` extends.
///
/// Implementations extend this class rather than implement it, so a method added
/// here does not break them.
abstract class ZakadiSdkPlatform extends PlatformInterface {
  /// Constructs a [ZakadiSdkPlatform].
  ZakadiSdkPlatform() : super(token: _token);

  static final Object _token = Object();

  static ZakadiSdkPlatform _instance = _UnregisteredZakadiSdkPlatform();

  /// The registered implementation. Until a platform package registers one,
  /// every method throws [UnimplementedError].
  static ZakadiSdkPlatform get instance => _instance;

  /// Registers [instance]; a platform package does so from `registerWith`.
  static set instance(ZakadiSdkPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  /// Closes the sessions an earlier Dart isolate created (a hot restart) and
  /// records [isolateEpoch] as this isolate's; each isolate calls it before its
  /// first session (spec 08 8.5).
  Future<void> initialize(String isolateEpoch) {
    throw UnimplementedError('initialize() has not been implemented.');
  }
}

class _UnregisteredZakadiSdkPlatform extends ZakadiSdkPlatform {}
