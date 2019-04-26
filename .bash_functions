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
