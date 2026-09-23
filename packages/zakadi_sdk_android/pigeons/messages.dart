// packages/zakadi_sdk_android/pigeons/messages.dart
// The iOS package holds identical declarations; only @ConfigurePigeon differs.
import 'package:pigeon/pigeon.dart';

// Keeps the closing `))` on its own line for tool/pigeons.sh (D75); the directive stands alone.
// dart format off
@ConfigurePigeon(PigeonOptions(
  dartPackageName: 'zakadi_sdk_android',
  dartOut: 'lib/src/messages.g.dart',
  // dartTestOut and dartHostTestHandler still generate the test API (D75).
  // ignore: deprecated_member_use
  dartTestOut: 'test/test_api.g.dart',
  kotlinOut: 'android/src/main/kotlin/dev/zakadi/flutter/Messages.g.kt',
  kotlinOptions: KotlinOptions(package: 'dev.zakadi.flutter', errorClassName: 'ZakadiPigeonError'),
  copyrightHeader: 'pigeons/copyright.txt',
))
// dart format on
enum SessionStateMsg {
  idle,
  consent,
  permission,
  connecting,
  active,
  ended,
  error,
}

enum AttestationKindMsg { playIntegrity, appAttest }

class IngestCandidateMsg {
  IngestCandidateMsg({required this.region, required this.url});
  String region;
  String url;
}

class PromptPackRefMsg {
  PromptPackRefMsg({
    required this.lang,
    required this.version,
    required this.url,
  });
  String lang;
  String version;
  String url;
}

class ThemeMsg {
  ThemeMsg({required this.colorTokens});
  Map<String, String> colorTokens;
  String? fontName;
  double? cornerRadius;
  String? logoAssetKey;
}

class BrandMsg {
  String? primary;
  String? logoUrl;
}

class UiOptionsMsg {
  UiOptionsMsg({
    required this.character,
    required this.theme,
    required this.consentCopy,
    required this.alternatePacks,
  });
  bool character;
  ThemeMsg theme;
  BrandMsg? brand;
  Map<String, ConsentCopyMsg> consentCopy;
  List<PromptPackRefMsg> alternatePacks;
}

class ConsentCopyMsg {
  String? title;
  String? body;
  String? recordingNotice;
}

class A11yOptionsMsg {
  bool? screenReader;
  bool? captions;
  bool? reducedMotion;
  bool? extendedTime;
}

class ConfigMsg {
  ConfigMsg({
    required this.clientToken,
    required this.ingest,
    required this.promptPack,
    required this.locale,
    required this.ui,
    required this.accessibility,
    required this.hasAttestationProvider,
    required this.hasTelemetrySink,
    required this.apiBaseUrl,
    required this.defaultTelemetry,
    required this.pinnedIntermediateSpki,
    required this.sessionUiJson,
    required this.wrapperName,
    required this.wrapperVersion,
  });
  String clientToken;
  List<IngestCandidateMsg> ingest;
  PromptPackRefMsg promptPack;
  String locale;
  UiOptionsMsg ui;
  A11yOptionsMsg accessibility;
  bool hasAttestationProvider; // native installs a provider only when true
  bool hasTelemetrySink; // native forwards telemetry only when true
  String? priorConsentJson; // 07 7.16 additions from here
  String apiBaseUrl;
  bool defaultTelemetry;
  List<String> pinnedIntermediateSpki;
  String
  sessionUiJson; // 05 5.2 sessionUi, the POST /v1/sessions `ui` object as JSON
  String
  wrapperName; // "zakadi_sdk"; set by the package, never by the host (8.0 item 11)
  String wrapperVersion;
}

enum UiActionMsg { repeat, moreTime, cancel, redial, close }

/// State change plus the session facts of 8.0 item 10.
class StateChangeMsg {
  StateChangeMsg({required this.from, required this.to});
  SessionStateMsg from;
  SessionStateMsg to;
  String? sessionId;
  String? consentRecord; // 07 7.16 JSON
}

/// The flat event record of 8.0 item 10.
class EventMsg {
  EventMsg({required this.type});
  String type;
  bool? camera;
  bool? microphone;
  String? region;
  int? rttMs;
  String? phase;
  String? outcome;
  String? reason;
  String? code;
  String? message;
  bool? recoverable;
  int? retryAfterS;
  int? closeCode;
  String? sessionId; // 8.0 item 10, on every record once known
  String? consentRecord;
}

class AttestationRequestMsg {
  AttestationRequestMsg({
    required this.nonce,
    required this.sessionId,
    required this.requestHash,
    required this.requestHashHex,
  });
  Uint8List nonce;
  String sessionId;
  Uint8List requestHash;
  String requestHashHex;
}

class AttestationTokenMsg {
  AttestationTokenMsg({required this.kind});
  AttestationKindMsg kind;
  String? token; // Play Integrity, or a ready-made envelope
  String?
  appAttestKeyId; // App Attest parts; the glue calls appAttestToken (07 7.10)
  Uint8List? appAttestAttestation;
  Uint8List? appAttestAssertion;
}

class TelemetryMsg {
  TelemetryMsg({required this.name, required this.tMs, required this.fields});
  String name;
  String? sessionId;
  int tMs;
  Map<String, Object?> fields;
}

// Without a handler dartTestOut emits only an unused codec (D75).
// ignore: deprecated_member_use
@HostApi(dartHostTestHandler: 'TestZakadiHostApi')
abstract class ZakadiHostApi {
  /// Closes sessions created by an earlier Dart isolate (hot restart); records this isolate's epoch.
  void initialize(String isolateEpoch);

  /// Constructs the native ZakadiSession; returns its handle. Errors: unsupported_device, usage_error.
  String create(ConfigMsg config);

  /// Completes at `active`; otherwise throws ZakadiPigeonError(code = 5.11 wire code).
  @async
  void start(String handle);

  void cancel(String handle, String? reason);
  void perform(String handle, UiActionMsg action);
  void dispose(String handle);

  /// Reply to ZakadiFlutterApi.onAttestationRequested; null = no attestation.
  void provideAttestation(
    String handle,
    String requestId,
    AttestationTokenMsg? token,
  );
}

@FlutterApi()
abstract class ZakadiFlutterApi {
  void onState(String handle, StateChangeMsg change);
  void onEvent(String handle, EventMsg event);
  void onAttestationRequested(
    String handle,
    String requestId,
    AttestationRequestMsg request,
  );
  void onTelemetry(String handle, TelemetryMsg event);
}
