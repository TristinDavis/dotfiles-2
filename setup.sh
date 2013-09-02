#!/bin/sh
echo "setup for $HOME"

ln -fs "$PWD/.bashrc"           $HOME/.bashrc
ln -fs "$PWD/.bash_profile"     $HOME/.bash_profile
ln -fs "$PWD/.emacs.d"          $HOME/.emacs.d
ln -fs "$PWD/.gitconfig"        $HOME/.gitconfig
ln -fs "$PWD/.gitignore"        $HOME/.gitignore
ln -fs "$PWD/.perltidyrc"       $HOME/.perltidyrc
ln -fs "$PWD/.ssh"              $HOME/.ssh
ln -fs "$PWD/.chef"             $HOME/.chef
ln -fs "$PWD/.uncrustifyconfig" $HOME/.uncrustifyconfig

git submodule init && git submodule update

mkdir -p $HOME/bin
ln -fs "$PWD/mv2trash"                 $HOME/bin/
ln -fs "$PWD/git-wata"                 $HOME/bin/
ln -fs "$PWD/create_secure_passwd.php" $HOME/bin/

echo "done."
