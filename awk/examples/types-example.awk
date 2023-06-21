#! /bin/awk

# Various functions for AWK or GAWK (to check) on types

# Thanks to Steven Penny on Stackoverflow
# https://unix.stackexchange.com/questions/281271/can-i-determine-type-of-an-awk-variable
# 'Awk has 4 types: "number", "string", "numeric string" and "undefined"'
function o_class(obj,   q, x, z)
{
    q = CONVFMT;
    CONVFMT = "% g";
    split(" " obj "\1" obj, x, "\1");
    x[1] = obj == x[1];
    x[2] = obj == x[2];
    x[3] = obj == 0;
    x[4] = obj "" == +obj;
    CONVFMT = q;
    z["0001"] = z["1101"] = z["1111"] = "number";
    z["0100"] = z["0101"] = z["0111"] = "string";
    z["1100"] = z["1110"] = "strnum";
    z["0110"] = "undefined";
    return (z[x[1] x[2] x[3] x[4]]);
}




print 1, o_class(0)
print 2, o_class(1)
print 3, o_class(123456.7)
print 4, o_class(1234567.8)
print 5, o_class(+"inf")
print 6, o_class(+"nan")
print 7, o_class("")
print 8, o_class("0")
print 9, o_class("1")
print 10, o_class("inf")
print 11, o_class("nan")
split("00", q); print 12, o_class(q[1])
split("01", q); print 13, o_class(q[1])
split("nan", q); print 14, o_class(q[1])
split("12345.6", q); print 15, o_class(q[1])
print 16, o_class()


# Should print :
# 1 number
# 2 number
# 3 number
# 4 number
# 5 number
# 6 number
# 7 string
# 8 string
# 9 string
# 10 string
# 11 string
# 12 strnum
# 13 strnum
# 14 strnum
# 15 strnum
# 16 undefined
