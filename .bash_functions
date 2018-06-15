# Listening port search
lps () {
  sudo lsof -i tcp:"$1" | grep LISTEN;
}

# Open man page as PDF
function manpdf() {
  man -t "${1}" | open -f -a /Applications/Preview.app/
}
