#!/bin/bash

# Check if the directory path is provided
if [ $# -eq 0 ]; then
    echo "Usage: $0 [relative_time]"
    echo "Example: $0 10hrs"
    exit 1
fi

# Set default relative time to 40 hours if no argument is passed
relative_time=${1:-40hrs}

# Directory path for audio files
audio_dir="/data/audios/"

# Log file name with date
log_file="deleted-files-$(date '+%d-%m-%Y').log"

# Delete audio files older than the specified relative time
deleted_files=()
while IFS= read -r file; do
    creation_time=$(stat -c "%z" "$file")  # Get creation time of the file
    current_time=$(date -Ins)  # Get current time in ISO format
    rm "$file"  # Delete the file
    deleted_files+=("$file $creation_time $current_time")
done < <(find "$audio_dir" -name "*.wav" -type f -mmin +"$(date -d "now - $relative_time" +"%s")")

# Write deleted file details to log file
echo "Audio File Deletion Log - $(date '+%d-%m-%Y %H:%M:%S')" > "$log_file"
for deleted_file in "${deleted_files[@]}"; do
    echo "$deleted_file" | awk '{printf "%s %s %s\n", $1, $2, $3}' >> "$log_file"
done
