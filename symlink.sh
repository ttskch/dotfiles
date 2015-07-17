#!/bin/sh

basepath=$(cd $(dirname $0);pwd)

# symlink dotfiles into ~
files=.*
for file in $files
do
    if [ $file != "." -a $file != ".." -a $file != ".git" ] ; then
        ln -sf $basepath/$file ~
    fi
done

# symlink binaries into /usr/local/bin
files=bin/*
for file in $files
do
    ln -sf $basepath/$file /usr/local/bin
done
