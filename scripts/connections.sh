#!/bin/bash
#
# connection stats for internet gateway / proxy
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

# Connection Stats

PORT80=`netstat -nta | grep ESTABLISHED | awk '{ print $5}' | grep -c :80`
PORT443=`netstat -nta | grep ESTABLISHED | awk '{ print $5}' | grep -c :443`

echo 'Current Connection Statistics'
echo "Port 80: $PORT80"
echo "Port 443 SSL: $PORT443"

