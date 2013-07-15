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
# Wine Requirements for EVE Online:
#     winetricks corefonts d3dx9_36 vcrun2005 vcrun2008 vcrun2010 msxml3
#
# msxml3 is only required for launcher to pull in the RSS feed from eve website
# (not required if you are not using launcher)


# Colors
blue="\033[1;34m"
green="\033[1;32m"
red="\033[1;31m"
bold="\033[1;37m"
reset="\033[0m"

# WINE arch
### WINEARCH=win32
# WINE binary
LOADER_WINE="wine"
# WINE debug opts
WINEDEBUG=-all

# Game directory
GAMEDIR="$HOME/.wine/drive_c/EVE/bin"

cd "$GAMEDIR"

# Start EVE Online in new virtual desktop at 1280x800
WINEDEBUG=-all $LOADER_WINE explorer /desktop=EVE,1280x800 "Exefile.exe" -- "$@"
