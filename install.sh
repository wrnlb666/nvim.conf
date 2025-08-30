#!/usr/bin/env sh

if [ ! -d ~/.config ]; then
    mkdir ~/.config
fi

if [ -e ~/.config/nvim ]; then
    rm -rf ~/.config/nvim
fi

ln -sf $(pwd) ~/.config/nvim
