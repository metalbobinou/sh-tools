#! /bin/sh

# Extract music and convert to mp3

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

	TMP_FILE=`mktemp tmp.XXXXX`

	ffprobe "${FILENAME}" 2> ${TMP_FILE}
	EXT_LINE=`cat ${TMP_FILE} | grep Audio`
	rm -f ${TMP_FILE}

	EXTENSION=`echo \"${EXT_LINE}\" | sed  's/.*Audio: \([[:alnum:]]*\).*/\1/g'`

	echo "#####################################"
	echo "# EXTRACTING FORMAT: -${EXTENSION}- #"
	echo "#####################################"
	echo ""

	BASENAME="$(basename "${FILENAME}" | rev | cut -d'.' -f2- | rev)"

	CMD1="ffmpeg -i \"${FILENAME}\" -vn -acodec xopy \"${BASENAME}.${EXTENSION}\""
	echo "${CMD1}"

	ffmpeg -i "${FILENAME}" -vn -acodec copy "${BASENAME}.${EXTENSION}"


	CMD2="ffmpeg -i \"${BASENAME}.${EXTENSION}\" -ab 320k \"${BASENAME}.mp3\""
	echo "${CMD2}"

	ffmpeg -i "${BASENAME}.${EXTENSION}" -ab 320k "${BASENAME}.mp3"

	fi
done
