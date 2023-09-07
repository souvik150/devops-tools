#!/bin/bash

# For loop: Iterating over a list of values
fruits=("apple" "banana" "cherry" "date")

echo "Using a for loop:"
for fruit in "${fruits[@]}"; do
  echo "I like $fruit"
done

# While loop: Counting from 1 to 5
echo "Using a while loop:"
count=1
while [ $count -le 5 ]; do
  echo "Count: $count"
  count=$((count + 1))
done
