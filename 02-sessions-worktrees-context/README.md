![Chapter 02: Sessions, Worktrees, and Context](assets/chapter-header.svg)

# Chapter 02: Sessions, Worktrees, and Context

> **What if every task had its own safe desk, branch, context, and history?**

Sessions are where the GitHub Copilot App starts to feel different from ordinary chat. A session is not just a conversation. It can have its own branch, working folder, plan, diff, terminal output, browser preview, and GitHub context. In this chapter, you will start a session from a task, understand why worktrees keep work separated, and practice giving Copilot just enough context.

## 🎯 Learning objectives

By the end of this chapter, you will be able to:

- Start a session from a prompt, issue, or pull request
- Explain a git worktree in beginner terms
- Understand why isolated sessions protect your main checkout
- Use `@` for file and folder context
- Use `#` for issue or PR context when available
- Use `/` for app commands
- Decide between local repository, new worktree, and cloud sandbox options
- Recognize branch prefixes and session lifecycle settings
- Use `/chronicle` to summarize session history

> ⏱️ **Estimated time**: ~45 minutes (20 min reading + 25 min hands-on)

## Suggested visuals and screenshots

- [visual-image: Create a beginner-friendly technical diagram titled 'One Repository, Many Safe Worktrees'. Show a central box labeled 'Main Repository' connected to three separate folder boxes labeled 'Feature Session', 'Bug Fix Session', and 'Docs Session'. Each folder has its own small branch label. Show that the folders do not collide by using separate lanes. Use clean technical documentation style, light background, GitHub blue and green accents, proper margins, and fully readable text.]
- [visual-image: Create a comparison diagram titled 'Where Should This Session Run?'. Three side-by-side cards labeled 'Local Repository', 'New Worktree', and 'Cloud Sandbox'. Local Repository shows direct edits with caution icon, New Worktree shows isolated branch/folder with recommended badge, Cloud Sandbox shows cloud container with policy and billing icons. Use professional course illustration style, clear labels, no tiny text, proper margins.]
- [app-screenshot: New session composer showing the choice between local repository, new worktree, and cloud sandbox if available.]
- [app-screenshot: Session details or sidebar area showing the generated branch/worktree name so learners can connect the app UI to git concepts.]
- [app-screenshot: Settings screen where branch prefix or session lifecycle settings are visible, with sensitive details hidden.]

---

## ✅ Prerequisites

Complete Chapters [00](../00-quick-start/README.md) and [01](../01-first-steps/README.md). You should have the course repository connected and understand the difference between Quick chat and a project session.

---

## 🧩 Real-world analogy: separate desks for separate projects

Imagine you have one important notebook, but three people need to work on different ideas from it. You would not ask everyone to write on the same page at the same time. You would make separate working copies, label them, and compare the results later.

A worktree is like that separate working desk. It is connected to the same repository, but it has its own folder and branch so parallel work does not collide.

## Core concepts

### What is a worktree?

A git worktree is a second working directory attached to the same repository. It usually uses a separate branch. This lets you work on more than one task without mixing files in the same folder.

### Why the app uses worktrees

| Without isolation | With a worktree-backed session |
|---|---|
| Multiple tasks can edit the same folder | Each task gets a separate folder |
| Easy to lose track of branch state | Session branch is visible in the app |
| Tests and diffs can mix together | Diffs stay tied to the session |
| Harder to compare work | Easier to inspect and approve |

### Context controls

| Syntax | Use it for | Example |
|---|---|---|
| `@` | Files or folders | `@samples/book-app-web/src` |
| `#` | Issues or pull requests | `#12` |
| `/` | Commands | `/chronicle` |

> Tip: Context controls are not a contest to attach the most information. Give the smallest useful context.

---

## Hands-on example 1: start a session from a task

