export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$XDG_CONFIG_HOME/local/share"
export XDG_STATE_HOME="$XDG_CONFIG_HOME/local/state"
export XDG_CACHE_HOME="$XDG_CONFIG_HOME/cache"
# export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
export DOCKER_CONFIG="$XDG_CONFIG_HOME"/docker
export NVM_DIR="$XDG_DATA_HOME"/nvm

export _Z_DATA=$XDG_DATA_HOME/.z      # https://github.com/rupa/z/
# export HISTFILE="$ZDOTDIR/.zhistory"  # History filepath
[ -f "$HOME/.cargo/env" ] && . "$HOME/.cargo/env"
