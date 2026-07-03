#!/usr/bin/env bash
set -euo pipefail

APP_BUNDLE="${1:-dist/Keytome.app}"
INFO="$APP_BUNDLE/Contents/Info.plist"
EXECUTABLE="$APP_BUNDLE/Contents/MacOS/Keytome"
ICON="$APP_BUNDLE/Contents/Resources/Keytome.icns"

fail() { echo "bundle check failed: $*" >&2; exit 1; }
[[ -d "$APP_BUNDLE" ]] || fail "app bundle missing"
[[ -x "$EXECUTABLE" ]] || fail "executable missing or not executable"
[[ -s "$ICON" ]] || fail "icon missing"
[[ "$(plutil -extract CFBundleIdentifier raw "$INFO")" == "com.sababurduli.keytome" ]] || fail "unexpected bundle identifier"
[[ "$(plutil -extract CFBundleShortVersionString raw "$INFO")" == "1.0.0" ]] || fail "unexpected version"
[[ "$(plutil -extract CFBundleVersion raw "$INFO")" == "1" ]] || fail "unexpected build number"
[[ "$(plutil -extract LSMinimumSystemVersion raw "$INFO")" == "14.0" ]] || fail "unexpected minimum macOS version"
[[ "$(plutil -extract CFBundleIconFile raw "$INFO")" == "Keytome" ]] || fail "unexpected icon metadata"
file "$EXECUTABLE" | grep -q 'Mach-O' || fail "executable is not Mach-O"
echo "Bundle metadata and structure are valid"
