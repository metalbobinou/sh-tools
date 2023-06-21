#! /bin/sh

# Extract subtitles
ffmpeg -i Movie.mkv -map 0:s:0 subs.srt
