[ -z "$PS1" ] && return

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth
HISTSIZE=1000
HISTFILESIZE=2000

shopt -s histappend
shopt -s checkwinsize

PS1="\u@\h:\w\a\]$ "
[ `id -u` -eq 0 ] && PS1="\u@\h:\w\a\]# "

dir=`readlink ~/.bashrc | \grep -Po '^.*\/'`
arch_dir="$dir$(uname)/"
other_files=( ".bash_aliases .bash_functions" )
arch_files=( ".bashrc .bash_aliases .bash_functions" )

for file in $other_files; do
    if [ -f "$dir$file" ]; then
        . "$dir$file"
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
