# source global definitions.
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

export SHELL="/bin/bash"
export TMPDIR="/tmp"
export TZ="JST-09"
export MAKE_MODE="unix"
export LANG="ja_JP.UTF-8"

PATH="/usr/local/sbin:/usr/sbin:/sbin:/usr/local/bin:/usr/bin:~/scripts:.:$PATH"
PATH="$PATH:/usr/local/share/npm/bin"   # for npm apps.

JLESSCHARSET="japanese-sjis"
export PATH JLESSCHARSET

export C_INCLUDE_PATH="/usr/include/"

if [ $(uname) == "Linux" ]; then
    # Linux
    alias ls="ls --color=auto"
else
    # OS X
    alias ls="ls -G"
    export LSCOLORS="gxfxcxdxbxegedabagacad"
fi

alias la="ls -a"
alias ll="ls -l"
alias lla="ll -a"
alias j="jobs"
alias vi="vim"
alias em="emacs"
alias more="less"
alias ip="ifconfig"
alias cp="cp -p"
alias mkdir="mkdir -p"
alias x="exit"
alias ht="cd ~/Data/workspace/htdocs"
alias console="php app/console"
alias composer="php ~/Data/workspace/htdocs/composer.phar"
alias g="git"
