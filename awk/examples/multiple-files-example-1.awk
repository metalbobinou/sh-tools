#! /bin/awk

# Put the first file in memory (an array) :
# - takes the 1st column as an ID
# - put the 2nd column inside the array
#
# Then, in the second file, write back the 2nd column when seeing the same ID
#
# Can be called by :
# awk -F ";" -v OFS=";" file1.csv file2.csv > out.csv

# Variables :
# OFS = ";"

# Input file 1 : file1.csv
# ID ; Data1

# Input file 2 : file2.csv
# Data2 ; Data3 ; ID

# Output file :
# ID ; Data1 ; Data2; Data3


# Works on file 1 :
# - "ID" is in the 1st column, "data" is in the 2nd colum
# - store the "data" in the array "my_array" at the index "ID"
FNR == NR {
    ID = $1;
    data = $2
    my_array[ID] = data;
    next; # End processing for this line
}

# Works on file 2 :
# - the ID is stored in the last column (Number of Fields => last column)
# - if the ID was not present in file 1, put "--NOT FOUND--"
# - if the ID was present in file 1, get the data kept in memory
{
    ID = $NF;
    if (length(my_array[ID]) == 0)
	data1 = "--NOT FOUND--";
    else
	data1 = my_array[ID];

    data2 = $1;
    data3 = $2;

    printf("%s%s%s%s%s%s%s\n", ID, OFS, data1, OFS, data2, OFS, data3);
}
