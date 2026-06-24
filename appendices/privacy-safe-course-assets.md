# Privacy-Safe Course Assets

Course assets should be safe to share publicly. This appendix gives authors and reviewers a practical checklist for screenshots, prompts, canvases, code snippets, terminal output, and manifests.

## What counts as a course asset

Review all of these before publishing:

- screenshots,
- GIFs and short recordings,
- conceptual images,
- prompt examples,
- terminal output,
- diff screenshots,
- issue and PR screenshots,
- canvas content,
- automation prompts and run history,
- sample configuration snippets,
- screenshot manifests.

## Redaction checklist

Remove or replace:

- personal account names,
- GitHub handles when not intentionally public,
- avatars and profile photos,
- email addresses,
- private repository names,
- private organization names,
- customer names,
- issue titles from real work,
- private branch names,
- local paths that reveal a person or client,
- tokens, API keys, secrets, and connection strings,
- model provider settings that reveal credentials, endpoints, account IDs, or billing data,
- internal server URLs,
- unreleased product names,
- organization-specific policy details.

## Account names

Use a training account when possible. If you must use a real account, crop or blur:

- profile menu,
- avatar,
- username,
- email,
- organization switcher,
- account-specific settings.

Do not rely only on a small blur if the original text is still readable. Crop when you can.

## Private repositories

Use the course sample repository for examples. If a screenshot shows a repository picker, My work list, issue list, PR list, or Search result, make sure no private repositories are visible.

Safe replacements:

- `copilot-app-for-beginners`
- `book-app-web`
- `copilot-app-training`
- `sample-org`

## Tokens and credentials

Never publish:

- GitHub tokens,
- API keys,
- OAuth client secrets,
- cloud credentials,
- `.env` values,
- connection strings,
- model provider keys,
- private Model Context Protocol (MCP) server credentials.

If a lesson needs to mention a secret, use a placeholder:

```text
GITHUB_TOKEN=REPLACE_WITH_YOUR_TOKEN
MODEL_PROVIDER_API_KEY=REPLACE_WITH_YOUR_KEY
```

Do not include real-looking secrets in examples.

## Model provider settings

Model provider screenshots can reveal more than beginners expect. Hide:

- provider account IDs,
- endpoint URLs,
- API keys,
- deployment names that identify an organization,
- billing or quota details,
- private model names,
- policy warnings that identify an organization.

For the beginner path, show model and reasoning controls without showing credential configuration. Treat provider setup as an intermediate or advanced topic.

## Customer data and organization details

Do not use customer tickets, internal roadmaps, private Slack or Teams text, real logs, private incident details, unreleased designs, or organization-specific security settings in public course material.

Replace them with course-owned examples:

- seeded issues,
- prepared PR scenarios,
- sample book data,
- fake organization names,
- training-only automation prompts.

## Canvas and automation content

Canvases and automations can store visible text, state, prompts, and results. Review them like documents.

Before publishing:

- clear private notes,
- remove sensitive prompts,
- verify generated summaries do not include private details,
- check run history for repository names or tool output,
- confirm tool selections do not reveal private integrations.

## Terminal and diff output

Terminal screenshots can expose local paths, environment variables, package registry URLs, private package names, and command history.

Before capture:

- clear the terminal,
- run only the command needed for the lesson,
- crop home folder paths if needed,
- avoid showing `.env` files,
- avoid printing full environment variables,
- use the sample app and sample data.

## Manifest safety

The screenshot manifest should record enough information to reproduce assets without exposing private details.

Safe:

- app version,
- operating system version,
- sample repository commit,
- chapter,
- asset filenames,
- training account note.

Avoid:

- personal account names,
- private absolute paths,
- internal machine names,
- private repository URLs,
- organization policy text.

Related appendix: [Screenshot Capture Guide](screenshot-capture-guide.md).
