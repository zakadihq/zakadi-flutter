import 'package:zakadi/zakadi.dart';
import 'package:test/test.dart';

void main() {
  test('error codes round-trip through their wire spelling', () {
    for (final c in ZakadiErrorCode.values) {
      expect(ZakadiErrorCode.fromWire(c.wire), c);
    }
    expect(ZakadiErrorCode.fromWire('not_a_code'), isNull);
  });

  test('redial is offered only for recoverable terminal states', () {
    expect(ZakadiTerminalState.incomplete.offersRedial, isTrue);
    expect(ZakadiTerminalState.completed.offersRedial, isFalse);
    expect(ZakadiTerminalState.unsupportedDevice.offersRedial, isFalse);
  });

  test('subprotocol is zakadi.v1', () {
    expect(zakadiSubprotocol, 'zakadi.v1');
  });
}
