# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Lines configured by zsh-newuser-install
HISTFILE=~/.config/zsh/.histfile
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

unalias run-help 2>/dev/null
autoload -Uz run-help
alias help='run-help '
autoload -Uz run-help-git run-help-openssl run-help-sudo

LANG=en_US.UTF-8
export EDITOR='nvim'

alias zshconfig="nvim ~/.zshrc"
alias config='git --git-dir=$HOME/.config/dotfiles.git --work-tree=$HOME'
alias l="exa -l --icons --group-directories-first"
alias la="exa -a --icons --group-directories-first"
alias ls="exa --icons --group-directories-first"
alias lsla="exa -la --icons --group-directories-first"
alias tree="exa --icons --group-directories-first -la -T -L"
alias cat="bat --paging=never"
alias icat="kitty +kitten icat"

function copypath {
    DIR_PATH=$(pwd)/$1
    if [ -d "$DIR_PATH" ]; then
        echo -n $DIR_PATH | xclip -sel clipboard;
    else
        echo "copypath: $DIR_PATH does not exist";
        return 1;
    fi
    # echo -n $(pwd)/$1 | xclip -sel clipboard
}

function mkdircd {
    mkdir -p $1 && cd $1
}

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
if [ "$TERM" = "linux" ]; then
  [[ ! -f ~/.p10k-tty.zsh ]] || source ~/.p10k-tty.zsh
else
  [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
fi

eval "$(zoxide init zsh)"

source ~/.config/zsh/powerlevel10k/powerlevel10k.zsh-theme
source ~/.config/zsh/zellij-completion.zsh
source ~/.config/zsh/catppuccin-tty.zsh
source ~/.config/zsh/zsh-syntax-highlighting/catppuccin_mocha-zsh-syntax-highlighting.zsh
source ~/.config/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
