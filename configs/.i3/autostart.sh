#!/bin/bash
# i3 autostart
# ============
#
# used to setup mouse and keyboard etc
#
# set hardware settings for keyboard and mouse
#xset m 1 1
## settings for SteelSeries Kana v2 Gaming Mouse
#xinput --set-prop "SteelSeries Kana v2 Gaming Mouse" "Device Accel Velocity Scaling" 1
#xinput --set-prop "SteelSeries Kana v2 Gaming Mouse" "Device Accel Profile" -1
### for some reason above variables removed / changed
### ref: https://www.x.org/wiki/Development/Documentation/PointerAcceleration/
### ref: https://wayland.freedesktop.org/libinput/doc/latest/pointer-acceleration.html
### using "AccelProfile" "flat" for libinput
xinput --set-prop "SteelSeries Kana v2 Gaming Mouse" "libinput Accel Speed" -0.2
###
## settings for Razer BlackWidow 2013
setxkbmap -layout 'gb' -model 'pc105'
## settings for us keyboard layout (filco tenkeyless)
#setxkbmap -layout 'us'
# remap right menu key to function as start key
xmodmap -e "keycode 135 = Super_R NoSymbol Super_R"
# set amd gpu fanspeed
# aticonfig --pplib-cmd "set fanspeed 0 65"
# set hardware accel for VDPAU to nvidia
export VDPAU_DRIVER=nvidia
# set nvidia gpu fanspeed
nvidia-settings -a "[gpu:0]/GPUFanControlState=1" -a "[fan:0]/GPUTargetFanSpeed=55"
#
### custom key codes for extended functions
# recorded using xev
# blackwidow extended keys
# M1 = 191, M2 = 192, M3 = 193, M4 = 194, M5 = 195
