#!/usr/bin/env sh

[ -d ~/.config ] || mkdir ~/.config
[ -e ~/.config/nvim ] && rm -rf ~/.config/nvim

cp -rf "$(pwd)" ~/.config/nvim
