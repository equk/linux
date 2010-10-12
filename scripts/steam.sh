#!/bin/bash
#
# www.equk.co.uk

# equk's wine launcher

# 30-11-2009

# kill composite manager
killall xcompmgr

# WINE binary
CDLOADER_WINE="wine"

# Game directory
GAMEDIR="$HOME/.wine/drive_c/Program Files/Steam"

cd "$GAMEDIR"

$CDLOADER_WINE "steam.exe" -- "$@" 

