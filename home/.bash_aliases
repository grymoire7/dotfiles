# ~/.bash_aliases: executed by .bashrc/.zshrc for non-login shells.

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

alias h=history
alias a=alias

if type "eza" > /dev/null; then
  alias ls='eza -F auto'
  alias ll='eza -l -F auto'
  alias l='eza -lA -F auto'
  alias la='eza -AG -F auto'
else
  alias ls='ls -F --color=auto'
  alias ll='ls -lF'
  alias l='ls -lAF'
  alias la='ls -ACF'
fi

alias lg='lazygit'

alias gn=garden

alias genv='env | grep'
alias ghist='history | grep'
alias t2='tree -C -L 2'
alias t3='tree -C -L 3'
alias t4='tree -C -L 4'

# Print each PATH entry on a separate line
alias path='echo -e ${PATH//:/\\n}'

# fzf with preview via bat
alias pfzf="fzf --preview='bat --color=always {}' --bind shift-up:preview-page-up,shift-down:preview-page-down"

alias be="bundle exec"
alias bek="bundle exec rake"
alias ber='bundle exec rspec'
# alias r='bundle exec rails'
# alias sr='./bin/rspec'

alias gst="git status"
alias e="emacs -nw"
alias ec="emacsclient -n"

# kitty terminal aliases
alias icat="kitty +kitten icat"
alias hg="kitty +kitten hyperlinked_grep"

# alias awe='aws-okta exec optimize/sandbox-dev --'
alias setclip="xclip -selection c"
alias getclip="xclip -selection c -o"

# FYI, cdpath in bash might be a better choice for cd aliases
# alias gprom="git pull --rebase origin master"
# alias gcan="git commit --amend --no-edit"
# alias grc="git rebase --continue"
# alias grqa="git fetch && git reset --hard origin/qa"
# alias wow='git status'
# alias gmacs="open -a Emacs"
# alias '+1'="echo 'Aw yeah!!!'"
# alias dc='docker-compose -f docker-compose.development.yml'
# alias dm='docker-machine'
# alias npmclean='rm -rf ./node_modules && npm install'

# alias 'fails'='kill -9 `ps aux | grep rails | tail -n 1 | awk "{print $2}"`'
# alias 'dgtunnel'='ssh b.snc1 -fNL 13342:dealguide-algorithm-dev.snc1:8080'


