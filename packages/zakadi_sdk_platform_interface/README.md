# zakadi_sdk_platform_interface

The common platform interface of `zakadi_sdk`, the Flutter plugin that wraps the native Zakadi face-liveness SDKs. Platform implementations extend `ZakadiSdkPlatform` and register an instance; apps depend on `zakadi_sdk`, not on this package.

Status: pre-release, version 0.0.0. The native Zakadi SDKs are not published yet, so the
plugin does not run a liveness check yet.

## Licence

Zakadi SDKs and client libraries are open source under the Apache License 2.0 (see `LICENSE`; the `NOTICE` file reserves the Zakadi trademarks). They are clients for the Zakadi service, which is proprietary; using it requires an account and acceptance of the Zakadi Terms of Service. Zakadi and the Zakadi logo are trademarks and are not covered by the Apache licence.
