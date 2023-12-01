#!/bin/fish
###Purpose: Change $scheme to day or night and uses theme.sh to change dynamically

if test "$scheme" = "day"
    set -U scheme "night"
    #echo "Changing to Night Scheme"
    theme.sh gruvbox-dark-hard
else
    set -U scheme "day"
    #echo "Changing to Day Scheme"
    theme.sh windows-nt-light
end
