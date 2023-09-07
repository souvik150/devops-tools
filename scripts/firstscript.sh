#! /bin/bash

##### THIS SCRIPT GIVES SYSTEM INFO #####

echo "Welcome to bash script"
echo

echo "####################################"
echo "Uptime of system is:"
uptime

echo "####################################"
echo "Memory Utilization"
free -m

echo "####################################"
echo "Disk Utilization"
df -h

echo "####################################"
current_date=$(date +%Y-%m-%d)
echo "Today's date is $current_date"

result=$((2 + $(echo 3)))
echo "Result: $result"