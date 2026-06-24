<!--
---
id: CopilotApp-04
title: !translate GitHub Workflows
description: !translate Use My work, issues, pull requests, review comments, failing checks, Fix actions, and Agent Merge in the GitHub Copilot App.
audience: Developers / Students / Desktop users
slug: github-workflows
weight: 5
---
-->

![Chapter 04: GitHub Workflows](assets/chapter-header.svg)

> **What if issues, pull requests, review comments, checks, and merge readiness lived in the same supervised workflow?**

The GitHub Copilot App also helps you move work through GitHub: Issues, pull requests, review comments, failing checks, and merge readiness. In this chapter, you'll use My work as your issue and pull request inbox, start sessions from GitHub context, review diffs, and use Fix actions safely.

## 🎯 Learning Objectives

By the end of this chapter, you'll be able to:

- Use My work as an issue and pull request inbox
- Filter issues and PRs with search qualifiers
- Start sessions from issues and pull requests
- Review diffs and comments in the app
- Use Fix actions for review comments and failing CI
- Know when to open a PR in the external browser
- Understand why advanced Agent Merge still needs human judgment

> ⏱️ **Estimated Time**: ~55 minutes (25 min reading + 30 min hands-on)

---

## ✅ Prerequisites

Complete Chapters [00](../00-quick-start/README.md) through [03](../03-development-workflows/README.md).

For the full hands-on flow, use a GitHub-backed training repository with seeded issues and PR scenarios. If you're self-paced, follow the [Training GitHub Scenarios setup guide](../appendices/training-github-scenarios.md) before starting this chapter. If you don't have permission to create PRs, read the steps and use screenshots or instructor-provided examples.

---

## 🧩 Real-World Analogy: The Producer's Review Desk

A music producer's desk does more than start new songs. It tracks song briefs, takes waiting for approval, notes for the players, quality checks, and the final call on what makes the album.

