#! /bin/sh

# Various regexp for SED (or GSED)

IN_FILE=`mktemp in_file.txt`
OUT_FILE=`mktemp out_file.txt`

# Replace the dot "." in the number by a comma ","
sed 's/\([[:digit:]]\)\.\([[:digit:]]\)/\1,\2/g' \
    ${IN_FILE} > ${OUT_FILE}

# Replace the comma "," in the number by a dot "."
sed 's/\([[:digit:]]\)\,\([[:digit:]]\)/\1.\2/g' \
    ${IN_FILE} > ${OUT_FILE}

rm -f ${IN_FILE}
rm -f ${OUT_FILE}
