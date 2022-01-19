#  ______ _____ _   _                    __ _       
# |___  //  ___| | | |                  / _(_)      
#    / / \ `--.| |_| |   ___ ___  _ __ | |_ _  __ _ 
#   / /   `--. \  _  |  / __/ _ \| '_ \|  _| |/ _` |
# ./ /___/\__/ / | | | | (_| (_) | | | | | | | (_| |
# \_____/\____/\_| |_/  \___\___/|_| |_|_| |_|\__, |
#                                              __/ |
#                                             |___/ 

# Personal zsh config file

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
    source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


autoload -Uz compinit
compinit

# Load the Antibody plugin manager for zsh.
source ~/.zsh_plugins.sh

# Configuration

HYPHEN_INSENSITIVE="true"
ENABLE_CORRECTION="false"
COMPLETION_WAITING_DOTS="true"
HIST_STAMPS="yyyy-mm-dd"

typeset -U path cdpath fpath

# Vim mode
bindkey -v
export KEYTIMEOUT=1

#export ANDROID_HOME="$HOME/Android/Sdk/"

export GIT_EDITOR=nvim

path=(
#     $HOME/.local/bin
#     $HOME/.bin
     $HOME/bin
#     $HOME/.composer/vendor/bin
#     $HOME/.go/bin
#     ./vendor/bin
#     ${ANDROID_HOME}tools/
#     ${ANDROID_HOME}platform-tools/
$HOME/.emacs.d/bin 
$path
)

setopt auto_cd
cdpath=(
    $HOME/Batcave
)

zstyle ':completion:*' group-name ''
zstyle ':completion:*:descriptions' format %d
zstyle ':completion:*:descriptions' format %B%d%b
zstyle ':completion:*:complete:(cd|pushd):*' tag-order \
            'local-directories named-directories'

export EDITOR='nvim'
#export NVIM_LISTEN_ADDRESS='/tmp/nvimsocket'

# FZF
export FZF_DEFAULT_COMMAND="rg --files --hidden --glob '!.git'"
export FZF_DEAFULT_OPTS="--height=40% --layout=reverse --border --margin=1 --padding=1"

#unsetopt sharehistory

# Bundle zsh plugins via antibody
alias update-antibody='antibody bundle < $HOME/.zsh_plugins.txt > $HOME/.zsh_plugins.sh'

# Homebrew alias for daily managment
alias brewup='brew update; brew upgrade; brew cleanup; brew doctor'

# Open nvim config everywhere
alias nvimrc='nvim ${HOME}/.config/nvim/init.vim'

# Git
alias g="git"
alias gs="git s"
alias nah="git reset --hard;git clean -df"
alias co="git checkout"

# DDEV
alias ddc="ddev describe"
alias dds="ddev start"
alias ddp='ddev pause'

# General
alias vim="nvim"
alias ls="lsd"
alias l="ls -l"
alias la="ls -la"
alias lt="ls --tree"
alias cat="bat"

# cd to directory then ls -l
cdd() { builtin cd "$@" && l; }

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Fix error: Console output during zsh initialization detected.
typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet

# Source fuzzy finder
#[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export BAT_THEME="gruvbox-dark"

# vim: set nospell foldmethod=marker foldlevel=0:
export PATH="/opt/homebrew/opt/node@16/bin:$PATH"
