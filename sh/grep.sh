#! /bin/sh

# Useful "grep" commands

# Search lines containing pattern && print its line number
## [SEE ALSO SED]
cat -n file.txt | grep "MATCH"

# Search for lines that only match a pattern
grep -o "Monday" file.txt

# Count lines containing lines that only match a pattern
grep -o "Monday" file.txt | wc -l
