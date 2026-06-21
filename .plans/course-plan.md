# GitHub Copilot App for Beginners Course Plan

## Purpose

Create a beginner-friendly, hands-on course for the GitHub Copilot app using `copilot-cli-for-beginners` as the model for tone, structure, and learner experience.

The course should teach the app as an agent-driven development control center: a place to start from issues or prompts, run parallel sessions, inspect plans and diffs, validate changes, manage pull requests, customize agents, and use canvases and automations without constantly switching between terminal, IDE, and browser. Source grounding: [About the GitHub Copilot app][about-app], [GitHub Copilot app README][app-readme], [GitHub Copilot app GA changelog][ga-changelog], and [GitHub Copilot app product blog][app-blog].

## Latest student-review outcome

Plan grade: **A-**

From a beginner learner perspective, the plan is strong because it follows the `copilot-cli-for-beginners` structure, uses one consistent sample app, emphasizes visuals and hands-on practice, and keeps validation evidence visible. The main risk is scope density: several app capabilities are accurate and useful, but they are not beginner-first topics. Keep them in the plan, but label them clearly as `INTERMEDIATE` or `ADVANCED` when drafting chapters and consider moving the deepest material into Chapter 09, appendices, or instructor/demo-only sections.

Beginner path guidance:

- Chapters 00-03 should be the required beginner path: setup, UI orientation, sessions/worktrees/context, and core development workflows.
- Chapters 04-05 remain beginner-friendly if GitHub workflow and settings concepts are explained through checklists and safe defaults.
- Chapter 06 should require only repo-local skills. MCP servers, plugins, model providers, and custom agents should be optional or labeled.
- Chapters 07-08 should start with prepared canvas concepts and manual automations. Creating canvas extensions, cloud automations, and event-triggered automations should be labeled.
- Chapter 09 should collect the most advanced end-to-end orchestration topics: parallel sessions, MCP, automations, Agent Merge, and cloud execution.

## Research grounding

### Primary GitHub docs

