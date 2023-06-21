#! /bin/sh

# Extension management
NAME=/the/path/foo.bar.lol.txt

# Remove only last extension (.gz)
BASENAME_NO_EXT=$(basename "${NAME}" | rev | cut -d'.' -f2- | rev)
echo ${BASENAME_NO_EXT}
# foo.bar.lol

# Remove on first dot ? (.tar.gz)
FIRST_BASENAME=$(basename "${NAME}" | cut -d'.' -f1)
echo ${FIRST_BASENAME}
# foo

# Show last extension (.gz)
LAST_EXTENSION=$(basename "${NAME}" | rev | cut -d'.' -f 1 | rev)
echo ${LAST_EXTENSION}
# txt
