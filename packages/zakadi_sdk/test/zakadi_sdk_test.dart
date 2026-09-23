import 'package:flutter_test/flutter_test.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';
import 'package:zakadi_sdk_platform_interface/zakadi_sdk_platform_interface.dart';

/// The platform fake of spec 08 8.7: installed as [ZakadiSdkPlatform.instance],
/// it stands in for the native side in unit and widget tests.
class FakeZakadiSdkPlatform extends ZakadiSdkPlatform
    with MockPlatformInterfaceMixin {
  /// The epochs [initialize] received, in order.
  final List<String> epochs = <String>[];

  @override
  Future<void> initialize(String isolateEpoch) async =>
      epochs.add(isolateEpoch);
}

void main() {
  test('FakeZakadiSdkPlatform installs as the platform instance', () async {
    final fake = FakeZakadiSdkPlatform();
    ZakadiSdkPlatform.instance = fake;

    await ZakadiSdkPlatform.instance.initialize('epoch-1');

    expect(fake.epochs, <String>['epoch-1']);
  });
}
