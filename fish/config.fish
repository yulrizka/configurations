alias g='git'
alias gis='git status -sb'
alias gla='git log --graph --pretty=format:'\''%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset'\'' --abbrev-commit --tags --branches'
alias gib='git branch'
alias gia='git add'
alias gic='git checkout'
alias G='git checkout-history'
alias gg='git gui citool'
alias gfo='git fetch origin'
alias grbi='git rebase -i'
alias gcp='git cherry-pick'
alias ghpr='git fetch origin;git rebase origin/master && git push -u && hub pull-request'
alias gitka='gitk --tags --branches'
alias grhh='git resethead'
alias gd='git diff'
alias gl='git log --graph --pretty='\''%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset'\'' --all'
alias gicm='git commit -m'
alias gim='git merge'
alias gprs='git pull --rebase --autostash'
alias gsu='git branch --set-upstream-to=origin/(git branch --show-current) (git branch --show-current)'

alias dc='docker compose'
alias dcup='dc up'
alias dcupd='dc up -d'
alias dcup='dc up'
alias dcrm='dc rm -fs'
#alias klf='kubectl logs -f'
alias r=ranger
alias l='ls'
alias ll='ls -alh'
alias f='fzf'
alias cl='clear'

alias gcurld='grpcurl -d @ -plaintext localhost:10000'
alias gcurl='grpcurl -plaintext localhost:10000'

alias k=kubectl
alias kx=kubectx
alias kd='kubectl describe'
alias kg='kubectl get'
alias kgp='kubectl get pods'
alias kdd='kubectl delete'
alias kl='kubectl logs'
#alias klf='kubectl logs -f'
alias r=ranger
alias ls='exa'
alias l='exa -alh'
alias f='fzf'

alias gcurld='grpcurl -d @ -plaintext localhost:10000'
alias gcurl='grpcurl -plaintext localhost:10000'

alias kxd='kx westeurope-dev'
alias kxs='kx westeurope-staging'
alias kxp='kx westeurope-prod'
alias kxpp='kx westeurope-prod-user'
alias kc='k config current-context'
alias kcs='k config set-context --current --namespace=strawberry'
alias kcp='k config set-context --current --namespace=pineapple'

alias be='cd ~/dev/shell/strawberry-be'
alias api='cd ~/dev/shell/strawberry-api'
alias e2e='cd ~/dev/shell/strawberry-e2e'
alias e="op run --env-file=.env --"

source $fish_config/config_local.fish