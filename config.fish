# initialize
#iunction fish_prompt
#    if [ $status -eq 0 ]
#        set status_face (set_color green)"(☝ ՞ਊ ՞)☝  < "
#    else
#        set status_face (set_color red)"｡+ﾟ(∩´﹏'∩)ﾟ+｡ < "
#    end
#    printf '%s %s' (set_color yellow)(prompt_pwd) $status_face
#end

# pyenv
set -x PATH $HOME/.pyenv/bin $PATH
. (pyenv init - | psub)

# alias
alias cdd 'cd ~/Desktop'
alias cdp 'cd ~/Code/Projects'
alias cdc 'cd ~/Code/others/commands'

alias clera 'clear'
alias cl 'clear'

alias code 'open -a "Visual Studio Code"'
alias storm 'open -a "PhpStorm"'
alias charm 'open -a "PyCharm CE"'
alias memo 'open -a textedit'
alias askd 'ask dialog -l ja-JP'
alias askl 'ask deploy -t lambda'
alias gs 'git status'
alias gd 'git diff'
alias gl 'git log'
alias gb 'git branch'
alias tn 'tmux new -s'
alias tnm 'tmux new -s main'

# peco/z
function peco_z
  set -l query (commandline)

  if test -n $query
    set peco_flags --query "$query"
  end

  z -l | peco $peco_flags | awk '{ print $2 }' | read recent
  if [ $recent ]
      cd $recent
      commandline -r ''
      commandline -f repaint
  end
end

function fish_user_key_bindings
  bind \cr 'peco_select_history (commandline -b)'
  bind \cq peco_z
  bind \cs accept-autosuggestion
end

