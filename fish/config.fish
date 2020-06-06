alias gis='git status -sb'
alias gla='git log --graph --pretty=format:'\''%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset'\'' --abbrev-commit --tags --branches'
alias gib='git branch'
alias gia='git add'
alias gic='git checkout'
alias gg='git gui citool'
alias gfo='git fetch origin'
alias grbi='git rebase -i'
alias gcp='git cherry-pick'
alias ghpr='git fetch origin;git rebase origin/master && git push -u && hub pull-request'
alias gitka='gitk --tags --branches'
alias gd='git diff'
alias gl='git log --graph --pretty='\''%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset'\'' --all'
alias gicm='git commit -m'
alias gprs='git pull --rebase --autostash'
alias dc='docker-compose'
alias dcupd='docker-compose up -d'
alias k=kubectl
alias r=ranger

test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish

