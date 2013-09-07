#!/bin/sh
# Rootkit Check
# ver 1.0
# last edit: 14-02-2012
# (dd-mm-yyyy)
# equk / B.Walden
#

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

# log location
log='/home/$USER/rkhunter.log'

# clear log
echo "==[ `date +%d-%m-%Y` ]==" > "$log"

# execute scan
echo -e "$blue::$reset Starting rkhunter check"
(/usr/bin/rkhunter --versioncheck --nocolors
/usr/bin/rkhunter --update --nocolors
/usr/bin/rkhunter --cronjob --nocolors --report-warnings-only) &>> "$log"
echo -e "$green::$reset rkhunter scan complete please see log located $log "

# mail the log
# su -c "echo see attached | mutt -s \"Root Kit Check\" -a \"$log\" -- user@gmail.com" username
# echo -e "$blue:: mailing rkhunter log to administrator $reset"
