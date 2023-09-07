#!/bin/bash

# Prompt the user for a username
read -p "Enter your username: " username

# Prompt the user for a password (with hidden input)
read -s -p "Enter your password: " password
echo  # Print a newline for better formatting

# Perform authentication (you can replace this with your actual authentication logic)
if [ "$username" == "test" ] && [ "$password" == "test@1234" ]; then
  echo "Authentication successful"
else
  echo "Authentication failed"
fi
