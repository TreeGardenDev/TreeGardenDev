#!/bin/sh

# Use fd to find all .desktop files and extract the Name and Exec fields
fd -e desktop . /usr/share/applications ~/.local/share/applications 2>/dev/null | while read -r desktop_file; do
    # Extract the Name and Exec fields
    name=$(grep -m 1 '^Name=' "$desktop_file" | cut -d '=' -f 2)
    exec=$(grep -m 1 '^Exec=' "$desktop_file" | cut -d '=' -f 2 | sed 's/%.//g')
    
    # Only display if both fields are present
    if [ -n "$name" ] && [ -n "$exec" ]; then
        echo "$name|$exec"
    fi
done | fzf --delimiter="|" --with-nth=1 | cut -d "|" -f 2 | xargs -r swaymsg exec --
