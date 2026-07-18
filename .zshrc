# Powerlevel10k instant prompt (must stay close to the top of .zshrc)
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
	source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Powerlevel10k theme
source /opt/homebrew/share/powerlevel10k/powerlevel10k.zsh-theme

# My Alias Collection
alias ghcd='cd $(ghq root)/$(ghq list | peco)'
alias serve='caddy file-server --listen :8080'
alias lg='lazygit'
alias ld='lazydocker'
alias cld='claude'
alias note='notebox'
alias glp='git log --graph'
alias y='yazi'

bindkey -e

# mise path setting
eval "$(/opt/homebrew/bin/mise activate zsh)"


autoload -Uz compinit
compinit

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
