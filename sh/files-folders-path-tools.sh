#! /bin/sh

# Multiple functions or tricks for files, folder, and their paths

# Obtain the real physical path of an object (file or directory)
function myrealpath()
{
    echo $(cd $(dirname "$1") && pwd -P)/$(basename "$1")
}

# Test file existence
if [ -f "${FILE}" ]; then
    echo "File ${FILE} exists"
else
    echo "File ${FILE} doesn't exist"
fi

# Test directory existence
if [ -d "${DIR}" ]; then
    echo "File ${DIR} exists"
else
    echo "File ${DIR} doesn't exist"
fi

# Negation equivalent :
# if [ ! -f "${FILE}" ]; then
# if [ ! -d "${DIR}" ]; then

# Specifications :
# -L "${FILE}" : file exists and is a symbolic link
# -h "${FILE}" : file exists and is a symbolic link
# -w "${FILE}" : file exists and write permission granted
