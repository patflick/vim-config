#!/bin/bash

# install requirements (ubuntu only)
sudo apt-get install build-essential cmake
sudo apt-get install python-dev

# install Ycm
cd ~/.vim/bundle/YouCompleteMe
./install.sh --clang-completer

