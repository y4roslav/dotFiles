if status is-interactive
    # Commands to run in interactive sessions can go here
    # fisher install IlanCosman/tide@v5 
end

if status --is-login
    # Localisation 
    set -x LC_CTYPE en_US.UTF-8
    set -x LC_ALL en_US.UTF-8
    set -x LANG en_US.UTF-8

    # Set operational variables 
    set -g SECRETS /Volumes/secrets
    set -gx CLOUD_SECRET $SECRETS/cloud.zsh

    # brew HOME setup
    set -g HOMEBREW /opt/homebrew

    # Python home path modification 
    set -x PYTHONUSERBASE $HOME/.python

    # Set PATH for macOS
    set -gx PATH $PATH $HOMEBREW $HOMEBREW/bin $HOMEBREW_SBIN/bin $HOME/bin $HOME/.cargo/bin $PYTHONUSERBASE/bin
    
    neofetch
end

if status is-interactive
    # Keychain trigering
    keychain --eval --agents ssh --inherit any $SECRETS/*{ecdsa,ed25519}
end
