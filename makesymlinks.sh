#!/bin/bash

dir=~/dotfiles
olddir=~/dotfiles.old

cd $dir
for entry in *; do
    if [ -e ~/.$entry ]; then
        mkdir -p $olddir
        mv ~/.$entry $olddir/
    fi

    ln -s $dir/$entry ~/.$entry
done

