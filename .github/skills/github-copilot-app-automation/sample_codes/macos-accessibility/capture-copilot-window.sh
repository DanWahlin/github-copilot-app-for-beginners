#!/usr/bin/env bash
set -euo pipefail

output_dir="${1:-./screenshots}"
base_name="${2:-copilot-app-$(date +%Y%m%d-%H%M%S)}"
quality="${WEBP_QUALITY:-82}"

mkdir -p "$output_dir"

png_path="$output_dir/${base_name}.png"
webp_path="$output_dir/${base_name}.webp"

open -a "GitHub Copilot" >/dev/null 2>&1 || true
sleep 0.8

rect="$(
  osascript <<'APPLESCRIPT'
tell application "System Events"
  tell process "GitHub Copilot"
    set frontmost to true
    delay 0.3
    if (count of windows) = 0 then error "GitHub Copilot has no accessible windows"
    set windowPosition to position of window 1
    set windowSize to size of window 1
    set xPos to item 1 of windowPosition
    set yPos to item 2 of windowPosition
    set windowWidth to item 1 of windowSize
    set windowHeight to item 2 of windowSize
    return (xPos as integer as text) & "," & (yPos as integer as text) & "," & (windowWidth as integer as text) & "," & (windowHeight as integer as text)
  end tell
end tell
APPLESCRIPT
)"

if [[ ! "$rect" =~ ^-?[0-9]+,-?[0-9]+,[0-9]+,[0-9]+$ ]]; then
  echo "Invalid capture rectangle: $rect" >&2
  exit 1
fi

screencapture -x -R "$rect" "$png_path"

if [[ ! -s "$png_path" ]]; then
  echo "PNG capture failed or produced an empty file: $png_path" >&2
  exit 1
fi

if command -v cwebp >/dev/null 2>&1; then
  cwebp -quiet -q "$quality" -m 6 -metadata none "$png_path" -o "$webp_path"
elif command -v magick >/dev/null 2>&1; then
  magick "$png_path" -strip -quality "$quality" "$webp_path"
elif command -v ffmpeg >/dev/null 2>&1; then
  ffmpeg -hide_banner -loglevel error -y -i "$png_path" "$webp_path"
else
  echo "No WebP encoder found. Install cwebp, ImageMagick, or ffmpeg." >&2
  exit 1
fi

if [[ ! -s "$webp_path" ]]; then
  echo "WebP conversion failed or produced an empty file: $webp_path" >&2
  exit 1
fi

png_size="$(wc -c < "$png_path" | tr -d ' ')"
webp_size="$(wc -c < "$webp_path" | tr -d ' ')"

printf 'png=%s bytes=%s\n' "$png_path" "$png_size"
printf 'webp=%s bytes=%s quality=%s\n' "$webp_path" "$webp_size" "$quality"
