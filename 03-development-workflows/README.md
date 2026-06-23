<!--
---
id: CopilotApp-03
title: !translate Development Workflows
description: !translate Use the GitHub Copilot App to review, debug, test, preview, and polish changes in the sample web app with visible validation evidence.
audience: Developers / Students / Desktop users
slug: development-workflows
weight: 4
---
-->

![Chapter 03: Development Workflows](assets/chapter-header.svg)

> **What if the app could help you review, debug, test, preview, and polish a change without losing the evidence?**

In this chapter, you'll use the GitHub Copilot App as a development loop for `samples/book-app-web`: Ask, plan, change, test, preview, review the diff, and iterate.

## 🎯 Learning Objectives

By the end of this chapter, you'll be able to:

- Run code review workflows inside the app
- Debug a failing test or small behavior bug with agent help
- Ask Copilot to generate or update tests
- Refactor code safely using tests as a guardrail
- Use integrated terminal output as validation evidence
- Use the integrated browser or browser canvas to inspect runtime behavior
- Use rubber duck review to critique a plan or change

> ⏱️ **Estimated Time**: ~60 minutes (25 min reading + 35 min hands-on)

---

## ✅ Prerequisites

Complete Chapters [00](../00-quick-start/README.md), [01](../01-first-steps/README.md), and [02](../02-sessions-worktrees-context/README.md).

At this point, you've got a session for the course repository and know where to find the session diff and terminal surfaces.

---

## 🧩 Real-World Analogy: Record, Play Back, Re-take

A good musician doesn't keep the first take just because it's finished. They record a take, play it back, listen closely for anything off, and re-record until it's right.

![Record, play back, re-take analogy for development workflows](assets/record-playback-retake-loop.webp)

Copilot can help you lay down the take, but you still listen back to the evidence:

- Plan
- Diff
- Tests
- Terminal output
- Browser behavior
- Pull request review

## Core Concepts

| Concept | Beginner explanation |
|---|---|
| Diff | The visible set of code changes made in a session |
| Validation | Evidence that the change works, usually tests, build output, and browser behavior |
| Integrated terminal | A terminal surface inside the app for running project commands |
| Integrated browser | A visible web preview surface for checking the running app |
| Rubber duck | Asking Copilot to critique or explain a plan or change before you accept it |

![Development loop in the GitHub Copilot App](assets/development-loop.webp)

---

## Prepare Repository Instructions

Repository instructions give Copilot stable project guidance before it starts editing. This course repository already includes `.github/copilot-instructions.md`. Open it before the first coding workflow and confirm it mentions:

- `samples/book-app-web`
- React, TypeScript, Vite, and Vitest
- small beginner-readable changes
- validation with install, test, build, and browser preview commands

![Better context layers for Copilot](assets/context-layers.webp)

If your own repository does not have instructions yet, keep them short and project-specific. Put personal preferences in global instructions, but put shared build, test, style, and safety rules in repository instructions so teammates can review them in git.

### Try the Comparison

Start a Plan-mode session and ask:

```text
Review the sample web app structure and suggest one beginner-friendly improvement.
```

Then ask a more scoped version:

```text
Using the repository instructions, review @samples/book-app-web and suggest one small accessibility improvement. Do not change files yet.
```

Demo output varies. Look for signs that Copilot used the validation commands and project boundaries from the instructions.

---

## Prepare the Sample App

From the repository root, use the session terminal for these commands:

```bash
cd samples/book-app-web
npm install
npm test -- --run
npm run build
```

<!-- app-screenshot: Integrated terminal showing a test command running or completed, with project-specific secrets and paths cropped if needed. -->

### Expected Output

You'll see dependencies install, tests run, and a production build complete. If the training repo includes an intentionally failing scenario, record the failing test name and continue with the debugging exercise.

### How It Works

Tests and builds are evidence. A confident chat response is not enough.

---

## Hands-On Exercises

In these exercises, you'll:

- Review a buggy area and debug a small fix with agent help
- Ask Copilot to generate or update tests
- Refactor safely using tests as a guardrail
- Critique the work with a rubber duck review before you finalize

