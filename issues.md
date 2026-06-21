# Course Review Issues

This file tracks issues found during the rubber-duck review of the root README and Chapters 00-09.

## ✅ Issue 1: Planned visuals and screenshots were missing from learner-facing course files

**Severity:** Blocking

**Files:** `README.md`, `00-quick-start/README.md` through `09-putting-it-all-together/README.md`

**Problem:** The plan called for conceptual visuals and app screenshots throughout the course, but the chapters only included the SVG header images. That made a visual desktop app course feel too text-heavy for beginners.

**Resolution:** Added `Suggested visuals and screenshots` sections to the root README and every chapter, generated PNG assets for the `visual-image` items, replaced those prompt placeholders with image references, and kept the `app-screenshot` placeholders for future app captures.

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

## ✅ Issue 5: Root README promised visuals that chapters did not yet provide

**Severity:** Medium

**File:** `README.md`

**Problem:** The README said each chapter includes a visual course image or screenshot, but the chapters did not include the planned screenshot or image placeholders beyond header art.

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

## Open questions

None.
