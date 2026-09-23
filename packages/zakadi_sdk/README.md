# zakadi_sdk

Zakadi active face liveness for Flutter. Zakadi runs the check as a short automated video call; this federated plugin is a thin wrapper over the native Zakadi SDKs for Android and iOS, which do the capture, the streaming and the call UI.

This is the app-facing package: apps depend on it, and it brings in `zakadi_sdk_android` and `zakadi_sdk_ios`. Android hosts extend `FlutterFragmentActivity`, compile against API 37 and set `minSdk` 26; iOS hosts target iOS 15. `example/` hosts the integration tests.

Status: pre-release, version 0.0.0. The native Zakadi SDKs are not published yet, so the
plugin does not run a liveness check yet.

## Licence

Zakadi SDKs and client libraries are open source under the Apache License 2.0 (see `LICENSE`; the `NOTICE` file reserves the Zakadi trademarks). They are clients for the Zakadi service, which is proprietary; using it requires an account and acceptance of the Zakadi Terms of Service. Zakadi and the Zakadi logo are trademarks and are not covered by the Apache licence.
