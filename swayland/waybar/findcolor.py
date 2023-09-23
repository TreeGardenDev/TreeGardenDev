#!/usr/bin/env python3
import os
file = open("/home/baum/.config/waybar/colormode.txt", "r")

color:str=file.read()

exec_command=""
if color == "light.css":
    exec_command="pkill waybar; waybar -s ~/.config/waybar/light.css"
    file.close()


else:
    exec_command="pkill waybar; waybar -s ~/.config/waybar/dark.css"
    file.close()

os.system(exec_command)
