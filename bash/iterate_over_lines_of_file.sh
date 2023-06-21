#! /bin/bash

# Process on each line

### https://stackoverflow.com/questions/1521462/looping-through-the-content-of-a-file-in-bash

# Trims leading sace, interpret backslash, skip last line if no \n
while read line; do
	echo "${line}"
done < file.txt


while IFS="" read -r line || [ -n "${line}" ]
do
	printf '%s\n' "${line}"
done < file.txt

## https://unix.stackexchange.com/questions/7011/how-to-loop-over-the-lines-of-a-file

IFS=$'\n'       # make newlines the only separator
set -f          # disable globbing
for line in $(cat < "$1"); do
	echo "${line}"
done


while IFS= read -r line; do
	echo "${line}"
done < "$1"
