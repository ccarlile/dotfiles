#!/bin/sh

# Get a new system up and running for development
# Get distro (ubuntu/debian or arch?)
OS=$(cat /etc/issue | awk '{print $1}')

# Install tmux, git, vim
if [ $OS = 'Arch' ]; then
    echo 'Found Arch'
    sudo pacman -Syu
    yes | sudo pacman -S tmux git vim curl cowsay fortune-mod
fi

if [ $OS = 'Ubuntu' ]; then
    echo 'Found Ubuntu'
    sudo apt-get update
    #stupid grub
    sudo apt-mark hold grub-common grub-pc grub-pc-bin grub2-common grub
    yes | sudo apt-get upgrade
    yes | sudo apt-get install tmux git vim build-essential curl fortune-mod
fi

# Create vim direcrtories
mkdir $HOME/.vim
mkdir $HOME/.vim/backup
mkdir $HOME/.vim/colors

# Git clone dotfiles
cd $HOME
git clone https://github.com/ccarlile/dotfiles
cd dotfiles/

# Install dotfiles
python dotfiles.py install

# Git clone vundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# Install nvm
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.29.0/install.sh | bash
