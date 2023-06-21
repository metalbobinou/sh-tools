#! /bin/sh

echo "#############"
echo "# Beginning #"
echo "#############"

FILE=$1
while read LINE
do
    echo ${LINE}
    youtube-dl ${LINE}
done < ${FILE}

echo "##########"
echo "# Ending #"
echo "##########"
