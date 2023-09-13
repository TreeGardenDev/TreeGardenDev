#!/bin/python

import os

#get the battery status from  sys/class/power_supply/BAT1/energy_now
bat0 = open('/sys/class/power_supply/BAT0/energy_now', 'r')
bat1 = open('/sys/class/power_supply/BAT1/energy_now', 'r')
bat0full = open('/sys/class/power_supply/BAT0/energy_full', 'r')
bat1full = open('/sys/class/power_supply/BAT1/energy_full', 'r')
total = (int(bat0.read()) + int(bat1.read())) / (int(bat0full.read()) + int(bat1full.read())) * 100
#take to 2 decimal places
total = round(total, 2)

print (total)
