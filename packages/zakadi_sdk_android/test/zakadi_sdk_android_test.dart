import 'package:flutter_test/flutter_test.dart';
import 'package:zakadi_sdk_android/zakadi_sdk_android.dart';
import 'package:zakadi_sdk_platform_interface/zakadi_sdk_platform_interface.dart';

import 'test_api.g.dart';

class _FakeHostApi extends Fake implements TestZakadiHostApi {
  final List<String> epochs = <String>[];

  @override
  void initialize(String isolateEpoch) => epochs.add(isolateEpoch);
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  test('registerWith installs ZakadiSdkAndroid as the platform instance', () {
    ZakadiSdkAndroid.registerWith();
    expect(ZakadiSdkPlatform.instance, isA<ZakadiSdkAndroid>());
  });

  test('initialize reaches the host API', () async {
    final host = _FakeHostApi();
    TestZakadiHostApi.setUp(host);
    addTearDown(() => TestZakadiHostApi.setUp(null));

    await ZakadiSdkAndroid().initialize('epoch-1');

    expect(host.epochs, <String>['epoch-1']);
  });
}
