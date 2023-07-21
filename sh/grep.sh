#! /bin/sh

# Useful "grep" commands

# Search lines containing pattern && print its line number
## [SEE ALSO SED]
cat -n file.txt | grep "MATCH"

# Search for lines that only match a pattern
grep -o "Monday" file.txt

# Count lines containing lines that only match a pattern
grep -o "Monday" file.txt | wc -l

# Print 3 lines before and 2 lines after a match [BSD & GNU grep]
grep -B 3 -A 2 "MATCH" file.txt

# Print 5 lines before and after a match
grep -C 5 "MATCH" file.txt
