#! /bin/sh

# List subtitles
youtube-dl --list-subs https://www.youtube.com/watch?v=Ye8mB6VsUHw

# Download only subtitles
youtube-dl --all-subs --skip-download https://www.youtube.com/watch?v=Ye8mB6VsUHw

# Download only 1 sub
youtube-dl --write-sub --sub-lang en --skip-download URL

# Create SRT file
youtube-dl --write-auto-sub --convert-subs=srt --skip-download URL
