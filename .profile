# .profile

PATH=$PATH:$HOME/bin:$HOME/.dotfiles/bin

export PATH

# Shortcuts

alias ll='ls -ltr'
alias ls='ls -G'
alias resource='source ${HOME}/.dotfiles/.profile'
alias ll='ls -ltrG'
alias cls='clear'
alias l='ll'
alias vi='vim'
alias ..='cd ..'
alias ...='cd .. ; cd ..'
alias subl="/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl"

alias g='grep -i'  #case insensitive grep
alias f='find . -iname'
alias ducks='du -cks * | sort -rn|head -11' # Lists the size of all the folders and files
alias top='top -o cpu'


