#!/bin/bash
# Pacman Clean Script
#
# www.equk.co.uk

# Colors
blue="\033[1;34m"
green="\033[1;32m"
red="\033[1;31m"
bold="\033[1;37m"
reset="\033[0m"

# Check for root
if [ $(whoami) != "root" ]; then
    echo -e $red"error:$reset you cannot perform this operation unless you are root."
    exit 1
fi

# Perform Clean
echo -e "$blue:: Cleaning Unused Packages $reset"
pacman -Rs $(pacman -Qqdt)
echo -e "$green:: Cleaning Complete $reset"
exit 0
