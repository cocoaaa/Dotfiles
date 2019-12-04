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
alias sortFolders='du -sch * .[!.]* | sort -rh' #sort folders by size

# Add some easy shortcuts for formatted directory listings and add a touch of color.
alias ls='ls -GFh' #MacOS. Equivalent to ls --color=auto
alias ll='ls -altFG'
alias la='ls -AGt'
alias l='ls -CFG'
alias lt='ls -lt'         #  Sort by date, most recent last.
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
alias LS='ls'

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

# Move to Spacenet_Preprocess root directory and
# activate fastai conda environment
alias workmode="useFastai && cd ~/Playground/Spacenet_Preprocess"

# cd to favorite folders
alias cd_earthml="cd ~/Playground/Geo/EarthML/examples"
alias cd_intml="cd ~/Playground/Geo/InteractML"
alias cd_pg="cd ~/Playground"
alias cd_sp="cd ~/Playground/Spacenet_Preprocess"
alias cd_fai="cd ~/Playground/Fastai/course-v3"
alias cd_pytalk="cd ~/Workspace/Talks/PyData-LA-2019"
alias cd_rl="cd ~/Workspace/Class/CS669-RL"

# Grep jupyter-lab under hayley as user
alias gjlab="ps aux | grep jupyter-lab | grep hayley"
alias gtb="ps aux | grep tensorboard | grep hayley"

# nvidia-smi watch with difference highlighted
alias nvwatch="watch -d -n 1 nvidia-smi"

# jupyter labextension
alias jl="jupyter labextension"
alias jll="jupyter labextension list"
