#!/bin/bash

cp ~/.gitconfig .
cp ~/.vimrc .
cp ~/.autotest .
cp -r ~/.vim .

git add .
git commit -am "update dotfiles"
git push origin master
