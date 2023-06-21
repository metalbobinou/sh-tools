#! /bin/bash

# Process on each file

for ARG in "$@"
do
    if [ -f "${ARG}" ]; then
        IN_NAME="${ARG}"
        BASENAME=`basename "${IN_NAME}"`
        OUTPUT_NAME="${OUTPUT_PREFIX}${BASENAME}"
		echo "-- ${BASENAME} --"

		# Process on each file
		echo "${IN_NAME}"
    fi
done
