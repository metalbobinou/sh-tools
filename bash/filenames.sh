#! /bin/bash

# Extension management

# Remove only last extension (.gz)
name=/the/path/foo.bar.lol.txt
echo "${name##*/}"
# foo.bar.lol.txt
new_name=${name##*/}
echo "${new_name%.txt}"
# foo.bar.lol
echo "${new_name%.*}"
# foo.bar.lol
echo "${t##*.}"
# txt

# Remove from first dot ? (.tar.gz)
