HOME_BASE=$(dirname $(perl -MCwd -e 'print Cwd::abs_path shift' ${(%):-%N}))

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export EDITOR=vim

if [[ -r "$XDG_CONFIG_HOME/ripgrep/rg.conf" ]]; then
  export RIPGREP_CONFIG_PATH="$HOME/.config/ripgrep/rg.conf"
fi
if [[ -d "$HOME/projects" ]]; then
  export PROJECT_DIR="$HOME/projects"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
if [[ -d "$XDG_CONFIG_HOME/zsh" ]]; then
  export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
else
  export ZDOTDIR="$HOME"
fi
export ZSH="$ZDOTDIR/.oh-my-zsh"
export HISTFILE="$ZDOTDIR/.zhistory"  # History filepath

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="robbyrussell"
ZSH_THEME="powerlevel10k/powerlevel10k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
HIST_STAMPS="mm/dd/yyyy"

SAVEHIST=5000
HISTSIZE=2000

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

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(z vi-mode)

source $ZSH/oh-my-zsh.sh

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

compdef g=git
function g {
  if [[ $# -gt 0 ]]; then
    git "$@"
  else
    git status --short --branch
  fi
}

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

export RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl@1.1)"

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Alias definitions.
[[ ! -f ~/.bash_aliases ]] || source ~/.bash_aliases

# Local, site specific environment modifications
# This file will not be under source control (as this one is)
# as it's contents will vary depending on the local context.
[[ ! -f ~/.zshrc.local ]] || source ~/.zshrc.local


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

# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f $ZDOTDIR/.p10k.zsh ]] || source $ZDOTDIR/.p10k.zsh
