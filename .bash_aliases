# Make some possibly destructive commands more interactive.
########################################################################################
alias rm='rm -i'
alias mv='mv -i'
alias cp='cp -i'

########################################################################################
# Process search alias
########################################################################################
alias psg="ps aux | grep -v grep | grep -i -e VSZ -e"
alias mkdir='mkdir -p'

alias h='history'
alias j='jobs -l'
#alias which='type -a'
alias ..='cd ..'

alias kill9='kill -9'

########################################################################################
# Pretty-print of some PATH variables:
########################################################################################
alias path='echo -e ${PATH//:/\\n}'
alias libpath='echo -e ${LD_LIBRARY_PATH//:/\\n}'

alias du='du -kh'    # Makes a more readable output.
alias df='df -kTh'

# Add some easy shortcuts for formatted directory listings and add a touch of color.
alias ls='ls -GFh' #MacOS. Equivalent to ls --color=auto
alias ll='ls -altFG'
alias la='ls -AGt'
alias l='ls -CFG'
alias lt='ls -ltr'         #  Sort by date, most recent last.
alias lc='ls -ltcr'        #  Sort by/show change time,most recent last.
alias lu='ls -ltur'        #  Sort by/show access time,most recent last.
# The ubiquitous 'll': directories first, with alphanumeric sorting:
alias lm='ll |more'        #  Pipe through 'more'
alias lr='ll -R'           #  Recursive ls.
alias tree2='tree -Csuh'    #  Nice alternative to 'recursive ls' ...

# Make grep more user friendly by highlighting matches
# and exclude grepping through .svn folders.
alias grep='grep --color=auto --exclude-dir=\.svn'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'


########################################################################################
# Typos
########################################################################################
alias VIM='vim'
alias CLEAR='clear'
alias cl='clear'
alias CL='clear'

alias CD='cd'
alias SUBL='subl'
alias OPEN='open'

########################################################################################
# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
########################################################################################
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'


#alias rsync="rsync --progress --partial -avz"

# google drive 
alias grive="grive -P"

# Show disk storage usage in the current directory
alias storage="du -sh * | sort -h"


# Reset mouse click reporting weird characters
alias resetMouse="printf '\e[?1000l'"
alias resetCP="printf '\e[?2004l'"

#GIMP
alias gimp="open /Applications/GIMP.app"

alias so="source ~/.bash_profile"

# Add notification for finished processes

# Add notification for finished processes
#alias notifyDone="terminal-notifier -message 'Job finished'"
alias notifyDone="osascript ~/Playground/AppleScripts/notify_done.scpt"

# QGIS3
alias qgis="open -n /Applications/QGIS3.app"

# Blog content folder path
alias BLOG="~/Workspace/Blog"

# Move to Dash's searchbar
alias dq="open dash://" #dq for dash query

# ssh shortcuts
alias ssh_arya="ssh arya.usc.edu"
alias ssh_jon='ssh jonsnow.usc.edu'

# Brightness of the display 1 to zero (dark)
alias b0='brightness -d1 0'
