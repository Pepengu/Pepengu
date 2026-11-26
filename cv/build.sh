#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "$0")"
mkdir -p out

if (($# > 0)); then
  profiles=("$@")
else
  profiles=()
  for file in profiles/*.typ; do
    profiles+=("$(basename "$file" .typ)")
  done
fi

for profile in "${profiles[@]}"; do
  echo "Building $profile..."
  typst compile --root . "profiles/$profile.typ" "out/$profile.pdf"
done

if [[ " ${profiles[*]} " == *" general "* ]]; then
  cp out/general.pdf main.pdf
  echo "Updated main.pdf (general profile)."
fi
