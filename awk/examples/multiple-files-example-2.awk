#! /bin/awk

# Put the first file in memory (an array) :
# - takes the 1st column as an ID, and 2nd column as data
# - avoid similar ID or similar data in the array
#
# Then, in the second file, write the full content of the first file at the end
# of each line.
#
# Can be called by :
# awk -F ";" -v OFS=";" file1.csv file2.csv file3.csv ... > out.csv

# Variables :
# OFS = ";"

# Input file 1 : file1.csv
# ID ; Data1

# Input file 2 (and +) : file2.csv
# Data2 ; Data3

# Output file :
# Data2; Data3 ; Data1_1 ; Data1_2 ; Data1_3 ; ...


# Find if a value is already stored in an array (only calls with 2 parameters)
function smartmatch(diamond, rough,   x, y)
{
    for (x in rough)
	y[rough[x]];
    return (diamond in y);
}


# Works on file 1 :
# - "ID" is in the 1st column, "data" is in the 2nd colum
# - if "ID" was already read, skip the current record/line
# - if "data" was already read, skip the current record/line
# - store the "data" in the array "Data_array" at the index "ID"
FNR == NR {
    ID = $1;
    data = $2

    # If ID was already stored, skip it
    if (ID in Data_array)
	next;

    # If data was already stored, skip it
    if (smartmatch(data, Data_array))
	next;

    Data_array[ID] = data;
}

# Works on file 2 :
# - the ID is stored in the last column (Number of Fields => last column)
# - if the ID was not present in file 1, put "--NOT FOUND--"
# - if the ID was present in file 1, get the data kept in memory
{
    data2 = $1;
    data3 = $2;

    printf("%s%s%s", data2, OFS, data3);

    # Iterate through all the indexes of the array
    for (key in Data_array)
    {
	# Print each data at the end of the line
	old_data = Data_array[key];
	printf("%s%s", OFS, old_data);
    }

    # Print the "end of line" before processing next line
    print("\n");
}
