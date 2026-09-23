import 'package:flutter_test/flutter_test.dart';
import 'package:zakadi_sdk_platform_interface/zakadi_sdk_platform_interface.dart';

class _ExtendingPlatform extends ZakadiSdkPlatform {}

class _ImplementingPlatform implements ZakadiSdkPlatform {
  @override
  Future<void> initialize(String isolateEpoch) async {}
}

void main() {
  final ZakadiSdkPlatform initial = ZakadiSdkPlatform.instance;

  test('the default instance implements nothing', () {
    expect(() => initial.initialize('epoch'), throwsUnimplementedError);
  });

  test('an implementation that extends the interface registers', () {
    final platform = _ExtendingPlatform();
    ZakadiSdkPlatform.instance = platform;
    expect(ZakadiSdkPlatform.instance, same(platform));
  });

  test('an implementation that only implements the interface is refused', () {
    expect(
      () => ZakadiSdkPlatform.instance = _ImplementingPlatform(),
      throwsA(isA<AssertionError>()),
    );
  });
}
