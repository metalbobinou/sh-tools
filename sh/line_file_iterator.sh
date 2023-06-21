#! /bin/sh

echo "#############"
echo "# Beginning #"
echo "#############"

FILE=$1
while read LINE
do
    echo ${LINE}
    # cmd ${LINE}
done < ${FILE}

echo "##########"
echo "# Ending #"
echo "##########"
