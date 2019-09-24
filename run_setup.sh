set -eu

# set up basic configurations on USC Ubuntu (servers) 
echo "Setting up basic configurations"
#cd 
#git clone https://github.com/cocoaaa/Dotfiles.git

# Clone TPM
#git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
cd $HOME
sudo ln -sf $HOME/Dotfiles/.bash_functions $HOME/.bash_functions && echo ".bash_function sym-linked"
sudo ln -sf $HOME/Dotfiles/.bash_aliases $HOME/.bash_aliases && echo ".bash_aliases sym-linked"
#sudo ln -sf $HOME/Dotfiles/.bash_profile ~$HOME.bash_profile && echo ".bash_profile sym-linked"
sudo ln -sf $HOME/Dotfiles/.bashrc $HOME/.bashrc  && echo ".bash_aliases sym-linked"

sudo ln -sf $HOME/Dotfiles/.gitconfig $HOME/.gitconfig && echo ".gitconfig set"
sudo ln -sf $HOME/Dotfiles/.vimrc $HOME/.vimrc && echo ".vimrc set"
sudo ln -sf $HOME/Dotfiles/.tmux.conf $HOME/.tmux.conf && echo ".tmux.conf set"
