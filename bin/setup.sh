#!/bin/bash
dir="$( cd -P "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
for file in `\ls -A $dir | \egrep -v 'README|setup'`; do
    filename="$dir/$file"
    if [ -f $filename ]; then
	echo "Linking $file"
	`ln -s $filename ~/$file`
    fi
done
