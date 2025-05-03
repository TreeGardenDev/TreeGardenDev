#!/bin/python

#get the battery status from  sys/class/power_supply/BAT1/energy_now
bat0 = open('/sys/class/power_supply/BAT0/energy_now', 'r')
bat0= int(bat0.read())
bat1 = open('/sys/class/power_supply/BAT1/energy_now', 'r')
bat1= int(bat1.read())

bat0full = open('/sys/class/power_supply/BAT0/energy_full', 'r')
bat0full=int(bat0full.read())
bat1full = open('/sys/class/power_supply/BAT1/energy_full', 'r')
#Adjust to account for the 93% full issue on some batteries
bat1full=int(bat1full.read())

bat0five=int(bat0full)*.05
bat1full80=int(bat1full)*.8
bat1five=int(bat1full)*.05
bat5five=int(bat0five+bat1five)

total = ((bat0 + (bat1))-bat5five) / ((bat0full + (bat1full))-bat5five) * 100
#take to 2 decimal places
total = round(total, 2)
#print(total)
#return the value in json such as {"text": "$text", "tooltip": "$tooltip", "class": "$class", "percentage": $percentage }

discharging=None
discharging0= open('/sys/class/power_supply/BAT0/status', 'r')
discharging1= open('/sys/class/power_supply/BAT1/status', 'r')
if discharging0.read() == "Discharging\n" or discharging1.read() == "Discharging\n":
    discharging="Discharging"
else:
    discharging="Charging"



#result = '{"text": "' + str(total) + '%", "tooltip": "Battery ' + str(total) + '%, '+discharging+'", "class": "battery", "percentage": ' + str(total) + '}'
result = '{"percentage": ' + str(total) + ',"discharging":"'+discharging+'", "text":"'+str(total)+'","tooltip": "Battery ' + str(total) + '%, '+discharging+'" }'


print(result)
#print (total)
