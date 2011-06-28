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
parcellite &
# set dual head settings
xrandr --auto --output DVI-1 --left-of DVI-0
# fix mouse acceleration
sleep 2 && xset m 1 1
# tint2 panel
sleep 2 && tint2 &
# set desktop background
nitrogen --restore &
# start conky
sleep 3 && conky -q &
# start conky cpu clock
sleep 3 && conky -q -c ~/.conkycpu &
# set keyboard map as xorg.conf dont work
setxkbmap -layout 'gb' -model 'pc105'
# set DE to XFCE to fix thunar
export DE=xfce
