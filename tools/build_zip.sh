#!/bin/sh
# Builds the LFGMesh zip from a committed git ref: the addon folders only, so the
# release zip (.github/workflows/release.yml) and the test zip (tools/host_build.sh)
# are the same and hold nothing else from the repo.
#   sh tools/build_zip.sh <out.zip> [<ref>]   (from the repo root; ref default HEAD)
# What goes in: every top-level folder LFGMesh/ or LFGMesh_<Name>/ as committed at
# <ref>, read with git archive (untracked or ignored files are never seen), and
# readme.txt and history.txt from the repo root, copied into LFGMesh/.
# What never goes in: anything else (docs/, tools/, .claude/, .github/, CLAUDE.md,
# TASK*.md, versions.json, dotfiles). Every entry is then checked against the
# allowlist below and the zip is refused (exit 1, no file left) when one fails.
ADDON=LFGMesh
EXTS='lua|toc|xml|txt|tga|blp|png|jpg|ttf|otf|ogg|mp3|m2'
out=$1
ref=${2:-HEAD}
if [ -z "$out" ]; then echo "usage: sh tools/build_zip.sh <out.zip> [<ref>]"; exit 1; fi
case "$out" in /*) ;; *) out=$(pwd)/$out ;; esac
dirs=$(git ls-tree -d --name-only "$ref" | grep -E "^$ADDON(_[A-Za-z0-9]+)?$")
if ! echo "$dirs" | grep -qx "$ADDON"; then echo "build_zip: no $ADDON/ folder at $ref"; exit 1; fi
work=$(mktemp -d)
trap 'rm -rf "$work"' EXIT
git archive "$ref" $dirs readme.txt history.txt | tar -x -C "$work" || exit 1
mv "$work/readme.txt" "$work/history.txt" "$work/$ADDON/" || exit 1
bad=$(cd "$work" && find . -type f | sed 's#^\./##' | grep -vE "^$ADDON(_[A-Za-z0-9]+)?/([^./][^/]*/)*[^./][^/]*\.($EXTS)$")
if [ -n "$bad" ]; then
	echo "build_zip: refused, these are not addon files:"
	echo "$bad"
	exit 1
fi
rm -f "$out"
(cd "$work" && zip -qrX "$out" $dirs) || exit 1
listed=$(unzip -Z1 "$out" | grep -v '/$' | grep -vE "^$ADDON(_[A-Za-z0-9]+)?/")
if [ -n "$listed" ]; then
	rm -f "$out"
	echo "build_zip: refused, entries outside the addon folders: $listed"
	exit 1
fi
echo "build_zip: $(unzip -Z1 "$out" | grep -vc '/$') files in $(echo $dirs | wc -w) folder(s): $out"
