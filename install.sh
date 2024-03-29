ln -s Dotfiles/.bash_profile $HOME/.bash_profile
ln -s Dotfiles/.bash_aliases $HOME/.bash_aliases
ln -s Dotfiles/.bash_functions $HOME/.bash_functions
ln -s Dotfiles/.tmux.conf $HOME/.tmux.conf
ln -s Dotfiles/.vimrc $HOME/.vimrc
ln -s Dotfiles/.gitconfig $HOME/.gitconfig
git clone https://github.com/tmux-plugins/tpm $HOME/.tmux/plugins/tpm
git clone https://github.com/VundleVim/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim


# Install miniconda
# https://dev.to/waylonwalker/installing-miniconda-on-linux-from-the-command-line-4ad7
# exec $SHELL # to restart the current shell without closing the terminal
