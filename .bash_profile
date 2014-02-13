
#  Customize BASH PS1 prompt to show current GIT repository and branch.

export TERM=xterm-color
export GREP_OPTIONS='--color=auto' GREP_COLOR='1;32'
export CLICOLOR=1

# Reset
Color_Off="\[\033[0m\]"       # Text Reset

# Regular Colors
Black="\[\033[0;30m\]"        # Black
Red="\[\033[0;31m\]"          # Red
Green="\[\033[0;32m\]"        # Green
Yellow="\[\033[0;33m\]"       # Yellow
Blue="\[\033[0;34m\]"         # Blue
Purple="\[\033[0;35m\]"       # Purple
Cyan="\[\033[0;36m\]"         # Cyan
White="\[\033[0;37m\]"        # White

# Bold
BBlack="\[\033[1;30m\]"       # Black
BRed="\[\033[1;31m\]"         # Red
BGreen="\[\033[1;32m\]"       # Green
BYellow="\[\033[1;33m\]"      # Yellow
BBlue="\[\033[1;34m\]"        # Blue
BPurple="\[\033[1;35m\]"      # Purple
BCyan="\[\033[1;36m\]"        # Cyan
BWhite="\[\033[1;37m\]"       # White

# Underline
UBlack="\[\033[4;30m\]"       # Black
URed="\[\033[4;31m\]"         # Red
UGreen="\[\033[4;32m\]"       # Green
UYellow="\[\033[4;33m\]"      # Yellow
UBlue="\[\033[4;34m\]"        # Blue
UPurple="\[\033[4;35m\]"      # Purple
UCyan="\[\033[4;36m\]"        # Cyan
UWhite="\[\033[4;37m\]"       # White

# Background
On_Black="\[\033[40m\]"       # Black
On_Red="\[\033[41m\]"         # Red
On_Green="\[\033[42m\]"       # Green
On_Yellow="\[\033[43m\]"      # Yellow
On_Blue="\[\033[44m\]"        # Blue
On_Purple="\[\033[45m\]"      # Purple
On_Cyan="\[\033[46m\]"        # Cyan
On_White="\[\033[47m\]"       # White

# High Intensty
IBlack="\[\033[0;90m\]"       # Black
IRed="\[\033[0;91m\]"         # Red
IGreen="\[\033[0;92m\]"       # Green
IYellow="\[\033[0;93m\]"      # Yellow
IBlue="\[\033[0;94m\]"        # Blue
IPurple="\[\033[0;95m\]"      # Purple
ICyan="\[\033[0;96m\]"        # Cyan
IWhite="\[\033[0;97m\]"       # White

# Bold High Intensty
BIBlack="\[\033[1;90m\]"      # Black
BIRed="\[\033[1;91m\]"        # Red
BIGreen="\[\033[1;92m\]"      # Green
BIYellow="\[\033[1;93m\]"     # Yellow
BIBlue="\[\033[1;94m\]"       # Blue
BIPurple="\[\033[1;95m\]"     # Purple
BICyan="\[\033[1;96m\]"       # Cyan
BIWhite="\[\033[1;97m\]"      # White

# High Intensty backgrounds
On_IBlack="\[\033[0;100m\]"   # Black
On_IRed="\[\033[0;101m\]"     # Red
On_IGreen="\[\033[0;102m\]"   # Green
On_IYellow="\[\033[0;103m\]"  # Yellow
On_IBlue="\[\033[0;104m\]"    # Blue
On_IPurple="\[\033[10;95m\]"  # Purple
On_ICyan="\[\033[0;106m\]"    # Cyan
On_IWhite="\[\033[0;107m\]"   # White

# Various variables you might want for your PS1 prompt instead
Time12h="\T"
Time12a="\@"
PathShort="\w"
PathFull="\W"
NewLine="\n"
Jobs="\j"

source ${HOME}/.dotfiles/git-prompt.sh

export PS1='\n'$On_White$Time12h$Cyan' \u '$Purple'\h$(if [ "$YROOT_NAME" != "" ]; then \
  echo "'$Green'" $YROOT_NAME; \
fi)'$IBlack$Color_Off'$(git branch &>/dev/null;\
if [ $? -eq 0 ]; then \
 echo "$(echo `git status` | grep "nothing to commit" > /dev/null 2>&1; \
 if [ "$?" -eq "0" ]; then \
   # @4 - Clean repository - nothing to commit
   echo " '$Green'"$(__git_ps1 "(%s)"); \
 else \
   # @5 - Changes to working tree
   echo " '$IRed'"$(__git_ps1 "{%s}"); \
 fi) '$BYellow$PathShort$Color_Off' "; \
else \
 # @2 - Prompt when not in GIT repo
 echo " '$Yellow$PathShort$Color_Off' "; \
