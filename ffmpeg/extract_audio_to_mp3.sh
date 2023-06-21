#! /bin/sh

# Extract music and convert to mp3 [one file at a time]

if [ $# -ne 2 ]; then
    echo "Incorrect parameters"
    echo ""
    echo "Usage:"
    echo "$0  intermediate-format  file"
    exit 255
fi

EXTENSION="$1"
FILENAME="$2"

BASENAME="$(basename "${FILENAME}" | rev | cut -d'.' -f2- | rev)"

CMD1="ffmpeg -i \"${FILENAME}\" -vn -acodec xopy \"${BASENAME}.${EXTENSION}\""
echo "${CMD1}"

ffmpeg -i "${FILENAME}" -vn -acodec copy "${BASENAME}.${EXTENSION}"


CMD2="ffmpeg -i \"${BASENAME}.${EXTENSION}\" -ab 320k \"${BASENAME}.mp3\""
echo "${CMD2}"

ffmpeg -i "${BASENAME}.${EXTENSION}" -ab 320k "${BASENAME}.mp3"
