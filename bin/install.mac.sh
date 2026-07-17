#!/bin/bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

# Check Neovim installed
if ! command -v nvim &>/dev/null; then
    echo "[ERROR] Neovim is not installed. Please install first."
    exit 1
fi

backup_if_real() {
    # $1: path to check. Backs it up if it exists and isn't already our symlink.
    if [ -e "$1" ] && [ ! -L "$1" ]; then
        echo "⚠️  Existing $1 found, backing up..."
        mv "$1" "${1}.bak.$(date +%s)"
    fi
}

echo "🔗 Linking ~/.config -> $SCRIPT_DIR/xdg_config"
backup_if_real "$HOME/.config"
ln -sfnv "$SCRIPT_DIR/xdg_config" "$HOME/.config"

echo "🔗 Linking home dotfiles"
for file in "$SCRIPT_DIR"/home/.??*; do
    name="$(basename "$file")"
    backup_if_real "$HOME/$name"
    ln -sfnv "$file" "$HOME/$name"
done

# ~/.claude holds Claude Code's own state (sessions, memory, credentials),
# so only the tracked skills subtree is linked, not the whole directory.
echo "🔗 Linking ~/.claude/skills/implement"
mkdir -p "$HOME/.claude/skills"
backup_if_real "$HOME/.claude/skills/implement"
ln -sfnv "$SCRIPT_DIR/home/.claude/skills/implement" "$HOME/.claude/skills/implement"

echo "✅ Successfully Completed!"
