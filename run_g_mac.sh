#!/bin/bash

gource DART \
-c 4 \
-s 0.03 \
--disable-progress \
--date-format "%d/%m/%y" \
--disable-progress \
--stop-at-end \
--hide mouse \
-1280x720 \
--output-ppm-stream  -  \
--output-framerate 60 \
| ffmpeg -y -r 60 -f image2pipe -vcodec ppm -i - -vcodec libx264 -preset ultrafast -pix_fmt yuv420p -crf 1 -threads 0 -bf 0 -b 65536K dart.mp4

