![Chapter 08: Automations](assets/chapter-header.svg)

# Chapter 08: Automations

> **What if your recurring Copilot prompt became a reusable button?**

Automations let you save repeatable agent work. In this chapter, you will start with a manual automation that runs only when you choose. Scheduled, cloud, and issue-triggered automations are useful, but they belong in optional sections because they can involve policy, billing, and permission decisions.

## 🎯 Learning objectives

By the end of this chapter, you'll be able to:

- Explain when to automate recurring agent work instead of starting a manual session
- Create and test an on-demand local automation
- Review automation run history, status, errors, and selected tools
- Apply least-privilege tool selection
- Understand scheduled automations as an intermediate next step
- Recognize cloud and issue-triggered automations as advanced workflows

> ⏱️ **Estimated time**: ~50 minutes (20 min reading + 30 min hands-on)

## Suggested visuals and screenshots

![Automation trigger to agent run](assets/automation-trigger-to-run.png)

![Local versus cloud automations](assets/local-vs-cloud-automations.png)

- [app-screenshot: Automations tab showing saved automations with name, schedule, repository, and last run status.]
- [app-screenshot: New automation form showing trigger choices such as Manual, On a schedule, and When an issue is created.]
- [app-screenshot: ADVANCED: Cloud automation tool selection area showing least-privilege tool choices, with any repository details anonymized.]
- [app-screenshot: Automation run detail or error state with copyable error text visible, using a safe sample workflow.]

---

## ✅ Prerequisites

Before starting:

- Complete Chapter 07
- Open the course repository in the GitHub Copilot app
- Use `samples/book-app-web` for validation examples
- Have a GitHub-backed repository if you want live PR or issue summaries

---

## 🧩 Real-world analogy: a kitchen prep list

A chef does not rewrite the morning prep list every day. They create a reusable list and run it when needed:

| Kitchen workflow | App automation |
|---|---|
| Prep list | Saved prompt |
| Start prep manually | Manual trigger |
| Daily prep time | Schedule |
| Check pantry first | Selected tools |
| Chef reviews the station | Human reviews the result |

Start with a manual automation so you can test the prompt safely before giving it a schedule or trigger.

---

## Core concepts

### Automation is a saved agent run

An automation has four beginner-friendly parts:

| Part | Question |
|---|---|
| Trigger | What starts it? |
| Prompt | What should the agent do? |
| Tools | What is the least access needed? |
| Review path | Where do I inspect the result? |

### Start manual

Manual automations run on demand. They are the safest first step because you can:

- test the prompt
- inspect output
- adjust scope
- avoid surprise runs
- confirm tools are minimal

---

## Hands-on example 1: create a manual PR summary automation

Create an automation named:

```text
Book app PR summary
```

Use a manual trigger.

Use this prompt:

```text
Summarize open pull requests for this training repository. Focus on PR title, current status, failing checks if visible, and the next human review action. Do not modify files, create comments, approve reviews, or merge anything.
```

Tool guidance:

- Allow read-only repository or GitHub context if available.
- Do not grant write-capable tools for this beginner exercise.
- Keep the automation local if local automations are available in your setup.

### Expected output

The run should produce a short PR summary and a suggested next human action.

Demo output varies. Repository state, permissions, and available tools will change the result.

### How it works

The automation saves the prompt and trigger so you can run the same bounded task again later. The selected tools control what the agent can inspect or do.

---

## Hands-on example 2: run it and inspect history

Run the automation manually. Then open the run details.

Look for:

- run status
- timestamp
- prompt used
- selected tools
- result summary
- error text if the run failed

### Pause point

Before editing the automation, ask:

1. Did the prompt ask for one bounded task?
2. Did the automation have only the tools it needed?
3. Did the result need human review?
4. Would this be safe to run again?

---

## Hands-on example 3: create a manual validation reminder

Create another manual automation for local project validation:

```text
Book app validation reminder
```

Prompt:

