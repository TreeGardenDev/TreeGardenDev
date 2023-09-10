#!/bin/bash
#
VOLUME='-1%'

#pactl list sinks short
#pactl list sinks short | awk '{print $2}'
for SINK in $(pactl list sinks short | awk '{print $2}')
do
  pactl set-sink-volume $SINK $VOLUME
done