The default sample app is stable. To practice a real planning workflow without overlapping the Chapter 03 debugging example, first read Issue 3 in [`samples/app-course-issues.md`](../samples/app-course-issues.md#issue-3-improve-the-empty-state-copy). This issue asks for clearer empty-state copy.

Create a new session in Plan mode and use this exact learner prompt:

```text
Improve the empty-state copy in samples/book-app-web. First inspect the relevant files and propose a plan. Do not edit files until I approve the plan.
```

### Expected output

Copilot should identify likely files to inspect, describe the current behavior, and propose a plan before editing.

> Demo output varies. The exact files and wording may differ.

### Success check

You can find the session in the app and identify whether it is using a worktree, local repository, or cloud sandbox.

---

## Hands-on example 2: give focused file context

Use this exact learner prompt in the same session:

```text
Use @samples/book-app-web/src to focus on the React app code. Which files are most likely involved in the empty-state copy?
```

### Expected output

Copilot should focus on the sample app source folder instead of discussing unrelated course chapters.

### How it works

The `@` reference narrows context. It helps Copilot spend attention on the files that matter.

---

## Hands-on example 3: start from an issue

If your training repository includes seeded issues, open Issue 3 from [`samples/app-course-issues.md`](../samples/app-course-issues.md#issue-3-improve-the-empty-state-copy) and start a session from it.

Use this exact learner prompt after the issue context is loaded:

```text
Use the issue details as the source of truth. Summarize the bug, identify likely files in samples/book-app-web, and propose a safe validation plan before making changes.
```

### Expected output

Copilot should summarize the issue, connect it to sample app files, and suggest checks such as tests and browser validation.

---

## Hands-on example 4: inspect the branch and worktree safely

From the app, locate:

- Session name
- Branch name
- Worktree or workspace path
- Diff view

If you open the folder in an editor, confirm the branch and path before making any edits.

Use this safe terminal check from the session terminal or your local terminal if the folder is open:

```bash
git status
```

### Expected output

Git should show the current branch and whether files are modified.

> Note: Do not delete an active worktree from Finder, Explorer, or terminal. Clean up sessions through the app when possible.

---

## Hands-on example 5: use `/chronicle`

After a small completed session or plan, type:

```text
/chronicle
```

### Expected output

Copilot should summarize what happened in the session and what decisions or changes were made.

> Demo output varies. Use `/chronicle` as a reflection aid, not as the only record of truth.

<details>
<summary>Intermediate: local repository, new worktree, and cloud sandbox tradeoffs</summary>

| Option | Good for | Watch out for |
|---|---|---|
| Local repository | Very small work in the current folder | Edits touch your main checkout directly |
| New worktree | Most course exercises and parallel work | Ports, databases, and background processes are still shared |
| Cloud sandbox | Isolated GitHub-hosted work when available | Requires plan, policy, repository settings, and possible billing awareness |

</details>

<details>
<summary>Advanced: session settings that change agent behavior</summary>

Some settings affect default model behavior, custom instructions, branch prefixes, session lifecycle, auto-approve behavior, Agent Merge attribution, and remote access.

For beginner work, focus on:

- Clear branch prefixes
- Safe default model and reasoning choices
- Review checkpoints before edits

Treat auto-approve, Agent Merge attribution, and remote access as optional advanced settings that depend on policy and team workflow.

</details>

---

## Notes and tips

- Worktrees are real directories and branches, not disposable chat history.
- Do not manually edit or delete a worktree while a session is active unless you understand the consequences.
- Worktrees isolate files and branches, but they do not automatically isolate ports, databases, containers, caches, or background processes.
- If two sessions run the sample app, use different ports.

### Common beginner mistakes

- Opening the wrong worktree folder in an editor and editing the main checkout by accident
- Attaching the whole repository when `@samples/book-app-web/src` is enough
- Assuming worktrees isolate ports, containers, databases, or background services

<details>
<summary>Troubleshooting: sessions and worktrees</summary>

### Two sessions cannot run the web app at the same time

They may both be trying to use the same port. For later chapters, run one session on `5173` and another on a different safe port such as `5174`.

### A session behaves differently from the main checkout

Check:

- Branch name
- Worktree path
- Dependency install status
- Environment variables
- Uncommitted changes

### The app lost track of a worktree

This can happen if the folder was moved or deleted outside the app. Prefer app-managed cleanup whenever possible.

</details>

---

## 🔑 Key takeaways

1. Sessions are focused agent workspaces.
2. Worktrees keep session changes separate from your main checkout.
3. `@`, `#`, and `/` help you control context and commands.
4. Cloud sandboxes are useful when available, but they are not required for the beginner path.
5. `/chronicle` helps summarize session history.

---

## 📝 Assignment

Start a Plan-mode session for this safe task:

```text
Investigate how samples/book-app-web calculates reading stats. Do not edit files. Explain which files are involved and what tests would prove the behavior.
```

Then answer:

1. What branch or worktree did the session use?
2. Which files did Copilot inspect or recommend inspecting?
3. What validation did Copilot suggest?
4. Did you keep the context focused?

---

## ➡️ What's next

In Chapter 03, you will use the app for real development workflows: review, debugging, tests, terminal validation, browser preview, and UI polish.

**[← Back to Chapter 01](../01-first-steps/README.md)** | **[Continue to Chapter 03 →](../03-development-workflows/README.md)**

---

## Source references

- [Working with agent sessions][agent-sessions]
- [About the GitHub Copilot App][about-app]
- [GitHub Copilot App repository][app-readme]
- [GitHub Copilot App GA changelog][ga-changelog]
- [GitHub Copilot App product blog][app-blog]
- [Cloud and local sandboxes][sandboxes]

[agent-sessions]: https://docs.github.com/en/copilot/how-tos/github-copilot-app/agent-sessions
[about-app]: https://docs.github.com/en/copilot/concepts/agents/github-copilot-app
[app-readme]: https://github.com/github/app
[ga-changelog]: https://github.blog/changelog/2026-06-17-github-copilot-app-generally-available/
[app-blog]: https://github.blog/news-insights/product-news/github-copilot-app-the-agent-native-desktop-experience/
[sandboxes]: https://docs.github.com/en/copilot/concepts/about-cloud-and-local-sandboxes
