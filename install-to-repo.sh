#!/usr/bin/env bash
set -euo pipefail

REPO_URL="https://github.com/braydenibex/homelab.git"
WORKDIR="${HOME}/homelab"
SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"

if ! command -v git >/dev/null 2>&1; then
  echo "Git is not installed. Install it with your distribution's package manager and rerun this script."
  exit 1
fi

if [ -e "$WORKDIR" ]; then
  echo "A path already exists at $WORKDIR."
  echo "To avoid overwriting your files, move it or set WORKDIR to another location in this script."
  exit 1
fi

echo "Cloning your existing homelab repository..."
git clone "$REPO_URL" "$WORKDIR"
cd "$WORKDIR"

echo "Copying the prepared documentation..."
cp -a "$SCRIPT_DIR/." "$WORKDIR/"

git add README.md CHANGELOG.md docs diagrams screenshots .gitignore

if git diff --cached --quiet; then
  echo "No changes to commit."
  exit 0
fi

git -c core.editor=true commit -m "Add homelab documentation and architecture"
echo
echo "Pushing the documentation commit to GitHub..."
if git push; then
  echo
  echo "Done! Your homelab documentation is now on GitHub:"
  echo "https://github.com/braydenibex/homelab"
else
  echo
  echo "The files and commit are ready locally, but the push did not complete."
  echo "Configure GitHub authentication, then run:"
  echo "  cd \"$WORKDIR\" && git push"
  echo "You can authenticate with GitHub CLI (gh auth login) or configure an SSH remote."
  exit 1
fi
