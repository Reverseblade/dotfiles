#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

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
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir vcs)
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
POWERLEVEL9K_CUSTOM_USER="user_with_skull"

# Prompt elements
# POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(custom_user dir vcs)
# POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(background_jobs battery)
