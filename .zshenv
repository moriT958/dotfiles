export XDG_CONFIG_HOME="$HOME/.config"

# Environment Variables
export EDITOR=nvim


# Bin path setting
export PATH="$HOME/.local/bin:$PATH"


# Go path setting
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:$HOME/go/bin


# libpq path setting
export PATH="/opt/homebrew/opt/libpq/bin:$PATH"


# mysql-client path setting
export PATH="/opt/homebrew/opt/mysql-client/bin:$PATH"


# for Ruby mysql2 gem
export LIBRARY_PATH=$LIBRARY_PATH:$(brew --prefix openssl)/lib
export LIBRARY_PATH=$LIBRARY_PATH:$(brew --prefix zstd)/lib

# pnpm
export PNPM_HOME="/Users/morita/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME/bin:"*) ;;
  *) export PATH="$PNPM_HOME/bin:$PATH" ;;
esac
