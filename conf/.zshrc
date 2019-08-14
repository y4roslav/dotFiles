# Vi mode
bindkey -v
# Path to your oh-my-zsh configuration.  
ZSH=$HOME/.oh-my-zsh
SECRETS=/Volumes/secrets

# Tunning to work with brew installed applications instead system one
#export PATH=$HOMEBREW/bin:$PATH
#export PATH=$HOMEBREW_SBIN:$PATH

# Add local bin folder to execute user specific applications

export PATH=${HOME}/bin:${PATH}

# Replace default OSX ruby by Brew version
export PATH=`gem environment gemdir`/bin:$PATH

# Add Go to PATH
export GOPATH=~/.golang
export PATH=$GOPATH/bin:$PATH 

# Tunning location for node.js packages 
export NODE_MODULES_PATH=$HOME/.node_modules_global
export PATH=$NODE_MODULES_PATH/bin:$PATH

# Tunning location for Python packages
export PYTHONUSERBASE=$HOME/.python
export PATH=$PYTHONUSERBASE/bin:$PATH

# Rust lang package path 
export PATH=$PATH:~/.cargo/bin

# Export EDITOR to satisfy requirements for tmuxinator
export EDITOR='vim'
# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
# ZSH_THEME="avit"
# ZSH_THEME="spaceship"
ZSH_THEME="bullet-train"

# Bullet Train Theme configuration 
BULLETTRAIN_PROMPT_CHAR='➥'
BULLETTRAIN_KCTX_KCONFIG=${HOME}/.kube/config
BULLETTRAIN_PROMPT_ORDER=(
    time
		status
    custom
		context
		dir
		screen
		ruby
		virtualenv
		aws
		go
		rust
		git
		cmd_exec_time
)

## Vagrant ##
# Set default provider
# export VAGRANT_DEFAULT_PROVIDER=vmware_fusion

## Set LAND to UTF-8
export LANG=en_GB.UTF-8
export LC_ALL=en_GB.UTF-8


# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias mark="open -a IA\ Writer"

# Tmuxinator
alias mux="tmuxinator"

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
plugins=(
 git 
 zsh-syntax-highlighting 
 osx 
 aws 
 brew 
 brew-cask 
 python
 colors
 zsh-colored-man-pages
 zsh-completions
 command-time
 command-not-found
 dirhistory
 docker
 ruby
 vi-mode
 rails
 rust
 httpie
 jsontools
 last-working-dir
 history-substring-search
 zsh-autosuggestions 
 kubectl
 kube-ps1
)

source $ZSH/oh-my-zsh.sh
eval `keychain --eval --agents ssh --inherit any $SECRETS/*{ecdsa,ed25519}`

SECRC=~/.zshrcd
# Load local secret configurations just like GitHub tokens, etc
if [ -d $SECRC ]; then
  if [ "$(ls -A $SECRC)" ]; then
    for file in $SECRC/*
    do
      source $file
    done
  fi
else
  print "404: $SECRC folder not found"
fi
# Load Cloud related secrets
CLOUD_SECRET=$SECRETS/cloud.zsh
source $CLOUD_SECRET

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/y4rv1k/.gloud/google-cloud-sdk/path.zsh.inc' ]; then source '/Users/y4rv1k/.gloud/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/y4rv1k/.gloud/google-cloud-sdk/completion.zsh.inc' ]; then source '/Users/y4rv1k/.gloud/google-cloud-sdk/completion.zsh.inc'; fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
