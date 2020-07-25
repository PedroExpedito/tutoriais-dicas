11

Essentially the same approach as Brian's above, but without touching any configuration file:

pactl load-module module-remap-sink \
    sink_name=reverse-stereo \
    master=0 \
    channels=2 \
    master_channel_map=front-right,front-left \
    channel_map=front-left,front-right
This will create on the fly an additional PA sink with reversed channels. (It will disappear after pulseaudio restart). To switch to it:

pactl set-default-sink reverse-stereo
