# Changelog

All notable changes to this package are documented here. The format follows
[Keep a Changelog](https://keepachangelog.com/en/1.1.0/) and the versions follow
[Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Added

- `ZakadiSdkIos`, the iOS implementation of `zakadi_sdk`, bridged to Swift by Pigeon
  29.0.2, with Swift Package Manager and CocoaPods support. The native Zakadi SDK is not
  linked yet: `initialize` completes and every other host call fails with `internal`.

[Unreleased]: https://github.com/zakadihq/zakadi-flutter/commits/main/packages/zakadi_sdk_ios
