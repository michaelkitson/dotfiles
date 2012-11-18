#!/bin/bash
dir=`pwd | grep dotfiles`
if [ $? -eq 0 ]; then
    for file in `\ls -A | \egrep -v 'README|setup'`; do
	if [ -f $file ]; then
	    echo "Linking $file"
	    `ln -s $dir/$file ~/$file`
	fi
    done
else
    echo 'You must execute the script from within the dotfiles folder!'
fi