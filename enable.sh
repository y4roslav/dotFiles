#!/usr/bin/env bash

# Copy non critical dot files without backup
cp -v conf/.curlrc ~/.curlrc
cp -v conf/.gitconfig ~/.gitconfig
cp -v conf/.gitignore_global ~/.gitignore_global

# Setup ZSH
if [[ -f '~/.zshrc' ]]; then
  mv ~/.zshrc ~/.zshrc.previous
fi
cp -v conf/.zshrc ~/.zshrc
mkdir -v ~/.zsh