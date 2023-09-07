#!/bin/bash

# Prompt the user for input
echo "Choose an option:"
echo "1. Check available RAM"
echo "2. Check free space on the root file system"
echo "3. Check load average"
read choice

# Perform actions based on user input
case $choice in
  1)
    # Get available RAM in megabytes
    free_memory=$(free -m | awk 'NR==2{print $4}')
    echo "Available RAM: $free_memory MB"
    ;;
  2)
    # Get free space on the root file system in human-readable format
    root_free_space=$(df -h / | awk 'NR==2{print $4}')
    echo "Free space on root: $root_free_space"
    ;;
  3)
    # Get load average values using uptime
    load_average=$(uptime | awk -F 'load average: ' '{print $2}')
    echo "Load Average: $load_average"
    ;;
  *)
    echo "Invalid choice. Please enter 1, 2, or 3."
    ;;
esac
