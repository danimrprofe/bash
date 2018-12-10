# Alias para DIRECTORIOS
alias .4='cd ../../../../'
alias .5='cd ../../../../..'
alias ag='cat .bash_aliases .bashrc .bash_functions | grep alias | grep'
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
alias c='clear'
alias ..='cd ..'
alias ...='cd ../../../'
alias ....='cd ../../../../'
alias .....='cd ../../../../'
alias cd.='cd ..'
alias cd..='cd ..'
alias CD='cd'
alias home='cd ~ && ll;'
alias t='tree -uRD'
ccd() { builtin cd "$@" && clear && pwd && ll; }
alias rm='rm -rvi'

#alias cleanPC='sudo apt-get -y autoclean && sudo apt-get -y clean && sudo apt-get -y autoremove'
alias display='eog -w'
alias egrep='egrep --color=auto'
alias emptyDir='find . -empty -type d -delete'
alias fgrep='fgrep --color=auto'
alias grep='grep --color=auto'

# Alias HISTORY
alias hg='history | sort -u | grep'
alias h='history'

# ALIAS GESTOR PAQUETES APT
alias install='sudo apt-get -y install'
alias uninstall='sudo apt-get --purge autoremove '
alias update='sudo apt -y update'
alias search='sudo apt search'
alias upgrade='sudo apt-get -y update && sudo apt-get -y --allow-unauthenticated upgrade && sudo apt-get autoclean && sudo apt-get autoremove && exit 0'

# Alias LS
alias la='ls -A'
alias lh='ls -lh'
alias light='xbacklight -set'
alias links='links2'
alias ll='ls -FGlAhp'
alias l='ls -CF'
alias lsdir='ls -ld */'
alias ls='ls --color=auto'

# Alias PROCESOS
alias paux='ps aux | grep'

# Alias de RED
alias port='netstat -tulanp'
alias ipa='ip a | grep "inet "'
alias pg='ping -c 5 www.google.com'
alias netstart='systemctl restart networking.service'

# Alias para SALIR
alias e='exit'
alias shut='sudo shutdown -r now'
alias reb='sudo reboot now'

# ALIAS EDITORES DE TEXTO
alias snano='sudo nano'

# Alias para SERVICIOS
alias ssr='sudo systemctl restart'
alias sss='sudo systemctl status'
alias sstart='sudo systemctl start'
alias sstop='sudo systemctl stop'

# Alias para LOGS
alias t10='tail -10'
alias t50='tail -50'
alias tf='tail -f'
tg='tail -10 | grep "$@"' 
