# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt beep nomatch
unsetopt autocd extendedglob
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/radial/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

LANG=en_US.UTF-8
if [ "$TERM" = "linux" ]; then
    export EDITOR='vim'
else
    export EDITOR='nvim'
fi

alias zshconfig="nvim ~/.zshrc"
alias l="exa -l"
alias ls="exa --icons"
alias lsa="exa -a --icons"
alias lsla="exa -la --icons"
alias cat="bat --paging=never"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
if [ "$TERM" = "linux" ]; then
  [[ ! -f ~/.p10k-tty.zsh ]] || source ~/.p10k-tty.zsh
else
  [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
fi

source ~/powerlevel10k/powerlevel10k.zsh-theme
source ~/.config/zsh/catppuccin-tty.zsh
