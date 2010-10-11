#!/bin/bash

cp ~/.gitconfig .
cp ~/.vimrc .
cp ~/.autotest .
cp -R ~/.vim/ .

git st
git add .
git commit -am "update dotfiles"
git push origin master
git lg
