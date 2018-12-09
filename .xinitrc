if [ -d /etc/X11/xinit/xinitrc.d ] ; then
    for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
        [ -x "$f" ] && . "$f"
    done
    unset f
fi

xrdb .Xresources
xset -dpms
xset -b
xset s off
numlockx &
compton -b --config .compton.conf
redshift &
xscreensaver -nosplash &
feh --bg-scale bg/whale.jpg
exec i3
