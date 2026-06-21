# Troubleshooting Reference

Use this reference when a learner gets stuck. Start with the related chapter, then check the symptom and next action.

## Chapter 00: Quick Start

Related chapter: [00 Quick Start](../00-quick-start/)

| Symptom | Likely cause | Try this |
|---|---|---|
| Sign-in fails | Account, network, SSO, or GitHub Enterprise Server URL issue | Confirm the account, browser sign-in, Enterprise Server URL if used, and network access |
| App access is unavailable | Copilot plan or organization policy | Confirm a paid Copilot plan and any Business or Enterprise policy requirements |
| Git is not detected | Git is missing or not on PATH | Install Git and restart the app |
| Repository does not appear | Repository access or picker filter | Check account access, organization membership, repository permissions, and whether to add a local folder, GitHub repo, or URL |
| Quick chat cannot summarize the repo | Repo not connected or context is too broad | Reconnect the project and ask for a small overview of the course repo |

## Chapter 01: First Steps

Related chapter: [01 First Steps](../01-first-steps/)

| Symptom | Likely cause | Try this |
|---|---|---|
| Learner is unsure which mode to use | Modes sound like skill levels | Use Quick chat for exploration, Plan for approach review, Interactive for steering, and Autopilot for clear low-risk work |
| Responses are slow or costly | Model, reasoning effort, or context is larger than needed | Lower reasoning effort for simple tasks and attach only useful context |
| Settings look different from screenshots | App version or platform difference | Check the app version and screenshot manifest |
| Voice dictation does not work | Microphone permission or local transcription model | Check OS microphone permission, voice settings, downloaded model, shortcut, and language support |
| Keyboard shortcut is missing | Platform or app version difference | Open Help or settings and use the shortcut list for the installed version |

## Chapter 02: Sessions, Worktrees, and Context

Related chapter: [02 Sessions, Worktrees, and Context](../02-sessions-worktrees-context/) and [Git Worktrees](git-worktrees.md)

| Symptom | Likely cause | Try this |
|---|---|---|
| Session edits appear in an unexpected folder | Worktree path or branch confusion | Check the session details, branch name, and worktree path in the app |
| Worktree is missing | Folder was moved or deleted manually | Prefer app cleanup. If already deleted, close the session and recreate the work from the branch or PR if available |
| Two sessions conflict | They edited the same files or shared resources | Pause one session, compare diffs, and decide which branch is the source of truth |
| Web server fails to start | Port already in use | Stop the unused server or run the second session on another port, such as `5174` |
| Session differs from main checkout | Dependencies, branch contents, environment, or generated files differ | Run install and validation commands in the session worktree |
| Context is noisy | Too many files or broad prompts | Use focused `@` file or folder references and smaller tasks |

## Chapter 03: Development Workflows

Related chapter: [03 Development Workflows](../03-development-workflows/)

| Symptom | Likely cause | Try this |
|---|---|---|
| Tests fail only in one session | Dependency or branch mismatch | Reinstall dependencies in that worktree and check branch contents |
| Browser preview does not update | Dev server, hot reload, or wrong port | Restart the server in the correct worktree and confirm the browser URL |
| Diff is hard to trust | Too many unrelated changes | Ask the agent to explain the diff, then split or revert unrelated edits |
| Pick and Polish changes hurt accessibility | Visual update changed contrast, layout, or labels | Review with accessibility goals and rerun tests or manual checks |
| Screenshot does not show expected state | Window was hidden, covered, or scrolled elsewhere | Bring the app forward, expose the target panel, and capture the visible window |

## Chapter 04: GitHub Workflows

Related chapter: [04 GitHub Workflows](../04-github-workflows/)

| Symptom | Likely cause | Try this |
|---|---|---|
| Issue or PR is missing from My Work | Filters or permissions | Clear filters, check repository access, and confirm assignment or review request |
| Cannot push a branch | No write access to upstream | Use a fork or a repository where the learner has write access |
| CI fails but local tests pass | Different environment, secrets, or branch protection | Read the failing check log and compare Node version, commands, and secrets |
| PR remains blocked | Required reviews, checks, branch protection, or conflicts | Triage in this order: failing checks, merge conflicts, required reviews, stale reviews, branch rules |
| Agent Merge is unavailable | Policy, permissions, or repository settings | Treat Agent Merge as advanced and use manual review or merge flow instead |

