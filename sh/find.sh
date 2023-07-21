#! /bin/sh

# Useful "find" commands

# Search emacs temporary files (ending by a "~" : file.txt~)
find . -name "*~"

# Delete emacs temporary files
find . -name "*~" -delete

# List empty directories
find . -type d -empty -print
