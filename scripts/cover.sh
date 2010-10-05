#!/bin/bash
# Script to use with conky to display cover art. You should modify
# the path to the directory containing the album art

# Array to extract the necessary data from MPD running on another
# system than localhost, in one call to save your CPU. Thanks to 
# bruenig for pointing me to what bash - yet again - can do here
IFS=$'\t' mpd_array=( $(MPD_HOST=archlinux MPD_PORT=6600 mpc --format "\t%artist%\t%album%\t") )

# Link the cover into /tmp so the conky cover instance can pick it up
# Make sure we don't relink all the time, it's a waste of CPU cycles
# and SSD memory cells
if [[ ! -f /tmp/"${mpd_array[1]}".album ]] ; then
  rm -f /tmp/*.album &>/dev/null
  >/tmp/"${mpd_array[1]}".album
#  ln -sf ~/.covers/*"${mpd_array[1]}.jpg" /tmp/cover.jpg || ln -sf ~/.covers/"${mpd_array[0]} - ${mpd_array[1]} 300.jpg" /tmp/cover.jpg
echo "${mpd_array[1]}.jpg" > ~/scripts/test.txt
fi