```text
Create a validation checklist for the current session before a pull request is opened. Include these commands exactly:

cd samples/book-app-web
npm install
npm test -- --run
npm run build

If browser validation is needed, include:

cd samples/book-app-web
npm run dev -- --host 127.0.0.1 --port 5173

Do not run commands or edit files. Return the checklist only.
```

### Expected output

The automation should return a checklist. It should not modify files or run commands.

Demo output varies, but the commands should remain exact.

---

<details>
<summary>Intermediate: scheduled automations</summary>

After a manual automation works reliably, you can consider a schedule.

Good candidates:

- daily PR summary
- weekly dependency review summary
- morning issue triage summary

Use a schedule only when the prompt is bounded and the result has a review path.

Before scheduling, narrow:

- repository scope
- branch or label filters
- read/write tools
- expected output format

</details>

<details>
<summary>Advanced: cloud automations</summary>

Cloud automations are powerful because they can run when your machine is off, but they can depend on:

- organization policy
- repository cloud-agent settings
- billing
- selected tools
- permissions

Use cloud automations only after the manual version works and after you understand the permission model.

</details>

<details>
<summary>Advanced: issue-created triggers</summary>

Issue-triggered automations can respond when an issue is created. This is advanced because a broad trigger can run too often or act on untrusted input.

Safer pattern:

1. Start read-only.
2. Limit repository scope.
3. Filter by label.
4. Avoid write tools until the summary is reliable.
5. Review run history before expanding permissions.

If an issue-triggered automation fires too often, narrow the issue search query, label filter, or repository scope before adding write-capable tools.

</details>

---

## Notes and tips

- Automations are best for repeatable, bounded work with a clear review path.
- Start with manual triggers before schedules or issue-created triggers.
- Least privilege means selecting only the tools required for the task.
- Treat prompts that read issue content as potentially exposed to prompt injection. Keep write actions out of early automations.

### Common beginner mistakes

- Scheduling an automation before testing it manually
- Giving broad write tools to a reminder or summary workflow
- Forgetting that cloud automations may have policy, billing, and repository-access implications

<details>
<summary>🔧 Troubleshooting</summary>

| Problem | What to check |
|---|---|
| Local automation does not run | App availability, project still connected, local tools and credentials |
| PR summary is empty | Repository permissions, filters, whether there are open PRs |
| Cloud automation unavailable | Organization policy, repository settings, billing, selected tools |
| Scheduled run is noisy | Prompt scope, schedule frequency, repository or label filters |
| Automation made surprising suggestions | Remove tools, make the prompt more bounded, add explicit non-goals |

</details>

---

## 🔑 Key takeaways

1. Automations turn repeatable prompts into reusable runs.
2. Manual automations are the safest first step.
3. Every automation needs a trigger, prompt, tool set, and review path.
4. Scheduled automations are intermediate because they run without you clicking each time.
5. Cloud and issue-triggered automations are advanced because policy, billing, and permissions matter.

---

## 📝 Assignment

Create one manual automation for your own workflow:

1. Name it clearly.
2. Use a manual trigger.
3. Write a prompt with one bounded task.
4. Give it only read-only tools if possible.
5. Run it once.
6. Inspect the run history and revise the prompt.

Success criteria: You can explain why the automation is safe to run again.

---

## ➡️ What's next

In Chapter 09, you'll combine the app workflow into a capstone: issue triage, planning, implementation, validation, PR review, and merge readiness. Advanced orchestration stays behind explicit pause points.

**[← Back to Chapter 07](../07-canvases/README.md)** | **[Next: Putting It All Together →](../09-putting-it-all-together/README.md)**

---

## Source references

- [Using automations in the GitHub Copilot app](https://docs.github.com/en/copilot/how-tos/github-copilot-app/using-automations)
- [GitHub Copilot app generally available](https://github.blog/changelog/2026-06-17-github-copilot-app-generally-available/)
- [GitHub Copilot app product blog](https://github.blog/news-insights/product-news/github-copilot-app-the-agent-native-desktop-experience/)
