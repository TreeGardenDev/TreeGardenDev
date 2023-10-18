#!/bin/python

governor=open("/sys/devices/system/cpu/cpu0/cpufreq/scaling_governor","r")
value=governor.read()
governor.close()
print (value)
