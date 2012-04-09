#!/bin/sh

ln -fns ~/.vim/vimrc ~/.vimrc
ln -fns ~/.vim/gvimrc ~/.gvimrc
ln -fns ~/.vim/pylint.rc ~/pylint.rc

cd ~/.vim/bundle/Command-T/ruby/command-t/
ruby extconf.rb
make

