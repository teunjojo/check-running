#!/bin/bash
version=1.3

lib="libteunjojo"
[ ! -f "$lib.sh" ] && curl -s -o $lib.sh https://files.teunjojo.com/$lib/latest/$lib.sh && chmod +x $lib.sh
source $lib.sh

[ -z "$delay" ] && echo '# After how many minutes of it being offline. Do you need to be notified?' >> $conf && echo '# At least 1 minute.' >> $conf && echo delay=5 >> $conf
[ -z "$minecraftScreen" ] && echo '# The screen name of minecraft' >> $conf && echo minecraftScreen=minecraft >> $conf
[ -z "$proxyScreen" ] && echo '# The screen name of your proxy' >> $conf && echo proxyScreen=proxy >> $conf
[ -z "$minecraftLastRunning" ] && echo minecraftLastRunning=1 >> $cache
[ -z "$minecraftReportedOffline" ] && echo minecraftReportedOffline=1 >> $cache
[ -z "$proxyLastRunning" ] && echo proxyLastRunning=1 >> $cache
[ -z "$proxyReportedOffline" ] && echo proxyReportedOffline=1 >> $cache
source $conf
source $cache

delay=$((delay - 1))

min=$(($(($(date +%s)-minecraftLastRunning))/60))
hour=$((min/60))
day=$((hour/24))
if ls -laR /var/run/screen/ | grep -q "$minecraftScreen"; then
  cache minecraftLastRunning "$(date +%s)"
  cache minecraftReportedOffline 0
elif [ $min -gt '4' ]; then
  if [[ $minecraftReportedOffline = 0 ]]; then
    if [ $hour ]; then min=$((min-hour*60)); fi
    if [ $day ]; then hour=$((hour-day*24)); fi
    offlineTime="$min minute$([ $min != "1" ] && echo s)"
    if ! [ $hour = 0 ]; then offlineTime="$hour hour$([ $hour != "1" ] && echo s) and $offlineTime"; fi
    if ! [ $day = 0 ]; then offlineTime="$day day$([ $day != "1" ] && echo s), $offlineTime"; fi
    pushover "Minecraft Server Offline!" "Minecraft has been offline for over $offlineTime"
    cache minecraftReportedOffline 1
  fi
fi
min=$(($(($(date +%s)-proxyLastRunning))/60))
hour=$((min/60))
day=$((hour/24))

if ls -laR /var/run/screen/ | grep -q "$proxyScreen"; then
  cache proxyLastRunning "$(date +%s)"
  cache proxyReportedOffline 0
elif [ $min -gt '4' ]; then
  if [[ $proxyReportedOffline = 0 ]]; then
    if [ $hour ]; then min=$((min-hour*60)); fi
    if [ $day ]; then hour=$((hour-day*24)); fi
    offlineTime="$min minute$([ $min != "1" ] && echo s)"
    if ! [ $hour = 0 ]; then offlineTime="$hour hour$([ $hour != "1" ] && echo s) and $offlineTime"; fi
    if ! [ $day = 0 ]; then offlineTime="$day day$([ $day != "1" ] && echo s), $offlineTime"; fi
    pushover "Proxy Offline!" "Proxy has been offline for over $offlineTime"
    cache proxyReportedOffline 1
  fi
fi
