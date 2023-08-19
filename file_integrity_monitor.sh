#!/bin/bash

# User Input
read -p "Enter the directory path to monitor: " directory
read -p "Enter your email address for alerts: " email

# Initial checksum calculation
declare -A checksums

# Populate initial checksums for existing files
find "$directory" -type f -exec md5sum {} + | while read sum file; do
    checksums["$file"]=$sum
done

# Monitoring Loop
while true; do
    sleep 60  # Adjust the sleep interval as needed

    # Calculate checksums for current files
    find "$directory" -type f -exec md5sum {} + | while read sum file; do
        if [[ "${checksums[$file]}" != "$sum" ]]; then
            # File change detected
            echo "$(date) - File change detected: $file" >> file_change_log.txt

            # Send email alert
            echo "File change detected: $file" | mail -s "Alert: File Change" "$email"

            # Update checksum in the array
            checksums["$file"]=$sum
        fi
    done
done
