#!/bin/bash

dir=~/dotfiles
olddir=~/dotfiles.old

files="vimrc vim gitconfig gitconfig-host gitignore teamocil tmux.conf zsh zshrc ctags"

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

    if [ -e $dir/hosts/$hostname/$entry ]; then
        ln -s $dir/hosts/$hostname/$entry ~/.$entry
    elif [ -e $dir/$entry ]; then
        ln -s $dir/$entry ~/.$entry
    fi
done

