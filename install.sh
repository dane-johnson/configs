#!/bin/sh

cd $(dirname "$0")
myname=$(basename "$0")

for f in $( ls -a | awk '!/^(.|..|.git|.gitignore|.gitmodules|'"$myname"')$/' ); do
    dest="$HOME"/"$f"
    rm -rf "$dest"
    ln -s $(pwd)/"$f" "$HOME"
done
exit
