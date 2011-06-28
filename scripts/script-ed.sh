#!/bin/bash
# loop to edit script files
#
# www.equk.co.uk

# Colors
blue="\033[1;34m"
green="\033[1;32m"
red="\033[1;31m"
bold="\033[1;37m"
reset="\033[0m"

scriptfind=$(find /home/bradley/scripts -type f -name "*.sh")

for config in $scriptfind
do
  geany $config &
  wait
done
