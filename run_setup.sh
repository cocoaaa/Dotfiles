# set up basic configurations on USC Ubuntu (servers) 
echo "Setting up basic configurations"
cd 
git clone https://github.com/cocoaaa/Dotfiles.git

# Clone TPM
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

sudo ln -s ~/Dotfile/.bash_profile ~/.bash_profile && echo ".bash_profile set"
sudo ln -s ~/Dotfile/.gitconfig ~/.gitconfig && echo ".gitconfig set"
sudo ln -s ~/Dotfile/.vimrc ~/.vimrc && echo ".vimrc set"
sudo ln -s ~/Dotfile/.tmux.config ~/.tmux.config && echo ".tmux.config set"
