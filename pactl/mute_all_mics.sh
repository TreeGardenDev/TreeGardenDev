#!/bin/bash
#
VOLUME='-1%'

#pactl list sinks short
#pactl list sinks short | awk '{print $2}'
for SINK in $(pactl list sources short | awk '{print $2}')
do
  pactl set-source-mute $SINK toggle
done
