#! /bin/awk

# Various functions for AWK or GAWK (to check)

# Extract a value between double quotes
function extract_value_from_quotes(str)
{
    LEN_STR = length(str);
    FIRST_CHAR = substr(str, 1, 1);
    if (FIRST_CHAR == "\"")
	str = substr(str, 2);

    LEN_STR = length(str);
    LAST_CHAR = substr(str, LEN_STR, 1);
    if (LAST_CHAR == "\"")
	str = substr(str, 1, LEN_STR - 1);

    return (str);
}
