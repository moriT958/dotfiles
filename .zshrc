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

# My Alias Collection
alias ghcd='cd $(ghq root)/$(ghq list | peco)'
alias serve='caddy file-server --listen :8080'
alias lg='lazygit'
alias ld='lazydocker'
alias cld='claude'
alias note='notebox'
alias glp='git log --graph'
alias y='yazi'


# mise path setting
eval "$(/opt/homebrew/bin/mise activate zsh)"


# Git auto completion
autoload -Uz compinit && compinit


# starship
eval "$(starship init zsh)"
