# Status and next step (build 1.0.0.1)

Purpose: current status and next step of wow-lfg-mesh · owner coordinator · status current, updated every PR · related `docs/mesh/02_RULES.md`, `docs/mesh/15_ROUTES.md`

LFGMesh: a looking-for-group mesh tool that finds LFG listings on different LFG shards (`DEC-00054`).

## Now
- **Documentation framework (2026-11-23, session intelligent-darwin-5smmqv prompt 02):** scratch `documents/reference-framework/`: the rules home (`DEC-00001` to `DEC-00047`), a fresh registry (`DEC-00048`), `refkey.py`, `link_keys.py` and the structure scripts, the `documents/` tree.
- **Operating setup (2026-11-23):** `CLAUDE.md`, the agent pack (`.claude/`), the WoW addon baseline (`docs/baseline/`) and this pack, carried over from PSS.
- **1.0.0.1, first build (PR #1, branch `claude/intelligent-darwin-5smmqv`):** the build and release pipeline (`docs/mesh/05_RELEASE.md`) and an empty `LFGMesh/` that loads; merging publishes it as a pre-release.
- **Next:** finish stage 1 of baseline `08_PROJECT_LIFECYCLE.md`: the harness (`docs/baseline/06_HARNESS.md`, `docs/baseline/examples/`) and `docs/mesh/01_HANDOVER.md`; the scratch documentation folder `documents/addons/LFGMesh/` (`CMP-00002`) exists; port the code map with the first code (`DEC-00055`).

## Waiting on the author
- PR #1: merge (publishes 1.0.0.1 as a pre-release); in-game check: the addon is listed and loads with no error, on each client.
- The TOC Title and Notes (placeholders in `LFGMesh/LFGMesh.toc` until the author words them) and the clients to support (TOCs today: Retail 120007 and Camelot 16001, from the baseline templates).

## Known breaches
None (02 section 12).

## Open issues
On GitHub: https://github.com/racetracks/wow-lfg-mesh/issues
