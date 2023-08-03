#! /bin/sh

# Remove 7th line of a file
sed '7d' input > output

# Remove lines from 11 to 15 of a file
sed '11,15d' input > output
