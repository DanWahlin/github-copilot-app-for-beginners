<!--
---
id: CopilotApp-02
title: !translate Sessions, Worktrees, and Context
description: !translate Start isolated worktree-backed sessions and give Copilot focused context with @, #, and / in the GitHub Copilot App.
audience: Developers / Students / Desktop users
slug: sessions-worktrees-and-context
weight: 3
---
-->

![Chapter 02: Sessions, Worktrees, and Context](assets/chapter-header.svg)

> **What if every task had its own workspace, branch, context, and history?**

Sessions are where the GitHub Copilot App stops feeling like ordinary chat. A session can have its own branch, working folder, plan, diff, terminal output, browser preview, and GitHub context. In this chapter, you'll start a session from a task, learn how worktrees keep work separated, and practice giving Copilot proper context.

## 🎯 Learning Objectives

By the end of this chapter, you'll be able to:

- Start a session from a prompt, issue, or pull request
- Explain what a git worktree is and why you'd use it
- Understand why isolated sessions protect your main branch
- Use `@` for file and folder context, `#` for issue or PR context, and `/` for app commands
- Decide between local repository, new worktree, and cloud sandbox options
- Recognize branch prefixes and session lifecycle settings

> ⏱️ **Estimated Time**: ~50 minutes (25 min reading + 25 min hands-on)

---

## ✅ Prerequisites

Complete Chapters [00](../00-quick-start/README.md) and [01](../01-first-steps/README.md). At this point, you've connected the course repository and understand the difference between Quick chats and project sessions.

---

## 🧩 Real-World Analogy: One Studio, Many Recording Booths

Imagine one song that three musicians (vocalist, guitar, drums) need to record at the same time. To get the best results, you wouldn't crowd them around a single microphone and hope it works out. You'd put each one in their own soundproof booth to lay down a different part individually or possibly in parallel (to get more of that "live" feel), then mix the takes together later. This approach allows each recorded track to be edited and modified separately.

![Recording studio booths analogy for worktrees and focused context](assets/recording-booths-worktrees.webp)

A worktree is like a separate recording booth. It's connected to the same repository (the same song), but it has its own folder and branch so parallel work doesn't collide.

## Core Concepts

### What Is a Git Worktree?

A **Git worktree** lets you create additional working directories for the same repository. Each worktree is usually checked out to a different branch (or commit). 

This allows you to work on multiple tasks or branches simultaneously without stashing changes or constantly switching branches in a single folder.

### Why Copilot App Uses Worktrees

| Without isolation | With a worktree-backed session |
|---|---|
| Multiple tasks can edit the same folder | Each task gets a separate folder |
| Easy to lose track of branch state | Session branch is visible in the app |
| Tests and diffs can mix together | Diffs stay tied to the session |
| Harder to compare work | Easier to inspect and approve |

![One repository with many safe worktrees](assets/one-repo-many-worktrees.webp)

### Session Settings That Matter Here

Before you run multiple sessions, find the app's session settings you toured in Chapter 01:

| Setting | Why it matters |
|---|---|
| Default model and reasoning | Affects speed, quality, and cost for new sessions |
| Branch prefix | Makes app-created session branches easier to recognize |
| Instructions | Instructions for the agent to follow for every session across projects |

### Context Syntax

Copilot App provides a dedicated context syntax (`@` and `#`) that you can use to give a session the context it needs to understand the problem and generate helpful responses.

| Syntax | Use it for | Example |
|---|---|---|
| `@` | Files or folders | `@samples/book-app-web/src` |
| `#` | Issues or pull requests | `#12` |

> Tip: Provide the smallest amount of useful context - less is often more.

### Slash Commands

Slash commands are shortcuts you type in the composer. They can open app utilities, invoke agent behaviors, inspect usage, or trigger installed skills. The safest way to discover what your app supports is to type `/` in the composer and read the palette. Commands can vary by app version, enabled plugins, installed skills, and organization policy.

Here are some common slash commands you might use:

| Command | What it's for | Use it when... |
|---|---|---|
| `/chronicle` | Summarizes session history and past work | You want a session recap or standup-style summary |
| `/context` | Opens session context and token usage details when available | You want to see how much context the session is using |
| `/usage` | Opens usage, rate limit, or credit information when available | You want to understand cost or plan limits |
| `/research` | Conducts research on a topic or question | You want to gather detailed information or insights on a specific subject |
| `/review` | Requests a review of the current session or a specific piece of code | You want to get feedback on your work before finalizing it |
| `/rubber-duck` | Asks a critic agent to review a plan, diff, tests, or design | You want a second opinion before accepting work |

<details>
<summary>GitHub Copilot App Slash Commands Reference</summary>

