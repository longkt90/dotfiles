#!/bin/bash

cp ~/.gitconfig .
cp ~/.vimrc .
cp ~/.gvimrc .
cp ~/.zshrc .
cp ~/.gemrc .
cp ~/.rdebugrc .
cp ~/.tmux.conf .

git status
git add .
if ["$1" != ""]; then
  git commit -am "$1"
  git push origin master
fi
