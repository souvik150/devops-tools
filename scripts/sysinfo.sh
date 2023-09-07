#!/bin/bash

# Get available RAM in megabytes
free_memory=$(free -m | awk 'NR==2{print $4}')

# Get free space on the root file system in human-readable format
root_free_space=$(df -h / | awk 'NR==2{print $4}')

# Get load average values using uptime
load_average=$(uptime | awk -F 'load average: ' '{print $2}')

# Display the information
echo "Available RAM: $free_memory MB"
echo "Free space on root: $root_free_space"
echo "Load Average: $load_average"
