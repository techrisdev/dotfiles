#!/bin/bash
rm -f ~/.zshrc
rm -f ~/.zshrcmac
rm -f ~/.zshrclinux
cd ~/.dotfiles
stow dotfiles
cd
rm -rf ~/Library
rm -f .zshrc
mv .zshrclinux .zshrc
cd ~/.config/alacritty
mv alacrittylinux.yml alacritty.yml
