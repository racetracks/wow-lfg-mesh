# 05_RELEASE: how LFGMesh is built and released

Purpose: what LFGMesh's pipeline does, and where it differs from baseline `09_RELEASE_PIPELINE.md` · owner the mesh pack · status live · related `docs/baseline/09_RELEASE_PIPELINE.md`, `docs/mesh/17_BUILD_PREFERENCES.md`

## Contents
- [Pipeline](#pipeline)
- [The zip](#the-zip)
- [Differences from the baseline](#differences-from-the-baseline)
- [Changelog](#changelog)

## Pipeline
| Step | Command or job | Code |
| --- | --- | --- |
| next build (a pre-release) | `sh tools/bump_version.sh build "Title"`, then the history bullets | `tools/bump_version.sh:1` |
| a full release (only when the author says) | `sh tools/bump_version.sh release "Title"`, then one summary since the last release (`python3 tools/versions.py prs <version>`) | `tools/versions.py:1` |
| record the PR | `sh tools/bump_version.sh pr <number>` | `tools/versions.py:1` |
| rules check (PRs, main, before every push) | `sh tools/check_rules.sh` | `tools/check_rules.sh:1`, `.github/workflows/rules.yml:1` |
| test zip on scratch | `sh tools/host_build.sh <scratch checkout> [--no-commit]` | `tools/host_build.sh:1` |
| publish (on push to main) | job `rules`, then job `release`: tag `v<version>`, `LFGMesh-<version>.zip`, pre-release or latest from `versions.json` | `.github/workflows/release.yml:1` |

## The zip
One builder for the release zip and the test zip: `tools/build_zip.sh:1`. It reads only the committed `LFGMesh/` and `LFGMesh_<Name>/` folders (`git archive`, so untracked files never go in) plus `readme.txt` and `history.txt` (copied into `LFGMesh/`), then refuses the zip if any entry is outside those folders, is a dotfile, or is not a file type the client loads (`lua toc xml txt tga blp png jpg ttf otf ogg mp3 m2`). `docs/`, `tools/`, `.claude/`, `.github/`, `CLAUDE.md`, `TASK*.md` and `versions.json` are never in it. The rules check (rule 8) builds it on every run.

## Differences from the baseline
| Baseline | LFGMesh |
| --- | --- |
| 09 mirror job | none (no mirror repo); add it from the template if one is wanted |
| release workflow builds the zip inline | the shared `tools/build_zip.sh` with its allowlist; the release waits for the rules check |

## Changelog
| Date | Reference | Change | Reason | Context |
| --- | --- | --- | --- | --- |
| 2026-11-23 | this file | created | the author: port the build logic; zips hold nothing else from the repo | session intelligent-darwin-5smmqv, prompt 04; before: new |
