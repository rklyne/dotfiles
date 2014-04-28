#!/bin/bash

ln -s "${PWD}/tmux.conf" ~/.tmux.conf
ln -s "${PWD}/vimrc" ~/.vimrc
ln -s "${PWD}/vim" ~/.vim
ln -s "${PWD}/gitconfig" ~/.gitconfig

pip install --user git+git://github.com/Lokaltog/powerline

(cd ~/.vim && ./install_bundles.sh)


