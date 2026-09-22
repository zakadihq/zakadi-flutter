/// The WebSocket subprotocol every Zakadi client requests.
const String zakadiSubprotocol = 'zakadi.v1';

/// Client-side session states, in lifecycle order.
enum ZakadiSessionState {
  idle,
  consent,
  permission,
  connecting,
  active,
  ended,
  error;

  /// The wire spelling used in telemetry and events.
  String get wire => name;
}

/// SDK error codes. Runtime conditions only; API misuse raises a platform
/// usage error instead.
enum ZakadiErrorCode {
  consentDeclined('consent_declined'),
  cancelled('cancelled'),
  permissionDenied('permission_denied'),
  unsupportedDevice('unsupported_device'),
  sdkDisabled('sdk_disabled'),
  packUnavailable('pack_unavailable'),
  networkUnavailable('network_unavailable'),
  authError('auth_error'),
  sessionExpired('session_expired'),
  sessionUsed('session_used'),
  maxDuration('max_duration'),
  admissionRejected('admission_rejected'),
  networkFloor('network_floor'),
  protocolError('protocol_error'),
  interrupted('interrupted'),
  captureError('capture_error'),
  encoderError('encoder_error'),
  internal('internal');

  const ZakadiErrorCode(this.wire);

  /// The wire spelling.
  final String wire;

  /// Looks up a code by its wire spelling; returns null for unknown values so
  /// that newer servers and SDKs stay compatible with older hosts.
  static ZakadiErrorCode? fromWire(String value) {
    for (final c in values) {
      if (c.wire == value) return c;
    }
    return null;
  }
}

/// Terminal UI states and the cue the SDK may play locally for each.
enum ZakadiTerminalState {
  completed('done.thanks'),
  incomplete('fail.one_more_step'),
  disconnected('net.dropped'),
  networkFloor('net.slow'),
  cancelled('end.cancelled'),
  error('end.error'),
  unsupportedDevice('end.unsupported'),
  permissionDenied('end.permission'),
  interrupted('end.interrupted'),
  sdkDisabled('end.disabled');

  const ZakadiTerminalState(this.cue);

  /// The prompt-pack cue identifier for this state.
  final String cue;

  /// Whether the SDK offers a redial action in this state.
  bool get offersRedial => switch (this) {
        incomplete || disconnected || networkFloor || error || interrupted => true,
        _ => false,
      };
}

/// Outcome of a session as reported by the `end` message.
enum ZakadiEndOutcome { completed, aborted }

/// Application-level WebSocket close codes.
abstract final class ZakadiCloseCode {
  static const int normal = 1000;
  static const int tokenInvalid = 4001;
  static const int tokenExpired = 4002;
  static const int sessionNotFound = 4003;
  static const int sessionUsed = 4004;
  static const int unsupportedCapabilities = 4005;
  static const int protocolViolation = 4006;
  static const int mediaFloorBreached = 4007;
  static const int admissionRejected = 4008;
  static const int maxDurationExceeded = 4009;
  static const int cancelledByUser = 4010;
  static const int internalError = 4011;
}

/// Challenge kinds the server may issue.
enum ZakadiChallengeKind {
  headTurn('head_turn'),
  distance('distance'),
  fingers('fingers'),
  digits('digits'),
  blink('blink'),
  expression('expression'),
  handOverFace('hand_over_face'),
  lookProfile('look_profile');

  const ZakadiChallengeKind(this.wire);

  /// The wire spelling.
  final String wire;
}
