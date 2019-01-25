#Info de SO, host e IP
alias so='lsb_release -a; hostname -I; hostname'

# Lista de alias
alias ag='cat .bash_aliases .bashrc .bash_functions | grep alias | grep'
# Borrar
alias c='clear'
alias cd.='cd ..'
alias cd..='cd ..'
alias CD='cd'
alias home='cd ~ && ll;'
alias t='tree -uRD'
ccd() { builtin cd "$@" && clear && pwd && ll; }
alias rm='rm -rvi'
alias rebash='. .bashrc'

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

# Cosas raras
alias eltiempo='curl wttr.in/Palma'




# ----------------------
# Git Aliases
# ----------------------
alias ga='git add'
alias gb='git branch'
alias gbd='git branch --delete '
alias gc='git commit'
alias gcm='git commit --message'
alias gcf='git commit --fixup'
alias gco='git checkout'
alias gcob='git checkout -b'
alias gcom='git checkout master'
alias gcos='git checkout staging'
alias gcod='git checkout develop'
alias gd='git diff'
alias gda='git diff HEAD'
alias gi='git init'
alias glg='git log --graph --oneline --decorate --all'
alias gld='git log --pretty=format:"%h %ad %s" --date=short --all'
alias gm='git merge --no-ff'
alias gma='git merge --abort'
alias gmc='git merge --continue'
alias gp='git pull'
alias gpr='git pull --rebase'
alias gr='git rebase'
alias gs='git status'
alias gss='git status --short'
alias gst='git stash'
alias gsta='git stash apply'
alias gstd='git stash drop'
alias gstl='git stash list'
alias gstp='git stash pop'
alias gsts='git stash save'
