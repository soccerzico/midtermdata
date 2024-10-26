#!/bin/bash

# Definition of base directory and subdirectory names as an array
dataSubDirectories=("takeoff" "land" "left" "right" "forward" "backward")
baseDirectory="/home/zakiadwan2003/midtermdata/data2"

# Loop through subdirectories
for subDirectory in "${dataSubDirectories[@]}"; do
    directoryPath="${baseDirectory}/${subDirectory}"
    [[ -d "$directoryPath" ]] || continue

    echo "Processing category directory: $directoryPath"

    # Loop through each subdirectory of the category
    for subdir in "$directoryPath"/*; do
        [[ -d "$subdir" ]] || continue
        echo "Processing subdirectory: $subdir"
        counter=1
        # Loop through each sub-subdirectory and rename the files 1-n after shuffling them
        for file in $(find "$subdir" -type f | shuf); do
        newFileName="$subdir/$counter.txt"
        mv "$file" "$newFileName"
        ((counter++))
        done
    done
done




