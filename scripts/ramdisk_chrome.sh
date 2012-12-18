#!/bin/bash
#
# google chrome cache to ramdisk script
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

# notes: ramdisks can be mounted in various ways depending on the distro
#
# eg: using the ramdisk_size kernel param mounts a ramdisk to /tmp/ram/
# the default setup for this script is using /tmp/ as this is a ramdisk by default on archlinux
#
# if needed you can specify a ramdisk at your own location
#
# for more information visit my website

# VARIABLES
# =========

# specify chrome cache directory
CACHE_DIR=/$HOME/.cache/google-chrome/
# specify ramdisk directory
CHROME_TEMP=/tmp/google-chrome/

# SCRIPT
# ======

# create symlink if temp dir doesn't exist
# tell user if exists for debugging
if [[ -e $CHROME_TEMP ]]; then
  echo 'chrome cache already created on ramdisk at: '$CHROME_TEMP
  else
  rm -fr $CACHE_DIR
  mkdir $CHROME_TEMP
  ln -s $CHROME_TEMP $CACHE_DIR
fi
