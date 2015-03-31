# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Add RVM to PATH
PATH=$PATH:$HOME/.rvm/bin/

# Add Go to PATH
export GOPATH=~/Go
export PATH="$GOPATH/bin:$PATH" 

# Tunning to work with brew installed applications instead system one
export PATH="/usr/local/bin:$PATH"

# Export EDITOR to satisfy requirements for tmuxinator
export EDITOR='vim'
# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="sorin"

## Vagrant ##
# Set default provider
export VAGRANT_DEFAULT_PROVIDER=vmware_fusion

## Set LAND to UTF-8
export LANG=en_GB.UTF-8
export LC_ALL=en_GB.UTF-8


# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git ruby rvm zsh-syntax-highlighting osx chef vagrant aws brew brew-cask knife knife_ssh)

source $ZSH/oh-my-zsh.sh

# Add congigs from ~/.zshrcd directory
# Note. This directory must be created and appropriate configs should be placed
if [ -f ~/.zshrcd/* ]; then
    source ~/.zshrcd/*
else
    print "404: ~/.zshrcd not found."
fi

# Add ChefDK ruby as default 
eval "$(chef shell-init zsh)"
