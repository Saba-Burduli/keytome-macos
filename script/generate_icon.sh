#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
ICONSET="$(mktemp -d)/Keytome.iconset"
SOURCE_PNG="$ICONSET/source.png"
mkdir -p "$ICONSET"

if [[ -f "$ROOT_DIR/Resources/KeytomeIconSource.png" ]]; then
  cp "$ROOT_DIR/Resources/KeytomeIconSource.png" "$SOURCE_PNG"
else
  swift "$ROOT_DIR/script/generate_icon.swift" "$SOURCE_PNG"
fi

for size in 16 32 128 256 512; do
  /usr/bin/sips -z "$size" "$size" "$SOURCE_PNG" --out "$ICONSET/icon_${size}x${size}.png" >/dev/null
  double=$((size * 2))
  /usr/bin/sips -z "$double" "$double" "$SOURCE_PNG" --out "$ICONSET/icon_${size}x${size}@2x.png" >/dev/null
done
rm "$SOURCE_PNG"
/usr/bin/iconutil -c icns "$ICONSET" -o "$ROOT_DIR/Resources/Keytome.icns"
echo "Generated Resources/Keytome.icns"
