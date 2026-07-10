# Zsh prompt setting
autoload -Uz vcs_info
precmd() { vcs_info }
setopt prompt_subst

zstyle ':vcs_info:git:*' formats '(%b)'
zstyle ':vcs_info:*' enable git

# Dark
PROMPT=' %F{#ef9f76}%. ❯ %f'
RPROMPT='%F{#e5c890}${vcs_info_msg_0_}%f'
# Light
# PROMPT=' %F{#fe640b}%. ❯ %f'
# RPROMPT='%F{#df8e1d}${vcs_info_msg_0_}%f'

# Environment Variables
export EDITOR=nvim


# My Alias Collection
alias ghcd='cd $(ghq root)/$(ghq list | peco)'
alias serve='caddy file-server --listen :8080'
alias lg='lazygit'
alias ld='lazydocker'
alias cld='claude'
alias note='notebox'
alias glp='git log --graph'
alias y='yazi'


# Bin path setting
export PATH="$HOME/.local/bin:$PATH"


# mise path setting
eval "$(/opt/homebrew/bin/mise activate zsh)"


# Go path setting
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:$HOME/go/bin


# libpq path setting
export PATH="/opt/homebrew/opt/libpq/bin:$PATH"


# mysql-client path setting
export PATH="/opt/homebrew/opt/mysql-client/bin:$PATH"


# Git auto completion
autoload -Uz compinit && compinit


# for Spearly Auth mysql2 gem
export LIBRARY_PATH=$LIBRARY_PATH:$(brew --prefix openssl)/lib
export LIBRARY_PATH=$LIBRARY_PATH:$(brew --prefix zstd)/lib

# pnpm
export PNPM_HOME="/Users/morita/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME/bin:"*) ;;
  *) export PATH="$PNPM_HOME/bin:$PATH" ;;
esac
# pnpm end

# starship
eval "$(starship init zsh)"
