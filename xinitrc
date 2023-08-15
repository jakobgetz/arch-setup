qtile start &
xrandr --newmode "2880x1800_60.00"  442.00  2880 3104 3416 3952  1800 1803 1809 1865 -hsync +vsync
xrandr --addmode Virtual-1 "2880x1800_60.00"
xrandr --output Virtual-1 --mode "2880x1800"
setxkbmap -model macintosh -layout de
alacritty
