#!/usr/bin/env python

import sys
import fileinput
import os
import re

def replace_in_file(file_path, search_text, new_text):
    with fileinput.input(file_path, inplace=True) as file:
        for line in file:
            new_line = line.replace(search_text, new_text)
            print(new_line, end='')

CONFIG_FILE_NAME = "foot.ini"
CONFIG_FILE_DIR = os.path.expanduser("~/.config/foot/")
CONFIG_FILE_PATH = os.path.join(CONFIG_FILE_DIR, CONFIG_FILE_NAME)


lastinc=""
newinclude=""
with open(CONFIG_FILE_PATH, "r") as config_file:
    file_content = config_file.read()
    #search for include=/usr/share/foot/themes/
    myword="include=/usr/share/foot/themes/"
    first=file_content.split(myword,1)[1]
    last=first.split("\n",1)[0]
    lastinc="include=/usr/share/foot/themes/"+last

    #remove all lines below
    
    if last=="tempus-night":
        newinclude="include=/usr/share/foot/themes/selenized-white"
    else:
        newinclude="include=/usr/share/foot/themes/tempus-night"


replace_in_file(CONFIG_FILE_PATH, lastinc, newinclude)
