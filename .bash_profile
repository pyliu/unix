# .bash_profile
# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs

PATH=$PATH:/home/y/bin:/usr/local/bin:$HOME/bin:$HOME/local/bin

export PATH
export SVNROOT=svn+ssh://svn.corp.yahoo.com/
export LEGO_SRC_ROOT=/home/pyliu/lego
export SVN_SSH='/usr/local/bin/yssh -q'
export SVN_EDITOR=/usr/bin/vim
# let git bypass SSL checking
export GIT_SSL_NO_VERIFY=true

# for easy grep source code
export LC_CTYPE=POSIX
export GREP_COLORS="ms=01;37:mc=01;37:sl=:cx=01;30:fn=35:ln=32:bn=32:se=36"
export LSCOLORS=GxFxCxDxBxegedabagaced
alias vgrep='grep --color=always -inR'

# For search dev
export SVNROOT=svn+ssh://svn.corp.yahoo.com/yahoo/searchfe
export SOURCE_DIR=~/web
export R3HOME=$SOURCE_DIR/r3

# yssh config
if [ -x /usr/local/bin/yssh ]; then
    export SVN_SSH=/usr/local/bin/yssh
    alias ssh=yssh
    alias scp=yscp
fi

if [ -x /usr/local/bin/yssh-find-agent ]; then
    export SSH_AUTH_SOCK=`/usr/local/bin/yssh-find-agent`
fi

PS1="["
PS1="$PS1\[\e[36m\]\u\[\e[0m\]"
PS1="$PS1@"
PS1="$PS1\[\e[34;1m\]\h\[\e[0m\]"
PS1="$PS1@"
if [ "x$YROOT_NAME" != "x" ]; then
    # Yroot Indicator
    PS1="$PS1\[\e[32;40m\]$YROOT_NAME\[\e[0m\]"
fi
PS1="$PS1]"
PS1="$PS1:\[\e[33m\]\w\[\e[0m\] \\$ "

# For colourful man pages (CLUG-Wiki style)
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'

#Aliases - Commands
alias f='find . -name'
alias g='git'
alias gm='g co master'
alias gd='g co dev'
alias gb='g branch'
alias gl='g lol'
alias gp='g pull upstream master'
alias gg='g g'
alias ls='ls --color'
alias ll='ls -lh'
alias lla='ll -ah'
alias work='tmux attach -t work || tmux new -s work'
alias gsp2_core='[ -e /home/y/share/pear/Yahoo/GSP2 ] && cd /home/y/share/pear/Yahoo/GSP2'
alias gsp='yroot gsp2web1'
alias play='yroot playground'
alias c='clear'
alias sdiff='/home/y/bin/svnvimdiff'
alias r='cd ~'
alias ack='ack --ignore-dir=external'
alias sassthis='sass --update --scss --style expanded -C'
alias sw='sass --watch --scss --style expanded -C assets/scss:assets/css --no-cache --compass;'
alias ferr="find * -not -regex '.*/\.svn/.*' -type f -exec egrep -iH 'backtrack' '{}' \; 2>&1"
# search dev shortcut
alias root='cd ~/web/'
alias comp='cd ~/web/src/templates/web/all/generic/skins/cosmos/html/component/'
alias ilpm='cd /tmp/cosmos/dd'
alias err='cd /home/y/logs/yapache/all'
alias gen_us='gsp2r3 web/en_US/skins/search/html_purple/main.inc'
alias grid="ssh kryptonite-gw.red.ygrid.yahoo.com"
alias qrs02="ssh qrs02.master.int.bp.vertical.search.gq1.yahoo.com"
alias tiber="ssh tiberium-gw.tan.ygrid.yahoo.com"
alias bass="ssh bassnium-gw.tan.ygrid.yahoo.com"
alias blue="ssh jet-gw.blue.ygrid.yahoo.com"
alias za="ssh zanium-gw.tan.ygrid.yahoo.com"
alias tbbf1="ssh db2-prod-ob1.toolbar.bf1.yahoo.com"
alias tbgq1="ssh launcher-ob1.toolbar.gq1.yahoo.com"

# rebuild openstack instance
#export OS_AUTH_URL=http://keystoneservice.ostk.dv1.vip.corp.gq1.yahoo.com:5000/v2.0
#export OS_TENANT_ID=96d4548d0ca042739fa174db5f75e737
#export OS_TENANT_NAME="pyliu"
#export OS_USERNAME=pyliu

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

export ORACLE_HOME=/home/y/lib64/ora11gclient
export NLS_LANG=AMERICAN_AMERICA.UTF8
export NLS_DATE_FORMAT="YYYY/MM/DD HH24:MI:SS"
export LD_LIBRARY_PATH=/home/y/lib64/ora11gclient
export TNS_ADMIN=/home/y/conf/oracle
export PATH=$PATH:$ORACLE_HOME
