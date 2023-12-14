TRAPUSR1() {
  if [ "$scheme" = "night" ];then
    /path/to/theme.sh dracula
  elif [ "$scheme" = "day" ]; then
    /path/to/theme.sh belafonte-day
  fi
}
