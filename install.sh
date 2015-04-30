#!/bin/bash

WD=$( cd $(dirname $0) ; pwd -P ) 

makelink () {
    TARGET="${HOME}/.${1}"
    if [[ -f "${TARGET}" && ! -L "${TARGET}" ]] ; then
        mv "${TARGET}" "${TARGET}.original" ;
    fi 
    [[ -e "${TARGET}" ]] || ln -s "${WD}/${1}" "${TARGET}"
}

makelink "tmux.conf"
makelink "vim"
makelink "vimrc"
makelink "gitconfig"
makelink "zsh.rk"
makelink "aliases"
# ln -s "${WD}/tmux.conf" ~/.tmux.conf
# ln -s "${WD}/vimrc" ~/.vimrc
# ln -s "${WD}/vim" ~/.vim
# ln -s "${WD}/gitconfig" ~/.gitconfig

pip install --user git+git://github.com/Lokaltog/powerline

(cd ~/.vim && ./install_bundles.sh)


