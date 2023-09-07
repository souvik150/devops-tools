#!/bin/bash

# Prompt the user for a numerical value
read -p "Enter a numerical value: " value

# Check if the input is a valid number
if ! [[ "$value" =~ ^[0-9]+$ ]]; then
  echo "Invalid input. Please enter a numerical value."
  exit 1
fi

# Perform numerical comparisons
if [ "$value" -gt 10 ]; then
  echo "$value is greater than 10."
elif [ "$value" -eq 10 ]; then
  echo "$value is equal to 10."
else
  echo "$value is less than 10."
fi
