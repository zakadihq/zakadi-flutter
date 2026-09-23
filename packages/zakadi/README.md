# zakadi

Shared protocol types and constants for the Zakadi face-liveness SDKs. Zakadi is an active face liveness check delivered as a short automated video call: the client is a thin capture-and-display shell, one WebSocket session carries continuous encoded video and audio, and all perception runs on the server.

This package holds the values that every Zakadi client and server agree on: session states, SDK error codes, terminal states, cue identifiers, WebSocket close codes and the protocol version. The Flutter SDK (`zakadi_sdk`) depends on it. It contains no networking, no camera code and no UI.

Status: pre-release. The API and this package's contents track the Zakadi protocol specification; nothing here is stable before 1.0.

Links: https://zakadi.dev (documentation), https://github.com/zakadihq/zakadi-flutter (source).
