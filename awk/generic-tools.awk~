#! /bin/awk

# Various functions for AWK or GAWK (to check) on strings

# Trim a string by the left, right, and both
function ltrim(s) { sub(/^[ \t\r\n]+/, "", s); return s }
function rtrim(s) { sub(/[ \t\r\n]+$/, "", s); return s }
function trim(s)  { return rtrim(ltrim(s)); }
