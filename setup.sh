# Getting oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Backing up existing configs
mkdir -p $HOME/backup_config
backup="$HOME/backup_config"

mv $HOME/.vimrc $backup
mv $HOME/.aliases* $backup
mv $HOME/.zshrc $backup
mv $HOME/.tmux.conf $backup

echo "This script needs to be ran inside the rc_po directory."
repo="`pwd`"
echo $repo
echo "Linking vim"
ln -s -f $repo/.vimrc $HOME/.vimrc
echo "Linking zshrc"
ln -s -f $repo/.zshrc $HOME/.zshrc
ln -s -f $repo/.aliases_zsh $HOME/.aliases_zsh
echo "Linking tmux"
ln -s -f $repo/.tmux.conf $HOME/.tmux.conf