## Chapter 05: Skills, Model Context Protocol (MCP) Servers, and Plugins

Related chapter: [05 Skills, Model Context Protocol (MCP) Servers, and Plugins](../05-skills-mcp-plugins/)

| Symptom | Likely cause | Try this |
|---|---|---|
| Copilot ignores project style | Instructions are missing or too broad | Put stable project guidance in `.github/copilot-instructions.md` |
| Responses include too much unrelated detail | Global instructions or context are noisy | Keep global instructions short and attach only relevant files |
| Branch names are hard to recognize | Branch prefix is not configured | Set a project or app branch prefix that identifies Copilot App sessions |
| Screenshot exposes settings | Credentials or org details are visible | Retake the screenshot with private fields cropped or hidden |
| Provider setup fails | Credential, endpoint, policy, or billing issue | Treat provider setup as intermediate and verify settings outside the beginner path |
| Skill does not seem to apply | Skill location, metadata, or prompt mismatch | Check `.github/skills/.../SKILL.md` and prompt for the skill's purpose |
| MCP server fails | Authentication, environment variable, or policy issue | Check enabled state, credentials, required variables, and app restart or reload requirements |
| Plugin capability is missing | Plugin disabled or not scoped to the session | Check plugin settings and restart the session if needed |
| Custom agent is confusing | Advanced concept introduced too early | Return to repo-local skills first, then explain agents as optional specialization |
| Agent has too many tools | Toolset adds noise and risk | Disable tools not needed for the task |

## Chapter 06: Canvases

Related chapter: [06 Canvases](../06-canvases/)

| Symptom | Likely cause | Try this |
|---|---|---|
| Canvas does not open | Extension syntax, dependency, or reload issue | Reload the app extension and check the canvas files |
| Canvas state looks stale | Stored state and visible UI are out of sync | Refresh the canvas or rerun the action that updates state |
| Agent action fails | Capability name or input schema mismatch | Check the action name, required fields, and stored state |
| Canvas contains private content | Shared surface was used like private notes | Remove secrets, private repo details, and customer data before publishing |

## Chapter 07: Automations

Related chapter: [07 Automations](../07-automations/)

| Symptom | Likely cause | Try this |
|---|---|---|
| Manual automation does not run | App, project, or tool dependency is unavailable | Confirm the app is open, the project exists, and required tools are installed |
| Schedule does not run | Local machine asleep or cloud setting unavailable | Use manual run for beginner exercises or verify cloud automation prerequisites |
| Cloud automation is unavailable | Policy, billing, repository, or permission issue | Treat it as advanced and use instructor screenshots or a simulated flow |
| Issue trigger fires too often | Trigger is too broad | Narrow the repository, labels, issue query, or tool permissions |
| Automation result is unsafe to publish | Run history includes private data | Redact or recreate with sample repository data |

## Chapter 08: Putting It All Together

Related chapter: [08 Putting It All Together](../08-putting-it-all-together/)

| Symptom | Likely cause | Try this |
|---|---|---|
| Parallel sessions duplicate work | Tasks were not independent | Pause, compare diffs, and assign one session as the source of truth |
| Merge conflicts appear | Branches touched the same files | Resolve manually after reviewing both diffs |
| Final PR is blocked | Checks, reviews, conflicts, branch rules, or Agent Merge settings | Triage checks first, then conflicts, reviews, branch protection, and Agent Merge |
| Learner loses track of evidence | Too many surfaces open | Use a checklist: plan, diff, terminal output, browser behavior, PR checks, and review comments |

## General rule

If the agent says a task is complete, still inspect the evidence. A good course workflow ends with visible validation: diff, tests, build, browser preview, PR checks, or review result.
