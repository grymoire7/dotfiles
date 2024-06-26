# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# tmux doesn't work properly unless you force TERM to be xterm-256color
# Also, if you are in PuTTY make sure you force putty to use putty-256color
# or xterm-256color as it's terminal
case "$TERM" in
    *-256color) export TERM=xterm-256color;;
esac

export PROJECT_DIR="$HOME/projects"

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth
HISTIGNORE="&:bg:fg:rm *:ls:ll:h:history"

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# append to the history file, don't overwrite it
shopt -s histappend

# correct simple spelling error in cd commands
shopt -s cdspell

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
    xterm-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
    # We have color support; assume it's compliant with Ecma-48
    # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
    # a case would tend to support setf rather than setaf.)
    color_prompt=yes
    else
    color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='\[\033[0;32m\]\[\033[0m\033[0;32m\]\u\[\033[0;36m\] \w\[\033[0;33m\] $(git branch 2>/dev/null | grep "^*" | colrm 1 2)\[\033[0m\n\$ '
else
    PS1='\u \w $(git branch 2>/dev/null | grep "^*" | colrm 1 2)\n\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
# case "$TERM" in
# xterm*|rxvt*)
#     PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
#     ;;
# *)
#     ;;
# esac

# Aliases involving color support and filesystem listings are included here.
# All other aliases should be in ~/.bash_aliases
#
# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='grep -F --color=auto'
    alias egrep='grep -E --color=auto'
fi

# other filesystem listing aliases
alias ll='ls -lF'
alias la='ls -A'
alias l='ls -CF'
alias h=history
alias a=alias

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
# alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

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

# put personal bin directory at end of path
if [ -d "$HOME/bin" ]; then
    pathmunge ~/bin after
fi

# put anaconda bin directory at end of path
if [ -d "/anaconda3/bin" ]; then
    pathmunge /anaconda3/bin before
fi

#### Here near the end we source certain external setup scripts
#### if present.
####

# if we have virtualenvwrapper then enable it
which virtualenvwrapper.sh &> /dev/null
if [ $? -eq 0 ]; then
    . `which virtualenvwrapper.sh`
fi

# if we have rbenv then enable it
if [ -d "$HOME/.rbenv" ]; then
    pathmunge $HOME/.rbenv/bin before
    eval "$(rbenv init -)"
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
    [[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
fi


# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# Local, site specific environment modifications
# This file will not be under source control (as this one is)
# as it's contents will vary depending on the local context.
if [ -f ~/.bashrc.local ]; then
    . ~/.bashrc.local
fi

if [ -f ~/.homesick/repos/homeshick/homeshick.sh ]; then
    . $HOME/.homesick/repos/homeshick/homeshick.sh
fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
[ -f "$HOME/.cargo/env" ] && . "$HOME/.cargo/env"
source /Users/tracy/.docker/init-bash.sh || true # Added by Docker Desktop
