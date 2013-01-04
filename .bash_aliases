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

alias j='jobs'

alias bashrc='emacs ~/.bashrc'
alias reup='source ~/.profile'

alias pullm='git pull origin master'
alias pull="git branch | \grep '*' | sed 's/* //' | xargs git pull origin"
alias push="git branch | \grep '*' | sed 's/* //' | xargs git push origin"

alias loadavg="uptime | \grep -Po '\d+\.\d+,? \d+\.\d+,? \d+\.\d+$' | tr -d ','"

alias uuid="curl 'http://uuid.me/'"

alias dig="dig +noall +answer +stats"
