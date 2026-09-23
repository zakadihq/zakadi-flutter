import Flutter

/// The iOS side of zakadi_sdk (spec 08 8.3). The native Zakadi SDK, `ZakadiSDK`, is not
/// published yet, so this host API is a stub: `initialize` returns and every other method
/// throws the `internal` error code.
public class ZakadiSdkPlugin: NSObject, FlutterPlugin, ZakadiHostApi {
  public static func register(with registrar: FlutterPluginRegistrar) {
    ZakadiHostApiSetup.setUp(binaryMessenger: registrar.messenger(), api: ZakadiSdkPlugin())
  }

  // No session exists yet, so there is none from an earlier isolate to close.
  func initialize(isolateEpoch: String) throws {}

  func create(config: ConfigMsg) throws -> String { throw Self.unavailable }

  func start(handle: String) async throws { throw Self.unavailable }

  func cancel(handle: String, reason: String?) throws { throw Self.unavailable }

  func perform(handle: String, action: UiActionMsg) throws { throw Self.unavailable }

  func dispose(handle: String) throws { throw Self.unavailable }

  func provideAttestation(handle: String, requestId: String, token: AttestationTokenMsg?) throws {
    throw Self.unavailable
  }

  private static var unavailable: ZakadiPigeonError {
    ZakadiPigeonError(code: "internal", message: "the native Zakadi SDK is not linked yet", details: nil)
  }
}
