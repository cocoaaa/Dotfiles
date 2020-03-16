# Listening port search
lps () {
  sudo lsof -nP -i4TCP:"$1" | grep LISTEN;
}

# Open man page as PDF
function manpdf() {
  man -t "${1}" | open -f -a /Applications/Preview.app/
}
# Move the input file to Blog/content/articles
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

# SSH Port Forward 
function pf() {
	# arg1: port number. Default: 7777
	# arg2: server name. Default: arya
	# Usage:
	# pf: this will port forward arya's 7777 to localhost:7777
	# pf 9999: portforward arys's 9999 to locahost:9999
	# pf 9999 jonsnow: port forward jonsnows 9999 to localhost:9999
	# Error!! if you use `pfa jonsnow`
	arg1=${1:-7777}
	arg2=${2:-arya}
	echo "Port: $arg1"
	echo "Server: $arg2"
	ssh -NfL "$arg1":localhost:"$arg1" hayley@"$arg2".usc.edu && echo "Port forwarding Success"
}
