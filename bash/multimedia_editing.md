# Multimedia Editing

## Jump to:
[ffmpeg](https://github.com/anesta95/how_to_data_journalism/blob/main/bash/multimedia_editing.md#ffmpeg) | 

## ffmpeg
A power tool for processing and converting video and audio files.

### Make a GIF
```bash
ffmpeg -ss 5 -t 1.7 -i video.MOV -vf "fps=24,scale=640:-1:flags=lanczos,split[s0][s1];[s0]palettegen[p];[s1][p]paletteuse" -loop 0 video.gif
```
Create a high quality GIF 640 pixels wide at 24 frames per second using the specified video file, skipping 5 seconds and lasting 1.7 seconds and save the output.

### Caption the GIF
```bash
ffmpeg -ss 278.8 -t 3.3 -i wings.mp4 -filter_complex "fps=24,scale=640:-1:flags=lanczos,drawtext=box=1:boxcolor=black@0.4:boxborderw=5:fontfile=/System/Library/Fonts/Supplemental/Impact.ttf:text='CONTRARY TO MY APPEARANCE,':fontsize=48:fontcolor=white:x=(w-tw)/2:y=(h/PHI)+th,drawtext=box=1:boxcolor=black@0.4:boxborderw=5:fontfile=/System/Library/Fonts/Supplemental/Impact.ttf:text='I AM ENJOYING THIS.':fontsize=48:fontcolor=white:x=(w-tw)/2:y=(h/PHI)+th+50,split[x1][x2];[x1]palettegen[p];[x2][p]paletteuse" wings.gif
```
Tweak the parameters (or delete the second line) to adjust the font, text etc. of the caption.

### MOV to mp4
```bash
ffmpeg -i apple.mov -vcodec h264 -acodec aac apple.mp4
```
Use a codec flag to convert a video file from QuickTime to the more universal mp4 format.

### AVI to mp4
```bash
ffmpeg -i full_video.avi full_video.mp4
```
Convert an AVI file to the more universal mp4 format.

### Combine video clips
```bash
ffmpeg -f concat -safe 0 -i vidlist.txt -c copy full_video.avi
```
Combine all of the files recorded in a text file called `vidlist.txt`, which looks like this:
```
file '/Users/username/directory/vid_seq001.avi'
file '/Users/username/directory/vid_seq002.avi'
```

### Create a video from a sequence of images
```bash
ffmpeg -r 1/5 -i img%03d.jpg -c:v libx264 -vf "fps=25,format=yuv420p" out.mp4
```
Read in a sequence of images from a folder and write to an mp4 file. The `-r` flag is the framerate, where the duration of each image is the inverse of the provided value (e.g. 1/5 is 5 seconds, 60 is 1/60 of a second). The `-i` flag specifies the filename structure, with 0 padding specified (e.g.  img%03d.jpg will iterate through img001.jpg, img002.jpg, img003.jpg etc.). [More details here](https://hamelot.io/visualization/using-ffmpeg-to-convert-a-set-of-images-into-a-video/).

[▲ BACK TO NAV](https://github.com/anesta95/how_to_data_journalism/blob/main/bash/multimedia_editing.md#jump-to)
