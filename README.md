# zakadi-flutter

Zakadi packages for Dart and Flutter.

- `packages/zakadi/` - `zakadi` on pub.dev: shared protocol constants and types.
- `packages/zakadi_sdk/` - `zakadi_sdk`, the app-facing package of the federated Flutter plugin that wraps the native Zakadi SDKs; `example/` hosts its integration tests.
- `packages/zakadi_sdk_platform_interface/` - `ZakadiSdkPlatform`, the interface the platform packages extend.
- `packages/zakadi_sdk_android/`, `packages/zakadi_sdk_ios/` - the Android and iOS implementations, bridged to Kotlin and Swift by Pigeon (`pigeons/messages.dart` in each).

The `zakadi_sdk*` packages and the example form a pub workspace (the root `pubspec.yaml`); `packages/zakadi` keeps its own resolution. Set up a clone with `dart pub get`, `dart pub get -C packages/zakadi` and `lefthook install`. `tool/pigeons.sh` regenerates the Pigeon outputs, which are committed. The hooks in `lefthook.yml` run the commands of `.github/workflows/ci.yml`.

Status: pre-release. The native Zakadi SDKs are not published yet, so the native side of the plugin is a stub.

## Checks

The hooks do not run the iOS legs of the `integration` job in `.github/workflows/ci.yml`, which build the example for the iOS simulator on Flutter 3.44 and the latest stable, with Swift Package Manager and with CocoaPods. The `Flutter` pod that Flutter 3.44 generates for CocoaPods declares iOS 13.0 and Xcode 27 builds for iOS 15.0 and later only, so the CocoaPods legs set `FLUTTER_XCODE_IPHONEOS_DEPLOYMENT_TARGET=15.0`, the plugin's own floor; Flutter hands the variable to `xcodebuild` as a build setting for every target. To run a CocoaPods leg on Xcode 27 the way CI does, work in `packages/zakadi_sdk/example` with a UTF-8 locale such as `LANG=en_US.UTF-8`, which CocoaPods needs:

```sh
flutter config --no-enable-swift-package-manager
FLUTTER_XCODE_IPHONEOS_DEPLOYMENT_TARGET=15.0 flutter build ios --simulator --no-codesign
flutter config --enable-swift-package-manager
```

`flutter config` applies to every Flutter project on the machine, so run the last line even when the build fails.

## Licence

Zakadi SDKs and client libraries are open source under the Apache License 2.0 (see `LICENSE`; the `NOTICE` file reserves the Zakadi trademarks). They are clients for the Zakadi service, which is proprietary; using it requires an account and acceptance of the Zakadi Terms of Service. Zakadi and the Zakadi logo are trademarks and are not covered by the Apache licence.
