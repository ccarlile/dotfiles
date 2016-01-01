#!/bin/sh

# Get a new system up and running for development
# Get distro (ubuntu/debian or arch?)
OS=$(cat /etc/issue | awk '{print $1}')

# Install tmux, git, vim
if [ $OS = 'Arch' ]; then
    sudo pacman -S tmux git vim curl
fi

if [ $OS = 'Ubuntu' ]; then
    sudo apt-get install tmux git vim build-essential curl
fi

# Git clone dotfiles
cd $HOME
git clone https://github.com/ccarlile/dotfiles
cd dotfiles/

# Install dotfiles
python dotfiles.py install
# Create vim direcrtories
mkdir $HOME/.vim
mkdir $HOME/.vim/backup
mkdir $HOME/.vim/colors

# Git clone vundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# Install nvm
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
