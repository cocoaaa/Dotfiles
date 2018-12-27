set -eu

# set up basic configurations on USC Ubuntu (servers) 
echo "Setting up basic configurations"
#cd 
#git clone https://github.com/cocoaaa/Dotfiles.git

# Clone TPM
#git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
cd ~
sudo ln -sf ~/Dotfiles/.bash_functions ~/.bash_functions && echo ".bash_function sym-linked"
sudo ln -sf $HOME/Dotfiles/.bash_aliases ~/.bash_aliases && echo ".bash_aliases sym-linked"
#sudo ln -sf ~/Dotfiles/.bash_profile ~/.bash_profile && echo ".bash_profile sym-linked"
sudo ln -sf $HOME/Dotfiles/.bashrc ~/.bashrc  && echo ".bash_aliases sym-linked"

sudo ln -sf ~/Dotfiles/.gitconfig ~/.gitconfig && echo ".gitconfig set"
sudo ln -sf ~/Dotfiles/.vimrc ~/.vimrc && echo ".vimrc set"
sudo ln -sf ~/Dotfiles/.tmux.conf ~/.tmux.conf && echo ".tmux.conf set"
