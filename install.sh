#!/bin/bash

ln -s "${PWD}/tmux.conf" ~/.tmux.conf
ln -s "${PWD}/vimrc" ~/.vimrc
ln -s "${PWD}/vim" ~/.vim
ln -s "${PWD}/gitconfig" ~/.gitconfig

(cd ~/.vim && ./install_bundles.sh)


