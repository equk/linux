#! /bin/bash
#  Backup script for Archlinux
# 
# 19/12/2009
#
# B.Walden
#
# Use this script to do a system backup to a specified location

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

echo -e "$blue:: $reset Starting the Backup Script..."
echo -e "$blue:: $reset"

echo -e "$blue:: $reset Setting the variables..."

#  The location of the backup tarball.
#  Be sure to include a trailing /
BackupLocation=/home/bradley/backup/

#  The name of the backup tarball.
archive=$BackupLocation$(hostname)-sysbkp.tar.bz2

#  Directories/files that will be exluded from the backup tarball.
#
#  Add directories that will be recursively excluded, delimited by a space.
#  Be sure to omit the trailing /
dir_excludes="/var/log/* /lost+found /srv /home /media /mnt /dev /proc /sys /tmp/* /var/tmp/*"
#
#  Add files that will be excluded, delimited by a space.
#  You can use the * wildcard for multiple matches.
#  There should always be $archive listed or bad things will happen.
file_excludes="$archive"
#
#  Combine the two *-excludes variables into the $excludes variable
excludes="$(for i in $dir_excludes; do if [ -d $i ]; then \
    echo -n " --exclude=$i/*"; fi; done) $(for i in $file_excludes; do \
    echo -n " --exclude=$i"; done)"

#  The options for the backup tarball.
tarOptions="$excludes --create --absolute-names --bzip2 --verbose --totals --file"

echo -e "$blue:: $reset Done!"
echo -e "$blue:: $reset"

#  Creating the backup tarball.
echo -e "$blue:: $reset Creating custom backup tarball \=\=\> $archive"
echo -e "$blue:: $reset"
echo -e "$blue:: $reset Running the following command:"
echo -e "$blue:: $reset tar ${tarOptions} ${archive} /"
tar ${tarOptions} ${archive} /;
echo -e "$blue:: $reset Done!"

#  End
echo -e "$green:: $reset The Backup Script has completed!"
exit 0