### 1. Review a Buggy Area

In a session, try this prompt:

```text
Review @samples/book-app-web/src for issues related to filtering, unread counts, and reading statistics. Create a short checklist grouped by high, medium, and low risk. Do not edit files yet.
```

#### Expected Output

Copilot should produce a review checklist that points to likely files and behaviors.

> Demo output varies. Focus on whether the checklist is specific and testable.

#### Success Check

The review should mention behavior that you can verify with tests or browser interaction.

---

### 2. Debug and Fix a Small Issue

The default app passes tests. Before this workflow, use the `practice-unread-count-bug` branch created by the setup script, or follow the Issue 2 training-branch setup in [`samples/app-course-issues.md`](../samples/app-course-issues.md#issue-2-keep-unread-stats-correct-when-filters-are-active) so there is a real unread-count regression to fix. If you're unsure how to base the session on that branch, use the [Chapter 02 practice branch note](../02-sessions-worktrees-context/README.md#practice-branches-in-this-course).

Try this prompt:

```text
Fix the unread count when filters are active in samples/book-app-web. Keep the change small, explain the root cause, and run the relevant tests.
```

#### Expected Output

Copilot should make a focused change, explain the cause, and run or suggest a test command.

#### Check the Result

Run:

From the repository root:

```bash
cd samples/book-app-web
npm test -- --run
```

If the app has a browser-visible behavior change, also run:

```bash
npm run dev -- --host 127.0.0.1 --port 5173
```

This dev-server command keeps running so the browser can preview the app. Leave that terminal open while you test, then press `Ctrl+C` when you're finished.

Then open the integrated browser to:

```text
http://127.0.0.1:5173
```

<!-- app-screenshot: Integrated browser or browser canvas showing the sample web app preview. -->

---

### 3. Ask for Tests

Stay on the same training branch from the previous workflow.

Try this prompt:

```text
Add or update tests for the unread count behavior so the bug would fail before the fix and pass after the fix. Keep the tests focused on samples/book-app-web.
```

#### Expected Output

Copilot should add or update tests in the sample app test area.

#### Success Check

Run:

```bash
cd samples/book-app-web
npm test -- --run
npm run build
```

Both commands should complete before you treat the change as ready.

---

### 4. Refactor Safely with Tests

Refactoring changes the shape of code without changing what it does. Tests are what make that safe: if they pass before and after, you have evidence the behavior held.

Start on a branch where the tests already pass, and confirm your baseline:

```bash
cd samples/book-app-web
npm test -- --run
```

The `filterBooks` function in `samples/book-app-web/src/App.tsx` combines the search, genre, and reading-status checks inline, which makes it a good candidate for a small extract-function refactor.

Try this prompt:

```text
Refactor filterBooks in @samples/book-app-web/src/App.tsx to extract the search, genre, and status checks into small, clearly named helper functions. Do not change behavior, and keep the filterBooks signature the same. Then run the tests to prove the behavior is unchanged.
```

#### Expected Output

Copilot should propose a behavior-preserving refactor, such as small `matchesSearch`, `matchesGenre`, and `matchesStatus` helpers, and then run the existing tests.

> Demo output varies. The goal is the same behavior with clearer structure, proven by tests.

#### Success Check

Run the tests and the build again, and confirm both still pass:

```bash
cd samples/book-app-web
npm test -- --run
npm run build
```

If a test fails after the refactor, the change altered behavior. Revert or adjust until the tests pass again without editing the test expectations.

---

### 5. Rubber Duck Review

The `/rubber-duck` slash command asks a critic agent to review your current plan, diff, tests, or design. Use it before you create a PR, especially when the session made code changes.

Try this prompt:

```text
/rubber-duck Critique the plan, diff, tests, and browser validation for this session. What should I double-check before creating a pull request?
```

<!-- app-screenshot: Diff view showing code changes alongside the conversation or validation output. -->

If `/rubber-duck` is not available in your app build, use the same prompt without the slash command.

#### Expected Output

Copilot should point out review areas, missing validation, or confidence checks.

> Demo output varies. Use the critique to improve your review, not to skip it.

<details>
<summary>Intermediate: Pick and Polish for UI work</summary>

Pick and Polish is the course name for a visible UI iteration loop:

![Pick and Polish UI iteration workflow](assets/pick-and-polish.webp)

1. Run `samples/book-app-web`.
2. Open the browser preview.
3. Pick or describe a visible area, such as a book card, filter panel, or reading stats area.
4. Ask Copilot to polish spacing, hierarchy, contrast, copy, accessibility, or responsive layout.
5. Preview the result.
6. Review the diff and run tests.

Try this prompt:

```text
Polish the book card UI in samples/book-app-web for spacing, visual hierarchy, accessible copy, and responsive behavior. Keep the design consistent with the existing app and show me the diff before I accept it.
```

<!-- app-screenshot: Pick and Polish live mode or relevant app UI showing selected browser element and polish options, with any user data hidden. -->

Remember: Visual polish can change accessibility and behavior. Always finish with diff review, tests, build, and browser validation.

</details>

---

## Notes and Tips

- A passing agent response is not the same thing as validated software.
- The best evidence is visible: Diff, tests, build output, browser behavior, and PR checks.
- Keep changes small when learning. It is easier to review and recover.
- Ask Copilot to explain the root cause instead of only producing a patch.

### Common Beginner Mistakes

- Accepting a fix because the chat response sounds confident
- Running tests in the wrong session worktree
- Treating visual polish as harmless without checking accessibility, responsive layout, and tests

<details>
<summary>Troubleshooting: Development workflow issues</summary>

### Browser Preview Does Not Update

Check:

- The dev server is running in the correct worktree
- The browser points to the correct port
- Hot reload is active
- You're not viewing a different session's app

### Tests Fail Only in One Session

Check:

- Dependency install status
- Branch contents
- Environment variables
- Generated files
- Whether another session changed the same files

### App Windows Must Be Visible to Capture Them

If you capture images for your notes, capture visible app windows only. Hidden or background sessions do not produce visible pixels for normal screenshot tools. Remove account names, private repository names, secrets, and organization-specific data.

</details>

---

## 🔑 Key Takeaways

1. Use the app as a loop: Ask, plan, change, test, preview, review, iterate.
2. Terminal and browser surfaces make agent work inspectable.
3. Tests and builds are required evidence.
4. Refactor with tests as a guardrail so the behavior stays the same.
5. Rubber duck review helps you pause before accepting or shipping.
6. Pick and Polish is useful for UI work, but it still needs validation.

---

## 📝 Assignment

Practice the full loop on a safe issue:

```text
Improve the empty-state copy in samples/book-app-web so it is clearer and more accessible. Propose a plan first, make the smallest useful change, run tests, run the build, and tell me what changed.
```

Then check:

1. Did Copilot explain the plan?
2. Did the diff stay focused?
3. Did tests pass?
4. Did the build pass?
5. Did the browser preview show the intended copy?

---

## ➡️ What's Next

In Chapter 04, you'll connect the development loop to GitHub work: Issues, pull requests, review comments, failing checks, Fix actions, and advanced Agent Merge.

**[← Back to Chapter 02](../02-sessions-worktrees-context/README.md)** | **[Continue to Chapter 04 →](../04-github-workflows/README.md)**

---

## Source References

- [GitHub Copilot App GA changelog][ga-changelog]
- [GitHub Copilot App product blog][app-blog]
- [Working with canvas extensions][canvas-docs]
- [Working with agent sessions][agent-sessions]

[ga-changelog]: https://github.blog/changelog/2026-06-17-github-copilot-app-generally-available/
[app-blog]: https://github.blog/news-insights/product-news/github-copilot-app-the-agent-native-desktop-experience/
[canvas-docs]: https://docs.github.com/en/copilot/how-tos/github-copilot-app/working-with-canvas-extensions
[agent-sessions]: https://docs.github.com/en/copilot/how-tos/github-copilot-app/agent-sessions
