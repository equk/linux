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
kupfer  --no-splash &

# set dual head settings
#xrandr --auto --output DVI-1 --left-of DVI-0
#xrandr --auto --output CRT1 --left-of DFP2
# set composite settings
#xcompmgr -cfF -r7 -o.65 -l-10 -t-8 -D7 &
# fix mouse acceleration
sleep 2 && xset m 1 1
# tint2 panel
sleep 2 && tint2 &
# cairo-dock
#sleep 2 && cairo-dock &
# skippy-xd
#sleep 2 && skippy-xd &
# set desktop background
nitrogen --restore &
# start conky
sleep 3 && conky -q -c ~/.conkystats &
# start conky cpu clock
sleep 3 && conky -q -c ~/.conkycpu &
# set keyboard map as xorg.conf dont work
setxkbmap -layout 'gb' -model 'pc105'
# set DE to XFCE to fix thunar
export DE=xfce