fi)\n↪'$Color_Off' '

# Shortcuts

alias ll='ls -ltr'
alias ls='ls -G'
alias resource='source ${HOME}/.bash_profile'
alias ll='ls -ltrG'
alias cls='clear'
alias l='ll'
alias vi='vim'
alias ..='cd ..'
alias ...='cd .. ; cd ..'
alias +=pushd


# extremely powerful stuff follows, beware:
# save bookmarks to directories by typing "save foo" which can be later accessed by "cd foo"

if [ ! -f ~/.dirs ]; then  # if doesn't exist, create it
        touch ~/.dirs
fi

alias show='cat ~/.dirs'
save (){
        command sed "/!$/d" ~/.dirs > ~/.dirs1; \mv ~/.dirs1 ~/.dirs; echo "$@"=\"`pwd`\" >> ~/.dirs; source ~/.dirs ;
}
source ~/.dirs  # Initialization for the above 'save' facility: source the .sdirs file
shopt -s cdable_vars # set the bash option so that no '$' is required when using the above facility

export HISTCONTROL=ignoredups # Ignores dupes in the history
shopt -s checkwinsize # After each command, checks the windows size and changes lines and columns

# bash completion settings (actually, these are readline settings)
bind "set completion-ignore-case on" # note: bind is used instead of setting these in .inputrc.  This ignores case in bash completion
bind "set bell-style none" # No bell, because it's damn annoying
bind "set show-all-if-ambiguous On" # this allows you to automatically show completion without double tab-ing

# Turn on advanced bash completion if the file exists (get it here: http://www.caliban.org/bash/index.shtml#completion)
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

alias g='grep -i'  #case insensitive grep
alias f='find . -iname'
alias ducks='du -cks * | sort -rn|head -11' # Lists the size of all the folders and files
alias top='top -o cpu'

alias svn-add-all='svn add `find | grep -vw "svn" | xargs`'
alias mysql='/usr/local/mysql/bin/mysql'
alias mysqladmin='/usr/local/mysql/bin/mysqladmin'
alias ysgr='yinst set | grep -i '
export HISTFILE=/Volumes/arsenal/var/.bash_history
export HISTFILESIZE=20000
export HISTCONTROL=ignoreboth
shopt -s histappend

export SVN_EDITOR=vi
SSH_ENV=$HOME/.ssh/environment

function startagent {
     echo "Initialising new SSH agent..."
     /usr/bin/ssh-agent | sed 's/^echo/#echo/' > ${SSH_ENV}
     echo succeeded
     chmod 600 ${SSH_ENV}
     . ${SSH_ENV} > /dev/null
     /usr/bin/ssh-add;
}

# Source SSH settings, if applicable

if [ -f "${SSH_ENV}" ]; then
     . ${SSH_ENV} > /dev/null
     ps -ef | grep ${SSH_AGENT_PID} | grep ssh-agent$ > /dev/null || {
         startagent;
     }
else
     startagent;
fi

# Remote Mount (sshfs)
# creates mount folder and mounts the remote filesystem
rmount() {
    local host folder mname
    host="${1%%:*}:"
    [[ ${1%:} == ${host%%:*} ]] && folder='' || folder=${1##*:}
    if [[ $2 ]]; then
        mname=$2
    else
        mname=${folder##*/}
        [[ "$mname" == "" ]] && mname=${host%%:*}
    fi
    if [[ $(grep -i "host ${host%%:*}" ~/.ssh/config) != '' ]]; then
        mkdir -p /Volumes/$mname > /dev/null
        sshfs $host$folder /Volumes/$mname -oCiphers=arcfour,auto_cache,reconnect,defer_permissions,negative_vncache,volname=$mname,noappledouble && echo "mounted /Volumes/$mname"
    else
        echo "No entry found for ${host%%:*}"
        return 1
    fi
}

rumount() {
    if [[ $1 == "" ]]; then
        echo "You need to specify a mounted volume name."
    else
        [[ $(mount | grep "/Volumes/$1") ]] && umount /Volumes/$1
    fi
}

complete -W "$(echo $(grep '^ssh ' ~/.bash_history | sed 's/^ssh //') $(cat ~/.ssh/known_hosts | cut -d, -f1) | sort -u)" ssh
