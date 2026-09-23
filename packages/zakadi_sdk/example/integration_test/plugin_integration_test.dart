// Runs in the example app on a device, so the calls reach the native plugins
// (https://flutter.dev/to/integration-testing).

import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:zakadi_sdk_android/zakadi_sdk_android.dart';
import 'package:zakadi_sdk_ios/zakadi_sdk_ios.dart';
import 'package:zakadi_sdk_platform_interface/zakadi_sdk_platform_interface.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('the platform implementation is registered and initializes', (
    WidgetTester tester,
  ) async {
    final platform = ZakadiSdkPlatform.instance;
    expect(
      platform,
      defaultTargetPlatform == TargetPlatform.iOS
          ? isA<ZakadiSdkIos>()
          : isA<ZakadiSdkAndroid>(),
    );

    // Completes only when the native host API answers on its Pigeon channel.
    await platform.initialize('integration-test');
  });
}
