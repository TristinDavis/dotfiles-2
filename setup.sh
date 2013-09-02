#!/bin/sh
echo "setup for $HOME"

ln -fs "$PWD/.bashrc"           ~/.bashrc
ln -fs "$PWD/.bash_profile"     ~/.bash_profile
ln -fs "$PWD/.emacs.d"          ~/.emacs.d
ln -fs "$PWD/.gitconfig"        ~/.gitconfig
ln -fs "$PWD/.gitignore"        ~/.gitignore
ln -fs "$PWD/.perltidyrc"       ~/.perltidyrc
ln -fs "$PWD/.ssh"              ~/.ssh
ln -fs "$PWD/.chef"             ~/.chef
ln -fs "$PWD/.uncrustifyconfig" ~/.uncrustifyconfig

git submodule init && git submodule update

mkdir -p ~/bin
ln -fs "$PWD/mv2trash"                 ~/bin/
ln -fs "$PWD/git-wata"                 ~/bin/
ln -fs "$PWD/create_secure_passwd.php" ~/bin/

echo "done."
