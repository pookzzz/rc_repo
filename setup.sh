# Setup for bash on Windows


# Backing up existing configs
mkdir -p $HOME/backup_config
backup="$HOME/backup_config"

# Making Directory tree for vim plugins
mkdir -p $HOME/.vim/autoload
curl -flo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

mv $HOME/.vimrc $backup
mv $HOME/.aliases* $backup
mv $HOME/.zshrc $backup
mv $HOME/.tmux.conf $backup

echo "This script needs to be ran inside the rc_po directory."
repo="`pwd`"
echo $repo
echo "Linking vim"
ln -s -f $repo/.vimrc $HOME/.vimrc
ln -s -f $repo/.vimpressrc $HOME/.vimpressrc
echo "Linking bashrc files"
ln -s -f $repo/.bashrc $HOME/.bashrc
ln -s -f $repo/.aliases_bash $HOME/.aliases_bash
ln -s -f $repo/.bash_profile $HOME/.bash_profile
ln -s -f $repo/.bash_login $HOME/.bash_login
echo "Linking tmux"
ln -s -f $repo/.tmux.conf $HOME/.tmux.conf

# Setup workspace
# TODO
