# -*- mode: sh -*-

[ -z "$PS1" ] && return

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth
HISTSIZE=1000
HISTFILESIZE=2000

shopt -s histappend
shopt -s checkwinsize

alias jobcount="jobs | \egrep -o '\[[0-9]+\]\+' | sed 's/+/ /'"
PS1="\$(jobcount)\u@\h:\w\$ "

dir=`readlink ~/.bashrc | xargs dirname`
arch_dir="$dir/$(uname)"
base_files=( "bash_aliases bash_functions" )
arch_files=( "bashrc bash_aliases bash_functions" )
site_files=( "bashrc.local" )

for file in $base_files; do
    if [ -f "$dir/$file" ]; then
        . "$dir/$file"
    fi
done

for file in $arch_files; do
    if [ -f "$arch_dir/$file" ]; then
        . "$arch_dir/$file"
    fi
done

for file in $site_files; do
    if [ -f "$dir/$file" ]; then
        . "$dir/$file"
    fi
done

if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi
