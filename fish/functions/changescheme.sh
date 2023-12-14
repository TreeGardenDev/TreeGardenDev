#!/bin/fish
###Purpose: Change $scheme to day or night and uses theme.sh to change dynamically

if test "$scheme" = "day"
    set -xU scheme "night";
    theme.sh gruvbox-dark-hard;
else
    set -xU scheme "day";
    theme.sh windows-nt-light;
end
