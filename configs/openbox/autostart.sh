# openbox startup
# ==========
# equk.co.uk

# xscreensaver
xscreensaver -no-splash &
# start thunar daemon for mounting etc
thunar --daemon &
# little numlock tool
numlockx &
# parcellite clipboard tool
parcellite &
#set nvidia settings
nvidia-settings --load-config-only
# fix mouse acceleration
sleep 2 && xset m 1 1
# tint2 panel
sleep 2 && tint2 &
# set desktop background
##eval `cat $HOME/.fehbg` &
nitrogen --restore &
# start conky
sleep 3 && conky -q &
# start conky cpu clock
sleep 3 && conky -q -c ~/.conkycpu &
# start tilda console
# quake style tilda to activate
sleep 4 && tilda &
# start composite manager for effects
##xcompmgr -cfF -r7 -o.65 -l-10 -t-8 -D7 &
#cairo-compmgr &
# set keyboard map as xorg.conf dont work
setxkbmap -layout 'gb' -model 'pc105'
# set DE to XFCE to fix thunar + chromium
export DE=xfce
# start uzbl twitter client
# sleep 5 && uzbl-browser mobile.twitter.com &
# sync google chrome to ramdisk - also in crontab
/usr/local/bin/chrome-sync &

