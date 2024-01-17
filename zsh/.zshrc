if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(
    git
    zsh-autosuggestions
    zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

[ -z "$TMUX" ] && exec tmux
alias vim="nvim"
alias pe="cd ~/code/portal-edit"
alias nvim-config="nvim ~/.config/nvim"

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
