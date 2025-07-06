#!/bin/sh

#Author: Karl Franz
#License GNU GPL v3
#Project link: https://github.com/KarlFranz-64/bachd

#Checking the presence of chdman in the system
if ! command -v chdman &> /dev/null; then
    echo "chdman not found in PATH. Please make sure the mame-tools package is installed."
    exit 1
fi

#Compressing .cue images to .chd while preserving original names
for file in *.cue; do
    if [ -f "$file" ]; then
        base=${file%.cue}

        echo "Compressing $file to ${base}.chd"
        chdman createcd -i "$file" -o "${base}.chd"

        if [ -f "${base}.chd" ]; then
            echo "Compression complete. ${base}.chd created."
        else
            echo "File compression error $file. Please make sure the image is not damaged."
        fi
    fi
done

#Compressing .iso images to .chd while preserving original names
for file in *.iso; do
    if [ -f "$file" ]; then
        base=${file%.iso}

        echo "Compressing $file to ${base}.chd"
        chdman createcd -i "$file" -o "${base}.chd"

        if [ -f "${base}.chd" ]; then
            echo "Compression complete. ${base}.chd created."
        else
            echo "File compression error $file. Please make sure the image is not damaged."
        fi
    fi
done

#Notification
echo "Compression complete."
