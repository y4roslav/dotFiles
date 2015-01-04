#!/usr/bin/env bash

# Install oh-my-zsh and modules
if [[ -d '~/.oh-my-zsh' ]]; then
  cd ~ && mv -f ~/.oh-my-zsh ~/.oh-my-zsh.previous
fi
cd ~ && git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh

# Install vim and vim modules
if [[ -d '~/.vim' ]]; then
  cd ~ && mv -f ~/.vim ~/.vim.previous
fi

# Install tmux-powerline
if [[ -d '~/.tmux-powerline' ]]; then
  cd ~ && mv -f ~/.tmux-powerline ~/.tmux-powerline.previous
fi
cd ~ && git clone https://github.com/erikw/tmux-powerline.git ~/.tmux-powerline
