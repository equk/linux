#!/bin/bash
#
#*****************************************************************
#     chkroot - equk.co.uk
#*****************************************************************
# Copyright (C) 2014  Bradley Walden
# This program comes with ABSOLUTELY NO WARRANTY.
# This is free software, and you are welcome to redistribute it
# under certain conditions. See GNU GPLv3.
#*****************************************************************
# This script was made to be used via cron on servers
# It can also be run on a desktop.
#
# There are extended options at the bottom for sending email to
# server administrator enabling you to leave it as a cron job
#
# Dependencies: rkhunter
#*****************************************************************
#
# Example Cronjob (daily at 23:59):
# 59  23    *   *  *    /root/scripts/chkroot.sh > /dev/null
#

# VARIABLES

# log location
log=~/rkhunter.log

# Colors
blue="\033[1;34m"
green="\033[1;32m"
red="\033[1;31m"
bold="\033[1;37m"
reset="\033[0m"

gplus="[$green+$reset]"
bplus="[$blue+$reset]"

# SCRIPT

# Check for root
if [ $(whoami) != "root" ]; then
    echo -e $red"error:$reset you cannot perform this operation unless you are root."
    exit 1
fi

[ -d $log ] || touch $log

# clear log
echo "==[ `date +%d-%m-%Y` ]==" > $log

# execute scan
echo -e "$bplus starting rkhunter check ..."
(/usr/bin/rkhunter --versioncheck --nocolors
/usr/bin/rkhunter --update --nocolors
/usr/bin/rkhunter --cronjob --nocolors --report-warnings-only) &>> $log
echo -e "$gplus rkhunter scan complete please see log located $log "


#EXTENDED OPTIONAL FUNCTIONS
# == mail the log ==
# mail -s "rootkit check log for `date +%d-%m-%Y`" admin@mailserver.com
# echo -e "$gplus mailing rkhunter log to administrator"
