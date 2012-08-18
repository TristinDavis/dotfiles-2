#!/bin/sh
echo "setup for $HOME"

ln -fs "$PWD/.bashrc"       ~/.bashrc
ln -fs "$PWD/.bash_profile" ~/.bash_profile
ln -fs "$PWD/.emacs.d"      ~/.emacs.d
ln -fs "$PWD/.emacs.el"     ~/.emacs.el
ln -fs "$PWD/.gitconfig"    ~/.gitconfig
ln -fs "$PWD/.gitignore"    ~/.gitignore
ln -fs "$PWD/.perltidyrc"   ~/.perltidyrc

git submodule init && git submodule update

mkdir -p ~/bin
ln -fs "$PWD/perldoc-complete/perldoc-complete" ~/bin/

echo "done."