- [About the GitHub Copilot app](https://docs.github.com/en/copilot/concepts/agents/github-copilot-app)
  - Desktop app for agent-driven development.
  - Built on GitHub Copilot CLI.
  - Supports parallel workspaces, GitHub issues and pull requests, session modes, model selection, customizations, automations, quick chats, `/chronicle`, and canvases.
- [Getting started with the GitHub Copilot app](https://docs.github.com/en/copilot/how-tos/github-copilot-app/getting-started)
  - Install, sign in, connect repositories, use Quick chats, create first sessions, and start from issues or tasks.
- [Working with agent sessions](https://docs.github.com/en/copilot/how-tos/github-copilot-app/agent-sessions)
  - Sessions run in isolated workspaces.
  - Learners should understand Interactive, Plan, and Autopilot modes.
  - Sessions can run in worktrees, local repositories, or cloud sandboxes.
  - Prompts can reference issues with `#`, files with `@`, and commands with `/`.
  - Voice dictation is configured in app settings, uses a local transcription model, and inserts editable text into the prompt box before sending.
  - Keyboard shortcuts are discoverable from Help, with settings coverage needed for accessibility and productivity.
  - Rubber duck is a useful review and critique topic.
- [Managing issues and pull requests](https://docs.github.com/en/copilot/how-tos/github-copilot-app/managing-issues-and-pull-requests)
  - "My work" centralizes issues, PRs, review requests, CI status, diffs, review comments, Fix actions, and agent merge.
  - Learners should practice picking up an issue, creating a PR, reviewing files changed, asking the agent to respond to review comments, fixing failing checks, and understanding when Agent Merge is appropriate.
- [Using automations](https://docs.github.com/en/copilot/how-tos/github-copilot-app/using-automations)
  - Local and cloud automations run recurring agent tasks on demand or schedules.
  - Cloud automations can also respond to repository events.
  - Tool selection is a key least-privilege concept.
- [Working with canvas extensions](https://docs.github.com/en/copilot/how-tos/github-copilot-app/working-with-canvas-extensions)
  - Canvases are shared, bidirectional surfaces where humans and agents work on artifacts directly.
  - Use cases include plans, PRs, browser sessions, terminals, dashboards, kanban boards, issue triage boards, markdown canvases, and document canvases.
  - Browser-session canvases and terminal/browser validation should be treated as first-class course surfaces because they make app work inspectable outside of chat.
- [Customizing the GitHub Copilot app](https://docs.github.com/en/copilot/how-tos/github-copilot-app/customize-github-copilot-app)
  - The app supports global and repository instructions, skills, MCP servers, custom agents, plugins, and canvas extensions.
- [GitHub Copilot app public changelog](https://github.com/github/app/blob/main/changelog.md)
  - Recent releases emphasize settings as a core learning surface.
  - v1.0.3 adds a dedicated Sessions settings tab for default model, custom instructions, auto-approve, agent merge attribution, remote access, and session lifecycle.
  - v1.0.2 reorganizes settings into logical groups including MCP servers and model providers.
  - v1.0.1 adds app-wide and per-project branch prefix settings and notes that composer model, reasoning effort, and context tier choices are reused for new sessions.
  - v1.0.0 and v1.0.1 include accessibility and keyboard-shortcut settings fixes, so shortcuts and accessibility settings deserve explicit course coverage.
- [Cloud and local sandboxes](https://docs.github.com/en/copilot/concepts/about-cloud-and-local-sandboxes)
  - Cloud sandboxes provide isolated, ephemeral GitHub-hosted Linux environments.
  - Local sandboxing restricts file system, network, and system access.
  - Course should explain the tradeoff between local speed and cloud isolation/portability.
- [Optimizing AI usage](https://docs.github.com/en/copilot/tutorials/optimize-ai-usage)
  - Teach learners to choose the right model and reasoning effort, scope prompts clearly, keep context lean, preserve cache, and separate research, planning, and implementation.
- [Public GitHub Copilot app repository](https://github.com/github/app)
  - Describes the app as an agent-native desktop experience for finding, running, steering, and landing software work.
  - Confirms each local session runs in an isolated git worktree, cloud sessions can be picked up elsewhere, canvases expose plans, terminals, browser previews, diffs, and workflow state, and My Work plus automations and Agent Merge support work beyond code editing.
- Local app skill metadata for Pick and Polish
  - The locally installed `impeccable` app skill includes `/live` for selecting browser elements and hot-swapping generated HTML/CSS variants, plus `/polish` for alignment, spacing, consistency, and micro-detail fixes before shipping.
  - Related design commands include `/audit`, `/critique`, `/layout`, `/typeset`, `/adapt`, `/harden`, and `/optimize`.
  - Course implication: Pick and Polish should be taught as the correct product/workflow name for live browser selection plus polish-focused iteration, with source evidence from local app metadata and user confirmation.

### GitHub blog and changelog

- [GitHub Copilot app generally available](https://github.blog/changelog/2026-06-17-github-copilot-app-generally-available/)
  - Generally available for macOS, Windows, and Linux.
  - Start sessions from issues, PRs, or prompts.
  - Run parallel sessions across repositories, each on its own branch and worktree.
  - Review diffs, validate in integrated terminal/browser, and open PRs that use existing checks and merge requirements.
  - Adds canvases, cloud automations, and bring-your-own model/tools via MCP.
- [GitHub Copilot app: The agent-native desktop experience](https://github.blog/news-insights/product-news/github-copilot-app-the-agent-native-desktop-experience/)
  - Positions the app as a control center for agent-native development.
  - Emphasizes reducing context switching, making agent work inspectable, and keeping humans in control of quality and delivery.
  - Highlights Agent Merge, canvases, sandboxes, code review, rubber duck, cloud automations, memory, and `/chronicle`.

### Video transcript research

Captions were fetched into session artifacts for three public videos:

- `official-end-to-end-agentic-development-onVn-lnHZ9s.txt`
  - Useful workflow theme: agentic development starts by selecting work, gathering issue context, delegating related work, implementing with agent mode, running tests, self-healing from failures, and generating commit/PR descriptions.
  - Course implication: show the app as an end-to-end workflow surface, not just chat.
- `copilot-app-future-of-software-development-NKIX0g9RPxw.txt`
  - Practical app tour themes: mission control for GitHub work, issue/PR inbox, starting sessions from issues, worktree-based sessions, diff review, integrated terminal, automations, MCP settings, skills, projects, quick chats, remote control, and Agent Merge.
  - Course implication: learners need a chapter that maps the UI and another that teaches when to use Quick chat versus a project session.
- `copilot-app-desktop-agent-native-devlore-p6NoUi_FTJU.txt`
  - High-level framing: the app shifts from file-level assistance to broader agentic workflows across a local development environment.
  - Course implication: introduce the mental model early, but keep claims grounded in documented app capabilities.

Evidence handling note:

- Public course chapters should cite public GitHub Docs, GitHub blog/changelog posts, and the public `github/app` repository whenever possible.
- Video transcript notes and local app metadata are author research inputs. Before using them as public course citations, either cite the original public video/source directly or convert the finding into a committed, sanitized course note.
- Pick and Polish is included because the local app metadata exposes `/live` and `/polish` design workflows and the product terminology was confirmed during planning. Treat the local metadata as build guidance unless a public source becomes available.

### Author research note: Pick and Polish

Pick and Polish is the course term for the app's live browser selection plus polish workflow. The local app metadata observed during planning exposes:

- `/live` for selecting browser elements and generating hot-swapped HTML/CSS variants.
- `/polish` for final alignment, spacing, consistency, and micro-detail fixes.
- Supporting commands such as `/audit`, `/critique`, `/layout`, `/typeset`, `/adapt`, `/harden`, and `/optimize`.

Until a public citation is available, course chapters should present Pick and Polish as an app workflow demonstrated through screenshots and instructor-controlled examples, not as a quoted claim from public documentation.

## Course design model from `copilot-cli-for-beginners`

Use the existing CLI course as the template:

- Beginner-friendly voice with plain-English explanations.
- Top-level README pattern:
  - Banner image and badges.
  - Short value proposition.
  - Target audience.
  - "What You'll Learn."
  - Prerequisites.
  - Copilot family positioning table.
  - Chapter table.
  - "How This Course Works."
  - Getting help, contributing, and license sections.
- Each chapter includes:
  - Chapter header image as the first visible element.
  - Short hook.
  - Learning objectives.
  - Prerequisites or "complete the previous chapter" callout where needed.
  - Estimated time.
  - Real-world analogy.
  - Core concepts.
  - Hands-on examples.
  - Demo callouts or screenshots/GIFs.
  - Expected output and "how it works" notes when output matters.
  - "Key insight" or "why this matters" callouts after important examples.
  - Notes, tips, or warnings only where they prevent real learner confusion.
  - Common mistakes and troubleshooting sections for chapters with likely setup, environment, or workflow issues.
  - Key takeaways.
  - Assignment.
  - "What's next."
- Course should use one consistent sample app across chapters.
- Examples should be runnable and should not rely on exact AI output.
- Prefer progressive workflows: quick win first, then context, then development workflows, then customization, then advanced integration.
- Label learner-level complexity in chapter drafts. Use `INTERMEDIATE:` for optional professional workflow topics that beginners can understand with guidance, and `ADVANCED:` for features that depend on policy, permissions, billing, custom extension code, branch protection, or multi-agent orchestration.

### Chapter authoring checklist

Every finished chapter should follow the same learner experience pattern used by `copilot-cli-for-beginners`:

1. Header image, chapter title, and a short hook that explains why the topic matters.
2. Measurable learning objectives and estimated time.
3. Prerequisites or a short "complete the previous chapter first" note when needed.
4. Real-world analogy with a visual image.
5. Core concepts with beginner-friendly definitions before new terms are used.
6. Hands-on examples using the course sample app, with expected outputs where output matters.
7. App screenshots or GIFs for visual workflows, with sensitive data removed.
8. Notes, tips, and troubleshooting callouts only for high-value situations.
9. Key takeaways.
10. Assignment or practice challenge.
11. "What's next" navigation to the following chapter.

Each chapter should also include a "Demo output varies" note when showing model-generated responses, because exact Copilot output will differ by model, prompt, app version, context, and available tools.

## Recommended sample project

Use one canonical GitHub-backed training repository throughout the course. Reuse the same "book collection" domain from the CLI course, but make the primary learner app a small web version named `book-app-web` so the GitHub Copilot app can demonstrate integrated browser validation, Pick and Polish, PR review, CI, canvases, and automations.

Canonical path:

- Learners fork or clone the course repository and connect it to the GitHub Copilot app.
- `samples/book-app-web/` is the main app used from Chapter 02 onward.
- `samples/book-app-project/` can remain as a CLI-course continuity reference, but should not be the main App course exercise path.
- The repository includes seeded GitHub issues, PR scenarios, branch names, labels, and CI checks so My Work, issue sessions, PR review, Fix actions, and Agent Merge can be demonstrated predictably.
- The repository includes a small deterministic test suite that passes by default, plus documented training-branch regressions for failing-check practice.
- The repository includes `.github/copilot-instructions.md` and optional scoped instructions for sample app style, validation commands, and safe agent behavior. Source: [Customizing the app][customizing] and [Optimizing AI usage][optimize-ai].
- INTERMEDIATE: The repository includes a prepared `.github/extensions` canvas concept for a guided tour, plus an optional `/create-canvas` stretch exercise. Source: [Canvas extensions][canvas-docs].
- ADVANCED: Cloud sandboxes, cloud automations, Agent Merge, and issue-triggered automations should be labeled as "hands-on when available, instructor/demo-only or simulated otherwise" because they can depend on plan, organization policy, repository permissions, branch protection, billing, and cloud-agent settings.
- INTERMEDIATE: Pick and Polish exercises use the visible browser surface in `book-app-web`. Source: [Canvas extensions][canvas-docs], [GA changelog][ga-changelog], [product blog][app-blog], and [local `impeccable` skill metadata][local-impeccable].

### Sample app specification

`samples/book-app-web/` should be a small Vite + React + TypeScript app with Vitest tests. This gives the course a modern web surface for browser validation and Pick and Polish without requiring a backend service.

Required commands:

```bash
cd samples/book-app-web
npm install
npm run dev -- --host 127.0.0.1 --port 5173
npm test -- --run
npm run build
```

Required file layout:

```text
samples/book-app-web/
├── package.json
├── index.html
├── src/
│   ├── App.tsx
│   ├── main.tsx
│   ├── data/books.ts
│   ├── components/
│   │   ├── BookCard.tsx
│   │   ├── BookFilters.tsx
│   │   └── ReadingStats.tsx
│   ├── styles/
│   │   └── app.css
│   └── tests/
│       ├── filtering.test.tsx
│       └── stats.test.tsx
└── README.md
```

Required fixtures and training scenarios:

- `src/data/books.ts` includes 12 seed books with title, author, genre, rating, read/unread status, and favorite flag.
- Default app state: tests and build pass so beginners start from a known-good baseline.
- Issue 1 training setup: introduce a search case-sensitivity regression on a training branch before asking Copilot to fix it.
- Issue 2 training setup: pass all books to `ReadingStats` on a training branch so unread stats ignore active filters.
- Issue 3 training setup: simplify empty-state copy on a training branch so learners can address review feedback.
- Issue 4 training setup: use the stable app as the baseline for visual polish and responsive layout practice.
- Issue 5 training setup: introduce an incorrect favorite count on a training branch so CI fails predictably.
- PR scenario 1: review comment asks for clearer empty-state copy.
- PR scenario 2: failing CI check points to the stats test.
- PR scenario 3: Agent Merge demo waits on checks and review state in a safe training repository.

The sample should support app workflows that are hard to demonstrate in a terminal-only course:

- Starting from an issue.
- Parallel sessions for independent features.
- Reviewing diffs in the app.
- Fixing CI or reviewer feedback.
- Creating and reviewing a PR.
- Using integrated terminal and browser surfaces to verify a running web app without leaving the app.
- Practicing a Pick and Polish workflow: pick a UI area or browser state, ask Copilot to polish layout/copy/accessibility, preview the result, and iterate.
- Trying Agent Merge in a safe learning repository.
- Creating a local automation for recurring issue or PR triage.
- Creating a simple canvas for a release checklist or issue triage board.

Primary sources for these workflows: [About the app][about-app], [Agent sessions][agent-sessions], [Managing issues and pull requests][issues-prs], [Canvas extensions][canvas-docs], [Automations][automations], [GA changelog][ga-changelog], and [product blog][app-blog].

## Proposed repository structure

```text
github-copilot-app-for-beginners/
├── README.md
├── GLOSSARY.md
├── 00-quick-start/
│   ├── README.md
│   └── assets/
├── 01-first-steps/
│   ├── README.md
│   └── assets/
├── 02-sessions-worktrees-context/
│   ├── README.md
│   └── assets/
├── 03-development-workflows/
│   ├── README.md
│   └── assets/
├── 04-github-workflows/
│   ├── README.md
│   └── assets/
├── 05-settings-and-instructions/
│   ├── README.md
│   └── assets/
├── 06-skills-mcp-plugins/
│   ├── README.md
│   └── assets/
├── 07-canvases/
│   ├── README.md
│   └── assets/
├── 08-automations/
│   ├── README.md
│   └── assets/
├── 09-putting-it-all-together/
│   ├── README.md
│   └── assets/
├── appendices/
│   ├── README.md
│   ├── git-worktrees.md
│   ├── screenshot-capture-guide.md
│   ├── privacy-safe-course-assets.md
│   └── troubleshooting-reference.md
├── assets/
├── samples/
│   ├── book-app-project/
│   ├── book-app-web/
│   ├── app-course-issues.md
│   └── app-course-pr-scenarios.md
└── .plans/
    └── course-plan.md
```

Appendix roles:

- `git-worktrees.md`: beginner explanation of worktrees, branch naming, safe inspection, cleanup, and port/resource conflict examples.
- `screenshot-capture-guide.md`: privacy-safe app screenshot workflow, PNG/WebP asset requirements, and visible-window limitations.
- `privacy-safe-course-assets.md`: checklist for redacting account names, private repositories, tokens, model provider settings, customer data, and organization-specific details.
- `troubleshooting-reference.md`: consolidated troubleshooting index that links back to the module-specific callouts.

## Initial course outline

### README: GitHub Copilot App for Beginners

Positioning:

- "Learn to direct AI coding agents from one desktop app."
- Explain where the app fits in the Copilot family:
  - GitHub Copilot in IDEs.
  - GitHub Copilot CLI.
  - GitHub Copilot app.
  - Copilot cloud agent.
- Clarify that the app is not primarily about autocomplete; it is about supervising agent-driven work from idea to pull request.

Primary sources: [About the app][about-app], [app README][app-readme], [GA changelog][ga-changelog], and [product blog][app-blog].

Visual imagery and screenshots:

- [visual-image: Create a professional technical course hero image for 'GitHub Copilot App for Beginners'. Show a modern desktop command center with a developer supervising multiple friendly AI agent workstreams. Include three labeled panels: 'Plan', 'Build', and 'Review'. Add subtle GitHub-inspired dark navy, blue, purple, and white accents. Use clean 3D-isometric style mixed with flat technical documentation elements. Ensure the words 'GitHub Copilot App for Beginners' are large, centered, spelled correctly, and fully visible with proper margins. No logos unless generic, no tiny unreadable text.]
- [visual-image: Create a clean comparison diagram titled 'Where the GitHub Copilot App Fits'. Four columns labeled 'IDE Copilot', 'Copilot CLI', 'Copilot App', and 'Cloud Agent'. Show IDE Copilot as inline coding help, Copilot CLI as terminal-based agent work, Copilot App as a desktop mission control for sessions, PRs, canvases, and automations, and Cloud Agent as GitHub-hosted background execution. Use a modern technical documentation style, light background, GitHub blue and purple accent colors, clear icons, consistent spacing, proper margins, and fully readable labels.]
- [app-screenshot: GitHub Copilot App home or sidebar showing the main navigation areas such as My Work, Automations, Search, Sessions, and Quick chats. Use this near the README introduction to orient learners to the app as a control center.]

Course table:

| Chapter | Title | What learners do |
|:--:|---|---|
| 00 | Quick Start | Install, sign in, connect a repository, and verify a Quick chat |
| 01 | First Steps | Learn the UI, Quick chats, sessions, modes, model/reasoning controls |
| 02 | Sessions, Worktrees, and Context | Start sessions from tasks/issues, use `@`, `#`, `/`, worktrees, and cloud/local choices |
| 03 | Development Workflows | Review, debug, refactor, test, validate, and iterate with integrated diff/terminal/browser plus Pick and Polish loops |
| 04 | GitHub Workflows | Use My Work, issues, PRs, review comments, CI checks, Fix actions, and ADVANCED: Agent Merge |
| 05 | Settings and Instructions | Configure safe app settings, model strategy, voice, shortcuts, branch prefixes, and instructions |
| 06 | Skills, MCP Servers, and Plugins | Extend the app with reusable expertise, plus INTERMEDIATE: MCP/plugin awareness and ADVANCED: custom agents |
| 07 | Canvases | Use shared work surfaces, starting with prepared canvas concepts before ADVANCED: custom canvas authoring |
| 08 | Automations | Create manual automations first, then INTERMEDIATE: schedules and ADVANCED: cloud or event triggers |
| 09 | Putting It All Together | Run a complete multi-session feature workflow from issue triage to merged PR |

### Core exercise specifications

Each chapter should expand these into runnable, screenshot-backed lessons:

| Chapter | Core exercise | Starting point | Expected observable result | Success check |
|:--:|---|---|---|---|
| 00 | Connect the course repo and ask a Quick chat overview question | App installed, learner signed in, course repo available | Quick chat summarizes the repo without creating code changes | Learner can identify the sample app and next chapter path |
| 01 | Compare Quick chat, Plan, Interactive, and Autopilot on a harmless repo explanation task | Connected course repo | Learner sees where modes, model, reasoning, Search, settings, shortcuts, and voice options live | Learner can explain which mode to use for exploration, planning, guided work, and autonomous work |
| 02 | Start a worktree-backed session from a seeded issue | `book-app-web` with seeded issues | App creates an isolated session branch/worktree and loads issue context | Learner can find the branch/worktree and explain why it is separate from the main checkout |
| 03 | Fix a small UI or validation issue, run tests, preview in browser, and use Pick and Polish | Worktree session with a known small issue | Diff, terminal output, browser preview, and polished UI update are visible | Tests pass and browser preview shows the intended behavior |
| 04 | Create or review a PR, then respond to a review comment or failing check | GitHub-backed training repo with PR scenario | Learner sees My Work, PR details, Files changed, Fix actions, checks, and ADVANCED: Agent Merge controls | Learner can explain what is safe to automate and what still requires human judgment |
| 05 | Configure safe settings and repository instructions | Connected course repo | Settings checklist is completed and `.github/copilot-instructions.md` improves a repeated prompt | Learner can explain which settings affect safety, cost, context, and branch naming |
| 06 | Create and use a repo-local `book-app-reviewer` skill | Connected course repo with `.github/skills/` available | Learner sees how a skill adds reusable review guidance without granting external tool access | Learner can explain skills first, with INTERMEDIATE: MCP/plugin differences and ADVANCED: custom agents as optional topics |
| 07 | Use a prepared canvas concept, then ADVANCED: optionally revise one capability | Prepared `.github/extensions` canvas concept | Learner understands the target canvas state and, when app support is available, can open or revise it | Learner can explain the difference between chat and shared canvas state |
| 08 | Create and test a manual automation before INTERMEDIATE: scheduling | Training repo and safe prompt | Automation runs on demand and shows status/history | Learner can explain trigger, prompt, tool permissions, and review path before ADVANCED: cloud or issue-created triggers |
| 09 | Complete a multi-session feature workflow | Seeded feature issue, test task, and PR scenario | Two sessions run safely, changes are validated, PR is reviewed, and merge readiness is assessed | Learner can walk from issue triage to validated PR without losing control points, with ADVANCED sections clearly marked |

### Chapter 00: Quick Start

Primary sources: [Getting started][getting-started] and [About the app][about-app].

Learning objectives:

- Confirm prerequisites: Git, paid Copilot plan, supported OS, and Copilot CLI policy for Business/Enterprise.
- Install the app.
- Sign in to GitHub or GitHub Enterprise Server.
- Connect a local folder, GitHub repository, or repository URL.
- Complete first-run choices such as repository selection and theme.
- Start a Quick chat and ask for an overview of a sample repo.

Hands-on flow:

1. Install and sign in.
2. Add the course sample repository.
3. Create a Quick chat: "Give me an overview of this book app course repository."
4. Create the first project session in Interactive mode with a harmless prompt: "Explain the app structure and suggest one beginner-friendly improvement."

Visual imagery and screenshots:

- [visual-image: Create a beginner-friendly technical flow diagram titled 'First 10 Minutes in the GitHub Copilot App'. Show five left-to-right steps with icons and labels: 'Install App', 'Sign In', 'Connect Repository', 'Start Quick Chat', 'Create First Session'. Use a clean course illustration style, soft blue and green accents, white background, simple arrows, proper margins, and ensure all text is spelled correctly and fully visible.]
- [app-screenshot: First-run or setup screen showing sign-in and onboarding flow, with any personal account details hidden or blurred.]
- [app-screenshot: Add project flow showing options for local folder or repository, GitHub repository, and repository URL.]
- [app-screenshot: Quick chat composer with a harmless repository overview prompt typed but no sensitive data visible.]

Planned notes and troubleshooting callouts:

- Note: A paid Copilot plan is required, and Business or Enterprise users may also need an administrator to enable the Copilot CLI policy before the app can be used.
- Note: Quick chats are useful for exploration because they do not create a branch or worktree.
- Troubleshooting: If sign-in or app access fails, have learners check the Copilot plan, organization policy, GitHub Enterprise Server URL if applicable, and whether Git is installed and available on the machine.
- Troubleshooting: If a repository does not appear, learners should confirm account access, repository permissions, and whether they need to add it as a local folder, GitHub repository, or repository URL.

### Chapter 01: First Steps

Primary sources: [Getting started][getting-started], [Agent sessions][agent-sessions], [app changelog][app-changelog], [Voice input][voice-input], and [AI models][ai-models].

Learning objectives:

- Navigate My Work, Automations, Search, Sessions, and Quick chats.
- Locate the main settings areas: General, Sessions, Projects, Skills, Voice dictation, and Accessibility or keyboard shortcuts, with INTERMEDIATE: MCP servers, Plugins, and Model providers as orientation-only settings.
- Choose between Quick chat and a project session.
- Explain Interactive, Plan, and Autopilot.
- Select a model and reasoning effort based on task complexity.
- Configure voice dictation at a conceptual level: shortcut, microphone permission, local transcription model, and review-before-send behavior.

Real-world analogy:

- "Mission control" for many small spacecraft: each session is one controlled mission.

Hands-on demos:

- Quick chat for brainstorming.
- Plan mode for a small change proposal.
- Interactive mode for guided implementation.
- INTERMEDIATE: Autopilot as a preview of high-autonomy workflows, with safety guidance.
- Search for a file, issue, or phrase in the connected repository from the app Search view.
- Open keyboard shortcuts from Help and identify three shortcuts learners will use throughout the course.
- Tour settings without changing risky options, then set a safe preference such as theme or voice shortcut if appropriate.

Visual imagery and screenshots:

- [visual-image: Create a technical analogy image titled 'Mission Control for Agent Sessions'. Show a calm developer at a control desk monitoring several small spacecraft-like agent sessions on screens. Each screen is labeled 'Quick chat', 'Plan mode', 'Interactive mode', and 'Autopilot'. Use a clean modern educational style, dark navy background with blue and purple highlights, friendly non-cartoon look, proper margins, and fully readable labels.]
- [visual-image: Create a decision ladder diagram titled 'Choosing the Right Session Mode'. Three ascending steps labeled 'Interactive: steer closely', 'Plan: approve before execution', and 'Autopilot: well-scoped autonomous work'. Use traffic-light style accents from blue to green, include small safety checkpoint icons, technical documentation style, proper margins, and fully visible text.]
- [app-screenshot: Main app sidebar with My Work, Automations, Search, Sessions, and Quick chats visible.]
- [app-screenshot: Session composer dropdowns showing mode, model, and reasoning effort controls.]
- [app-screenshot: Settings area showing the major categories such as General, Sessions, Projects, Skills, Voice dictation, and Accessibility or keyboard shortcuts. If MCP servers, Plugins, or Model providers are visible, label them as INTERMEDIATE orientation topics rather than required setup.]
- [app-screenshot: Voice dictation settings screen showing shortcut selection and local transcription model setup, with account details hidden.]

Planned notes and troubleshooting callouts:

- Note: Session modes are autonomy settings, not skill levels. Use Plan when the approach matters, Interactive when learners want to steer, and Autopilot only for clear, low-risk work.
- Note: Model and reasoning choices affect speed, quality, and cost. Teach learners to choose enough capability for the task, but not more than needed.
- Troubleshooting: Voice dictation depends on microphone permission, a downloaded local transcription model, and supported language settings.
- Troubleshooting: Keyboard shortcuts and settings screens can vary by platform and app version, so screenshots should be labeled with the app version used in the course.

### Chapter 02: Sessions, Worktrees, and Context

Primary sources: [Agent sessions][agent-sessions], [About the app][about-app], [app README][app-readme], [GA changelog][ga-changelog], [product blog][app-blog], [cloud and local sandboxes][sandboxes], and [app changelog][app-changelog].

Learning objectives:

- Start from a prompt, issue, or PR.
- Understand worktrees and isolated sessions.
- Explain what a git worktree is in beginner terms: a second working directory attached to the same repository, usually on a separate branch, so parallel work does not collide with your main checkout.
- Know where Copilot App worktrees live, why learners should not manually edit/delete them while a session is active, and when to open a worktree in an editor for inspection.
- Use `@` for file/folder context, `#` for issues, and `/` for commands.
- Decide between local repository and new worktree, with INTERMEDIATE: cloud sandbox tradeoffs when available.
- Configure branch prefix settings at app and project scope so learners can recognize session branches.
- Understand session settings that affect default model behavior, custom instructions, branch prefixes, and session lifecycle, with ADVANCED: auto-approve, Agent Merge attribution, and remote access labeled as optional.
- Use `/chronicle` to summarize or reflect on session history.

Hands-on demos:

- Start a session from a task: "Fix the unread count when filters are active."
- Start a session from an issue with issue context preloaded.
- Open the diff and inspect changed files.
- Locate the session branch/worktree from the app, inspect it safely, then compare it with the main repo.
- Compare local repo and new worktree tradeoffs, then INTERMEDIATE: cloud sandbox tradeoffs when available.
- Use `/chronicle` after a small completed session to summarize what happened and reinforce session history.

Key cautions:

- Worktrees are real directories and branches, not disposable chat history.
- Do not delete an active worktree from Finder/Explorer/terminal; close or clean up through the app when possible.
- If a worktree is opened in an editor, keep track of which branch and folder you are editing.

Source notes:

- GitHub's app overview and README describe isolated sessions, dedicated git worktrees, branches, and cloud sandboxes.
- The app changelog documents branch prefix settings and the local repository versus new worktree session preference.

Visual imagery and screenshots:

- [visual-image: Create a beginner-friendly technical diagram titled 'One Repository, Many Safe Worktrees'. Show a central box labeled 'Main Repository' connected to three separate folder boxes labeled 'Feature Session', 'Bug Fix Session', and 'Docs Session'. Each folder has its own small branch label. Show that the folders do not collide by using separate lanes. Use clean technical documentation style, light background, GitHub blue and green accents, proper margins, and fully readable text.]
- [visual-image: Create a comparison diagram titled 'Where Should This Session Run?'. Three side-by-side cards labeled 'Local Repository', 'New Worktree', and 'Cloud Sandbox'. Local Repository shows direct edits with caution icon, New Worktree shows isolated branch/folder with recommended badge, Cloud Sandbox shows cloud container with policy and billing icons. Use professional course illustration style, clear labels, no tiny text, proper margins.]
- [app-screenshot: New session composer showing the choice between local repository, new worktree, and cloud sandbox if available.]
- [app-screenshot: Session details or sidebar area showing the generated branch/worktree name so learners can connect the app UI to git concepts.]
- [app-screenshot: Settings screen where branch prefix or session lifecycle settings are visible, with sensitive details hidden.]

Planned notes and troubleshooting callouts:

- Note: Worktrees isolate files and branches, but they do not automatically isolate external resources such as ports, databases, containers, cache folders, or background processes.
- Note: `@`, `#`, and `/` are context controls. Teach learners to provide the smallest useful context instead of attaching everything.
- Troubleshooting: If two sessions run a web server, API, or container on the same port, one will fail. Use different ports, stop the unused server, or configure per-session environment values.
- Troubleshooting: If a session behaves differently from the main checkout, check branch name, worktree path, dependency install status, local environment files, and uncommitted changes.
- Troubleshooting: If learners delete or edit a worktree manually, the app may lose track of that session. Prefer cleanup from inside the app.

### Chapter 03: Development Workflows

Primary sources: [GA changelog][ga-changelog], [product blog][app-blog], [Canvas extensions][canvas-docs], [Agent sessions][agent-sessions], and [local `impeccable` app skill metadata][local-impeccable] for Pick and Polish.

Learning objectives:

- Run code review workflows inside the app.
- Debug failing tests with agent help.
- Generate tests and validate changes.
- Use integrated terminal/browser to inspect runtime behavior.
- Use browser-session surfaces for web app preview and validation.
- INTERMEDIATE: Use a Pick and Polish loop for UI work: select or describe the visible area, ask Copilot to improve polish/accessibility/responsiveness, preview, and repeat.
- Use rubber duck for critique of plans or changes.

Hands-on demos:

- Review a buggy file for input validation.
- Ask the agent to fix a failing test.
- Ask the agent to run the test suite and iterate.
- Open the browser canvas or integrated browser for UI verification if the sample app includes a web surface.
- INTERMEDIATE: Run a Pick and Polish exercise on a book card, the filter panel, or the reading stats area: improve spacing, visual hierarchy, color contrast, copy, and responsive behavior, then validate in the browser.

Source notes:

- The GA changelog explicitly mentions validating in the integrated terminal and browser.
- Canvas docs and the product blog describe browser sessions, terminal sessions, and other canvases as inspectable work surfaces.
- Local `impeccable` metadata describes `/live` browser element selection and `/polish` final quality passes, which grounds the Pick and Polish exercise.

Visual imagery and screenshots:

- [visual-image: Create a technical workflow diagram titled 'Development Loop in the Copilot App'. Show a circular loop with five stages: 'Ask', 'Plan', 'Change Code', 'Run Tests', and 'Preview in Browser'. Add a small 'Human Review' checkpoint before the loop repeats. Use modern technical documentation style, blue and purple accents, white background, clean icons, proper margins, and fully readable labels.]
- [visual-image: Create a polished UI iteration diagram titled 'Pick and Polish'. Show a browser preview on the left with one highlighted UI card labeled 'Pick', an arrow to an AI design action panel labeled 'Polish', and a refined browser preview on the right labeled 'Preview and Iterate'. Include small callouts for 'spacing', 'copy', 'contrast', and 'responsive layout'. Use premium SaaS dashboard visual style, soft blue and indigo accents, proper margins, and ensure all text is spelled correctly.]
- [app-screenshot: Integrated terminal showing a test command running or completed, with project-specific secrets and paths cropped if needed.]
- [app-screenshot: Integrated browser or browser canvas showing the sample web app preview.]
- [app-screenshot: Pick and Polish live mode or relevant app UI showing selected browser element and polish options, with any user data hidden.]
- [app-screenshot: Diff view showing code changes alongside the conversation or validation output.]

Planned notes and troubleshooting callouts:

- Note: A passing agent response is not the same thing as validated software. Treat tests, terminal output, browser behavior, and diffs as the evidence.
- Note: Pick and Polish should still end with code review and validation. Visual polish can affect accessibility, responsiveness, and behavior.
- Troubleshooting: If the browser preview does not update, check whether the dev server is running in the correct worktree, whether hot reload is active, and whether the browser is pointed at the right port.
- Troubleshooting: If tests fail only in one session, compare dependency install status, environment variables, branch contents, and generated files in that worktree.
- Troubleshooting: If screenshots are needed for course assets, capture visible app windows. Hidden or background sessions do not produce visible pixels for normal screenshot tools.

### Chapter 04: GitHub Workflows

Primary sources: [Managing issues and pull requests][issues-prs], [Getting started][getting-started], [GA changelog][ga-changelog], and [product blog][app-blog].

Learning objectives:

- Use My Work as an issue and pull request inbox.
- Filter issues/PRs with search qualifiers.
- Start sessions from issues and PRs.
- Review diffs, leave comments, and submit reviews.
- Use Fix actions for review comments and failing CI.
- ADVANCED: Understand Agent Merge and when not to use it.
- Know when to open a PR in the external browser versus staying inside the app.

Hands-on demos:

- Pick an issue from My Work and start a Plan-mode session.
- Create a PR from completed work.
- Review a PR in the app.
- Ask the agent to respond to a review comment.
- Ask the agent to fix failing checks, then inspect the change before accepting it.
- ADVANCED: Enable Agent Merge in a safe training scenario.

Source notes:

- GitHub's issues and pull requests docs cover My Work, starting from issues, reviewing PRs, Fix actions for review comments, Fix failing checks, and Agent Merge.
- The product blog explains Agent Merge as carrying pull requests through review, checks, and merge conditions while keeping the developer in control.

Visual imagery and screenshots:

- [visual-image: Create a technical process diagram titled 'From Issue to Merged Pull Request'. Show a left-to-right pipeline with stages: 'Pick Issue', 'Start Session', 'Review Diff', 'Open PR', 'Fix Checks', 'Agent Merge'. Add small approval gates before 'Open PR' and 'Agent Merge'. Use GitHub-inspired blue, green, and purple accents, clean icons, professional documentation style, proper margins, and fully readable labels.]
- [visual-image: Create a review workflow image titled 'Human Judgment Stays in the Loop'. Show an agent proposing changes, automated checks reporting status, and a developer approving or redirecting. Include labels 'Diff', 'Review comments', 'CI checks', and 'Merge decision'. Use calm professional colors, no clutter, proper margins, and readable labels.]
- [app-screenshot: My Work view showing issue and pull request sections with filters, using a safe sample repository.]
- [app-screenshot: Issue detail page with New session button visible.]
- [app-screenshot: Pull request Files changed tab or diff review surface inside the app.]
- [app-screenshot: Review comment or failing CI check with Copilot Fix action visible.]
- [app-screenshot: ADVANCED: Agent Merge control or merge drawer in a safe training repository before enabling it.]

Planned notes and troubleshooting callouts:

- Note: My Work reflects GitHub data and permissions. If a learner cannot see an issue, PR, reviewer request, or check, the first thing to verify is repository access and filters.
- Note: Agent Merge should be presented as a controlled finishing workflow, not a substitute for understanding the diff, test results, and merge requirements.
- Troubleshooting: Failing checks may depend on GitHub Actions secrets, hosted services, or branch protection rules that are not available locally.
- Troubleshooting: Public repository PRs may require forks if the learner cannot push to the upstream repository.
- Troubleshooting: A PR may be blocked even after code is fixed because required reviewers, stale reviews, required checks, or merge conflicts still need attention.

### Chapter 05: Settings and Instructions

Primary sources: [Customizing the app][customizing], [app changelog][app-changelog], [Agent sessions][agent-sessions], [Voice input][voice-input], [Optimizing AI usage][optimize-ai], and [AI models][ai-models].

Learning objectives:

- Audit app settings that affect safety, context, productivity, and cost.
- Explain settings that affect sessions: model behavior, reasoning effort carryover, custom instructions, branch prefixes, and session lifecycle, with ADVANCED: auto-approve, remote access, and Agent Merge attribution labeled as optional.
- Explain settings that affect daily use: theme, keyboard shortcuts, voice dictation, accessibility, project-specific settings, and notifications when available.
- Write useful global and repository instructions.
- Add app-relevant `.github/copilot-instructions.md` guidance.
- Choose least-context and least-tool setups.

Hands-on demos:

- Complete a guided settings checklist and record recommended beginner-safe defaults.
- Configure or inspect branch prefix behavior so new worktree branches are easy to recognize.
- Configure voice dictation or explain why a learner might skip it on a shared machine.
- Add repository instructions for sample app style and validation commands.
- Compare a generic prompt versus a prompt with repository instructions.

Source notes:

- Customizing docs cover global and repository instructions.
- The public app changelog documents the Sessions settings tab, model providers, branch prefix settings, keyboard shortcut accessibility fixes, and voice dictation fixes.
- Agent-session docs state that app voice dictation is configured in app settings. CLI voice docs explain on-device transcription, shortcut setup, supported languages, and settings persistence.
- Optimization docs explain why model, reasoning effort, context, and enabled tools should be chosen intentionally before a session.

Visual imagery and screenshots:

- [visual-image: Create a technical settings map titled 'Customize the Copilot App Safely'. Show a hub labeled 'App Settings' connected to five labeled nodes: 'Session Safety', 'Instructions', 'Model Strategy', 'Voice and Shortcuts', and 'Branch Prefixes'. Add small icons for shield, document, model chip, microphone, keyboard, and branch. Use clean technical documentation style, white background, blue and purple accents, proper margins, and fully readable labels.]
- [visual-image: Create a layered context diagram titled 'How Copilot Gets Better Context'. Stack four layers from bottom to top: 'Repository files', '.github/copilot-instructions.md', 'App settings', and 'Prompt context'. Add a side note labeled 'Keep context lean'. Use modern flat diagram style, subtle gradients, proper margins, and text fully visible.]
- [app-screenshot: General or Sessions settings tab showing default model behavior, custom instructions, branch prefix, or session lifecycle settings, with sensitive fields hidden. If auto-approve, Agent Merge attribution, or remote access appears, label it as ADVANCED.]
- [app-screenshot: Project-specific settings area showing repository instructions or branch prefix settings.]
- [app-screenshot: Voice dictation or keyboard shortcuts settings, with account details hidden.]
- [app-screenshot: INTERMEDIATE: Model providers settings showing available provider configuration without exposing credentials. Use this as orientation only, not as a required beginner setup step.]

Planned notes and troubleshooting callouts:

- Note: Settings are part of the agent's operating environment. They affect context, autonomy, cost, and safety.
- Note: Keep global instructions short and stable. Put project-specific build, test, and style guidance in repository instructions instead of repeating it in every prompt.
- Troubleshooting: If responses become slower or more expensive, review model choice, reasoning effort, attached context, and enabled tools before assuming the prompt is the only problem.
- Troubleshooting: Never capture screenshots that expose model provider credentials, tokens, private server URLs, or organization-specific settings.

### Chapter 06: Skills, MCP Servers, and Plugins

Primary sources: [Customizing the app][customizing], [app changelog][app-changelog], and [Optimizing AI usage][optimize-ai].

Learning objectives:

- Understand when skills are useful, with INTERMEDIATE: MCP servers and plugins as optional extension topics.
- Explain the difference between reusable expertise, INTERMEDIATE: external tool access, and INTERMEDIATE: bundled plugin capabilities.
- Configure skills from app settings, with INTERMEDIATE: MCP servers, plugins, and model providers as orientation-only settings.
- ADVANCED: Use `/agent` to choose a custom agent when a specialized workflow calls for it.
- Choose least-context and least-tool setups.

Hands-on demos:

- Create `.github/skills/book-app-reviewer/SKILL.md` with focused review guidance for accessibility, responsive layout, tests, and safe changes in `book-app-web`.
- Invoke or reference the skill in a session, then compare a generic review prompt with a skill-guided review prompt.
- INTERMEDIATE: Inspect the GitHub MCP server if available, but keep it optional because authentication and policy can vary.
- INTERMEDIATE: Inspect plugin settings and explain enable/disable controls, but do not require installing a third-party plugin for the beginner path.
- ADVANCED: Use `/agent` to view available agents, then explain when a custom or plugin-provided agent would be appropriate.

Source notes:

- Customizing docs cover skills, MCP servers, custom agents, plugins, and canvas extensions.
- The public app changelog documents settings organization for MCP servers, model providers, plugins, and plugin-provided agents.
- Optimization docs warn that large toolsets add context and should be enabled intentionally.

Visual imagery and screenshots:

- [visual-image: Create a technical capability map titled 'Extending the Copilot App'. Show a central node labeled 'Copilot Agent' connected to four labeled nodes: 'Skills: reusable expertise', 'MCP Servers: external tools and data', 'Plugins: bundled capabilities', and 'Custom Agents: specialized roles'. Use clean technical documentation style, white background, blue, green, and purple accents, proper margins, and fully readable labels.]
- [visual-image: Create a least-tool principle diagram titled 'Give the Agent Only What It Needs'. Show a large toolbox with many dimmed tools and three highlighted tools labeled 'Repo context', 'Docs search', and 'Review skill'. Include a small warning label 'Too many tools add noise'. Use modern educational style, proper margins, and clear text.]
- [app-screenshot: Skills settings showing installed or available skills.]
- [app-screenshot: INTERMEDIATE: MCP servers settings showing built-in, plugin, or on-device server grouping.]
- [app-screenshot: INTERMEDIATE: Plugins settings showing install/manage/enable/disable controls.]
- [app-screenshot: ADVANCED: `/agent` picker showing available built-in, custom, plugin, or user agents, with personal details hidden.]

Planned notes and troubleshooting callouts:

- Note: MCP servers and plugins expand what the agent can see or do. Teach them as INTERMEDIATE optional capabilities and add only the tools needed for the current workflow.
- Note: A skill changes how the agent approaches work; an MCP server gives the agent access to tools or data; a plugin can bundle multiple capabilities. Skills belong on the beginner path; MCP and plugins should be optional in this course.
- Note: The required exercise uses a repo-local skill because it is deterministic, reviewable, and does not require external credentials.
- Troubleshooting: If an MCP server or plugin does not work, check authentication, required environment variables, enabled status, and whether the app needs to reload or restart.
- Troubleshooting: If a capability appears in settings but not in a session, check project scope, plugin enabled state, and whether the session needs to be restarted.

### Chapter 07: Canvases

Primary sources: [Canvas extensions][canvas-docs], [GA changelog][ga-changelog], and [product blog][app-blog].

Learning objectives:

- Explain why canvases exist and when chat is not enough.
- Use a prepared simple canvas for issue triage, release checklist, or project planning.
- Understand canvases as shared surfaces for plans, browser sessions, terminals, dashboards, documents, and structured workflows.
- ADVANCED: Explain the difference between project-scoped canvases in `.github/extensions` and user-scoped canvases in `~/.copilot/extensions`.
- Use canvas controls to inspect, steer, and verify work, with ADVANCED: agent-callable capabilities labeled as optional.

Hands-on demos:

- Use a prepared issue triage canvas or release checklist canvas.
- Open a browser, terminal, markdown, or checklist canvas and use it as a visible work surface.
- ADVANCED: Ask the agent to add or revise a canvas capability.
- Use a canvas to inspect progress instead of relying only on chat history.

Source notes:

- Canvas docs describe bidirectional shared surfaces for plans, triage boards, markdown, documents, browser sessions, terminals, dashboards, and other artifacts.
- The product blog frames canvases as the place where intent becomes visible, steerable, inspectable work.

Visual imagery and screenshots:

- [visual-image: Create a technical diagram titled 'Chat vs Canvas'. Split the image into two panels. Left panel labeled 'Chat' shows a vertical conversation thread with intent and discussion. Right panel labeled 'Canvas' shows a shared work surface with a plan card, browser preview, terminal output, and checklist. Add a center arrow labeled 'Intent becomes inspectable work'. Use clean educational style, GitHub blue and purple accents, proper margins, and fully readable labels.]
- [visual-image: Create a canvas architecture diagram titled 'Human and Agent Shared Surface'. Show a central canvas labeled 'Canvas Extension' with two-way arrows to 'Developer' and 'Copilot Agent'. Under the canvas show three capability chips labeled 'get_board', 'add_card', and 'move_card'. Include side labels 'Shared state' and 'Visible controls'. Use modern technical documentation style, light background, proper margins, and text fully visible.]
- [app-screenshot: Right-side canvas panel showing a plan, checklist, browser session, terminal session, or markdown artifact open inside the GitHub Copilot App.]
- [app-screenshot: ADVANCED: `/create-canvas` prompt or resulting canvas extension workflow, using a simple issue triage or release checklist example.]
- [app-screenshot: Canvas controls being used to update shared state, such as moving a card or checking an item.]

Planned notes and troubleshooting callouts:

- Note: A canvas is not just a prettier chat response. It is shared state plus UI controls plus agent-callable capabilities.
- Note: Project-scoped canvases can become team assets in `.github/extensions`; user-scoped canvases are better for personal workflows and experiments. Treat this as ADVANCED implementation detail after learners understand prepared canvases.
- Troubleshooting: If a canvas action does not do what the UI suggests, check whether the agent capability name, input schema, and stored canvas state match the visible controls.
- Troubleshooting: If a canvas fails to open after edits, check extension dependencies, reload requirements, syntax errors, and whether the app is reading the project-scoped or user-scoped extension.
- Troubleshooting: Treat canvas contents as potentially shareable artifacts. Avoid placing secrets, private customer data, or unreleased business details in example canvases.

### Chapter 08: Automations

Primary sources: [Automations][automations], [GA changelog][ga-changelog], and [product blog][app-blog].

Learning objectives:

- Explain when to automate recurring agent work instead of starting a manual session.
- Understand local automations first, with ADVANCED: cloud automations labeled separately.
- Create an on-demand automation, with INTERMEDIATE: scheduled automations as the next step.
- ADVANCED: Understand issue-created triggers for repository workflows.
- Apply least-privilege tool selection and visibility controls, with ADVANCED: billing awareness and prompt-injection awareness included as safety callouts.

Hands-on demos:

- Build a manual "summarize open PRs" automation, then INTERMEDIATE: convert it to a daily scheduled automation if appropriate.
- ADVANCED: Build an issue-created triage automation for private/internal repo scenarios.
- ADVANCED: Compare local automation and cloud automation tradeoffs.
- Review automation run history, status, errors, and selected tools.

Source notes:

- Automation docs cover manual, scheduled, and issue-created triggers, local versus cloud execution, cloud prerequisites, and least-privilege tool selection.
- The GA changelog and product blog explain that cloud automations can schedule recurring agent work without depending on the local machine being awake.

Visual imagery and screenshots:

- [visual-image: Create a technical workflow diagram titled 'Automation Trigger to Agent Run'. Show a left-to-right flow: 'Manual trigger or schedule or issue created' to 'Automation prompt' to 'Selected tools' to 'Agent run' to 'Review result'. Add a security gate labeled 'Least privilege tools'. Use clean technical documentation style, GitHub blue, green, and amber accents, proper margins, and fully readable labels.]
- [visual-image: Create a comparison image titled 'Local vs Cloud Automations'. Two side-by-side cards. Left card labeled 'Local Automation' with laptop icon, note 'Runs on your machine', and status 'Good for personal workflows'. Right card labeled 'Cloud Automation' with cloud icon, note 'Runs when your machine is off', and status 'Requires policy and billing awareness'. Use modern course illustration style, proper margins, and clearly readable labels.]
- [app-screenshot: Automations tab showing saved automations with name, schedule, repository, and last run status.]
- [app-screenshot: New automation form showing trigger choices such as Manual, On a schedule, and When an issue is created.]
- [app-screenshot: ADVANCED: Cloud automation tool selection area showing least-privilege tool choices, with any repository details anonymized.]
- [app-screenshot: Automation run detail or error state with copyable error text visible, using a safe sample workflow.]

Planned notes and troubleshooting callouts:

- Note: Automations are best for repeatable, bounded work with a clear prompt, trigger, and review path.
- Note: ADVANCED: Cloud automations are powerful because they do not depend on the local machine, but they introduce policy, billing, and tool-permission decisions.
- Note: Start with manual automations before scheduled or issue-triggered automations so learners can test the prompt safely.
- Troubleshooting: If a local automation does not run, check whether the app is available, the project still exists, and any local tools or credentials are present.
- Troubleshooting: If a cloud automation is unavailable, check organization policy, repository cloud-agent settings, selected tools, and whether the learner has permission to configure it.
- Troubleshooting: If an issue-triggered automation fires too often, narrow the issue search query, label filter, or repository scope before adding write-capable tools.

### Chapter 09: Putting It All Together

Primary sources: [About the app][about-app], [Agent sessions][agent-sessions], [Managing issues and pull requests][issues-prs], [Canvas extensions][canvas-docs], [Automations][automations], [Customizing the app][customizing], and [product blog][app-blog].

Learning objectives:

- ADVANCED: Orchestrate multiple app sessions in parallel.
- INTERMEDIATE: Delegate independent work safely.
- Move from issue triage to implementation to review to merge.
- Use instructions, rubber duck, canvases, and GitHub integration together, with ADVANCED: MCP and automations added only after the core flow is working.
- Know when to pause and inspect instead of increasing autonomy.

Capstone scenario:

1. Use Quick chat or My Work to prioritize the backlog.
2. Start one session from a feature issue in Plan mode.
3. ADVANCED: Start a second session for test coverage or documentation.
4. Use rubber duck to critique the feature plan.
5. Let the agent implement and run tests.
6. Inspect diffs and validate in terminal/browser.
7. Create a PR.
8. Ask the app to address review comments or failing checks.
9. ADVANCED: Use Agent Merge only after learners understand the control points.

Visual imagery and screenshots:

- [visual-image: Create a capstone journey map titled 'End-to-End Copilot App Workflow'. Show a sweeping left-to-right journey across eight labeled stops: 'Prioritize work', 'Start session', 'Approve plan', 'Implement', 'Validate', 'Review PR', 'Fix feedback', and 'Merge'. Add small icons for My Work, session, plan, code, terminal/browser, PR, checks, and merge. Use a polished course roadmap style, GitHub blue and purple gradient accents, proper margins, and fully readable text.]
- [visual-image: Create a multi-agent coordination diagram titled 'Parallel Sessions Without Collisions'. Show three separate session lanes running in parallel, each with its own branch/worktree, then converging into a final review and merge lane. Include labels 'Feature', 'Tests', 'Docs', 'Human review', and 'Merged PR'. Use clean technical documentation style, white background, proper margins, and readable labels.]
- [app-screenshot: App sidebar showing multiple active sessions under the same repository or across repositories.]
- [app-screenshot: Capstone session conversation with plan, tasks, changes, terminal/browser validation, and PR context visible in a single workspace.]
- [app-screenshot: Final PR ready to merge with checks passing and ADVANCED: Agent Merge or merge controls visible in a safe repository.]

Planned notes and troubleshooting callouts:

- Note: The capstone should explicitly show pause points where the learner inspects plans, diffs, terminal output, browser behavior, PR checks, and automation results before increasing autonomy.
- Note: Parallel sessions are useful when tasks are independent. They are risky when multiple sessions edit the same files or depend on the same running service.
- Troubleshooting: If two sessions modify the same files, expect merge conflicts or duplicated work. Pause one session, review diffs, and decide which branch should become the source of truth.
- Troubleshooting: If the capstone uses multiple running web surfaces, assign distinct ports per session and label browser tabs or canvases clearly.
- Troubleshooting: If the final PR is blocked, triage in this order: failing checks, merge conflicts, required reviews, branch protection, then Agent Merge configuration.

## Asset production plan

Asset format:

- Store source screenshots as PNG.
- Export optimized WebP copies for web delivery.
- Keep generated conceptual images as PNG and optionally export WebP copies for the published site.
- Display large images at approximately 800px wide in chapter markdown unless the layout needs a smaller image.

Naming convention:

- Chapter screenshot: `CHAPTER/assets/app-screenshot-short-description.png`
- Chapter screenshot WebP: `CHAPTER/assets/app-screenshot-short-description.webp`
- Generated visual: `CHAPTER/assets/visual-short-description.png`
- Generated visual WebP: `CHAPTER/assets/visual-short-description.webp`
- Demo GIF or recording: `CHAPTER/assets/demo-short-description.gif`

Capture schedule:

- Capture screenshots while drafting each chapter, not at the end of the course, so UI steps and written instructions stay synchronized.
- Capture each screenshot from a clean training account or sanitized sample repository.
- Record the app version, operating system, and sample repository commit used for screenshot batches in `assets/screenshot-manifest.md`.
- Re-capture screenshots after major app UI changes or before publishing a course release.

## Content principles

- Keep the course beginner-friendly, but do not hide professional controls.
- Every chapter should include a practical "when to use this" decision table.
- Treat autonomy as a dial:
  - Quick chat for exploration.
  - Plan for scope and confidence.
  - Interactive for steering.
  - Autopilot for well-scoped, low-risk tasks.
  - Agent Merge only after validation and clear merge requirements.
- Emphasize inspectability:
  - Plans, diffs, terminal output, browser output, PR checks, review comments, and canvases are learning surfaces.
- Avoid promising exact AI responses.
- Use screenshots/GIFs heavily because the app is visual.
- Every chapter should plan at least one conceptual visual image asset and multiple app screenshot captures where the app UI is the learning surface.
- Screenshot captures should avoid exposing personal repositories, private issue details, access tokens, account identifiers, or organization-specific data.
- Include notes for Business/Enterprise policy requirements and public preview features.

## Locked course build decisions

- Use `samples/book-app-web/` as the canonical learner app because the GitHub Copilot app course needs browser validation, Pick and Polish, PR workflows, canvases, and automations.
- Require a GitHub-backed training repository for the full course path. Provide instructor screenshots or simulated fallback notes only for learners who lack repository, organization, or cloud-agent permissions.
- Treat cloud sandboxes, cloud automations, issue-triggered automations, and Agent Merge as hands-on when available and demo-only or simulated otherwise.
- Use a prepared canvas concept as the primary Chapter 07 exercise, with `/create-canvas` as an optional stretch activity.
- Keep `samples/book-app-project/` only as a continuity reference to the CLI course, not the main exercise path.

## Remaining implementation details

- Final visual design system for `book-app-web`.
- Exact text of seeded GitHub issues and PR review comments.
- Exact course asset filenames after screenshots and generated images are produced.

## Source references

[about-app]: https://docs.github.com/en/copilot/concepts/agents/github-copilot-app
[getting-started]: https://docs.github.com/en/copilot/how-tos/github-copilot-app/getting-started
[agent-sessions]: https://docs.github.com/en/copilot/how-tos/github-copilot-app/agent-sessions
[issues-prs]: https://docs.github.com/en/copilot/how-tos/github-copilot-app/managing-issues-and-pull-requests
[automations]: https://docs.github.com/en/copilot/how-tos/github-copilot-app/using-automations
[canvas-docs]: https://docs.github.com/en/copilot/how-tos/github-copilot-app/working-with-canvas-extensions
[customizing]: https://docs.github.com/en/copilot/how-tos/github-copilot-app/customize-github-copilot-app
[sandboxes]: https://docs.github.com/en/copilot/concepts/about-cloud-and-local-sandboxes
[optimize-ai]: https://docs.github.com/en/copilot/tutorials/optimize-ai-usage
[ai-models]: https://docs.github.com/en/copilot/reference/ai-models
[voice-input]: https://docs.github.com/en/copilot/how-tos/copilot-cli/use-copilot-cli/voice-input
[app-readme]: https://github.com/github/app
[app-changelog]: https://github.com/github/app/blob/main/changelog.md
[ga-changelog]: https://github.blog/changelog/2026-06-17-github-copilot-app-generally-available/
[app-blog]: https://github.blog/news-insights/product-news/github-copilot-app-the-agent-native-desktop-experience/
[local-impeccable]: #author-research-note-pick-and-polish
