#!/bin/bash

# Definition of base directory and subdirectory names as an array
dataSubDirectories=("takeoff" "land" "left" "right" "forward" "backward")
baseDirectory="/home/zakiadwan2003/midtermdata/data"

# Loop through subdirectories
for subDirectory in "${dataSubDirectories[@]}"; do
    directoryPath="${baseDirectory}/${subDirectory}"
    [[ -d "$directoryPath" ]] || continue

    echo "Processing category directory: $directoryPath"

    # Loop through each subdirectory of the category
    for subdir in "$directoryPath"/*; do
        [[ -d "$subdir" ]] || continue
        echo "Processing subdirectory: $subdir"

        # Loop through each sub-subdirectory
        for file in "$subdir"/*; do
            # display each file
               echo "Processing file: $file"
        done
    done
done





