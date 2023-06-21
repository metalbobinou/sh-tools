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

	CMD1="ffmpeg -i \"${FILENAME}\" -c:v h264 -vf \"scale=1920:1080,fps=30,format=yuv420p\" -c:a aac \"${BASENAME}.${EXTENSION}\""
#	CMD1="ffmpeg -i \"${FILENAME}\" -c:v h264 -vf \"scale=1920:1080,fps=30\" -c:a aac \"${BASENAME}.${EXTENSION}\""
	echo "${CMD1}"

	ffmpeg -i "${FILENAME}" -c:v h264 -vf "scale=1920:1080,fps=30,format=yuv420p" -c:a aac "${BASENAME}.${EXTENSION}"
#	ffmpeg -i "${FILENAME}" -c:v h264 -vf "scale=1920:1080,fps=30" -c:a aac "${BASENAME}.${EXTENSION}"

#	ffmpeg -i in.mp4 -vf "fps=20,scale=1920:-1,crop=1920:1080,setsar=1,format=yuv420p" -movflags +faststart out.mp4

	fi
done
