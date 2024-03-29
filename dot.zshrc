#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#
 export PATH=$HOME/.nodebrew/current/bin:$PATH
 export TERM="xterm-256color"

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...
ZSH_THEME="agnoster"

autoload -Uz promptinit
promptinit
prompt  powerlevel9k

POWERLEVEL9K_RPROMPT_ON_NEWLINE=true
POWERLEVEL9K_MODE='nerdfont-complete'

#POWERLEVEL9K_LEFT_SEGMENT_SEPARATOR=$''
#POWERLEVEL9K_RIGHT_SEGMENT_SEPARATOR=$''

# Set name of the theme to load.
ZSH_THEME="powerlevel9k/powerlevel9k"

# VCS icons
# POWERLEVEL9K_VCS_GIT_ICON=$'\uf113 '
# POWERLEVEL9K_VCS_GIT_GITHUB_ICON=$'\uf113 '
# POWERLEVEL9K_VCS_GIT_GITLAB_ICON=$'\uf296 '
POWERLEVEL9K_VCS_BRANCH_ICON=$''
POWERLEVEL9K_VCS_STAGED_ICON=$'\uf055'
POWERLEVEL9K_VCS_UNSTAGED_ICON=$'\uf421'
POWERLEVEL9K_VCS_UNTRACKED_ICON=$'\uf00d'
POWERLEVEL9K_VCS_INCOMING_CHANGES_ICON=$'\uf0ab '
POWERLEVEL9K_VCS_OUTGOING_CHANGES_ICON=$'\uf0aa '

# Autosuggest color
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=5"

# VCS colours
POWERLEVEL9K_VCS_MODIFIED_BACKGROUND='blue'
POWERLEVEL9K_VCS_MODIFIED_FOREGROUND='black'
POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND='green'
POWERLEVEL9K_VCS_UNTRACKED_FOREGROUND='black'
POWERLEVEL9K_VCS_CLEAN_BACKGROUND='green'
POWERLEVEL9K_VCS_CLEAN_FOREGROUND='black'

# Status
# POWERLEVEL9K_OK_ICON=$'\uf164'
# POWERLEVEL9K_FAIL_ICON=$'\uf165'
# POWERLEVEL9K_CARRIAGE_RETURN_ICON=$'\uf165'

# User with ninja
user_with_skull() {
 echo -n "\ufc72 $(whoami)"
}
# POWERLEVEL9K_CUSTOM_USER="user_with_skull"

# Prompt elements
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir virtualenv)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(background_jobs)

# peco
function peco-history-selection() {
        BUFFER=`history -n 1 | tail -r  | awk '!a[$0]++' | peco`
        CURSOR=$#BUFFER
    zle reset-prompt
}

zle -N peco-history-selection
bindkey '^R' peco-history-selection

# alias
alias cdd='cd ~/Desktop'
alias clera='clear'

alias code='open -a "Visual Studio Code"'
alias storm='open -a "PhpStorm"'
alias charm='open -a "PyCharm CE"'
alias memo='open -a textedit'
#alias askd='ask dialog -l ja-JP'
#alias askl='ask deploy -t lambda'
alias gs='git status'
alias gd='git diff'
alias gl='git log'
alias gb='git branch'

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export FZF_DEFAULT_OPTS="--height 70% --ansi --preview-window 'right:60%' --preview 'bat --color=always --style=header,grid --line-range :300 {}'"
# export FZF_DEFAULT_COMMAND='rg --files'
# export FZF_CTRL_T_COMMAND='$FZF_DEFAULT_COMMAND'

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# custom functions
ide() {
    tmux split-window -v -p 20
    tmux split-window -h -p 30
    vim
}

# コマンド履歴を出して検索・絞り込み
setopt hist_ignore_all_dups

function peco_select_history() {
  local tac
  if which tac > /dev/null; then
    tac="tac"
  else
    tac="tail -r"
  fi
  BUFFER=$(fc -l -n 1 | eval $tac | peco --query "$LBUFFER")
  CURSOR=$#BUFFER
  zle clear-screen
}
zle -N peco_select_history
bindkey '^r' peco_select_history

# ghqレポジトリへの移動
function peco-src () {
  local selected_dir=$(ghq list -p | peco --query "$LBUFFER")
  if [ -n "$selected_dir" ]; then
    BUFFER="cd ${selected_dir}"
    zle accept-line
  fi
  zle clear-screen
}
zle -N peco-src
bindkey '^]' peco-src

# ローカル参照
#source ~/zsh_local

# goenv
#export GOENV_ROOT="$HOME/.goenv"
#export PATH="$GOENV_ROOT/bin:$PATH"
#eval "$(goenv init -)"
#export PATH="$GOROOT/bin:$PATH"
#export PATH="$PATH:$GOPATH/bin"
#export GOBIN="$GOPATH/bin"
