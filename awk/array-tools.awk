#! /bin/awk

# Various functions for AWK or GAWK (to check) on arrays

# Find if a value is already stored in an array (only calls with 2 parameters)
# Return the key associated with this value
function smartmatch(diamond, rough,   x, y)
{
    for (x in rough)
        y[rough[x]];
    return (diamond in y);
}

# Find if a value is already stored in an array (only calls with 2 parameters)
# Return 1 if found, 0 if not found
function is_in_array(value, array,   iter)
{
    for (iter in array)
    {
        if (value == array[iter])
            return 1;
    }
    return 0;
}

# Measure the length of an array
# Usage : array_length(array)
function array_length(array_measured,   array_i, array_k)
{
    array_k = 0;
    for (array_i in array_measured)
        array_k++;
    return array_k;
}


## Add value at the end of an array, and return the position at insertion
# (indexes of arrays in awk are tricky : they are just concatenated with SUBSEP
#  therefore : tab[ab,cd] is the same as tab[ab@cd] if SUBSEP is set to '@'.
#  SUBSEP = "\034"  by default (rare and non-printable character).
#  Do not change SUBSEP "after" putting values in a multidimensional array)
# BEWARE OF INDEX AT 0 ! The concatenation remove the trailing "0" in numbers

# Add one element at the end of the array (index begin at 1)
function add_in_array_0_index(value, array,   iter)
{
    iter = 1; # Never begin at 0
    while (length(array[iter]) != 0)
        iter += 1;
    array[iter] = value;
    return (iter);
}

# Add one element at the end of the array, with index given in parameter (begin at 1)
function add_in_array_1_index(value, array, index_1,   iter)
{
    iter = 1; # Never begin at 0
    while (length(array[index_1,iter]) != 0)
        iter += 1;
    array[index_1,iter] = value;
    return (iter);
}

# Add one element at the end of the array, with 2 indexes given in parameter (begin at 1)
function add_in_array_2_index(value, array, index_1, index_2,   iter)
{
    iter = 1; # Never begin at 0
    while (length(array[index_1,index_2,iter]) != 0)
        iter += 1;
    array[index_1,index_2,iter] = value;
    return (iter);
}
