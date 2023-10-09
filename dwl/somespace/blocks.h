//Modify this file to change what commands output to your statusbar, and recompile using the make command.
static const Block blocks[] = {
	/*Icon*/	/*Command*/		/*Update Interval*/	/*Update Signal*/
    {"Usage: ", "(iostat -c | awk '{print $1+$3}'  | sed -n '4 p')",10,0},
    {"Temp ", "(sensors | grep CPU | awk '{print $2}')"},
    {"Volume : ", "(pactl list sinks | rg front-left: | awk '{print $5}' | tail -1)", 1,0},
	{"Mem:", "free -h | awk '/^Mem/ { print $3\"/\"$2 }' | sed s/i//g",	30,		0},
    {"Battery: ", "~/.local/bin/checkboth", 5,0},
	{"", "date '+%b %d (%a) %I:%M%p'",					5,		0},
};

//sets delimeter between status commands. NULL character ('\0') means no delimeter.
static char delim[] = " | ";
static unsigned int delimLen = 5;
