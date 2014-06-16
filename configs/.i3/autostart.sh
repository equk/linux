#!/bin/bash
# i3 autostart
# ============
#
# used to setup mouse and keyboard etc
#
# set hardware settings for keyboard and mouse
xset m 1 1
setxkbmap -layout 'gb' -model 'pc105'
xinput --set-prop "SteelSeries Kana v2 Gaming Mouse" "Device Accel Velocity Scaling" 1
xinput --set-prop "SteelSeries Kana v2 Gaming Mouse" "Device Accel Profile" -1
# set right start key
xmodmap -e "keycode 135 = Super_R NoSymbol Super_R"
