export TMPDIR="/tmp"
export TZ="JST-09"
export MAKE_MODE="unix"
export LANG="ja_JP.UTF-8"
export JLESSCHARSET="japanese-sjis"
export C_INCLUDE_PATH="/usr/include/"

export GEM_HOME=$HOME/.gem

PATH=/usr/local/bin:/usr/bin:/usr/local/sbin:$PATH
PATH=$HOME/bin:$PATH
PATH=$HOME/.rbenv/bin:$PATH # for ruby from rbenv
PATH=$HOME/.gem/bin:$PATH # for gems
PATH=$HOME/ghq/github.com/flutter/flutter/bin:$PATH # for flutter
PATH=$HOME/.composer/vendor/bin:$PATH # for composer global packages
PATH=$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH # for yarn global packages
PATH="/opt/homebrew/opt/openjdk@17/bin:$PATH" # for java
PATH="/Applications/PhpStorm.app/Contents/MacOS:$PATH" # for PhpStorm Command-line Launcher
PATH="/Applications/IntelliJ IDEA CE.app/Contents/MacOS:$PATH" # for IntelliJ IDEA Command-line Launcher
export PATH

export CPPFLAGS="-I/opt/homebrew/opt/openjdk@17/include" # for java

eval "$(/opt/homebrew/bin/brew shellenv)" # for homebrew
eval "$(nodenv init -)" # for nodenv
eval "$(rbenv init -)" # for rbenv
eval "$(pyenv init -)" # for pyenv

. $(brew --prefix z)/etc/profile.d/z.sh # for z

eval "$(direnv hook zsh)" # for direnv

export LS_COLORS='di=36:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
zstyle ':completion:*' list-colors 'di=36' 'ln=35' 'so=32' 'ex=31' 'bd=46;34' 'cd=43;34'

ulimit -n 1024 # avoid "Too many open files"
