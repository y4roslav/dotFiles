#############################
###### Specific for MacOS ###
#############################
# BEGIN: Comment or un-comment lines bellow 
SECRETS=/Volumes/secrets
CLOUD_SECRET=$SECRETS/cloud.sh

# Add brew to the PATH
export HOMEBREW=/opt/homebrew

# Tunning to work with brew installed applications instead system one
export PATH=$HOMEBREW/bin:$PATH
export PATH=$HOMEBREW_SBIN:$PATH

# Replace default OSX ruby by Brew version
export PATH=`gem environment gemdir`/bin:$PATH

# END: Comment or un-comment lines above 

# Fix localization issue 
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

####################################
### PATH modification ##############
####################################

export PATH=${HOME}/bin:${PATH}

# Tunning location for Python packages
export PYTHONUSERBASE=$HOME/.python
export PATH=$PYTHONUSERBASE/bin:$PATH

# Rust lang package path 
export PATH=$PATH:~/.cargo/bin

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


##################################
##### ZPLUG ######################
##################################
# You can customize where you put it but it's generally recommended that you put in $HOME/.zplug
if [[ ! -d ~/.zplug ]];then
    git clone https://github.com/b4b4r07/zplug ~/.zplug
fi

source ~/.zplug/init.zsh

# Make sure to use double quotes
zplug "zsh-users/zsh-history-substring-search"

# Use the package as a command
# And accept glob patterns (e.g., brace, wildcard, ...)
zplug "Jxck/dotfiles", as:command, use:"bin/{histuniq,color}"

# Can manage everything e.g., other person's zshrc
zplug "tcnksm/docker-alias", use:zshrc

# Disable updates using the "frozen" tag
zplug "k4rthik/git-cal", as:command, frozen:1


# Also prezto
# zplug "modules/prompt", from:prezto

zplug "akoenig/gulp.plugin.zsh" # Gulp completion in dev dirs
zplug "chrissicool/zsh-256color" # Color autoset

# Run a command after a plugin is installed/updated
# Provided, it requires to set the variable like the following:
# ZPLUG_SUDO_PASSWORD="********"
zplug "jhawthorn/fzy", \
    as:command, \
    rename-to:fzy, \
    hook-build:"make && sudo make install"

# Supports checking out a specific branch/tag/commit
zplug "b4b4r07/enhancd", at:v1
zplug "mollifier/anyframe", at:4c23cb60

# Rename a command with the string captured with `use` tag
zplug "b4b4r07/httpstat", \
    as:command, \
    use:'(*).sh', \
    rename-to:'$1'

# Fuzzy Finder
zplug "junegunn/fzf", \
  hook-build:"./install --bin && ln -sr bin/fzf $ZPLUG_HOME/bin", \
  use:"shell/*.zsh"
zplug "unixorn/fzf-zsh-plugin"

# Group dependencies

# Set the priority when loading
# e.g., zsh-syntax-highlighting must be loaded
# after executing compinit command and sourcing other plugins
# (If the defer tag is given 2 or above, run after compinit command)
zplug "zsh-users/zsh-syntax-highlighting", defer:2

# command auto-suggestion based on history
zplug "zsh-users/zsh-autosuggestions"

# Can manage local plugins
zplug "~/.zsh", from:local

# Load theme file
# setopt prompt_subst # Make sure prompt is able to be generated properly.
# zplug "caiogondim/bullet-train.zsh", use:bullet-train.zsh-theme, defer:3 
# zplug romkatv/powerlevel10k, as:theme, depth:1
# as:theme # defer until other plugins like oh-my-zsh is loaded

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# Then, source plugins and add commands to $PATH
zplug load # --verbose

# Run external scripts 
######################


# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
# [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Run oh-my-posh as prompt customisation frameworks 
# eval "$(oh-my-posh init zsh)"
# List of themes: 
# - clean-detailed
# - cloud-context
# - night-owl
# - kushal
eval "$(oh-my-posh init zsh --config $(brew --prefix oh-my-posh)/themes/clean-detailed.omp.json)"

# Run macchina (replacement neofetch)
# neofetch
macchina

# Initiate secret keys for platfrom management (AWS, Nomad, DO, Linode)
source $CLOUD_SECRET

# Run keychain for SSH keys management (see Funtoo project for details) 
eval `keychain --eval --agents ssh --inherit any $SECRETS/*{ecdsa,ed25519}`
## Use RBenv to manage Ruby version
# eval "$(rbenv init - zsh)"

[ -f "/Users/y4roslav/.ghcup/env" ] && source "/Users/y4roslav/.ghcup/env" # ghcup-env
#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
