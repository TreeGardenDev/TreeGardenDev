#!/bin/python
#####Find battery discharge rate#####
import time
def get_batteries():
    bat0 = open('/sys/class/power_supply/BAT0/energy_now', 'r')
    bat1 = open('/sys/class/power_supply/BAT1/energy_now', 'r')
    return bat0, bat1

bat0first, bat1first = get_batteries()
totalfirst = int(bat0first.read()) + int(bat1first.read())
time.sleep(10)

bat0second, bat1second = get_batteries()
totalsecond = int(bat0second.read()) + int(bat1second.read())

rate= (totalfirst - totalsecond)/10#energy/seconds
rateperhrs=rate*3600
retpercentage=None
if rate>0.00:
    #print(totalsecond/rateperhrs)
    retpercentage=totalsecond/rateperhrs
else:
    #print("0")
    retpercentage=0

#PRINT AS JSON in following format {"text": "$text", "tooltip": "$tooltip", "class": "$class", "percentage": $percentage }
print('{"text": "Rate of Decline", "tooltip": "Rate of Decline", "class": "Rate of Decline", "percentage": %s }' % (str(rateperhrs), str(rateperhrs), "discharging", retpercentage))


