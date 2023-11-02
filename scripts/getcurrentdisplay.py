#purpose: return current focused display from sway
import sys
import os
import subprocess

#def getcurrentdisplay():
#    display = os.popen("swaymsg -t get_outputs | grep -oP '(?<=focused\":\s\").*(?=\")'").read()
#    print(display)
#def getcurrentworkspace():
#    #workspace = os.popen("swaymsg -rt get_workspaces | grep -B 47 -A2 'focused\": true'")
#    #workspace=subprocess.call(['swaymsg', '-rt', 'get_workspaces', '|', 'grep', '-B', '47', '-A2', '\'focused\": true\''])
#    workspace = subprocess.Popen("swaymsg -rt get_workspaces | grep -B 47 -A2 'focused\": true'", stdout=subprocess.PIPE, shell=True)
#    print(workspace)

if __name__ == "__main__":
    #workspace = subprocess.Popen("swaymsg -rt get_workspaces | grep -B 47 -A2 'focused\": true'", stdout=subprocess.PIPE, shell=True)
    workspace = os.popen("swaymsg -rt get_workspaces | grep -B 47 -A2 'focused\": true'")
    print(workspace)