| Command | Description |
|---|---|
| `/agent` | Select or switch the active agent for a session. |
| `/agent-merge` | Start or enable the Agent Merge workflow for PR merge-readiness automation. |
| `/chronicle` | Summarize session history, generate standups, search past work, or get workflow/cost tips. |
| `/collect-debug-logs` | Collect app logs for troubleshooting or filing GitHub Copilot App issues. |
| `/context` | Show session context details such as token usage, context window, and AI credit spend. |
| `/create-canvas` | Create a canvas from the current session for a richer editable/inspectable surface. |
| `/orchestrate` | Coordinate multi-session or multi-repo work by delegating to child sessions. |
| `/remote` | Work with remote-session/remote-control flows when available in your build. |
| `/rubber-duck` | Ask a critic agent to review a plan, diff, tests, design, or proposed approach. |
| `/skills` | Discover available skills; `/skills reload` reloads skills during a session. |
| `/usage` | Open usage, rate-limit, plan-limit, or credit information. |
| `/[skill-name]` | Invoke an installed skill directly, such as `/security-audit`; available commands depend on installed skills. |

When in doubt, type `/` and use the in-app palette to discover what's available.

</details>

### Practice Branches in This Course

Some later exercises use setup-script branches such as `practice-empty-state-copy`, `practice-unread-count-bug`, and `practice-search-case-bug`. Those branches contain intentional regressions or training changes.

Before starting one of those exercises, make sure the session is based on the named branch:

1. If the app lets you choose a branch or worktree base, choose the named practice branch.
2. If the app uses your local checkout, switch your local clone first:

   ```bash
   git switch practice-empty-state-copy
   git status
   ```

3. Confirm `git status` shows the expected branch before asking Copilot to inspect or fix the scenario.

Use the branch name shown in the chapter you're working through.

---

## Hands-On Exercises

In these exercises, you'll:

- Start a worktree-backed session from a task in Plan mode
- Give a session focused context with `@` and an issue reference
- Inspect the session's branch, diff, and terminal to confirm the work stays isolated
- Recap session history and check context usage with `/chronicle` and `/context`

### 1. Start a Session from a Task

