#!/bin/bash

cp ~/.gitconfig .
cp ~/.vimrc .
cp ~/.gvimrc .
cp ~/.autotest .
cp ~/.ackrc .
cp -R ~/.vim/ .

git status
git add .
git commit -am "$1"
git push origin master
