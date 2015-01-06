#!/usr/bin/env bash

# Install oh-my-zsh and modules
if [[ -d '~/.oh-my-zsh' ]]; then
  cd ~ && mv -f ~/.oh-my-zsh ~/.oh-my-zsh.previous
fi
cd ~ && git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
cd ~/.oh-my-zsh/themes && git clone https://github.com/Y4Rvik/gabriel-zsh.git 
cd ~/.oh-my-zsh/custom/plugins && git clone https://github.com/zsh-users/zsh-syntax-highlighting.git 

# Install vim and vim modules
if [[ -d '~/.vim' ]]; then
  cd ~ && mv -f ~/.vim ~/.vim.previous
fi
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall

# Install tmux-plugins
if [[ -d '~/.tmux' ]]; then
  cd ~ && mv -f ~/.tmux ~/.tmux.previous
fi
cd ~ && git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
# start a server but don't attach to it
tmux start-server
# create a new session but don't attach to it either
tmux new-session -d
# install the plugins
~/.tmux/plugins/tpm/scripts/install_plugins.sh
# killing the server is not required
tmux kill-server
