#!/bin/sh
# Checks the coding rules that can be checked by a script:
#   1. Lua 5.1 only: every .lua file compiles with luac5.1; no goto, no
#      ::labels::, no Lua 5.2+ library calls (tools/check_style.lua)
#   2. ASCII only in .lua, .toc, .xml and the .txt files shipped in the zip
#   4. Tabs, not spaces: indentation, mid-line alignment and no trailing
#      whitespace (tools/check_style.lua; --fix there repairs these)
#   6. Core logic files hold no UI code (tools/check_layers.lua)
#   7. Versions: every TOC carries the same version, shaped X.Y.Z.B (a build
#      or a release; B never resets), history.txt starts with its section and
#      its bullets are written, and versions.json agrees (tools/versions.py
#      check; in CI every entry has its PR, PR_NUMBER: this pull request's)
#   8. The zip holds the addon folders only: tools/build_zip.sh builds it from
#      HEAD and refuses any entry outside LFGMesh/ and LFGMesh_*/ or of a file
#      type the client does not load
# Usage: sh tools/check_rules.sh   (from the repo root, needs luac5.1/lua5.1)

fail=0
# every addon folder (LFGMesh/, LFGMesh_*/)
files=$(ls LFGMesh*/*.lua tools/*.lua tools/harness/*.lua 2>/dev/null)

for f in $files; do
	luac5.1 -p "$f" || fail=1
done

lua5.1 tools/check_style.lua $files || fail=1

if LC_ALL=C grep -nP '[^\x00-\x7F]' $(ls LFGMesh*/*.toc LFGMesh*/*.xml 2>/dev/null) readme.txt history.txt /dev/null; then
	echo "ASCII only: non-ASCII bytes found above"
	fail=1
fi

if grep -nP '^\t* |[ \t]+$' $(ls LFGMesh*/*.xml 2>/dev/null) /dev/null; then
	echo "Tabs, not spaces: space indentation or trailing whitespace found above"
	fail=1
fi

lua5.1 tools/check_layers.lua || fail=1

ver=$(sed -n 's/^## Version: *//p' LFGMesh/LFGMesh.toc | tr -d '\r')
for toc in LFGMesh*/*.toc; do
	v=$(sed -n 's/^## Version: *//p' "$toc" | tr -d '\r')
	if [ "$v" != "$ver" ]; then
		echo "$toc: version '$v' differs from LFGMesh/LFGMesh.toc '$ver'"
		fail=1
	fi
done
if ! echo "$ver" | grep -qE '^[0-9]+\.[0-9]+\.[0-9]+\.[1-9][0-9]*$'; then
	echo "Version '$ver' must be X.Y.Z.B"
	fail=1
fi
top=$(sed -n 's/^=> \([^ ]*\) .*/\1/p' history.txt | head -n 1)
if [ "$top" != "$ver" ]; then
	echo "history.txt: the top section is '$top', the TOCs say '$ver'"
	fail=1
fi
if awk 'NR > 1 && /^=> / { n++ } n == 1' history.txt | grep -qE '^- (What changed, in plain words\.|Summary of every change since .*written at release time)'; then
	echo "history.txt: the top section still holds the placeholder bullet"
	fail=1
fi
strict=""
[ -n "$CI" ] && strict="--strict"
python3 tools/versions.py check --toc "$ver" $strict ${PR_NUMBER:+--pr "$PR_NUMBER"} || fail=1

zip=$(mktemp -d)/check.zip
sh tools/build_zip.sh "$zip" HEAD >/dev/null || fail=1
rm -rf "$(dirname "$zip")"

[ $fail -eq 0 ] && echo "All rule checks passed"
exit $fail
