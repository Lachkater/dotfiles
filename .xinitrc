# ------------------------------------------------------
# file:     $HOME/.xinitrc
# author:   Ramon Solis - http://cyb3rpunk.wordpress.com
# modified: February 2011
# vim:fenc=utf-8:nu:ai:si:et:ts=4:sw=4:ft=sh:
# ------------------------------------------------------

# Turn-off C-A-B
setxkbmap -optioN terminate:ctrl_alt_bksp

# Swap Ctrl-CAPS
setxkbmap -option ctrl:swapcaps

# Set keyboard layout
setxkbmap -layout us -variant altgr-intl

# Hide mouse after some idle time
unclutter -idle 5 &

# Disable touchpad clicks while typing
syndaemon -k -t -d -i 1 > /dev/null &

# Load fonts
xset +fp /usr/share/fonts/local  
xset +fp /usr/share/fonts/artwiz-latin1

# Execute MPD
exec $HOME/Scripts/startmpd &

# Load wallpaper
eval `cat $HOME/.fehbg`

# Start urxvt daemon
/usr/bin/urxvtd -q -o -f &

exec $HOME/Scripts/startwmfs
