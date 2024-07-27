#!/bin/bash

# This fixes the below error:
# sudo: effective uid is not 0, is /usr/bin/sudo on a file system with the 'nosuid' option 

for x in /usr/lib/binfmt.d/*.conf; do
    sed 's/\(:[^C:]*\)$/\1C/' "$x" | \
    sudo tee /etc/binfmt.d/"$(basename "$x")"
done
