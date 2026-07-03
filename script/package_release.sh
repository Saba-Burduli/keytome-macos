#!/usr/bin/env bash
set -euo pipefail

VERSION="${1:-}"
if [[ ! "$VERSION" =~ ^[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
  echo "usage: $0 <major.minor.patch>" >&2
  exit 2
fi

required=(DEVELOPER_ID_APPLICATION APPLE_KEY_ID APPLE_ISSUER_ID APPLE_API_KEY_PATH APPLE_TEAM_ID)
for variable in "${required[@]}"; do
  if [[ -z "${!variable:-}" ]]; then
    echo "error: required release credential $variable is not set; refusing to create an unsigned release" >&2
    exit 1
  fi
done

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
APP_NAME="KeyForge"
DIST_DIR="$ROOT_DIR/dist"
APP_BUNDLE="$DIST_DIR/$APP_NAME.app"
DMG_PATH="$DIST_DIR/$APP_NAME-$VERSION.dmg"
STAGE_DIR="$(mktemp -d)"
RW_DMG="$(mktemp -u).dmg"
MOUNT_DIR="$(mktemp -d)"
trap 'hdiutil detach "$MOUNT_DIR" -quiet >/dev/null 2>&1 || true; rm -rf "$STAGE_DIR" "$MOUNT_DIR" "$RW_DMG"' EXIT

cd "$ROOT_DIR"
swift build -c release
BIN_PATH="$(swift build -c release --show-bin-path)/$APP_NAME"

rm -rf "$APP_BUNDLE" "$DMG_PATH"
mkdir -p "$APP_BUNDLE/Contents/MacOS" "$APP_BUNDLE/Contents/Resources"
cp "$BIN_PATH" "$APP_BUNDLE/Contents/MacOS/$APP_NAME"
cp Resources/Info.plist "$APP_BUNDLE/Contents/Info.plist"
cp Resources/KeyForge.icns "$APP_BUNDLE/Contents/Resources/KeyForge.icns"
/usr/libexec/PlistBuddy -c "Set :CFBundleShortVersionString $VERSION" "$APP_BUNDLE/Contents/Info.plist"

codesign --force --timestamp --options runtime \
  --entitlements Resources/KeyForge.entitlements \
  --sign "$DEVELOPER_ID_APPLICATION" "$APP_BUNDLE"
codesign --verify --deep --strict --verbose=2 "$APP_BUNDLE"

cp -R "$APP_BUNDLE" "$STAGE_DIR/"
ln -s /Applications "$STAGE_DIR/Applications"
hdiutil create -quiet -fs HFS+ -format UDRW -volname "$APP_NAME" -srcfolder "$STAGE_DIR" "$RW_DMG"
hdiutil attach -quiet -readwrite -noverify -noautoopen -mountpoint "$MOUNT_DIR" "$RW_DMG"
osascript <<APPLESCRIPT
tell application "Finder"
  tell disk "$APP_NAME"
    open
    set current view of container window to icon view
    set toolbar visible of container window to false
    set statusbar visible of container window to false
    set bounds of container window to {200, 200, 780, 560}
    set icon size of icon view options of container window to 112
    set arrangement of icon view options of container window to not arranged
    set position of item "$APP_NAME.app" of container window to {150, 180}
    set position of item "Applications" of container window to {430, 180}
    close
    open
    update without registering applications
    delay 2
  end tell
end tell
APPLESCRIPT
hdiutil detach -quiet "$MOUNT_DIR"
hdiutil convert -quiet "$RW_DMG" -format UDZO -imagekey zlib-level=9 -o "$DMG_PATH"
codesign --force --timestamp --sign "$DEVELOPER_ID_APPLICATION" "$DMG_PATH"

xcrun notarytool submit "$DMG_PATH" --wait \
  --key "$APPLE_API_KEY_PATH" --key-id "$APPLE_KEY_ID" \
  --issuer "$APPLE_ISSUER_ID" --team-id "$APPLE_TEAM_ID"
xcrun stapler staple "$DMG_PATH"
xcrun stapler validate "$DMG_PATH"
spctl --assess --type open --context context:primary-signature --verbose=2 "$DMG_PATH"

echo "Created signed and notarized $DMG_PATH"
