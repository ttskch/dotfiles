#!/bin/sh

ln -sf $(cd $(dirname $0);pwd)/.zshrc ~
ln -sf $(cd $(dirname $0);pwd)/.emacs ~
ln -sf $(cd $(dirname $0);pwd)/.gitconfig ~
ln -sf $(cd $(dirname $0);pwd)/.vimrc ~
ln -sf $(cd $(dirname $0);pwd)/.filezilla ~
ln -sf $(cd $(dirname $0);pwd)/.tmux.conf ~
ln -sf $(cd $(dirname $0);pwd)/.gemrc ~
ln -sf $(cd $(dirname $0);pwd)/.gitignore_global ~
ln -sf $(cd $(dirname $0);pwd)/git-subcommands/git-mergeto /usr/local/bin
ln -sf $(cd $(dirname $0);pwd)/git-subcommands/git-wip /usr/local/bin
