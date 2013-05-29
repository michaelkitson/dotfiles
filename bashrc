[ -z "$PS1" ] && return

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth
HISTSIZE=1000
HISTFILESIZE=2000

shopt -s histappend
shopt -s checkwinsize

alias jobcount="jobs | \grep -Po '\[[0-9]+\]\+' | sed 's/+/ /'"
PS1="\$(jobcount)\u@\h:\w\$ "

dir=`readlink ~/.bashrc | xargs dirname`
arch_dir="$dir/$(uname)/"
other_files=( ".bash_aliases .bash_functions .bashrc.local" )
arch_files=( ".bashrc .bash_aliases .bash_functions" )

for file in $other_files; do
    if [ -f "$dir/$file" ]; then
        . "$dir/$file"
    fi
done

if [ -d $arch_dir ]; then
    for file in $arch_files; do
        if [ -f "$arch_dir/$file" ]; then
            . "$arch_dir$file"
        fi
    done
fi

if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi
