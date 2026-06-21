![Chapter 05: Settings and Instructions](assets/chapter-header.svg)

# Chapter 05: Settings and Instructions

> **What if Copilot already knew your project rules before you typed the prompt?**

In the first four chapters, you learned how to start sessions, inspect worktrees, fix issues, validate changes, and work with GitHub pull requests. This chapter slows down and tunes the app itself. Settings and instructions are where you make Copilot safer, more predictable, and easier to supervise.

## 🎯 Learning objectives

By the end of this chapter, you'll be able to:

- Audit app settings that affect safety, context, productivity, and cost
- Explain session settings such as model behavior, reasoning effort carryover, custom instructions, branch prefixes, and session lifecycle
- Find daily-use settings such as theme, keyboard shortcuts, voice dictation, accessibility, project settings, and notifications when available
- Write useful global and repository instructions
- Add app-relevant guidance to `.github/copilot-instructions.md`
- Choose least-context and least-tool setups for beginner-friendly work

> ⏱️ **Estimated time**: ~50 minutes (20 min reading + 30 min hands-on)

## Suggested visuals and screenshots

- [visual-image: Create a technical settings map titled 'Customize the Copilot App Safely'. Show a hub labeled 'App Settings' connected to five labeled nodes: 'Session Safety', 'Instructions', 'Model Strategy', 'Voice and Shortcuts', and 'Branch Prefixes'. Add small icons for shield, document, model chip, microphone, keyboard, and branch. Use clean technical documentation style, white background, blue and purple accents, proper margins, and fully readable labels.]
- [visual-image: Create a layered context diagram titled 'How Copilot Gets Better Context'. Stack four layers from bottom to top: 'Repository files', '.github/copilot-instructions.md', 'App settings', and 'Prompt context'. Add a side note labeled 'Keep context lean'. Use modern flat diagram style, subtle gradients, proper margins, and text fully visible.]
- [app-screenshot: General or Sessions settings tab showing default model behavior, custom instructions, branch prefix, or session lifecycle settings, with sensitive fields hidden. If auto-approve, Agent Merge attribution, or remote access appears, label it as ADVANCED.]
- [app-screenshot: Project-specific settings area showing repository instructions or branch prefix settings.]
- [app-screenshot: Voice dictation or keyboard shortcuts settings, with account details hidden.]
- [app-screenshot: INTERMEDIATE: Model providers settings showing available provider configuration without exposing credentials. Use this as orientation only, not as a required beginner setup step.]

---

## ✅ Prerequisites

Before starting:

- Complete Chapters 00 through 04
- Open the course repository in the GitHub Copilot app
- Use `samples/book-app-web` as the sample app path
- Have a GitHub-backed training repository if you want to compare issue or PR behavior

---

## 🧩 Real-world analogy: setting up a workshop

A good workshop is not just a pile of tools. It has labels, safety rules, task lighting, a clean bench, and a place for each tool.

Copilot app settings work the same way:

| Workshop choice | App equivalent | Why it matters |
|---|---|---|
| Safety glasses | Autonomy and approval settings | Prevents risky work from happening unnoticed |
| Labels on drawers | Branch prefixes and project names | Makes sessions easier to recognize |
| Workbench notes | Repository instructions | Keeps project rules visible every time |
| Right tool for the job | Model and reasoning choice | Balances speed, quality, and cost |
| Clear lighting | Shortcuts, voice, and accessibility | Makes daily work easier |

Settings are part of the agent's operating environment. They affect what Copilot sees, how much freedom it has, and how easy it is for you to review the result.

---

## Core concepts

### App settings are not just preferences

Some settings change appearance, such as theme. Others change the way sessions behave. For this course, focus on settings that affect:

| Area | Beginner question to ask |
|---|---|
| Safety | Can the agent act without me approving the next step? |
| Context | What instructions or files are being included by default? |
| Productivity | Which shortcuts, voice settings, and project defaults help me move faster? |
| Cost and speed | Is the selected model and reasoning effort appropriate for this task? |
| Branch naming | Can I recognize app-created worktree branches later? |

### Instructions give Copilot stable guidance

Instructions are reusable guidance Copilot can read before it works. Keep them short, specific, and durable.

| Instruction type | Best use |
|---|---|
| Global instructions | Personal preferences you want everywhere |
| Repository instructions | Project-specific build, test, style, and safety guidance |
| Prompt context | One-time details for the task in front of you |

> 💡 **Tip**: Keep global instructions short and stable. Put project-specific commands and conventions in repository instructions so your team can review them in git.

---

## Hands-on example 1: complete a safe settings checklist

Open the GitHub Copilot app settings and walk through this checklist. Do not change anything you do not understand yet. The goal is to know where each control lives.

| Setting area | Beginner-safe action |
|---|---|
| General | Confirm theme and notification preferences |
| Sessions | Find default model, reasoning effort, branch prefix, and lifecycle settings |
| Projects | Find project-specific settings for this repository |
| Skills | Notice where skills are managed, but wait for Chapter 06 |
| Voice dictation | Confirm whether microphone permission and shortcut setup are appropriate |
| Accessibility or shortcuts | Identify three shortcuts you want to use |

### Expected result

You should be able to explain where the main settings are and which ones affect session behavior.

### How it works

The app reuses some composer choices, such as model, reasoning effort, and context tier, when creating new sessions. That means your setup choices can affect future sessions, not just the current conversation.

<details>
<summary>Advanced: auto-approve, remote access, and Agent Merge attribution</summary>

These controls can be useful in professional workflows, but they are not required for this course path.

- **Auto-approve** can reduce interruptions, but it also increases risk if the task is vague.
- **Remote access** can make sessions available from other places, but it may depend on organization policy.
- **Agent Merge attribution** affects how automated merge work is represented.

Use these only after you are comfortable inspecting plans, diffs, tests, browser behavior, and PR checks.

</details>

---

## Hands-on example 2: add repository instructions

In this exercise, add guidance that helps Copilot work safely in `samples/book-app-web`.

Create or update `.github/copilot-instructions.md` with guidance like this:

```markdown
# GitHub Copilot instructions

This repository contains a beginner course for the GitHub Copilot app.

When working in `samples/book-app-web`:

- Use React, TypeScript, Vite, and Vitest patterns already present in the app.
- Keep changes small and beginner-readable.
- Prefer accessible copy, semantic HTML, clear labels, and responsive layout.
- Validate changes with:
  - `cd samples/book-app-web`
  - `npm install`
  - `npm test -- --run`
  - `npm run build`
- If browser validation is needed, run:
  - `npm run dev -- --host 127.0.0.1 --port 5173`
- Do not edit unrelated chapters, appendices, root README content, or sample files unless the task asks for it.
```

> 📝 **Course note**: If your repository already has this file, add only missing guidance. Do not duplicate instructions.

### Try the comparison

Start a new Plan-mode session and ask:

```text
Review the sample web app structure and suggest one beginner-friendly improvement.
```

Then ask a more scoped version:

```text
Using the repository instructions, review @samples/book-app-web and suggest one small accessibility improvement. Do not change files yet.
```

Demo output varies. The important result is not exact wording. The important result is that Copilot should use the validation commands and project boundaries from the instructions.

---

## Hands-on example 3: verify the sample app commands

Use the integrated terminal in a session or your normal terminal:

```bash
cd samples/book-app-web
npm install
npm test -- --run
npm run build
```

For browser validation:

```bash
cd samples/book-app-web
npm run dev -- --host 127.0.0.1 --port 5173
```

### Expected output

- Tests should run through Vitest
- The build should complete without TypeScript or Vite errors
- The dev server should serve the app on `127.0.0.1:5173`

Demo output varies by dependency version, operating system, and app state.

### How it works

These commands become part of your shared project contract. When the instructions list them, Copilot has a better chance of validating work the same way your course expects.

---

<details>
<summary>Intermediate: model providers and model strategy</summary>

Some settings screens may show model providers or provider configuration. Treat this as orientation only in the beginner path.

Beginner model strategy:

| Task | Suggested approach |
|---|---|
| Quick explanation | Use a faster model and lower reasoning |
| Planning a code change | Use enough reasoning to compare options |
| Debugging failing tests | Use a stronger model if the failure is subtle |
| Large multi-file change | Keep context tight before increasing model capability |

Never screenshot tokens, API keys, private provider URLs, or organization-specific settings.

</details>

---

## Notes and tips

- A passing agent response is not validated software. Look for evidence in tests, builds, diffs, browser behavior, and PR checks.
- More context is not always better. Extra files, instructions, and tools can distract the agent.
- Use branch prefixes that make app-created session branches easy to recognize.
- Voice dictation is helpful for longer prompts, but skip it on shared machines if microphone setup is uncomfortable.

### Common beginner mistakes

- Treating settings as cosmetic when some settings change session behavior
- Putting project-specific commands in global instructions instead of repository instructions
- Increasing model power or reasoning before narrowing the task and context

<details>
<summary>🔧 Troubleshooting</summary>

| Problem | What to check |
|---|---|
| Responses are slow or costly | Model choice, reasoning effort, attached context, and enabled tools |
| Instructions seem ignored | File location, spelling, whether the session started before the instruction was added |
| Branch names are confusing | App-level and project-level branch prefix settings |
| Voice dictation does not work | Microphone permission, shortcut setup, local transcription model, supported language |
| Screenshot contains private data | Retake it with account names, tokens, and private repositories hidden |

</details>

---

## 🔑 Key takeaways

1. Settings shape how Copilot works, not just how the app looks.
2. Repository instructions are the best place for project-specific rules.
3. Keep context lean and tools limited to what the task needs.
4. Model and reasoning choices affect speed, quality, and cost.
5. Validation commands belong in shared instructions so every session has the same target.

---

## 📝 Assignment

Create a short settings and instructions checklist for your own repository:

1. Identify the default model and reasoning setting you want for normal work.
2. Choose a recognizable branch prefix for app-created sessions.
3. Write three repository instructions:
   - one style rule
   - one safety rule
   - one validation command
4. Ask Copilot to review the instructions for clarity before committing them.

Success criteria: You can explain which settings affect safety, context, cost, and branch naming.

---

## ➡️ What's next

In Chapter 06, you'll extend Copilot with reusable expertise using repo-local skills. MCP servers, plugins, model providers, and custom agents are introduced as optional deeper topics.

**[← Back to Chapter 04](../04-github-workflows/README.md)** | **[Next: Skills, MCP Servers, and Plugins →](../06-skills-mcp-plugins/README.md)**

---

## Source references

- [Customizing the GitHub Copilot app](https://docs.github.com/en/copilot/how-tos/github-copilot-app/customize-github-copilot-app)
- [Working with agent sessions](https://docs.github.com/en/copilot/how-tos/github-copilot-app/agent-sessions)
- [Optimizing AI usage](https://docs.github.com/en/copilot/tutorials/optimize-ai-usage)
- [Supported AI models](https://docs.github.com/en/copilot/reference/ai-models)
- [Voice input in Copilot CLI](https://docs.github.com/en/copilot/how-tos/copilot-cli/use-copilot-cli/voice-input)
- [GitHub Copilot app changelog](https://github.com/github/app/blob/main/changelog.md)
