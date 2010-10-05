#!/bin/bash
# pacnew-diff - merge *.pacnew files with original configurations with meld

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

pacnew=$(find /etc -type f -name "*.pacnew")

for config in $pacnew
do
  meld ${config%\.*} $config &
  wait
done
