#!/bin/bash

#definition of base directory and subdirectory names as an array
dataSubDirectories=("takeoff" "land" "left" "right" "forward" "backward")
baseDirectory="/home/zakiadwan2003/midtermdata/data"
#replace path with desired path

for subDirectory in "${dataSubDirectories[@]}"; do
directoryPath="${baseDirectory}/${subDirectory}"
[[ -d "$directoryPath" ]] || continue

echo "Processing category directory: $directoryPath"



