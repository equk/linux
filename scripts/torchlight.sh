#!/bin/bash
#
# www.equk.co.uk

# equk's wine launcher

# 30-11-2009

# WINE binary
CDLOADER_WINE="wine"

# Game directory
GAMEDIR="$HOME/.wine/drive_c/Program Files/Runic Games/Torchlight/Torchlight.exe"

cd "$GAMEDIR"

$CDLOADER_WINE "Torchlight.exe" -- "$@" 

