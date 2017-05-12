#!/bin/sh

cd $(dirname "$0")
myname=$(basename "$0")

for f in $( ls -a | awk '!/^(.|..|.git|'"$myname"')$/' ); do
    dest="$HOME"/"$f"
    rm -rf "$dest"
    if [ -d "$f" ]; then
	mkdir "$dest"
	lndir -silent $(pwd)/"$f" "$dest" #Need pwd because lndir expects fromdir relative to todir
    else
	ln -s $(pwd)/"$f" "$HOME"
    fi
done
exit
	      
	    
