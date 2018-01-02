#!/bin/bash

# install requirements (ubuntu only)
sudo apt-get install build-essential cmake
sudo apt-get install python-dev python3-dev

# install Ycm
cd ~/.vim/bundle/YouCompleteMe
./install.py --clang-completer

