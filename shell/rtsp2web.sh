#!/bin/bash

ffmpeg -i rtsp://wowzaec2demo.streamlock.net/vod/mp4:BigBuckBunny_115k.mov \
  -profile:v baseline -level 3.0 -s 1280x720 -start_number 0 \
  -hls_time 10 -hls_list_size 0\
  -f hls video.m3u8
