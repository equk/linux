#!/bin/bash
#
# sync chrome profile to ramdisk on /tmp with seperate user profiles
#
# www.equk.co.uk
STATIC=chrome
LINK=chromium
PROFILE=/tmp/$USER/chromium

cd ~/.config/

[[ -r $PROFILE ]] || install -dm700 $PROFILE

if [[ `readlink $LINK` != $PROFILE ]]; then
  mv $LINK $STATIC
  ln -s $PROFILE $LINK
fi

if [[ -e $LINK/.unpacked ]]; then
  rsync -av --delete --exclude .unpacked ./$LINK/ ./$STATIC/
else
  rsync -av ./$STATIC/ ./$LINK/
  touch $LINK/.unpacked
fi
# cleanup google history cache (remove previous months)
# also remove the database of safebrowsing
rm -fr ~/.config/chromium/Safe*
rm -fr ~/.config/chromium/Default/History\ Index*
