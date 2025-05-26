#!/usr/bin/python3

##Purpose: List all execuatble desktop applications in the system
import subprocess

desktop_dict= {}
def get_desktop_files():
    """
    Get a list of all .desktop files in the system.
    """
    import os
    import glob
    # Get the list of all .desktop files in the system
    desktop_files = []
    for path in ['/usr/share/applications', '/usr/local/share/applications', os.path.expanduser('~/.local/share/applications')]:
        desktop_files.extend(glob.glob(os.path.join(path, '*.desktop')))
    return desktop_files

def parse_desktop_file(file_path):
    """
    Parse a .desktop file and return the name and command.
    """
    import configparser
    config = configparser.ConfigParser(interpolation=None)
    config.read(file_path)

    config.read(file_path)
    # Get the name and command from the .desktop file
    try:
        name = config.get('Desktop Entry', 'Name')

        #get the executable
        #before parsing the command, we need to check if the Exec field is present
        if 'Exec' not in config['Desktop Entry']:
            return None, None
        #Protest for cases where there are spaces and % in the exec string, do before parsing
        #strip out %u
        #if the file is Terminal=true, we need to run the command in a terminal

        command = config.get('Desktop Entry', 'Exec').replace('%u', '').replace('%U', '').replace('%f', '').replace('%F', '').strip()
        if 'Terminal' in config['Desktop Entry'] and config.getboolean('Desktop Entry', 'Terminal'):
            command = f"alacritty -e {command}"
        #if the 
        
        
        return name, command
    finally:
        #Closed
        a=1
def show_all_applications():
    """
    Show all applications in the desktop_dict via fzf
    """
    echo_string = []
    for name, command in desktop_dict.items():
        echo_string.append(str(name))

    result = subprocess.run(["fzf", "--layout=reverse-list", "--border=rounded", "--border-label='Fuzzy Spotify'"], input=" \n".join(echo_string), text=True, capture_output=True)
    result=result.stdout.strip()

    execute=desktop_dict[result]
    print(execute)
    _=run_executable(execute)



def run_executable(command):
    """
    Run the given command and return the output.
    """
    import subprocess
    # Run the command and get the output
    #result = subprocess.run(command, shell=True, capture_output=True, text=True)
    #run the comman xargs -r swaymsg exec --
    result = subprocess.run(['xargs', '-r', 'swaymsg', 'exec', '--'], input=command, text=True, capture_output=True)

    return result.stdout
def main():
    files= get_desktop_files()
    for file in files:  
        name, command = parse_desktop_file(file)
        desktop_dict[name] = command
    show_all_applications()

    
if __name__ == "__main__":
    main()
