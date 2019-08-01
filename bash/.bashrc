# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

#
# ---------- begin history
#

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# Ignore more
HISTIGNORE='ls:ll:ls -lah:pwd:clear:history:bg:fg:exit'

# append to the history file, don't overwrite it
shopt -s histappend
# force commands entered on more than one line to be fit on only one
shopt -s cmdhist
# results of history substitution are not immediately passed to the shell parser
shopt -s histverify

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)

# The  number  of commands to remember in the command history (see HISTORY below).  If the value is 0,
# commands are not saved in the history list.  Numeric values less than zero result in  every  command
# being  saved on the history list (there is no limit).  The shell sets the default value to 500 after
# reading any startup files.
HISTSIZE=15000

# The  maximum number of lines contained in the history file.  When this variable is assigned a value,
# the history file is truncated, if necessary, to contain no more than that number of lines by  remov‐
# ing  the  oldest  entries.   The history file is also truncated to this size after writing it when a
# shell exits.  If the value is 0, the history file is truncated to zero size.  Non-numeric values and
# numeric  values less than zero inhibit truncation.  The shell sets the default value to the value of
# HISTSIZE after reading any startup files.
HISTFILESIZE="INFINITY"
#HISTFILESIZE=2000000

# Set time format
HISTTIMEFORMAT='%F %T '

# Append new history lines, clear the history list, re-read the history list, print prompt.
export PROMPT_COMMAND="history -a; history -c; history -r; ${PROMPT_COMMAND}"
# write to perpetual history file
export PROMPT_COMMAND="${PROMPT_COMMAND}"'echo $USER pid\($$\)  ::"$(history 1)" >> ~/.bash_history_perpetual'

#
# ---------- end history
#

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
#[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

################################################################################

# powerline
if [ -f /usr/share/powerline/integrations/powerline.sh ]; then
  . /usr/share/powerline/integrations/powerline.sh
fi
