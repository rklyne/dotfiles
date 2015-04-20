#!/bin/bash

WD=`dirname ${0}`

makelink () {
    ln -s "${WD}/${1}" "~/.${1}"
}

makelink "tmux.conf"
makelink "vim"
makelink "vimrc"
makelink "gitconfig"
makelink "zsh.rk"

ln -s "${WD}/tmux.conf" ~/.tmux.conf
ln -s "${WD}/vimrc" ~/.vimrc
ln -s "${WD}/vim" ~/.vim
ln -s "${WD}/gitconfig" ~/.gitconfig

pip install --user git+git://github.com/Lokaltog/powerline

(cd ~/.vim && ./install_bundles.sh)


