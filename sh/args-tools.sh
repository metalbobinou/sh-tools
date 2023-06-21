#! /bin/sh

# Multiple functions or tricks for arguments/parameters management


# Number of arguments
if [ "$#" = "0" ]; then
    echo "Missing arguments"
    echo "$0 input_file1.csv [...]"
    exit 255
fi

# Process multiple steps on each file in argument/parameter
# shift
NUM_FILE=0
for ARG in "$@"
do
    if [ -f "${ARG}" ]; then
        IN_NAME="${ARG}"
        BASENAME=`basename "${IN_NAME}"`
	echo "-- ${BASENAME} --"

	echo "Process"
    else
	echo "File ${ARG} not found (skipping it)"
    fi
    NUM_FILE=$(( NUM_FILE + 1 ))
done
## "shift" might be done to skip some argument/parameters in front of the list
