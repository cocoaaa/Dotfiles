# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# put Homebrew directory at the opt of PATH environment variable
PATH="/usr/bin:/bin:/usr/sbin:/sbin"
export PATH=/usr/local/bin:/usr/local/sbin:$PATH

# Make homebrew installed python default
export PATH="/usr/local/opt/python/libexec/bin:$PATH"

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

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
force_color_prompt=yes
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

# Colored prompt makes it easier to visually parse terminal output. Note that
# using \[ and \] is necessary to prevent weird behavior (lines overlapping).
if [ -n "$SSH_CONNECTION" ]; then  # connected through SSH?
    usercolor="\[\e[35m\]"  # yes -> magenta
else
    usercolor="\[\e[96m\]"  # no -> 32m for lightgreen, 36m for stronger green, 96m: blurs into Sephia background coloror 34m for blue
fi
# pathcolor="\[\e[96m\]"  # blurs into Sephia background color
pathcolor="\[\e[36m\]"  # no -> 32m for lightgreen, 36m for stronger green, or 34m for blue
resetcolors="\[\e[0m\]"

if [ "$color_prompt" = yes ]; then
    PS1="${pathcolor}\w ${resetcolors} \n\\$ "
    # PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1="${debian_chroot:+($debian_chroot)}\w \n\\$ "
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

# Enable colors
export CLICOLOR=1

# Improve 'ls'
export LSCOLORS=ExFxBxDxCxegedabagacad


# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

#bash-autocomplete
if [ -f $(brew --prefix)/etc/bash_completion ]; then
. $(brew --prefix)/etc/bash_completion
fi

# Find all files modified since X amount of time ago
# Use it like: lssince n[smhdw] dirname.
# n is a time param with units, dirname is the search space

lssince () {
	find "$2" -maxdepth 1 -mtime "$1";
} 

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi
if [ -f ~/.bash_functions ]; then
    . ~/.bash_functions
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

#Python path
export PYTHONPATH=${PYTHONPATH}:/

# Add definition for pip installing a new package in global
gpip(){
   PIP_REQUIRE_VIRTUALENV="" pip2 "$@"
}

# Set Blog folder path
export BLOG='/Users/hayley/Workspace/Blog'
#sublime-text
#export EDITOR='subl -w'

# Add path to matlab to path
#export PATH="$PATH:/Applications/MATLAB_R2017a.app/bin"

# added by "brew install --with-python pyqt5"
# export PATH="/usr/local/opt/qt/bin:$PATH"

function frameworkpython {
    if [[ ! -z "$VIRTUAL_ENV" ]]; then
        PYTHONHOME=$VIRTUAL_ENV /usr/local/bin/python "$@"
    else
        /usr/local/opt/python/libexec/bin/python "$@"
    fi
    echo "PYTHONHOME: " $PYTHONHOME
}

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"


# added by Miniconda3 installer
# export PATH="/Users/hayley/miniconda3/bin:$PATH"

# Setting PATH for Python 3.6
# The original version is saved in .bash_profile.pysave
# PATH="/Library/Frameworks/Python.framework/Versions/3.6/bin:${PATH}"


# 2020-01-06: Copied from arys's bashrc 
# Added to better prompt colors in Sephia background as in Arya
# Aliasing 'g' to 'git' wouldn't be useful without autocompletion.
complete -o default -o nospace -F _git g
. /usr/share/bash-completion/completions/git 2> /dev/null

# Instead of rm, which deletes files permanently, I prefer to use trash-cli
# (github.com/andreafrancia/trash-cli) which moves files to system trash.
alias tp='trash-put'
#alias rm='echo "This is not the footgun you are looking for."; false'

# Show a desktop notification when a command finishes. Use like this:
#   sleep 5; alert
function alert() {
    if [ $? = 0 ]; then icon=terminal; else icon=error; fi
    last_cmd="$(history | tail -n1 | sed 's/^\s*[0-9]*\s*//' | sed 's/;\s*alert\s*$//')"
    notify-send -i $icon "$last_cmd"
}



# SETTINGS

# enable autocompletion and make it case-insensitive
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi
bind "set completion-ignore-case on"

# let aliases work after sudo (see http://askubuntu.com/a/22043)
alias sudo='sudo '

# cd to a dir just by typing its name (requires bash > 4.0), autocorrect typos
[ ${BASH_VERSION:0:1} -ge 4 ] && shopt -s autocd
shopt -s cdspell

# shell history is useful, let's have more of it
export HISTFILESIZE=1000000
export HISTSIZE=1000000
export HISTCONTROL=ignoredups   # don't store duplicated commands
shopt -s histappend   # don't overwrite history file after each session

# disable useless flow control binding, allowing Ctrl-S to search history forward
stty -ixon

# let Ctrl-O open ranger, a console file manager (http://nongnu.org/ranger/):
bind '"\C-o":"ranger\C-m"'
# this wrapper lets bash automatically change current directory to the last one
# visited inside ranger.  (Use "cd -" to return to the original directory.)
function ranger {
    tempfile="$(mktemp)"
    /usr/bin/ranger --choosedir="$tempfile" "${@:-$(pwd)}"
    test -f "$tempfile" && cd -- "$(cat "$tempfile")"
    rm -f -- "$tempfile"
}



# PROMPT

# Colored prompt makes it easier to visually parse terminal output. Note that
# using \[ and \] is necessary to prevent weird behavior (lines overlapping).

# I'm using bright colors because in most terminal palettes the "normal" ones
# (\e[35m, \e[34m and \e[36m) are too dim - feel free to adjust.
if [ -n "$SSH_CONNECTION" ]; then  # connected through SSH?
    usercolor="\[\e[95m\]"  # yes -> magenta
else
    usercolor="\[\e[94m\]"  # no -> blue
fi
pathcolor="\[\e[96m\]"  # cyan path
resetcolors="\[\e[0m\]"
# export PS1="${usercolor}\u@\h${pathcolor} \w${resetcolors} \n\\$ "

# $(__git_ps1) displays git repository status in the prompt - very handy!
# Read more: https://github.com/git/git/blob/master/contrib/completion/git-prompt.sh
#GIT_PS1_SHOWDIRTYSTATE=1
#GIT_PS1_DESCRIBE_STYLE="branch"
#GIT_PS1_SHOWUPSTREAM="verbose git"

# we don't want "command not found" errors when __git_ps1 is not installed
#type __git_ps1 &>/dev/null || function __git_ps1 () { true; }



# Set DISPLAY variable for X11 forwarding
export DISPLAY="localhost:10.0"

# Set Pylearn2 data path
export PYLEARN2_DATA_PATH="$HOME/data/pylearn2"


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/div26loaner/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/div26loaner/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/div26loaner/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/div26loaner/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

