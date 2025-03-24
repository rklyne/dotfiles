#!/bin/bash

WD=$(
  cd $(dirname $0)
  pwd -P
)

makelink() {
  PARENT="${2:-${HOME}}"
  TARGET="${PARENT}/.${1}"
  if [[ -f "${TARGET}" && ! -L "${TARGET}" ]]; then
    mv "${TARGET}" "${TARGET}.original"
  fi
  [[ -e "${TARGET}" ]] || ln -s "${WD}/${1}" "${TARGET}"
}

# oh my zsh
curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh

makelink "tmux.conf"
makelink "vim"
makelink "vimrc"
makelink "gitconfig"
makelink "zsh.rk"
makelink "aliases"
makelink "nvim" "${HOME}/.config/"
# ln -s "${WD}/tmux.conf" ~/.tmux.conf
# ln -s "${WD}/vimrc" ~/.vimrc
# ln -s "${WD}/vim" ~/.vim
# ln -s "${WD}/gitconfig" ~/.gitconfig

pip install --user git+git://github.com/Lokaltog/powerline

(cd ~/.vim && ./install_bundles.sh)

mkdir -p ~/.tmux/plugins
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
