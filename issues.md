# Course Review Issues

This file tracks issues found during course reviews of the root README and Chapters 00-09.

## ✅ Issue 1: Course files were too text-heavy for beginners

**Severity:** Blocking

**Files:** `README.md`, `00-quick-start/README.md` through `09-putting-it-all-together/README.md`

**Problem:** The plan called for course imagery and app capture placeholders throughout the course, but the chapters only included the SVG header images. That made a desktop app course feel too text-heavy for beginners.

**Resolution:** Added PNG assets from the `visual-image` items, replaced those prompt placeholders with image references, and kept the `app-screenshot` placeholders for future app captures.

## ✅ Issue 2: Chapter template consistency drifted between Chapters 00-04 and 05-09

**Severity:** High

**Files:** `00-quick-start/README.md` through `09-putting-it-all-together/README.md`

**Problem:** The first half and second half of the course used noticeably different conventions for hook style, estimated time formatting, prerequisites headings, separators, and notes.

**Resolution:** Standardized the chapter rhythm around the template pattern: header image, H1, blockquote hook, learning objectives, bold estimated time, visual checklist, prerequisites, analogy, core concepts, hands-on examples, notes, troubleshooting, takeaways, assignment, navigation, and sources.

## ✅ Issue 3: Chapters 05-09 used top-level headings for repeated sub-sections

**Severity:** High

**Files:** `05-settings-and-instructions/README.md` through `09-putting-it-all-together/README.md`

**Problem:** Repeated sections such as `Expected output`, `Expected result`, `How it works`, `Pause point`, `Try the comparison`, and `Why this matters` were marked as `##` headings, which made them appear as peers of the hands-on examples.

**Resolution:** Demoted those repeated supporting sections to `###` headings so they nest under the relevant hands-on example or capstone part.

## ✅ Issue 4: Chapter 03 cited the internal planning document

**Severity:** High

**File:** `03-development-workflows/README.md`

**Problem:** A learner-facing source reference linked to `.plans/course-plan.md`, which exposed internal planning notes and made the published course look unfinished.

**Resolution:** Removed the internal planning citation and left the public GitHub Copilot App, sessions, canvas, changelog, and product-blog references.

## ✅ Issue 5: Root README promised chapter imagery that chapters did not yet provide

**Severity:** Medium

**File:** `README.md`

**Problem:** The README said each chapter includes course imagery or screenshot guidance, but the chapters did not include the planned capture placeholders or image references beyond header art.

**Resolution:** Added generated visual images and planned screenshot placeholders to every chapter, so the README promise now matches the course structure.

## ✅ Issue 6: Chapters 02 and 03 used the same seeded issue too closely

**Severity:** Medium

**Files:** `02-sessions-worktrees-context/README.md`, `03-development-workflows/README.md`

**Problem:** Chapter 02 planned around the unread-count bug and Chapter 03 implemented the unread-count bug, which narrowed learner exposure to the seeded scenarios.

**Resolution:** Updated Chapter 02 to use Issue 3, the empty-state copy task, for session planning and context practice. Chapter 03 now owns the Issue 2 unread-count debugging workflow.

## ✅ Issue 7: Empty `src/test` directory could confuse sample app exploration

**Severity:** Low

**File path:** `samples/book-app-web/src/test/`

**Problem:** The sample app tests live in `src/tests`, while an empty `src/test` directory also existed.

**Resolution:** Removed the empty directory.

## ✅ Issue 8: Common beginner mistakes were not called out explicitly

**Severity:** Low

**Files:** `00-quick-start/README.md` through `09-putting-it-all-together/README.md`

**Problem:** The chapters had troubleshooting sections, but they did not consistently include beginner mistake callouts that reinforce safe habits before problems occur.

**Resolution:** Added `Common beginner mistakes` sections to all chapters.

## ✅ Issue 9: Chapter 07 asks learners to use a canvas that is only documented as a concept

**Severity:** High

**Files:** `07-canvases/README.md`, `.github/extensions/release-checklist/README.md`

**Problem:** Chapter 07 correctly starts by calling the release checklist a prepared canvas concept, but the next workflow asks learners to "use the canvas" and update checklist state. The repository currently contains a concept README, not a working canvas extension, so beginners may think something is broken or missing.

**Suggested resolution:** Either reword Chapter 07 so the release checklist is consistently framed as a concept/simulation exercise, or add a minimal working release checklist canvas extension that learners can actually open and update.

**Resolution:** Reworded Chapter 07 so the release checklist is consistently framed as a concept or simulation unless the learner's app build supports a visible project-scoped canvas. The prompts now include a markdown fallback.

## ✅ Issue 10: GitHub issue and PR workflows need a clearer setup path for self-paced learners

**Severity:** High

**Files:** `04-github-workflows/README.md`, `09-putting-it-all-together/README.md`, `samples/app-course-issues.md`, `samples/app-course-pr-scenarios.md`

**Problem:** Chapters 04 and 09 rely on seeded issues, pull requests, review comments, failing checks, and merge-readiness scenarios. The repository provides strong Markdown drafts for those scenarios, but self-paced learners are not given a clear setup path for turning those drafts into real GitHub issues, branches, PRs, comments, and CI states.

**Suggested resolution:** Add a short setup section or appendix for creating the training issues and PR scenarios, then link to it before Chapter 04 and Chapter 09.

**Resolution:** Added `appendices/training-github-scenarios.md`, linked it from the appendices index, and linked it from Chapters 04 and 09 before the GitHub issue and PR workflows.

## ✅ Issue 11: Capstone workflow image says "Merge" instead of "Merge ready"

**Severity:** Medium

**File:** `09-putting-it-all-together/assets/end-to-end-workflow.png`

**Problem:** Chapter 09 consistently teaches merge readiness, human review, and pause points before merge automation. The final step in the capstone workflow image says "Merge," which is a little stronger than the safer lesson language.

**Suggested resolution:** Regenerate or edit the image so the final step says "Merge ready" or "Merge readiness."

**Resolution:** Regenerated `09-putting-it-all-together/assets/end-to-end-workflow.png` so the final workflow step says "Merge Ready."

## ✅ Issue 12: MCP acronym is not expanded on first beginner-facing use

**Severity:** Low

**Files:** `README.md`, `06-skills-mcp-plugins/README.md`

**Problem:** The course introduces "MCP servers" before spelling out Model Context Protocol. Chapter 06 explains the concept later, but beginners should see the expanded term the first time the acronym appears.

**Suggested resolution:** Use "Model Context Protocol (MCP) servers" on first use in the root README and Chapter 06.

**Resolution:** Expanded Model Context Protocol (MCP) on first beginner-facing use in the root README, Chapter 01, Chapter 05, Chapter 06, Chapter 09, the glossary, and related appendices.

## Open questions

None.
