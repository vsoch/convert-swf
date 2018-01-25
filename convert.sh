#!/bin/bash


if [ $# -ne 1 ]; then
    echo "Usage: docker run vanessa/swf-convert input.swf"
    echo "will produce input.mp4 as output"
    exit 1
fi

inputswf=$1

# Generate mp4 name
filename=$(basename "$inputswf")
dir=$(dirname "$inputswf")
filename="${filename%.*}"
mp4=$dir/$filename.mp4

# Run to generate the file
avconv -i $inputswf -c:a aac -q:a 3 -vcodec mpeg4 -strict -2 $mp4
