#!/bin/bash
set -e

if [ "$(uname)" != "Darwin" ]; then
    echo "[ERROR] Not macOS."
    exit 1
fi

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

# これらのファイルは symlink したくないため
IGNORE=(.git .gitignore .DS_Store .editorconfig)

skip_if_real() {
    # $1: path to check. Warns and returns success (0) if it exists and isn't already our symlink.
    if [ -e "$1" ] && [ ! -L "$1" ]; then
        echo "⚠️  [WARN] $1 already exists, skipping" >&2
        return 0
    fi
    return 1
}

echo "🍺 Installing Homebrew"
if ! command -v brew &>/dev/null; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi
eval "$(/opt/homebrew/bin/brew shellenv)"

echo "🍺 Installing Homebrew packages"
brew bundle --file="$SCRIPT_DIR/Brewfile"

echo "🔗 Linking home dotfiles"
for file in "$SCRIPT_DIR"/.??*; do
    name="$(basename "$file")"
    skip=false
    for ign in "${IGNORE[@]}"; do
        [ "$ign" = "$name" ] && skip=true && break
    done
    $skip && continue
    skip_if_real "$HOME/$name" && continue
    ln -sfnv "$file" "$HOME/$name"
done

echo "⚙️  Installing mise runtimes"
mise trust "$SCRIPT_DIR"
mise install

echo "✅ Successfully Completed!"
