#!/bin/bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TARGET="$HOME"
PACKAGES=(nvim mise yazi starship)

# Check Neovim installed
if ! command -v nvim &>/dev/null; then
    echo "[ERROR] Neovim is not installed. Please install first."
    exit 1
fi

# Check GNU Stow installed
if ! command -v stow &>/dev/null; then
    echo "[ERROR] GNU Stow is not installed. Please install first (e.g. brew install stow)."
    exit 1
fi

# Detect conflicts via dry-run and back up anything in the way, since stow
# refuses to overwrite existing real files or symlinks it doesn't own.
CONFLICTS="$(stow -n -v -d "$SCRIPT_DIR" -t "$TARGET" "${PACKAGES[@]}" 2>&1 || true)"
while IFS= read -r rel; do
    [ -z "$rel" ] && continue
    dest="$TARGET/$rel"
    if [ -e "$dest" ] || [ -L "$dest" ]; then
        echo "⚠️  Existing $dest found, backing up..."
        mv "$dest" "${dest}.bak.$(date +%s)"
    fi
done < <(printf '%s\n' "$CONFLICTS" | grep -oE "existing target is not owned by stow: .+|over existing target [^ ]+ since" | sed -E 's/existing target is not owned by stow: //; s/over existing target //; s/ since//')

echo "🔗 Stowing: ${PACKAGES[*]}"
stow -v -d "$SCRIPT_DIR" -t "$TARGET" "${PACKAGES[@]}"

echo "✅ Successfully Completed!"
