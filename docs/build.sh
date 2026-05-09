#!/bin/sh
# Copies markdown files from parent directory into docs/ for GitHub Pages deployment.
# Run from the docs/ directory, or from the repo root via: sh docs/build.sh

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
PARENT_DIR="$(dirname "$SCRIPT_DIR")"

cp "$PARENT_DIR/concept_scope.md" "$SCRIPT_DIR/concept_scope.md"
cp "$PARENT_DIR/study_resources.md" "$SCRIPT_DIR/study_resources.md"

echo "Copied markdown files into docs/"
