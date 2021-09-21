#!/bin/bash

brew install the_silver_searcher fzf ctags

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
rm -fr $HOME/.vimrc

ln -s $(pwd)/vimrc  $HOME/.vimrc
vim +PluginInstall +qall +GoInstallBinaries

git config --global init.templatedir '$(pwd)/.git_template'
