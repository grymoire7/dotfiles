# HOME_BASE=$(dirname $(perl -MCwd -e 'print Cwd::abs_path shift' ${(%):-%N}))
HOME_BASE=$(dirname $(realpath "${(%):-%N}"))

# Aliases involving color support and filesystem listings are included here.
# All other aliases should be in ~/.bash_aliases
#
# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
  test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
  alias ls='ls --color=auto'
fi

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

if [[ -r "$XDG_CONFIG_HOME/ripgrep/rg.conf" ]]; then
  export RIPGREP_CONFIG_PATH="$HOME/.config/ripgrep/rg.conf"
fi
if [[ -d "$HOME/projects" ]]; then
  export PROJECT_DIR="$HOME/projects"
fi

# Path to your zsh config files.
if [[ -d "$XDG_CONFIG_HOME/zsh" ]]; then
  export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
else
  export ZDOTDIR="$HOME"
fi

# Fix up history settings.
export HISTFILE="$ZDOTDIR/.zhistory"
HISTSIZE=5000
SAVEHIST=2000
HISTDUP=erase

# When writing out the history file, older commands that duplicate newer ones are omitted. 
setopt hist_save_no_dups

# share history across multiple zsh sessions
# setopt SHARE_HISTORY

# append to history
setopt APPEND_HISTORY

# adds commands as they are typed, not at shell exit
setopt INC_APPEND_HISTORY

# expire duplicates first
setopt HIST_EXPIRE_DUPS_FIRST

# do not store duplications
setopt HIST_IGNORE_DUPS

#ignore duplicates when searching
setopt HIST_FIND_NO_DUPS

# removes blank lines from history
setopt HIST_REDUCE_BLANKS

# Vim keybindings for command line
bindkey -v

# User configuration

# PATH munging -- very handy for what follows
pathmunge () {
  if ! echo $PATH | egrep -q "(^|:)$1($|:)" ; then
    if [ "$2" = "after" ] ; then
      PATH=$PATH:$1
    else
      PATH=$1:$PATH
    fi
  fi
}

autoload -Uz compinit
compinit

# compdef g=git
function g {
  if [[ $# -gt 0 ]]; then
    git "$@"
  else
    git status --short --branch
  fi
}

# Case insensitive completion
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

if type "brew" > /dev/null; then
  BREW_PREFIX=$(brew --prefix)
  export RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl@1.1)"
fi

# zsh-autosuggstions: https://github.com/zsh-users/zsh-autosuggestions
# Check both brew and manual install locations
if [ -f "${BREW_PREFIX}/share/zsh-autosuggestions/zsh-autosuggestions.zsh" ]; then
  source "${BREW_PREFIX}/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
elif [ -f "${ZDOTDIR}/zsh-autosuggestions/zsh-autosuggestions.zsh" ]; then
  source "${ZDOTDIR}/zsh-autosuggestions/zsh-autosuggestions.zsh"
fi

# Alias definitions
[[ ! -f ~/.bash_aliases ]] || source ~/.bash_aliases

# Local, site specific environment modifications
# This file will not be under source control (as this one is)
# as it's contents will vary depending on the local context.
[[ ! -f ~/.zshrc.local ]] || source ~/.zshrc.local

compdef g=git

if [ -f ~/.homesick/repos/homeshick/homeshick.sh ]; then
  source $HOME/.homesick/repos/homeshick/homeshick.sh
fi

# put personal bin directory at end of path
if [ -d "$HOME/bin" ]; then
  pathmunge ~/bin after
fi

# put anaconda bin directory at end of path
if [ -d "/anaconda3/bin" ]; then
  pathmunge /anaconda3/bin before
fi

# if we have rbenv then enable it
if [ -d "$HOME/.rbenv" ]; then
  pathmunge $HOME/.rbenv/bin before
  eval "$(rbenv init -)"
fi

if [ -d "/usr/local/opt/libpq/bin" ]; then
  pathmunge /usr/local/opt/libpq/bin before
fi

if [ -d "/usr/local/sbin" ]; then
    pathmunge /usr/local/sbin before
fi

# if we have heroku then enable it
if [ -d "/usr/local/heroku" ]; then
  pathmunge /usr/local/heroku/bin before
fi

if type "zoxide" > /dev/null; then
  eval "$(zoxide init zsh)"
fi

if type "fzf" > /dev/null; then
  [ -f ${XDG_CONFIG_HOME}/.fzf.completion.zsh ] && source ${XDG_CONFIG_HOME}/.fzf.completion.zsh
  [ -f ${XDG_CONFIG_HOME}/.fzf.key-bindings.zsh ] && source ${XDG_CONFIG_HOME}/.fzf.key-bindings.zsh
fi

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
# export PATH="$PATH:$HOME/.rvm/bin"
# if we have rvm then enable it
if [ -d "$HOME/.rvm" ]; then
    pathmunge $HOME/.rvm/bin before
    # Load RVM into a shell session *as a function*
    [[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
fi

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

# Set prompt using starship if present.
if type "starship" > /dev/null; then
  eval "$(starship init zsh)"
fi

[[ ! -f $HOME/.docker/init-zsh.sh ]] || source $HOME/.docker/init-zsh.sh

