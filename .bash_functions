# Listening port search
lps () {
  sudo lsof -nP -i4TCP:"$1" | grep LISTEN;
}

# Open man page as PDF
function manpdf() {
  man -t "${1}" | open -f -a /Applications/Preview.app/
}
# Move the input file to Blog/content
function mv2blog() {
  mv "$@" ~/Workspace/Blog/content/articles
}
# Start new jupyterlab at input port#
function startLab() {
  # arg1: port number
  nohup jupyter lab --port="$1" --no-browser --notebook-dir='~' &
}

# Delete all python .pyc, .pyo, __pycache__ directory
function pyclean() {
  find . -type f -name "*.py[co]" -delete
  find . -type d -name "__pycache__" -delete
}

# SLURM cmds
# See the status of a running job
function sjob() {
    # arg1: jobid
    sacct -j "$1" --format=User,JobID,Jobname,partition,state,time,start,end,elapsed,MaxRss,MaxVMSize,nnodes,ncpus,nodelist
}

# See all jobs from a user (haejinso)
function sjobs() {
    sacct -u haejinso --format=User,JobID,Jobname,partition,state,time,start,end,elapsed,MaxRss,MaxVMSize,nnodes,ncpus,nodelist	
}

# See more info about a finished job that weren't available while running it
function sjstat() {
    #arg1: job_id
    sacct -j "$1"  --format=JobID,JobName,MaxRSS,Elapsed
}
