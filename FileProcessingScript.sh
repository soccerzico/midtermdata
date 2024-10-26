#!/bin/bash

# Definition of base directory and subdirectory names as an array
dataSubDirectories=("takeoff" "land" "left" "right" "forward" "backward")
baseDirectory="/home/zakiadwan2003/midtermdata/data8"
#replace base directory with applicable path

# Loop through subdirectories
for subDirectory in "${dataSubDirectories[@]}"; do
    directoryPath="${baseDirectory}/${subDirectory}"
    [[ -d "$directoryPath" ]] || continue

    echo "Processing category directory: $directoryPath"

    # Loop through each sub-subdirectory 
    for subdir in "$directoryPath"/*; do
        [[ -d "$subdir" ]] || continue
        echo "Processing subdirectory: $subdir"

        # Shuffle files, then move all files to parent directory
        for file in $(find "$subdir" -type f | shuf); do
            mv "$file" "$directoryPath"
        done
    done
done

# Second set of loops to iterate through and add sequential names to each of the newly moved files in each subdirectory
# Also remove the sub-subdirectories, which are now unneeded
for subDirectory in "${dataSubDirectories[@]}"; do
    counter=1
    directoryPath2="${baseDirectory}/${subDirectory}"
    
    for item in "$directoryPath2"/*; do
        if [[ -d "$item" ]]; then
            rm -r "$item"
        else
            newFileName="$directoryPath2/$counter.txt"
            mv "$item" "$newFileName"
            ((counter++))
        fi
    done
done




