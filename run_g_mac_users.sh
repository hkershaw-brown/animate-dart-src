#!/bin/bash

gource DART \
-c 4 \
-s 0.03 \
--disable-progress \
--date-format "%d/%m/%y" \
--disable-progress \
--stop-at-end \
--hide mouse,progress,filenames \
-1920x1080 \
--output-ppm-stream  - \
--highlight-users \
--max-files 600 \
--output-framerate 60 \
--disable-bloom \
--user-scale 1.04 \
| ffmpeg -y -r 60 -f image2pipe -vcodec ppm -i - -vcodec libx264 -preset ultrafast -pix_fmt yuv420p -crf 1 -threads 0 -bf 0 -b 65536K dart.mp4

