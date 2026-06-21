# Screenshot Capture and WebP Optimization

## Goal

Capture visible GitHub Copilot App states for course material:

- Save a **PNG** as the high-quality source artifact.
- Save a **WebP** optimized version for web delivery.
- Keep screenshots deterministic and safe by using a known separate session that is already visible, or by getting explicit approval before changing the visible App window.

## Hidden Session Limitation

macOS screenshot capture requires pixels from a visible display/window. A hidden, background-only, minimized, or API-only Copilot App session cannot be captured with `screencapture` unless the App provides a future render/export API.

For hidden-session tasks:

- Do not call `navigate_to` just to take a screenshot.
- Do not foreground the user's current App window without explicit approval.
- Verify hidden work with `get_session`, session events, and filesystem state.
- Report the limitation plainly when the requested screenshot and hidden execution conflict.

## Required macOS Permissions

Two macOS privacy gates may apply:

- **Accessibility**: required to locate the GitHub Copilot window and read its position/size.
- **Screen Recording**: may be required by `screencapture` to capture app contents.

If a capture is blank, denied, returns `could not create image from display`, or prompts the user, stop and have the user grant permission to the automation caller. Do not bypass macOS privacy controls.

## Local Tool Chain

Observed available tools on this machine:

```text
screencapture=/usr/sbin/screencapture
osascript=/usr/bin/osascript
sips=/usr/bin/sips
cwebp=/opt/homebrew/bin/cwebp
magick=/opt/homebrew/bin/magick
ffmpeg=/opt/homebrew/bin/ffmpeg
pngquant=/opt/homebrew/bin/pngquant
```

Preferred conversion order:

1. `cwebp -q 82 -m 6 -metadata none source.png -o output.webp`
2. `magick source.png -strip -quality 82 output.webp`
3. `ffmpeg -i source.png output.webp`

`sips` is useful for reading dimensions but did not advertise WebP conversion support in the local probe.

## Capture Strategy

Use Accessibility to get the window position and size:

```applescript
tell application "System Events"
  tell process "GitHub Copilot"
    set frontmost to true
    set windowPosition to position of window 1
    set windowSize to size of window 1
  end tell
end tell
```

Then call:

```bash
screencapture -x -R "x,y,width,height" output.png
```

Notes:

- `-x` disables the screenshot sound.
- Rectangle capture is used because Accessibility exposes bounds reliably; exact window id capture would require a lower-level CGWindow lookup.
- On multi-display or Retina setups, validate the first capture. If the crop is offset, capture the full screen once to determine coordinate behavior.

## File Naming

Use descriptive, sortable names:

```text
assets/screenshots/01-first-steps-quick-chat.png
assets/screenshots/01-first-steps-quick-chat.webp
```

For research artifacts:

```text
~/.copilot/session-state/<session>/files/screenshots/<timestamp>-copilot-app.png
~/.copilot/session-state/<session>/files/screenshots/<timestamp>-copilot-app.webp
```

## Recommended Workflow

1. Create a separate session and make it visible only if the user approved visible UI changes.
2. Use app/session APIs or Accessibility to reach the desired UI state.
3. Wait 1-2 seconds for UI to settle.
4. Run `capture-copilot-window.sh`.
5. Inspect file sizes and image dimensions.
6. Review for private data before moving images into course assets.

## Example

```bash
bash .github/skills/github-copilot-app-automation/sample_codes/macos-accessibility/capture-copilot-window.sh \
  assets/screenshots \
  01-first-steps-session-ui
```

This creates:

```text
assets/screenshots/01-first-steps-session-ui.png
assets/screenshots/01-first-steps-session-ui.webp
```
