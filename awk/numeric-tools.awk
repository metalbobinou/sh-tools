#! /bin/awk

# Various functions for AWK or GAWK (to check) on numbers

function ceil(value)
{
    var = int(value);
    if (value > var)
        return (var + 1);
    else
        return (var);
}

function floor(value)
{
    var = int(value);
    if (value < var)
        return (var - 1);
    else
        return (var);
}

function abs(v) { return v < 0 ? -v : v }
