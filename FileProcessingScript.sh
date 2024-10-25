#!/bin/bash

#definition of base directory and subdirectory names as an array
dataSubDirectories=("takeoff" "land" "left" "right" "forward" "backward")
baseDirectory="/home/zakiadwan2003/midtermdata/data"
#replace path with desired path

#loop through sub directories
for subDirectory in "${dataSubDirectories[@]}"; do
directoryPath="${baseDirectory}/${subDirectory}"
[[ -d "$directoryPath" ]] || continue

#for clarity/debugging, to see each path
echo "Processing category directory: $directoryPath"

for subdir in "$directoryPath"/*; do
[[ -d "$subdir" ]] continue
echo "Processing sub directory: $subdir"



