#!/bin/bash
#
#
# blog.equk.co.uk
# ﻿                     
# equk's wine launcher                             
#                                      -oo-         
#                                      +MMo         
#      .:+o+:`   `:+o/-+o+  +oo`  ooo  +MMo .oo+.   
#     oNNs+hMd- :mMmyydMMm  mMM`  MMM  +MMs/mMh:    
#    :MMmyyhMMy mMM-  .MMm  mMM`  MMM  +MMmNMh`     
#    -NMmo//++- hMMo..+MMm  dMM/.:MMM  +MMd+NMd-    
#     :ymmmmdh` .smNmdyMMm  -dNNmhhMN  +MMo :mMN+   
#       `...``    `..``MMm   ``.` `..  `..`  `...   
#                     `NNd                          
#                                                   

# Colors
blue="\033[1;34m"
green="\033[1;32m"
red="\033[1;31m"
bold="\033[1;37m"
reset="\033[0m"

# WINE arch
WINEARCH=win32
# WINE binary
LOADER_WINE="wine"
# WINE debug opts
WINEDEBUG=-all

# Game directory
GAMEDIR="$HOME/.wine/drive_c/Guild Wars"

cd "$GAMEDIR"

WINEARCH=win32 WINEDEBUG=-all $LOADER_WINE "Gw.exe" -- "$@" 


