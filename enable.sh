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
mkdir -v ~/.zshrcd

# Install oh-my-zsh and modules
if [[ -d '~/.oh-my-zsh' ]]; then
  mv -f ~/.oh-my-zsh ~/.oh-my-zsh.previous
fi
git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
wget https://raw.githubusercontent.com/caiogondim/bullet-train-oh-my-zsh-theme/master/bullet-train.zsh-theme -P $ZSH_CUSTOM/themes/