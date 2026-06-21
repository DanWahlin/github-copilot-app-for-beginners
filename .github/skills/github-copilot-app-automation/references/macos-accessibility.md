# macOS Accessibility Automation

## Permission Requirement

macOS Accessibility control must be granted to the automation caller. If `osascript` returns an assistive access error, stop and have the user grant access in System Settings.

Typical error:

```text
System Events got an error: osascript is not allowed assistive access.
```

## Read-Only Probe Pattern

Use read-only probes first:

```bash
osascript sample_codes/macos-accessibility/probe-readonly.applescript
```

Expected useful outputs include:

- process names
- window names
- menu bar items
- `AXWebArea` children
- named buttons/groups/text controls

## Control Discovery Notes

The Copilot App shell may look like:

```text
AXWindow GitHub Copilot
  AXGroup
    AXGroup
      AXScrollArea
        AXWebArea GitHub Copilot
```

Known controls:

```text
AXGroup      Sidebar
AXCheckBox   Toggle sidebar
AXPopUpButton Create new project or session
AXButton     New session in <project>
AXTextArea   Message
AXComboBox   Select model
AXGroup      Conversation timeline
AXButton     Open changes
```

## Safe Draft Prompt Test

Use the draft test to confirm write access to the prompt composer without submitting:

```bash
osascript sample_codes/macos-accessibility/type-and-clear-draft.applescript
```

Expected shape:

```text
direct-set-worked=true
typed-value=DRAFT ONLY - accessibility automation probe - do not submit
cleared-value=
```

## Robustness Requirements

- Run `open -a "GitHub Copilot"` before probing if the window is absent.
- Add short delays after focusing the app.
- Re-find the `AXWebArea` and `Message` text area before every operation.
- Prefer setting `value` directly over simulated typing when possible.
- If direct set fails, fall back to `keystroke` only after focusing the text area.
- Clear drafts with Command+A then Delete.
- Never send Return/Enter unless the user explicitly asked to submit.

