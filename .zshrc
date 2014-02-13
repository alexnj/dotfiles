#
# Executes commands at the start of an interactive session.
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Generic 
alias resource='source ~/.zshrc'
alias servethis='python -m SimpleHTTPServer'

# Git
alias gp='git pull'
alias gc='git commit'
alias ga='git add'
alias gs='git status'
