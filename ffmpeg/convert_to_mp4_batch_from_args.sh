#! /bin/sh

# Convert videos to MP4

if [ $# -lt 1 ]; then
    echo "Incorrect parameters"
    echo ""
    echo "Usage:"
    echo "$0 files ..."
    exit 255
fi

#FILENAME="$1"

for ARG in "$@"
do
    if [ -f "${ARG}" ]; then
	FILENAME="${ARG}"
	BASENAME=`basename "${FILENAME}"`

	echo ""
	echo "-- ${BASENAME} --"
	echo ""

	EXTENSION="mp4"

	echo "#####################################"
	echo "# EXTRACTING FORMAT: -${EXTENSION}- #"
	echo "#####################################"
	echo ""

	BASENAME="$(basename "${FILENAME}" | rev | cut -d'.' -f2- | rev)"

	CMD1="ffmpeg -i \"${FILENAME}\" \"${BASENAME}.${EXTENSION}\""
	echo "${CMD1}"

	ffmpeg -i "${FILENAME}" "${BASENAME}.${EXTENSION}"

	fi
done
