# openbox startup
# ==========
# equk.co.uk

# Make GTK apps look and behave how they were set up in the gnome config tools
if test -x /usr/libexec/gnome-settings-daemon >/dev/null; then
  /usr/libexec/gnome-settings-daemon &
elif which gnome-settings-daemon >/dev/null; then
  gnome-settings-daemon &
fi

# xscreensaver
xscreensaver -no-splash &
# start thunar daemon for mounting etc
thunar --daemon &
# little numlock tool
numlockx &
# parcellite clipboard tool
parcellite -n &
# fix mouse acceleration
sleep 2 && xset m 1 1
# pypanel
#sleep 2 && pypanel &
# tint2
sleep 2 && tint2 &
# set desktop background
eval `cat $HOME/.fehbg` &
# start conky
sleep 3 && conky &
# start composite manager for effects
# xcompmgr -cfF -r7 -o.65 -l-10 -t-8 -D7 &
# set keyboard map as xorg.conf dont work
setxkbmap -layout 'gb' -model 'pc105'

