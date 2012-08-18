# lang
LC_ALL=ja_JP.UTF-8

# path
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/sbin:/usr/local/bin
PATH=$PATH:$HOME/bin:$HOME/local/bin
if [ -e /usr/local/mysql/bin/ ] ; then
    PATH=$PATH:/usr/local/mysql/bin
fi

if [ -e ~/.rbenv/bin/ ] ; then
    PATH=$PATH:$HOME/.rbenv/bin
    eval "$(rbenv init -)"
fi

if [ -e ~/.rvm/bin/ ] ; then
    PATH=$PATH:$HOME/.rvm/bin
fi

if [ -d /usr/local/lib/node/ ] ; then
    PATH=$PATH:/usr/local/share/npm/bin
    NODE_PATH=/usr/local/lib/node
fi

export PATH

# history
HISTCONTROL=ignoredups:ignorespace
shopt -s histappend
HISTSIZE=10000
HISTFILESIZE=20000

# aliases
#alias ls="ls --color -ltra"
alias ls="ls -Cltra"
alias rsync="rsync -avz --exclude=\".git\" --exclude=\".DS_Store\" --exclude=\".git_ignore\" --exclude=sandbox"
alias ack="ack -a"

# others
export PS1="\[\033[037;041m\]\u@\h: \w$ \[\033[0m\]"
export CLICOLOR=1
export LSCOLORS=CxGxcxdxCxegedabagacad
export GREP_OPTIONS="-r -I --color --exclude=*.svn* --exclude=.git --exclude=CVS --exclude=*~ --exclude=*.d --exclude=*.o -n"

# programming
export EDITOR=/usr/bin/vim
export PAGER=/usr/bin/less

if [ -s ~/perl5/perlbrew/etc/bashrc ] ; then
    source ~/perl5/perlbrew/etc/bashrc
fi

if [ -s ~/.pythonbrew/etc/bashrc ] ; then
    source ~/.pythonbrew/etc/bashrc
fi

#if [ -s ~/.phpbrew/bashrc ] ; then
#    source ~/.phpbrew/bashrc
#fi

export RBENV_VERSION=1.9.3-p194
