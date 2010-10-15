#!/bin/bash
#
# sync home dir with external drive
#
# syntax - homebak.sh /path/to/drive
#
# note: make sure you do not leave a trailing /
#
# www.equk.co.uk

# Colors
blue="\033[1;34m"
green="\033[1;32m"
red="\033[1;31m"
bold="\033[1;37m"
reset="\033[0m"

BACKUP=/home/$USER/
EXCLUDES=/home/$USER/scripts/backup/excludes
TARGET=$1/backup/home/$USER
LOG=/home/$USER/scripts/backup/log.txt
echo -e "$blue:: $reset Starting Sync Process to: $1"
# check if backup dir exists
if [[ ! -e "$TARGET" ]]; then
            mkdir -p "$TARGET"
fi
# run sync
rsync -avu --delete --exclude-from=$EXCLUDES $BACKUP "$TARGET" &> $LOG
echo -e "$green:: $reset Sync Complete"
echo -e "$green:: $reset log saved to $LOG"
