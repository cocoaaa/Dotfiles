# Listening port search
lps () {
  sudo lsof -nP -i4TCP:"$1" | grep LISTEN;
}

# Open man page as PDF
function manpdf() {
  man -t "${1}" | open -f -a /Applications/Preview.app/
}

# Start new jupyterlab at input port#
function startLab() {
  # arg1: port number
  nohup jupyter lab --port="$1" --no-browser --notebook-dir='~' > /dev/null &
}

# Delete all python .pyc, .pyo, __pycache__ directory
function pyclean() {
  find . -type f -name "*.py[co]" -delete
  find . -type d -name "__pycache__" -delete
}

# Run tensorboard with nohup
# arg1: logdir
# arg2: port number
function tb() {
  nohup tensorboard --logdir "$1" --port="$2" >  /dev/null &
}
