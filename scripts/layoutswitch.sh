#!/bin/sh

swaymsg -t get_inputs -r \
  | jq '[.[] | select(.type == "keyboard") | .xkb_active_layout_index][0] - 1 | fabs' \
  | xargs swaymsg 'input type:keyboard xkb_switch_layout'
