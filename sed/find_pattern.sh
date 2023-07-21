#! /bin/sh

# Search for patterns in a file

IN_FILE=`mktemp in_file.txt`
OUT_FILE=`mktemp out_file.txt`

# Print lines that do not begin by a '#'
sed -n '/^\#/!p' \
    ${IN_FILE} > ${OUT_FILE}


# Print blocks of lines between two boundaries
sed -n '/DATA BEGIN/, /DATA END/p' \
    ${IN_FILE} > ${OUT_FILE}

# Print blocks of lines between two boundaries [Include BEGIN Only]
sed -n '/DATA BEGIN/, /DATA END/{ /DATA END/!p }' \
    ${IN_FILE} > ${OUT_FILE}

# Print blocks of lines between two boundaries [Include END Only]
sed -n '/DATA BEGIN/, /DATA END/{ /DATA BEGIN/!p }' \
    ${IN_FILE} > ${OUT_FILE}

# Print blocks of lines between two boundaries [Exclude BEGIN & END]
sed -n '/DATA BEGIN/, /DATA END/{ /DATA BEGIN/! { /DATA END/! p } }' \
    ${IN_FILE} > ${OUT_FILE}

rm -f ${IN_FILE}
rm -f ${OUT_FILE}
