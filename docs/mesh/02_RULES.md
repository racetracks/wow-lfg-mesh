# wow-lfg-mesh: project rules (only what this addon adds to the baseline)

Purpose: the rules this addon adds to `docs/baseline/02_RULES.md`, and its Overrides · owner the mesh pack (`docs/mesh/`) · status live · related `CLAUDE.md`, `docs/baseline/02_RULES.md`, `docs/mesh/15_ROUTES.md`

Read in full, with the baseline's `02_RULES.md`, before the first change to this repo. The baseline's rules are mandatory; a rule here adds to them, and differs from one only through section 12.

## 1. Code and style
- Baseline section A as written. The addon folder, namespace and file prefix are not set yet (proposed `LFGMesh`, prefix `LFGM_`, the author's OK pending); the agent pack's code globs use `LFGMesh*` (`.claude/scripts/check_context.py`). Every other name (documents, folders, files, keys, zips, saves, branches) follows scratch `documents/reference-framework/12_User_Guides/12_02_Documentation_Rules.md` section 5 (`DEC-00047`).

## 8. Versions
- Baseline section F as written: `X.Y.Z.B`, the build number never resets, every build a pre-release, full releases only when the author says so.

## 9. Hosting on scratch
- Test zips, handovers, docs, real saves, summaries and handoffs live on `racetracks/wow-lfg-mesh_scratch`, as its `CLAUDE.md` describes; never in this repo (baseline 02 D10).
- Every scratch delivery is pushed straight to scratch `main`; no PR or branch there.

## 12. Overrides of the baseline
The only places this addon differs, each with the author's OK. Add a row (with the OK) before shipping anything else that differs; a difference not listed is a bug. A breach waiting for a fix is listed with the line that fixes it.

### Approved overrides
None.

### Known breaches, with their fix
None.

## Changelog
| Date | Reference | Change | Reason | Context |
| --- | --- | --- | --- | --- |
| 2026-11-23 | this file | created | the author: apply the PSS rules, baseline, budgets and handoff to wow-lfg-mesh | session intelligent-darwin-5smmqv, prompt 01; before: new |
| 2026-11-23 | section 1 | naming points to `DEC-00047` | the author: port naming conventions | session intelligent-darwin-5smmqv, prompt 02; before: 5df10ad |
