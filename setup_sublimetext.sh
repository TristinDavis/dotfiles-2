#!/bin/sh

SUBLIMETEXT3DIR=$HOME/Library/Application\ Support/Sublime\ Text\ 3

echo "setup Sublime Text 3 for $SUBLIMETEXT3DIR"
ln -fs "$PWD/sublime_text_3/Cache"               $SUBLIMETEXT3DIR/Cache
ln -fs "$PWD/sublime_text_3/Installed\ Packages" $SUBLIMETEXT3DIR/Installed\ Packages
ln -fs "$PWD/sublime_text_3/Packages"            $SUBLIMETEXT3DIR/Packages

echo "done."