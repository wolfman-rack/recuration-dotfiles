alias a="alias"
alias c="clear"
alias m="more"
alias h="history"
alias j="jobs -l"

alias l="ls -l"
alias la="ls -A"
alias ll="ls -l"
alias ls="ls -CF"

alias dir='ls -ba'
alias dot='ls .[a-zA-Z0-9_]*'

alias pu="pushd"
alias po="popd"

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi
