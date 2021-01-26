#!/bin/bash

INPUT=$@

if [ "" != "$INPUT" ]; then
  echo "$INPUT"
  ffmpeg -i "$INPUT" -vcodec h264 -acodec aac -strict -2 output.mp4
else
  echo "./v2web.sh <arquivo>"
fi

