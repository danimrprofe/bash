
#!bin/bash
# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dirc$
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -FGlAhp'
alias la='ls -A'
alias l='ls -CF'
alias lh='ls -lh'
# Network Start, Stop, and Restart
alias light='xbacklight -set'


# Apt
alias update='sudo apt -y update'
alias upgrade='sudo apt-get -y update && sudo apt-get -y --allow-unauthenticate$
alias search='sudo apt search'
alias links='links2'
# Install and Remove Packages
alias install='sudo apt-get -y install'
alias uninstall='sudo apt-get --purge autoremove '
alias search-installed='sudo dpkg --get-selections '
alias upgrade-pips='sudo pip freeze --local | grep -v '^\-e' | cut -d = -f 1  |$
'
#alias cleanPC='sudo apt-get -y autoclean && sudo apt-get -y clean && sudo apt-$


alias lsdir='ls -ld */'
alias display='eog -w'
alias emptyDir='find . -empty -type d -delete'
alias meng='cd ${HOME}/Dropbox/MEng_Stuff/MEng-Progress'
alias media='sshfs -o reconnect media@192.168.1.10:/mnt /home/"${USER}"/mnt/med$
alias reboot='sudo shutdown -r now'
alias shutdown='sudo shutdown -h now'
alias paux='ps aux | grep'
alias cd.='cd ..'
alias ..='cd ..'
alias ...='cd ../../../'

