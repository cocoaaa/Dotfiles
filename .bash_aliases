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

alias so="source ~/.bashrc"

#alias useConda="export PATH=~/miniconda3/bin:$PATH"
#see: https://github.com/Microsoft/vscode-python/issues/1882#issuecomment-428621588
#
alias docker="sudo docker"
alias useFastai="conda activate fastai"
alias useAPLS="conda activate apls_environment"

# nvidia-smi watch 
alias gps="nvidia-smi -lms 500"

# google drive 
alias grive="grive -P"

# Show disk storage usage in the current directory
alias storage="du -sh * | sort -h"

# Reset mouse click reporting weird characters
alias resetMouse="printf '\e[?1000l'"
alias resetCP="printf '\e[?2004l'"
# Move to Spacenet_Preprocess root directory and
# activate fastai conda environment
# alias workmode="useFastai && cd ~/Playground/Spacenet_Preprocess"
alias cdmd="cd /nas/vista-ssd01/users/haejinso/Projects/ModelSpace"
alias cdrepr="cd /nas/vista-ssd01/users/haejinso/Projects/ModelSpace/nb"

# SLURM cmds
# alias jobstats="sacct -j job_id --format=User,JobID,Jobname,partition,state,time,start,end,elapsed,MaxRss,MaxVMSize,nnodes,ncpus,nodelist"
alias lsql='squeue -u $USER -S +i -o "%7i %8u %4P %30j %2t %10R %10b"'
alias lsq="squeue -u $USER  -o '%8i %10u %20j %4t %5D %20R %15b %3C %7m %11l %11L'"
alias lsqa="squeue -Su -o '%8i %10u %20j %4t %5D %20R %15b %3C %7m %11l %11L'"
# - shortcut to submit slrum jobs to move gm256 to node's tempdir and start jupyter lab
alias runjl="sbatch Scripts/slurm-scripts/slurm-run-jlab-on-node.sh"

# Watch with alias
# src: https://unix.stackexchange.com/a/25329 
# src: https://unix.stackexchange.com/a/453890
alias watchx='watch -x '


