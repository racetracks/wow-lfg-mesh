# The author's preferences and approach (the one file)

Purpose: how the author works and what the author wants from Claude, loaded by `CLAUDE.md` in every session · owner the mesh pack · status live · related `docs/mesh/17_BUILD_PREFERENCES.md`, `docs/baseline/07_WORKING_WITH_THE_AUTHOR.md`

Carried over from PSS `docs/pss/11_PREFERENCES.md` (the author, 2026-11-23), without what is true of PSS only. Add new preferences here, dated. Baseline 07 is the generic version; where they differ, this file wins. **Build, test and release preferences:** `docs/mesh/17_BUILD_PREFERENCES.md`; read it in full before any build, test run, PR or release.

## Sessions and context
- **One step per session.** The author resets the session after each step of every implementation plan. Build only the named step, then stop.
- **Plans and designs are references.** `CLAUDE.md` points to them and never copies them. At each full release, the done stages are re-summarized into `01_HANDOVER.md` and leave the plan.

## Communication
- **Call the user "the author":** never by name, in replies, docs, PRs, commits and issues; never gendered pronouns.
- **Response style:** short, no preamble, no recap of what was just done. Don't explain code changes unless asked. Don't repeat file contents back; reference `file:line`.
- **File hosting:** never host files in the Claude session; use the most relevant scratch folder (`summary/`, `releases/`, `docs/latest/<topic>/`).
- Plain language, answer first, short; the author may read on the go.
- Numbered questions, each with a recommendation; the author answers by number ("1: yes 2: recommended").
- Always give links: scratch `raw` links for zips, `blob` links for docs, `tree` links for folders. Never only a path.
- Use measured numbers, never estimates, for memory, CPU and save size.
- Short asks want the thing: "PR?" means open it and give the link; "where release" wants the link.
- Re-read the newest message before building; the author may refine mid-flight ("wait hold").
- Study screenshots closely before guessing a fix.
- When the author doesn't answer a fork, build on the recommended option and say so.

## How the author works
- **Leftovers and waiting items become GitHub issues:** one issue each, with a context md on scratch (`docs/latest/issues/`) whose text is also the issue body: what, why, the decision with a recommendation, the steps, in-game checks and links.
- The author answers decision cards. An unanswered card means the recommended option, said so in the PR.

## Values
- **Performance and memory first:** zero cost until used, lazy UI, GC only at safe requested moments, nothing grows without a cap.
- **Upgrades are sacred.** Every save change gets the author's OK first, a validated migration on all the author's real saves, and identical counters; saves forward compatible, unknown data kept.
- **Lean on native tools,** and build only what the stated goal needs.
- **Human-readable output:** upgrade lines name features, not internals.
- **Copy logic, never code or media,** from other addons, and respect licences.
- **TOC Title and Notes are the author's;** never change them unless asked.
- **Hover never opens a window.**
- **User systems must be intuitive:** one action does the obvious whole thing.
- **One plain merge flow:** one PR per step, based on main, never stacked.
- **Scratch never gets a PR:** every scratch delivery is pushed straight to scratch `main`.
- **Ask before anything hard to undo:** save layout, deleting data, production releases.
