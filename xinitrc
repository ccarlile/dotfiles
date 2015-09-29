#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then

    xrdb -merge ~/.Xresources
#    xrdb -merge $sysresources

fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then

    xrdb -merge "$userresources"

fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

#xrdb -merge ~/.Xresources
# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

#twm &
#xclock -geometry 50x50-1+1 &
#xterm -geometry 80x50+494+51 &
#xterm -geometry 80x20+494-0 &
#exec xterm -geometry 80x66+0+0 -name login
#dualhead.sh

#remove pcspkr
xset -b

#set caps to ctrl
setxkbmap -option ctrl:nocaps

#start xscreensaver
/usr/bin/xscreensaver --no-splash &

#set the background
feh --bg-fill ~/8bit.jpg

#start the policy kit GUI tool
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &

#start xbindkeys (used to lock screen)
xbindkeys

#start the wm
exec i3
