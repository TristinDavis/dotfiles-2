# lang
LC_ALL=ja_JP.UTF-8

# path
PATH=/bin:/sbin:/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin
PATH=$PATH:$HOME/bin:$HOME/local/bin
if [ -e /usr/local/mysql/bin/ ] ; then
    PATH=$PATH:/usr/local/mysql/bin
fi

if [ -d ~/.plenv ] ; then
    PATH=$PATH:$HOME/.plenv/bin
    eval "$(plenv init -)";
fi

if [ -d ~/.phpenv ] ; then
    PATH=$PATH:$HOME/.phpenv/bin
    eval "$(phpenv init -)"
fi

if [ -d ~/.rbenv ] ; then
    PATH=$PATH:$HOME/.rbenv/bin
    eval "$(rbenv init -)"
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
alias rm="mv2trash"
alias ls="ls -Cltra"
alias rsync="rsync -avz --exclude=\".git\" --exclude=\".DS_Store\" --exclude=\".git_ignore\" --exclude=sandbox"
alias ack="ack -a"
alias emacs="/Applications/Emacs.app/Contents/MacOS/Emacs -nw"
alias git-wata="GIT_SSH=git-wata git"

# Git branch in prompt.
parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

# others
export PS1="\[\033[037;041m\]\u@\h: \w\$(parse_git_branch)$ \[\033[00m\]"
export CLICOLOR=1
export LSCOLORS=CxGxcxdxCxegedabagacad
#export GREP_OPTIONS="-r -I --color --exclude=*.svn* --exclude=.git --exclude=CVS --exclude=*~ --exclude=*.d --exclude=*.o -n"

# programming
export EDITOR=/usr/bin/vim
export PAGER=/usr/bin/less

#if [ -s ~/perl5/perlbrew/etc/bashrc ] ; then
#    source ~/perl5/perlbrew/etc/bashrc
#fi
#if [ -f ~/perl5/perlbrew/etc/perlbrew-completion.bash ]; then
#  source ~/perl5/perlbrew/etc/perlbrew-completion.bash
#fi

if [ -s ~/.pythonbrew/etc/bashrc ] ; then
    source ~/.pythonbrew/etc/bashrc
fi

