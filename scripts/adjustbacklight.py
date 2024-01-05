#!/bin/python
import sys
import os

#Take argument from command line
incrementincrease= sys.argv[1]

#open file for reading and writing
currentbrightness = open("/sys/class/backlight/intel_backlight/brightness", "r+")


maxbrightness = open("/sys/class/backlight/intel_backlight/max_brightness", "r")

currenttoint= int(currentbrightness.read())
maxtoint= int(maxbrightness.read())
incrementtoint= int(incrementincrease)
currentpercent= currenttoint / maxtoint * 100
totalpercent= (currenttoint/maxtoint * 100) + incrementtoint


brightnessnew= totalpercent * maxtoint / 100

if brightnessnew > maxtoint:
    brightnessnew = maxtoint
if brightnessnew< 0:
    brightnessnew = 0

#use system command echo
system="echo " + str(int(brightnessnew)) + " > /sys/class/backlight/intel_backlight/brightness"

os.system(system)
