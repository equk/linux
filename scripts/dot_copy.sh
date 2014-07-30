#!/bin/bash
#
#*****************************************************************
#     dot_copy - equk.co.uk
#*****************************************************************
# Copyright (C) 2014  Bradley Walden
# This program comes with ABSOLUTELY NO WARRANTY.
# This is free software, and you are welcome to redistribute it
# under certain conditions. See GNU GPLv3.
#*****************************************************************
# This script was made as an alternative to using multiple
# symlinks for the syncing of dotfiles to github.
# The script simply copies files from their location to the repo
# directory and runs the relevant commands to commit any changes
#*****************************************************************

# COLORS

blue="\033[1;34m"
green="\033[1;32m"
red="\033[1;31m"
bold="\033[1;37m"
reset="\033[0m"

# VARIABLES

repo_folder=~/test
base_files=".bashrc .vimrc .zshrc .conkycpu .conkystats"
vim_files="keymap.vim plugins.vim"
day=$(date '+%d/%m/%Y');

gplus="[$green+$reset]"
bplus="[$blue+$reset]"

# SCRIPT

echo -e ""
echo -e "    equk :: linux config copy"
echo -e "    -------------------------"
echo -e ""
echo -e "$gplus copying base files"
for file in $base_files; do
    echo -e "    $gplus copying file ~/$file to $repo_folder/"
    cp ~/$file $repo_folder/
done

echo -e "$gplus starting Sublime Text 3"
[ -d $repo_folder/sublime-text-3/Packages/User ] || mkdir -p $repo_folder/sublime-text-3/Packages/User/
echo -e "    $gplus creating package list for Sublime Text 3"
ls ~/.config/sublime-text-3/Packages/ | sort > $repo_folder/sublime-text-3/Packages/packages.txt
echo -e "    $gplus copying user Preferences for Sublime Text 3"
cp ~/.config/sublime-text-3/Packages/User/Preferences.sublime-settings $repo_folder/sublime-text-3/Packages/User/
echo -e "$gplus copying zsh configuration files"
cp -R ~/.zsh $repo_folder/
echo -e "$gplus copying vim configuration files"
[ -d $repo_folder/.vim/config/ ] || mkdir -p $repo_folder/.vim/config/
for file in $vim_files; do
    echo -e "    $gplus copying file ~/.vim/config/$file to $repo_folder/.vim/config/"
    cp ~/.vim/config/$file $repo_folder/.vim/config/
done
echo -e "$gplus copying xfce terminal configuration"
[ -d $repo_folder/Terminal/ ] || mkdir -p $repo_folder/Terminal/
cp ~/.config/Terminal/terminalrc $repo_folder/Terminal/
echo -e "$gplus copying i3wm configuration"
cp -R ~/.i3 $repo_folder/
echo -e "$gplus finished copying configuration files"
echo -e ""
echo -e "$bplus running git commands"
cd $repo_folder
git add *
echo -e "$bplus running git checkout"
git checkout
echo -e "$bplus running git commit"
git commit -a -m "$day - linux config update"
echo -e "$bplus ready to push changes"
git push
