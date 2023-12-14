# Change this according to your device
################
# Variables
################

# Keyboard input name
keyboard_input_name="1:1:AT_Translated_Set_2_keyboard"

# Date and time
date_and_week=$(date "+%Y/%m/%d (w%-V)")
current_time=$(date "+%H:%M")

#############
# Commands
#############

# Battery or charger
#battery_charge=$(upower --show-info $(upower --enumerate | grep 'BAT') | egrep "percentage" | awk '{print $2}')
battery_charge=$(echo $($HOME/.config/waybar/checkbatswaybar.py) "% bat")
battery_status=$(upower --show-info $(upower --enumerate | grep 'BAT') | egrep "state" | awk '{print $2}')

# Audio and multimedia
audio_volume=$(echo "Volume : $(pactl list sinks | rg front-left: | awk '{print $5}' | tail -1)")
#audio_is_muted=$(pactl list sinks short | grep RUNNING | awk '{print $1}'` --get-mute)

cpu_temp=$(echo $(sensors | grep "Package id 0" | awk '{print $4}' | cut -c 2-3) "C ")
cpu_usage=$(echo "Cpu" $(mpstat 1 1 | awk '/Average:/ {print 100-$NF"%"}'))

# Network
network=$(ip route get 1.1.1.1 | grep -Po '(?<=dev\s)\w+' | cut -f1 -d ' ')
# interface_easyname grabs the "old" interface name before systemd renamed it
interface_easyname=$(dmesg | grep $network | grep renamed | awk 'NF>1{print $NF}')
ping=$(ping -c 1 www.google.es | tail -1| awk '{print $4}' | cut -d '/' -f 2 | cut -d '.' -f 1)

# Others
language=$(swaymsg -r -t get_inputs | awk '/1:1:AT_Translated_Set_2_keyboard/;/xkb_active_layout_name/' | grep -A1 '\b1:1:AT_Translated_Set_2_keyboard\b' | grep "xkb_active_layout_name" | awk -F '"' '{print $4}')
loadavg_5min=$(cat /proc/loadavg | awk -F ' ' '{print $2}')
ram_usage=$(echo "Mem: "$(cat /proc/meminfo | sed -n '2 p'  | awk '{print $2, $3}'))

brightness=$(echo "Brightness: "$(light -G))
# Removed weather because we are requesting it too many times to have a proper
# refresh on the bar
#weather=$(curl -Ss 'https://wttr.in/Pontevedra?0&T&Q&format=1')

if [ $battery_status = "discharging" ];
then
    battery_pluggedin='⚠'
else
    battery_pluggedin='⚡'
fi

if ! [ $network ]
then
   network_active="⛔"
else
   network_active="⇆"
fi
echo "⌨ $language | $network_active $interface_easyname ($ping ms) | 🏋 $loadavg_5min | $brightness| $battery_pluggedin $battery_charge | $ram_usage | $cpu_temp| $cpu_usage|  $date_and_week 🕘 $current_time"
