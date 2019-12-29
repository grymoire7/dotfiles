# ~/.bash_aliases: executed by .bashrc for non-login shells.

alias genv='env | grep'
alias gh='history | grep'
alias ghist='history | grep'
alias t2='tree -L 2'
alias t3='tree -L 3'
alias t4='tree -L 4'

alias be="bundle exec"
alias bek="bundle exec rake"
alias ber='bundle exec rspec'
alias r=rails
alias sr='./bin/rspec'

alias gco="git checkout"
alias gbr="git branch"
alias gst="git status"
alias gpoh="git push origin head"
alias gpom="git push origin master"
alias gcom="git commit -m"
alias gcm="git commit -m"

alias finchsay='cowsay -f finch' # requires finch.cow file

alias awe='aws-okta exec optimize/sandbox-dev --'

# FYI, cdpath might be a better choice for cd aliases
# alias bc="cd ~/projects/birdcage"
# alias gprom="git pull --rebase origin master"
# alias gcan="git commit --amend --no-edit"
# alias grc="git rebase --continue"
# alias grqa="git fetch && git reset --hard origin/qa"
# alias wow='git status'
# alias g='git'
# alias gs='git status'
# alias gmacs="open -a Emacs"
# alias 'dbtunnel'='ssh b.snc1 -fNL 13306:dealguide-terminator-db1.snc1:3306'
# alias '+1'="echo 'Aw yeah!!!'"
# alias killNodeRunTests='killall node && make test-integration'
# alias r='bundle exec rspec'
# alias dc='docker-compose -f docker-compose.development.yml'
# alias dm='docker-machine'
# alias fixdockerrails='dc run birdcage /bin/bash -c "rm /app/tmp/pids/server1.pid"; dc run birdcage-uat /bin/bash -c "rm /app/tmp/pids/server2.pid"; dc run birdcage /bin/bash -c "rm /app/tmp/pids/server3.pid"'
# alias embers='ember s'
# alias dwuatdeploy='bundle exec cap snc1_uat deploy -s branch=uat'
# alias gap='git add -p'
# alias npmclean='rm -rf ./node_modules && npm install'

# alias foremans='foreman s'
# alias foremen='foreman s'
# alias qabranch='yodasay $(git branch 2>/dev/null | grep '^*' | colrm 1 2) merged to qa! && git checkout qa & git fetch && git reset --hard origin/qa && git merge --no-edit - && git push origin head && ./script/deploy qa'
# alias updateSLS='cd ~/projects/finch.js && cake build && cd ~/projects/optimize-suite && touch ~/projects/optimize-suite/lib/optimize-suite.coffee && make build && cd ~/projects/sls && make assets dev'

# alias 'jarit'='cd ~/projects/deal-guide/ && lein clean && lein uberjar && cp ~/projects/deal-guide/target/deal-guide*.jar ~/projects/deal-guide/lib/'
# alias 'fails'='kill -9 `ps aux | grep rails | tail -n 1 | awk "{print $2}"`'
# alias 'dgtunnel'='ssh b.snc1 -fNL 13342:dealguide-algorithm-dev.snc1:8080'
# alias cuke='bundle exec cucumber -r features/'
# alias test-integration="mocha --launch=false --app.port=3070 test/integration/"


