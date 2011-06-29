#!/bin/bash
#
# sync pacman with external drive
#
# syntax - pac_migrate.sh /path/to/drive
#
# note: make sure you do not leave a trailing /
#
# to install packages on new system:
#     cp -fr /path/to/drive/pacman/pkg /var/cache/pacman/
#     chmod -R 644 /var/cache/pacman/pkg
#     chmod 755 /var/cache/pacman/pkg
#     pacman-db-upgrade
#     pacman -Sy
#     xargs -a Packages pacman -S --noconfirm --needed
#
#
# www.equk.co.uk

# Colors
blue="\033[1;34m"
green="\033[1;32m"
red="\033[1;31m"
bold="\033[1;37m"
reset="\033[0m"

BACKUP=/var/cache/pacman/pkg
TARGET=$1/pacman
LOG=/home/$USER/scripts/backup_pacman/log.txt
echo -e "$blue:: $reset Starting Sync Process to: $TARGET"
# check if backup dir exists
if [[ ! -e "$TARGET" ]]; then
            mkdir -p "$TARGET"
fi
# run sync
rsync -av --delete $BACKUP "$TARGET" &> $LOG
echo -e "$green:: $reset Sync Complete"
echo -e "$green:: $reset log saved to $LOG"
# create lists of installed packages
echo -e "$blue:: $reset Saving list of installed packages to: $TARGET/Packages"
pacman -Qqe | grep -vx "$(pacman -Qqm)" > "$TARGET/Packages"
echo -e "$blue:: $reset Saving list of installed packages to: $TARGET/Packages.aur"
pacman -Qqm > "$TARGET/Packages.aur"
echo -e "$green:: $reset All Operations Complete"
