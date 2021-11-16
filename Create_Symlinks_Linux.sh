#!/bin/bash
rm -f ~/.zshrc
rm -f ~/.zshrcmac
rm -f ~/.zshrclinux
rm -rf ~/.config/alacritty/*
cd ~/.dotfiles
stow dotfiles
cd
rm -rf ~/Library
rm -f .zshrc
mv .zshrclinux .zshrc
cd ~/.config/alacritty
rm -f alacritty.yml
mv alacrittylinux.yml alacritty.yml