![Producer's review desk analogy for GitHub issues and pull requests](assets/producer-review-desk-github.webp)

My work is similar. It helps you see what needs attention before you start, review, fix, or merge work.

## Core Concepts

| Concept | Beginner explanation |
|---|---|
| My work | An app view for GitHub issues, pull requests, review requests, and checks |
| Issue session | A session started with issue context already attached |
| Pull request session | A session connected to a PR so Copilot can inspect diff, comments, and checks |
| Fix action | A guided action that asks Copilot to address a review comment or failing check |
| CI check | An automated validation run, often from GitHub Actions |

![Issue to pull request workflow](assets/issue-to-merged-pr.webp)

---

## Hands-On Exercises

In these exercises, you'll:

- Find work in My work and start a session from an issue
- Create and review a pull request
- Respond to a PR conversation comment
- Investigate and fix a failing check safely

### 1. Find Work in My work

Open My work and find:

- Issues assigned to you
- Pull requests authored by you
- Review requests
- Pull requests with failing checks

<!-- app-screenshot: My work view showing issue and pull request sections with filters, using a safe sample repository. -->

Try search qualifiers such as:

```text
repo:your-org-or-user/copilot-app-for-beginners is:issue is:open
```

```text
repo:your-org-or-user/copilot-app-for-beginners is:pr is:open
```

#### Success Check

You're able to explain whether a missing issue or PR is more likely caused by filters, permissions, repository selection, or organization policy.

---

### 2. Start from an Issue

Open a seeded issue for the sample app. Choose Issue 1 from [`samples/app-course-issues.md`](../samples/app-course-issues.md#issue-1-make-search-case-insensitive) and use the `practice-search-case-bug` branch created by the setup script. If you skipped the script, manually apply Issue 1's training-branch diff before asking Copilot to fix it. If you're unsure how to base the session on that branch, use the [Chapter 02 practice branch note](../02-sessions-worktrees-context/README.md#practice-branches-in-this-course):

```text
Search should be case-insensitive in samples/book-app-web
```

Start a Plan-mode session from the issue, then try this prompt:

```text
Use this issue as the source of truth. Plan a small fix in samples/book-app-web, list the files you expect to change, and name the tests or browser checks that should prove the issue is fixed. Do not edit until I approve the plan.
```

<!-- app-screenshot: Issue detail page with New session button visible. -->

#### Expected Output

Copilot should summarize the issue, propose a small plan, and identify validation steps.

> Demo output varies. Do not expect exact wording.

---

### 3. Create or Review a Pull Request

After completing and validating a small session, use the app's PR flow to open or inspect a pull request.

Before opening a PR, check:

- Diff is focused
- Tests passed
- Build passed
- Browser behavior was checked if UI changed
- PR description explains the change and validation

<!-- app-screenshot: Pull request Files changed tab or diff review surface inside the app. -->

#### Prompt for PR Description Help

```text
Draft a pull request summary for this session. Include what changed, why it changed, and validation performed. Do not claim checks passed unless you saw the terminal or CI output.
```

#### Expected Output

Copilot should draft a PR summary that you can edit before submitting.

> Demo output varies. Always review PR text before publishing it.

---

### 4. Respond to a PR Conversation Comment

Open the PR conversation comment from [PR scenario 1](../samples/app-course-pr-scenarios.md#pr-scenario-1-review-comment-asks-for-clearer-empty-state-copy), which asks for clearer empty-state copy.

Try this prompt:

```text
Review this PR conversation comment and propose the smallest change that addresses it. Show me the diff and validation plan before I accept the fix.
```

<!-- app-screenshot: PR conversation comment, review comment, or failing CI check, with a Copilot Fix action visible if your app exposes one. -->

#### Expected Output

Copilot should connect the comment to the relevant file, propose a focused fix, and suggest validation.

#### Success Check

You're able to explain whether the comment is fully addressed and whether the fix changes anything unrelated.

---

### 5. Fix a Failing Check Safely

Open [PR scenario 2](../samples/app-course-pr-scenarios.md#pr-scenario-2-failing-ci-points-to-the-stats-test), which should fail the `Book app web` workflow, or use an instructor-provided example.

Try this prompt:

```text
Analyze the failing check. Explain the failure, identify the likely file in samples/book-app-web, propose a minimal fix, and tell me which command should pass afterward.
```

#### Expected Output

Copilot should summarize the failing check and suggest a minimal fix.

#### Check the Result

When the failure is related to the sample app, run:

From the repository root:

```bash
cd samples/book-app-web
npm test -- --run
npm run build
```

Do not mark the PR ready until local validation and CI evidence agree.

<details>
<summary>Advanced: Agent Merge</summary>

Agent Merge is an advanced finishing workflow. It can help carry a pull request through review comments, checks, and merge requirements in a safe training scenario, but it is not a substitute for understanding the work.

![Human judgment stays in the loop](assets/human-judgment-loop.webp)

<!-- app-screenshot: ADVANCED: Agent Merge control or merge drawer in a safe training repository before enabling it. -->

Use Agent Merge only when:

- The PR is small and well-scoped
- You reviewed the diff
- Required checks are meaningful
- Review comments are understood
- Branch protection and merge rules are clear
- The repository is safe for training or your team has approved the workflow

Do not use Agent Merge when:

- You don't understand the diff
- Checks are missing, flaky, or unrelated
- The PR touches secrets, auth, permissions, billing, production data, or deployment logic
- Your organization policy does not allow it
- You're working in a public or upstream repository where you lack merge rights

Safe orientation prompt:

```text
Explain whether this training PR is a good candidate for Agent Merge. Consider diff size, tests, review comments, branch protection, and what I should inspect before enabling it.
```

> Demo output varies. Treat the response as a checklist, not permission to merge.

If your app version exposes `/agent-merge`, treat it as an advanced entry point to the same workflow:

```text
/agent-merge
```

Run it only in the training fork after you've reviewed the PR diff, checks, comments, branch protection, and merge rules.

</details>

---

## Notes and Tips

- My work reflects GitHub data and permissions.
- If a learner cannot see an issue, PR, review request, or check, verify repository access and filters first.
- Fix actions are helpers, not approvals.
- Open the PR in the browser when you need GitHub settings, branch protection details, full Actions logs, or repository administration controls.

### Common Beginner Mistakes

- Assuming My work shows every issue or PR regardless of filters and permissions
- Letting a Fix action change more than the failing check or review comment requires
- Treating Agent Merge as a shortcut before understanding the diff, checks, and branch rules

<details>
<summary>Troubleshooting: GitHub workflow issues</summary>

### I Cannot See an Issue or PR

Check:

- Repository access
- Current account
- Organization membership
- My work filters
- Search qualifiers
- Whether the issue or PR is in a fork

### A Check Fails Locally or in CI Only

Check:

- GitHub Actions secrets
- Hosted service dependencies
- Node version differences
- Branch protection
- Whether the failing workflow is unrelated to your change

### A PR Is Still Blocked After the Fix

Triage in this order:

1. Failing checks
2. Merge conflicts
3. Required reviews
4. Stale approvals
5. Branch protection
6. Agent Merge configuration if using the advanced flow

### I Cannot Push to the Repository

Public or shared training repositories may require forks. Ask your instructor or repository owner which workflow is expected.

</details>

---

## 🔑 Key Takeaways

1. My work turns GitHub issues and PRs into an app workflow surface.
2. Starting from an issue gives Copilot better task context.
3. PR review still belongs to the human.
4. Fix actions can help with comments and failing checks, but you inspect the diff and validation.
5. Agent Merge is advanced and should be used only after clear review checkpoints.

---

## 📝 Assignment

Use a training issue or instructor-provided scenario:

```text
Start from an issue in My work, create a Plan-mode session, propose a fix for samples/book-app-web, validate it locally, and draft a PR summary that only claims evidence you actually saw.
```

Then answer:

1. What issue did you start from?
2. What changed?
3. What tests or checks passed?
4. What would make this PR unsafe to merge automatically?

---

## ➡️ What's Next

Chapter 05 will show how repo-local skills add reusable review guidance without adding external tools.

**[← Back to Chapter 03](../03-development-workflows/README.md)** | **[Continue to Chapter 05 →](../05-skills-mcp-plugins/README.md)**

---

## Source References

- [Managing issues and pull requests in the GitHub Copilot App][issues-prs]
- [Getting started with the GitHub Copilot App][getting-started]
- [GitHub Copilot App GA changelog][ga-changelog]
- [GitHub Copilot App product blog][app-blog]

[issues-prs]: https://docs.github.com/en/copilot/how-tos/github-copilot-app/managing-issues-and-pull-requests
[getting-started]: https://docs.github.com/en/copilot/how-tos/github-copilot-app/getting-started
[ga-changelog]: https://github.blog/changelog/2026-06-17-github-copilot-app-generally-available/
[app-blog]: https://github.blog/news-insights/product-news/github-copilot-app-the-agent-native-desktop-experience/
