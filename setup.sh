#!/bin/bash
dir="$( cd -P "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
files=( "bashrc emacs gitconfig" )
for file in $files; do
    filename="$dir/$file"
    if [ -f "$filename" ]; then
	echo "Linking $file"
	`ln -is $filename ~/.$file`
    fi
done
