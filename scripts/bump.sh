#!/usr/bin/env bash
# Points the cask and the formula at a VodLabs Recorder release.
# Each asset is downloaded, its build attestation verified, and its sha256
# written in place.
#
#   scripts/bump.sh            the latest release
#   scripts/bump.sh 0.0.30     a given release
set -euo pipefail

REPO=vodlabs-io/recorder
root="$(cd "$(dirname "$0")/.." && pwd)"
version="${1:-$(gh release view -R "$REPO" --json tagName -q .tagName)}"
version="${version#v}"

dir="$(mktemp -d)"
trap 'rm -rf "$dir"' EXIT

sha() {
  local asset=$1
  gh release download "v$version" -R "$REPO" -p "$asset" -D "$dir" --clobber
  gh attestation verify "$dir/$asset" --repo "$REPO" >/dev/null
  shasum -a 256 "$dir/$asset" | cut -d' ' -f1
}

# Replaces the sha256 on the line after each url naming an asset.
pin() {
  local file=$1 tmp
  tmp="$(mktemp)"
  awk -v v="$version" -v list="$2" '
    BEGIN { n = split(list, kv, " "); for (i = 1; i <= n; i++) { split(kv[i], p, "="); h[p[1]] = p[2] } }
    /^ *version "/ { sub(/"[^"]*"/, "\"" v "\"") }
    /url "/ { want = ""; for (a in h) if (index($0, a)) want = h[a] }
    /sha256 "/ && want != "" { sub(/"[0-9a-f]+"/, "\"" want "\""); want = "" }
    { print }
  ' "$file" >"$tmp"
  cat "$tmp" >"$file" && rm -f "$tmp"
}

cask="$root/Casks/vodlabs-recorder.rb"
arm=$(sha VodLabs-Recorder-macOS-arm64.dmg)
intel=$(sha VodLabs-Recorder-macOS-x64.dmg)
sed -i.bak -E \
  -e "s/^( *version )\"[^\"]*\"/\1\"$version\"/" \
  -e "s/(arm: +)\"[0-9a-f]{64}\"/\1\"$arm\"/" \
  -e "s/(intel: )\"[0-9a-f]{64}\"/\1\"$intel\"/" "$cask"
rm -f "$cask.bak"

list=""
for a in cli_darwin_arm64 cli_darwin_amd64 cli_linux_arm64 cli_linux_amd64; do
  list="$list $a.tar.gz=$(sha "$a.tar.gz")"
done
pin "$root/Formula/vod.rb" "${list# }"

echo "pinned $version"
