#!/bin/bash

# Check if the script is run as root (needed to change system time)
if [[ $EUID -ne 0 ]]; then
   echo "❌ This script must be run as root (use sudo)" 
   exit 1
fi

while true; do
    echo "⏳ Press ENTER to advance system clock by 1 hour (CTRL+C to exit)..."
    read -r   # Wait for user input

    # Get the current date and add 1 hour
    NEW_TIME=$(date -d "+1 hour" +"%Y-%m-%d %H:%M:%S")

    # Set the new system time
    sudo date -s "$NEW_TIME"

    echo "✅ System clock updated to: $(date)"
done