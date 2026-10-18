#!/usr/bin/env bash
# Zips each skill with its folder at the zip root, ready to upload.
set -euo pipefail

cd "$(dirname "$0")/.."
rm -rf dist
mkdir -p dist

for dir in skills/*/; do
  name="$(basename "$dir")"
  (cd skills && zip -rq "../dist/${name}.zip" "$name")
  echo "built dist/${name}.zip"
done
