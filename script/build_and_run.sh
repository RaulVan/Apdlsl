#!/usr/bin/env bash
set -euo pipefail
MODE="${1:-run}"
case "$MODE" in
  run|--debug|--logs|--telemetry|--verify) ;;
  *) echo "usage: $0 [run|--debug|--logs|--telemetry|--verify]" >&2; exit 2 ;;
esac
ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
APP="$ROOT_DIR/build/Debug/Build/Products/Debug/Apdlsl.app"
pkill -x Apdlsl >/dev/null 2>&1 || true
xcodebuild -project "$ROOT_DIR/Apdlsl.xcodeproj" -scheme Apdlsl \
  -configuration Debug -destination 'platform=macOS' \
  -derivedDataPath "$ROOT_DIR/build/Debug" -allowProvisioningUpdates build
case "$MODE" in
  --debug) lldb -- "$APP/Contents/MacOS/Apdlsl" ;;
  --logs|--telemetry)
    open -n "$APP"
    /usr/bin/log stream --info --style compact --predicate 'process == "Apdlsl"'
    ;;
  --verify) open -n "$APP"; sleep 2; pgrep -x Apdlsl >/dev/null ;;
  run) open -n "$APP" ;;
esac
