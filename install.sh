#!/bin/bash

# installs vim (including vundle and ycm)

# 1.) copy the vimrc
cp ~/.vim/vimrc.cp ~/.vimrc

# 2.) install vundle
~/.vim/install_vundle.sh

# 3.) install all bundles by starting vim
vim +BundleInstall +qall

# 4.) install (and compile) YCM
~/.vim/install_ycm.sh

