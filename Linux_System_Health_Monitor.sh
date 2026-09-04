#!/bin/bash

CPU=$(top -bn1 | awk '/Cpu\(s\)/{print 100 - $8}')
memory_usage=free | awk '/Mem:/ {printf "%.0f%%", ($2-$7)/$2*100}' 
DISK=$(df -h / | awk 'NR==2 {print $5}')

echo "                                     "
echo "============SYSTEM HEALTH============"

echo "                                     "
echo "Hostname             : $(hostname) "
echo "OS                   : $(. /etc/os-release && echo "$PRETTY_NAME")"
echo "Uptime               : $(uptime -p)"
echo "CPU Usage            : $CPU%"
echo "Memory Usage         : $memory_usage"
echo "Disk Usage           : $DISK"
echo "Logged Users         : $(who | wc -l)"
echo "Running Procs        : $(ps aux | wc -l)"

echo "                                      "
echo "======================================"
