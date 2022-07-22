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


################################################################################
# Typos
################################################################################
alias VIM='vim'
alias CLEAR='clear'
alias cl='clear'
alias CL='clear'

alias CD='cd'
alias SUBL='subl'
alias OPEN='open'


# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

#alias rsync="rsync --progress --partial -avz"

# google drive 
alias grive="grive -P"

# Show disk storage usage in the current directory
alias storage="du -sh * | sort -h"

# Reset mouse click reporting weird characters
alias rsmouse="printf '\e[?1000l'"
alias rscp="printf '\e[?2004l'"
alias rsmouse="printf '\e[?1000l'"
alias rskb="printf '\e[?2004l' & printf '\e[?1000l'"


# Disable built-in Macbook keyboard
alias disableKB="sudo kextunload -b com.apple.driver.AppleHIDKeyboard"

# Enable back the built-in keyboard
alias enableKB="sudo kextload -b com.apple.driver.AppleHIDKeyboard"

################################################################################
# Start apps from commandline
################################################################################
alias gimp="open /Applications/GIMP.app"
alias tstudio="open /Applications/texstudio.app" 
#alias tstudio="/Applications/texstudio.app/Contents/MacOS/texstudio &"
alias qgis="open -n /Applications/QGIS3.app"
alias vlc='/Applications/VLC.app/Contents/MacOS/VLC -I rc'


alias so="source ~/.bash_profile"


# Add notification for finished processes
#alias notifyDone="terminal-notifier -message 'Job finished'"
alias notifyDone="osascript ~/Playground/AppleScripts/notify_done.scpt"


# Blog content folder path
alias cd_blog="~/Workspace/Blog"
alias wmb="conda activate pelican-blog && cd ~/Workspace/Blog && clear"

# Move to Dash's searchbar
alias dq="open dash://" #dq for dash query

# ssh shortcuts
alias ssh_arya="ssh arya.usc.edu"
alias ssh_jon='ssh jonsnow.usc.edu'
alias ssh_umn="ssh geoserver@umnlcc.cs.umn.edu"
# SSH port forward
# Brightness of the display 1 to zero (dark)
alias b0='brightness -d1 0'

# jupyter labextension
alias jl="jupyter labextension"
alias jll="jupyter labextension list"


alias mntarya="sudo sshfs -o allow_other,default_permissions,IdentityFile=~/.ssh/id_rsa
hayley@arya.usc.edu:/ /mnt/arya"

alias umt="umount /mnt/arya"

alias pfs="ssh -NfL 7007:localhost:7007 arya &&  ssh -NfL 6006:localhost:6006 arya && ssh -NfL 9999:localhost:9999 arya && ssh -NfL 8265:localhost:8265 arya"

alias pf="ssh -NfL 9999:localhost:9999 hayley@arya.usc.edu"

# cd aliases
## cd into a working memory folder
alias gdrive="/Volumes/GoogleDrive/My Drive"
alias cdwm="cd '/Volumes/GoogleDrive/My Drive/MyDailyLogs/WM'"
