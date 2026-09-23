# zakadi-flutter

Zakadi packages for Dart and Flutter.

- `packages/zakadi/` - `zakadi` on pub.dev: shared protocol constants and types.
- `packages/zakadi_sdk/` - `zakadi_sdk`, the app-facing package of the federated Flutter plugin that wraps the native Zakadi SDKs; `example/` hosts its integration tests.
- `packages/zakadi_sdk_platform_interface/` - `ZakadiSdkPlatform`, the interface the platform packages extend.
- `packages/zakadi_sdk_android/`, `packages/zakadi_sdk_ios/` - the Android and iOS implementations, bridged to Kotlin and Swift by Pigeon (`pigeons/messages.dart` in each).

The `zakadi_sdk*` packages and the example form a pub workspace (the root `pubspec.yaml`); `packages/zakadi` keeps its own resolution. Set up a clone with `dart pub get`, `dart pub get -C packages/zakadi` and `lefthook install`. `tool/pigeons.sh` regenerates the Pigeon outputs, which are committed. The hooks in `lefthook.yml` run the commands of `.github/workflows/ci.yml`.

Status: pre-release. The native Zakadi SDKs are not published yet, so the native side of the plugin is a stub.

## Licence

Zakadi SDKs and client libraries are open source under the Apache License 2.0 (see `LICENSE`; the `NOTICE` file reserves the Zakadi trademarks). They are clients for the Zakadi service, which is proprietary; using it requires an account and acceptance of the Zakadi Terms of Service. Zakadi and the Zakadi logo are trademarks and are not covered by the Apache licence.
