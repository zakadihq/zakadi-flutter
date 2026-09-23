package dev.zakadi.flutter

import io.flutter.embedding.engine.plugins.FlutterPlugin

/**
 * The Android side of zakadi_sdk (spec 08 8.3). The native Zakadi SDK, `dev.zakadi.sdk`,
 * is not published yet, so this host API is a stub: [initialize] returns and every other
 * method fails with the `internal` error code.
 */
class ZakadiSdkPlugin :
    FlutterPlugin,
    ZakadiHostApi {
    override fun onAttachedToEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        ZakadiHostApi.setUp(binding.binaryMessenger, this)
    }

    override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        ZakadiHostApi.setUp(binding.binaryMessenger, null)
    }

    // No session exists yet, so there is none from an earlier isolate to close.
    override fun initialize(isolateEpoch: String) {}

    override fun create(config: ConfigMsg): String = throw unavailable()

    override suspend fun start(handle: String): Unit = throw unavailable()

    override fun cancel(
        handle: String,
        reason: String?,
    ): Unit = throw unavailable()

    override fun perform(
        handle: String,
        action: UiActionMsg,
    ): Unit = throw unavailable()

    override fun dispose(handle: String): Unit = throw unavailable()

    override fun provideAttestation(
        handle: String,
        requestId: String,
        token: AttestationTokenMsg?,
    ): Unit = throw unavailable()

    private fun unavailable() = ZakadiPigeonError("internal", "the native Zakadi SDK is not linked yet")
}
