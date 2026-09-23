#!/usr/bin/env bash
# Regenerates the Pigeon outputs of both platform packages and checks that their
# definitions declare the same API (spec 08 8.3). CI runs it and fails on any diff.
set -euo pipefail
cd "$(dirname "$0")/.."

for p in zakadi_sdk_android zakadi_sdk_ios; do
  (cd "packages/$p" && dart run pigeon --input pigeons/messages.dart && dart format lib test)
done

# Pigeon 29.0.2 writes Swift enum cases without escaping keywords, and `repeat`
# (UiActionMsg) is one: escape it, or the iOS plugin does not compile.
perl -pi -e 's/^(\s*)case repeat = /$1case `repeat` = /' \
  packages/zakadi_sdk_ios/ios/zakadi_sdk_ios/Sources/zakadi_sdk_ios/Messages.g.swift

# The declarations follow the closing `))` of @ConfigurePigeon; without that line the
# comparison below would compare two empty texts.
for p in zakadi_sdk_android zakadi_sdk_ios; do
  grep -qx '))' "packages/$p/pigeons/messages.dart" ||
    { echo "tool/pigeons.sh: no '))' line in packages/$p/pigeons/messages.dart" >&2; exit 1; }
done
diff <(sed '1,/^))$/d' packages/zakadi_sdk_android/pigeons/messages.dart) \
     <(sed '1,/^))$/d' packages/zakadi_sdk_ios/pigeons/messages.dart)   # declarations must match
