package dev.zakadi.flutter

import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertFailsWith

/*
 * Unit tests of the Kotlin stub. Once the example app has been built, run them with
 * `./gradlew testDebugUnitTest` in `packages/zakadi_sdk/example/android/`.
 */
internal class ZakadiSdkPluginTest {
    @Test
    fun initialize_returns() {
        ZakadiSdkPlugin().initialize("epoch")
    }

    @Test
    fun dispose_failsWithInternal() {
        val error = assertFailsWith<ZakadiPigeonError> { ZakadiSdkPlugin().dispose("handle") }
        assertEquals("internal", error.code)
    }
}
