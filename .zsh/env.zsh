export TMPDIR="/tmp"
export TZ="JST-09"
export MAKE_MODE="unix"
export LANG="ja_JP.UTF-8"
export JLESSCHARSET="japanese-sjis"
export C_INCLUDE_PATH="/usr/include/"

export GEM_HOME=$HOME/.gem

PATH=/usr/local/bin:/usr/bin:/usr/local/sbin:$PATH
PATH=/usr/local/opt/httpd24/bin:$PATH   # for apache from brew
PATH=/usr/local/opt/ruby/bin:$PATH   # for ruby from brew
PATH=$HOME/.gem/bin:$PATH   # for gems
PATH=$HOME/.phpenv/bin:$PATH   # for phpenv
PATH=/usr/local/opt/bison/bin:$PATH   # for phpenv
PATH=$HOME/.nodebrew/current/bin:$PATH   # for nodebrew
export PATH

eval "$(phpenv init -)"   # for phpenv

export PKG_CONFIG_PATH=/usr/local/opt/krb5/lib/pkgconfig:/usr/local/opt/openssl/lib/pkgconfig:/usr/local/opt/icu4c/lib/pkgconfig:/usr/local/opt/libedit/lib/pkgconfig:/usr/local/opt/libxml2/lib/pkgconfig   # for phpenv

export LS_COLORS='di=36:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
zstyle ':completion:*' list-colors 'di=36' 'ln=35' 'so=32' 'ex=31' 'bd=46;34' 'cd=43;34'
