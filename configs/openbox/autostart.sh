# openbox startup
# ======= =======
# equk.co.uk

# xscreensaver
xscreensaver -no-splash &
# start thunar daemon for mounting etc
thunar --daemon &
# little numlock tool
numlockx &
# parcellite clipboard tool
parcellite -n &
#kupfer launcher
kupfer --no-splash &
# skippy-xd
skippy-xd &

# set display orientation
##xrandr --output DFP2 --auto --primary --left-of DFP3
# set composite settings
#xcompmgr -cfF -r7 -o.65 -l-10 -t-8 -D7 &
compton &
# fix mouse acceleration
sleep 1 && xset m 1 1
# tint2 panel
sleep 1 && tint2 &
# set desktop background
nitrogen --restore &
# start conky clock
sleep 2 && conky -q -c ~/.conkyclock &
# start conky cpu stats
sleep 2 && conky -q -c ~/.conkystats &
# start conky cpu clock
sleep 2 && conky -q -c ~/.conkycpu &
# start email client
# thunderbird with thunderbird-firetray auto-minimize
thunderbird &
# set keyboard map as xorg.conf dont work
setxkbmap -layout 'gb' -model 'pc105'
# set DE to XFCE to fix thunar
export DE=xfce
# remove annoying WINE open with items
rm -fr ~/.local/share/applications/wine-extension* &
# sync chrome cache to ramdisk
sleep 4 && $HOME/scripts/ramdisk_chromium.sh &
# cleanup chrome HTML5 storage
rm -fr ~/.config/chromium/Default/File\ System/ &
# setup wacom devices to main monitor to fix scaling
# used for dual monitor setup
xsetwacom --set 8 MapToOutput "DFP2"
xsetwacom --set 13 MapToOutput "DFP2"
xsetwacom --set 14 MapToOutput "DFP2"
