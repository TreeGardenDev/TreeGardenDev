#!/usr/bin/env python3
import os
file = open("/home/baum/.config/waybar/colormode.txt", "r")

color:str=file.read()

exec_command=""
if color == "light.css":
#~/.config/alacritty/alacritty_colorscheme.py
    exec_command="pkill waybar; waybar -s ~/.config/waybar/dark.css; ~/.config/alacritty/alacritty_colorscheme.py"
    file = open("/home/baum/.config/waybar/colormode.txt", "w")
    file.write("dark.css")
    file.close()


else:
    exec_command="pkill waybar; waybar -s ~/.config/waybar/light.css; ~/.config/alacritty/alacritty_colorscheme.py"
    file = open("/home/baum/.config/waybar/colormode.txt", "w")
    file.write("light.css")
    file.close()

os.system(exec_command)
