#!/bin/bash

dir=~/dotfiles
olddir=~/dotfiles.old

files="vimrc vim gitconfig gitconfig-host gitignore tmux.conf"

hostname=$(hostname -s)

cd $dir
for entry in $files; do
    if [ -e ~/.$entry ]; then
        if [ -L ~/.$entry ]; then
            rm ~/.$entry
        else
            mkdir -p $(dirname $olddir/.$entry)
            mv ~/.$entry $olddir/
        fi
    fi

    if [ -e $dir/$entry.$hostname ]; then
        ln -s $dir/$entry.$hostname ~/.$entry
    else
        ln -s $dir/$entry ~/.$entry
    fi
done

