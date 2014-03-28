#!/bin/bash
git submodule init
git submodule update
[ -h ~/.vim ] || ln -s ~/.configurations/vim/dotvim ~/.vim
[ -h ~/.vimrc ]     || ln -s ~/.configurations/vim/dotvimrc ~/.vimrc
[ -h ~/.tmux.conf ] || ln -s ~/.configurations/tmux/dottmux.conf ~/.tmux.conf
[ -h ~/.oh-my-zsh ] || ln -s ~/.configurations/zsh/dotoh-my-zsh ~/.oh-my-zsh
[ -h ~/.pystartup ] || ln -s ~/.configurations/python/pystartup ~/.pystartup
[ -h ~/.pryrc ] || ln -s ~/.configurations/dotfiles/pryrc ~/.pryrc
[ -h ~/.Xmodmap ] || ln -s ~/.configurations/dotfiles/Xmodmap ~/.pryrc

if [ ! -h ~/.zshrc ]; then
  cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc
fi
