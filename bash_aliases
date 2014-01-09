# -*- mode: sh -*-

alias grep='grep -ns --color=auto'
alias fgrep='fgrep -ns --color=auto'
alias egrep='egrep -ns --color=auto'
alias rgrep='rgrep -ns --color=auto'

alias grep_red='GREP_COLOR="1;31" \grep --color=always --line-buffered'
alias grep_yellow='GREP_COLOR="1;33" \grep --color=always --line-buffered'
alias grep_green='GREP_COLOR="1;32" \grep --color=always --line-buffered'
alias grep_blue='GREP_COLOR="1;34" \grep --color=always --line-buffered'
alias grep_purple='GREP_COLOR="1;35" \grep --color=always --line-buffered'
alias grep_teal='GREP_COLOR="1;36" \grep --color=always --line-buffered'

alias du='du -h'

alias rmacs="emacs --eval '(setq buffer-read-only t)'"
alias e="emacs"
alias emacs="emacs -nw"
alias py="python"

alias j='jobs'

alias pullm='git pull origin master'
alias pull="git branch | \grep '*' | sed 's/* //' | xargs git pull origin"
alias push="git branch | \grep '*' | sed 's/* //' | xargs git push origin"

alias gitlast="git l | head -n1 | cut -f 2 -d ' '"

alias loadavg="uptime | \grep -Eo '[0-9]+\.[0-9]+,? [0-9]+\.[0-9]+,? [0-9]+\.[0-9]+$' | tr -d ','"

alias dig="dig +noall +answer +stats"

alias ymd="date +%Y-%m-%d"
alias hms="date +%H:%M:%S"

alias pubip="curl ip.mikekitson.com"

# Vagrant Aliases
alias vbox="vagrant box"
alias vdestroy="vagrant destroy"
alias vhalt="vagrant halt"
alias vinit="vagrant init"
alias vpackage="vagrant package"
alias vplugin="vagrant plugin"
alias vprovision="vagrant provision"
alias vreload="vagrant reload"
alias vresume="vagrant resume"
alias vrunning='VBoxManage list runningvms | \grep -Eo "^\"(.+)_[0-9]+\"" | \sed -E "s/_[0-9]+\"$//g" | \sed "s/\"//"'
alias vssh="vagrant ssh"
alias vssh-config="vagrant ssh-config"
alias vstatus="vagrant status"
alias vsuspend="vagrant suspend"
alias vup="vagrant up"
alias vupnp="vagrant up --no-provision"
alias vin="vagrant up --no-provision && vagrant ssh"

alias password_get="openssl rand 15 | url64"

alias mac="ifconfig en0 | \grep -Eo '[0-9a-f:]{17} '"
alias fake_mac='mac ; echo "TO" ; sudo ifconfig en0 ether "`openssl rand 1 -hex`:`openssl rand 1 -hex`:`openssl rand 1 -hex`:`openssl rand 1 -hex`:`openssl rand 1 -hex`:`openssl rand 1 -hex`" ; mac'
