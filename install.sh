#!/bin/bash
git submodule init
git submodule update
ln -s ~/.configurations/vim/dotvim ~/.vim
ln -s ~/.configurations/vim/dotvimrc ~/.vimrc
ln -s ~/.configurations/tmux/dottmux.conf ~/.tmux.conf
ln -s ~/.configurations/zsh/dotoh-my-zsh ~/.oh-my-zsh
ln -s ~/.configurations/python/pystartup ~/.pystartup
cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc
chsh -s /bin/zsh
