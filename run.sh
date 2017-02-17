#!/bin/bash

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
rm -fr $HOME/.vimrc

ln -s $(pwd)/vimrc  $HOME/.vimrc
vim +PluginInstall +qall
