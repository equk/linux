#!/bin/bash
#
# simple disk io test script
# can be used to check IO on VPS' etc
#
# blog.equk.co.uk
# ﻿                                                  
#                                      -oo-         
#                                      +MMo         
#      .:+o+:`   `:+o/-+o+  +oo`  ooo  +MMo .oo+.   
#     oNNs+hMd- :mMmyydMMm  mMM`  MMM  +MMs/mMh:    
#    :MMmyyhMMy mMM-  .MMm  mMM`  MMM  +MMmNMh`     
#    -NMmo//++- hMMo..+MMm  dMM/.:MMM  +MMd+NMd-    
#     :ymmmmdh` .smNmdyMMm  -dNNmhhMN  +MMo :mMN+   
#       `...``    `..``MMm   ``.` `..  `..`  `...   
#                     `NNd                          
#                                                   

# Colors
blue="\033[1;34m"
green="\033[1;32m"
red="\033[1;31m"
bold="\033[1;37m"
reset="\033[0m"

# exec tests
cname=$( awk -F: '/model name/ {name=$2} END {print name}' /proc/cpuinfo )
cores=$( awk -F: '/model name/ {core++} END {print core}' /proc/cpuinfo )
freq=$( awk -F: ' /cpu MHz/ {freq=$2} END {print freq}' /proc/cpuinfo )
tram=$( free -m | awk 'NR==2 {print $2}' )
swap=$( free -m | awk 'NR==4 {print $2}' )
up=$(uptime|awk '{ $1=$2=$(NF-6)=$(NF-5)=$(NF-4)=$(NF-3)=$(NF-2)=$(NF-1)=$NF=""; print }')

# show output
echo "CPU model : $cname"
echo "Number of cores : $cores"
echo "CPU frequency : $freq MHz"
echo "Total amount of ram : $tram MB"
echo "Total amount of swap : $swap MB"
echo "System uptime : $up"

# run disk IO test
io=$( ( dd if=/dev/zero of=test_$$ bs=64k count=6k conv=fdatasync && rm -f test_$$ ) 2>&1 | awk -F, '{io=$NF} END { print io}' )
echo "I/O speed : $io"
date
