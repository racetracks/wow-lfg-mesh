# 17_BUILD_PREFERENCES: the author's build, test and release preferences

Purpose: read in full before any build, test run, PR or release · owner the mesh pack · status live · related `docs/mesh/11_PREFERENCES.md`, `docs/mesh/15_ROUTES.md#route-table`

Carried over from PSS `docs/pss/17_BUILD_PREFERENCES.md` (the author, 2026-11-23), without what is true of PSS only.

## Context in every PR
Before a step's PR is final, update everything a fresh session needs: the current plan's stage table (state, PR, next build), `06_STATUS_AND_NEXT.md`, `02_RULES.md` for a new rule, `11_PREFERENCES.md` for a new preference, and the scratch copies (`docs/latest/<project>/`). A fresh session must be able to start from `CLAUDE.md` alone.

## Testing
- **Simulate the WoW client while coding.** Every change is exercised in the harness's simulated client (baseline `06_HARNESS.md`) as it is written: drive the changed path and read what it did; changed behaviour gets a check that fails on the old code; the PR says what was simulated and what goes to the numbered in-game checks.
- **Claude runs every test before handover:** the rules check, the full harness on the real saves from scratch `SavedVariables/`, and the look-compare for any window that changes; the PR states what was run and the counts. CI is a backstop. A check that prints a NOTE and skips is not a pass.
- Give exact numbered in-game checks for every build, naming each client where it matters. Expect a code review pass before merging.

## Releases
- The author tests every build in game and does every merge. "Branch, PR and release" is approval to merge and verify the release.
- A full release happens only when the author says the feature is done; before it goes live, the author tests a very old save on the final pre-release.
- The author uploads WTF saves and names the version; file them on scratch under `SavedVariables/<version>/`.
- Every build, a release included, takes the next build number.
- Release notes are one player-facing summary of every change since the previous release; every full release has its record on scratch (`docs/latest/release-notes/<version>.md`).
