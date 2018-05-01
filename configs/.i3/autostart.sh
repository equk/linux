#!/bin/bash
# i3 autostart
# ============
## settings for Razer BlackWidow 2013
setxkbmap -layout 'gb' -model 'pc105'
## settings for us keyboard layout (filco tenkeyless)
#setxkbmap -layout 'us'
# remap right menu key to function as start key
xmodmap -e "keycode 135 = Super_R NoSymbol Super_R"
# remove any wine applications or filetype references
# (not really into opening exe viruses on double click in linux)
rm -fr ~/.local/share/applications/wine-*
# remove any application shortcuts for wine
rm -fr ~/.local/share/applications/wine/Programs