The default sample app is stable. To practice a real planning workflow without overlapping the Chapter 03 debugging example, first read Issue 3 in [`samples/app-course-issues.md`](../samples/app-course-issues.md#issue-3-improve-the-empty-state-copy). This issue asks for clearer empty-state copy. Use the `practice-empty-state-copy` branch created by the setup script, or manually apply Issue 3's training-branch setup before this exercise. Follow the practice branch note above before starting the session.

Create a new session in Plan mode, then try this prompt:

```text
Improve the empty-state copy in samples/book-app-web. First inspect the relevant files and propose a plan. Do not edit files until I approve the plan.
```

<!-- app-screenshot: New session composer showing the choice between local repository, new worktree, and cloud sandbox if available. -->

#### Expected Output

Copilot should identify likely files to inspect, describe the current behavior, and propose a plan before editing.

> Demo output varies. The exact files and wording may differ.

#### Success Check

You'll find the session in the app and identify whether it's using a worktree, local repository, or cloud sandbox.

---

### 2. Give Focused File Context

In the same session, try this prompt:

```text
Use @samples/book-app-web/src to focus on the React app code. Which files are most likely involved in the empty-state copy?
```

#### Expected Output

Copilot should focus on the sample app source folder instead of discussing unrelated course chapters.

#### How It Works

The `@` reference narrows context. It helps Copilot spend attention on the files that matter.

---

### 3. Start from an Issue

Your forked repository should include seeded issues if you ran the setup script in [00 - Quick Start](../00-quick-start/README.md). With the GitHub Copilot App, you can open an issue directly without having to leave the app. 

Open Issue #3 from your repository by selecting the `Create from` icon next to your `copilot-app-for-beginners` project, selecting the `Issues` tab, and then selecting the issue.

![Open Issue in Copilot App](assets/app-create-from-icon.webp)

> Note: If you skipped the setup script, you can go back to the [00 - Quick Start](../00-quick-start/README.md) section and run the seed script to get the issues and other resources used in the course in your repository.

You should see that the app analyzes the issue and generates a plan to address it. A huge time saver!

#### Expected Output

Copilot should analyze the issue and generate a plan that you can then review and approve before making any changes.

---

### 4. Inspect the Branch and Worktree Safely

A session keeps its evidence in a few surfaces. In this example, you'll explore those surfaces and how they relate to the git concepts you're learning. Open them now so you'll know exactly where to look when you start making changes in upcoming chapters.

From the app, locate:

- Session name
- Branch name
- Worktree or workspace path

<!-- app-screenshot: Session details or sidebar area showing the generated branch/worktree name so learners can connect the app UI to git concepts. -->

If you open the folder in an editor, confirm the branch and path before making any edits.

#### Open the Review Panel and Check the Diff

Select the **Review panel** toggle in the upper-right corner of the screen. This is where a session's diff and terminal surfaces live.

Open the **Changes** tab to see the diff. This session has only planned and inspected, and you haven't approved any edits, so the Changes tab is empty. That's expected. In Chapter 03 you'll make real changes and watch diffs appear here.

<!-- app-screenshot: Review panel open with the Changes tab selected, showing an empty diff for a plan-only session. -->

#### Start a Terminal and Check Git Status

In the Review panel, select the **Terminal** tab. If no terminal exists yet, press **+** to start one.

Run this safe check in the session terminal:

```bash
git status
```

#### Expected Output

Git should show the current branch and whether files are modified.

Example clean output looks like this:

```text
On branch practice-empty-state-copy
nothing to commit, working tree clean
```

> Note: Do not delete an active worktree from Finder, Explorer, or terminal. Clean up sessions through the app when possible.

---

### 5. Use `/chronicle`

After a small completed session or plan, type:

```text
/chronicle
```

#### Expected Output

Copilot should summarize what happened in the session and what decisions or changes were made.

> Demo output varies. Use `/chronicle` as a reflection aid, not as the only record of truth.

---

### 6. Check Session Context with `/context`

Type:

```text
/context
```

#### Expected Output

If your app version supports it, Copilot opens or summarizes session context details such as token count, context window, and usage information.

If `/context` is not available, open the slash command palette and look for a similar usage or context command. App commands change over time, so the palette is the source of truth.

#### How It Works

Context is the material Copilot is using for the current session. Checking it helps you notice when a session is getting too broad before you add more files, issues, or instructions.

<details>
<summary>Intermediate: Local repository, new worktree, and cloud sandbox tradeoffs</summary>

| Option | Good for | Watch out for |
|---|---|---|
| Local repository | Very small work in the current folder | Edits touch your main checkout directly |
| New worktree | Most course exercises and parallel work | Ports, databases, and background processes are still shared |
| Cloud sandbox | Isolated GitHub-hosted work when available | Requires plan, policy, repository settings, and possible billing awareness |

![Where a session should run](assets/session-run-location-comparison.webp)

</details>

<details>
<summary>Advanced: Session settings that change agent behavior</summary>

Some settings affect default model behavior, custom instructions, branch prefixes, session lifecycle, auto-approve behavior, Agent Merge attribution, and remote access.

For beginner work, focus on:

- Clear branch prefixes
- Safe default model and reasoning choices
- Review checkpoints before edits

<!-- app-screenshot: Settings screen where branch prefix or session lifecycle settings are visible, with sensitive details hidden. -->

Treat auto-approve, Agent Merge attribution, and remote access as optional advanced settings that depend on policy and team workflow.

</details>

---

## Notes and Tips

- Worktrees are real directories and branches, not disposable chat history.
- Do not manually edit or delete a worktree while a session is active unless you understand the consequences.
- Worktrees isolate files and branches, but they do not automatically isolate ports, databases, containers, caches, or background processes.
- If two sessions run the sample app, use different ports.

### Common Beginner Mistakes

- Opening the wrong worktree folder in an editor and editing the main checkout by accident
- Attaching the whole repository when `@samples/book-app-web/src` is enough
- Assuming worktrees isolate ports, containers, databases, or background services

<details>
<summary>Troubleshooting: Sessions and worktrees</summary>

### Two Sessions Cannot Run the Web App at the Same Time

They may both be trying to use the same port. For later chapters, run one session on `5173` and another on a different safe port such as `5174`.

### A Session Behaves Differently from the Main Checkout

Check:

- Branch name
- Worktree path
- Dependency install status
- Environment variables
- Uncommitted changes

### The App Lost Track of a Worktree

This can happen if the folder was moved or deleted outside the app. Prefer app-managed cleanup whenever possible.

</details>

---

## 🔑 Key Takeaways

1. Sessions are focused agent workspaces.
2. Worktrees keep session changes separate from your main checkout.
3. `@`, `#`, and `/` help you control context and commands.
4. Cloud sandboxes are useful when available, but they are not required for the beginner path.
5. `/chronicle`, `/context`, and `/usage` help summarize session history and inspect context or usage when available.

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

## ➡️ What's Next

In Chapter 03, you'll use the app for real development workflows: Review, debugging, tests, terminal validation, browser preview, and UI polish.

**[← Back to Chapter 01](../01-first-steps/README.md)** | **[Continue to Chapter 03 →](../03-development-workflows/README.md)**

---

## Source References

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
