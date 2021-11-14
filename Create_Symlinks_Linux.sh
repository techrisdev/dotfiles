#!/bin/bash
cd ~/.dotfiles
stow dotfiles
cd
rm -rf ~/Library
rm .zshrc
mv .zshrclinux .zshrc
