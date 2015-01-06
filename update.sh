#!/bin/bash

# Update oh-my-zsh  modules
cd ~/.oh-my-zsh && git pull
cd ~/.oh-my-zsh/themes && git pull
cd ~/.oh-my-zsh/custom/plugins && git pull

# Update vim and vundle
cd ~/.vim/bundle/Vundle && git pull
vim +PluginUpdate +qall

# Update tmux plugins
cd ~/.tmux/plugins/tpm && git pull
