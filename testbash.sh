##!/bin/sh
#
##find /usr/share/applications ~/.local/share/applications -name "*.desktop" 2>/dev/null | while read -r desktop_file; do
#fd -e desktop . /usr/share/applications ~/.local/share/applications 2>/dev/null | while read -r desktop_file; do
#    name=$(grep -m 1 '^Name=' "$desktop_file" | cut -d '=' -f 2)
#    exec=$(grep -m 1 '^Exec=' "$desktop_file" | cut -d '=' -f 2 | sed 's/%.//g')
#    
#    if [ -n "$name" ] && [ -n "$exec" ]; then
#        echo "$name|$exec"
#    fi
#done | fzf --border=rounded --border-label="Fuzzy Launcher" --layout=reverse-list --delimiter="|" --with-nth=1 | cut -d "|" -f 2 | xargs -r sh -c
#!/bin/sh

fd -e desktop . /usr/share/applications ~/.local/share/applications 2>/dev/null | while read -r desktop_file; do
    # Extract fields from the .desktop file
    name=$(grep -m 1 '^Name=' "$desktop_file" | cut -d '=' -f 2)
    exec=$(grep -m 1 '^Exec=' "$desktop_file" | cut -d '=' -f 2 | sed 's/%.//g' | awk '{print $1}') # Extract the first word of the Exec command
    no_display=$(grep -m 1 '^NoDisplay=' "$desktop_file" | cut -d '=' -f 2)
    terminal=$(grep -m 1 '^Terminal=' "$desktop_file" | cut -d '=' -f 2)

    # Filter out non-invokable apps
    if [ -n "$name" ] && [ -n "$exec" ] && [ "$no_display" != "true" ] && [ "$terminal" != "true" ] && command -v "$exec" >/dev/null 2>&1; then
        echo "$name|$exec"
    fi
done | fzf --border=rounded --border-label="Fuzzy Launcher" --layout=reverse-list --delimiter="|" --with-nth=1 | cut -d "|" -f 2 | xargs -r sh -c

