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
alias gd='git diff'
alias gl='git log --graph --pretty='\''%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset'\'' --all'
alias gicm='git commit -m'
alias gim='git merge'
alias gprs='git pull --rebase --autostash'
alias dc='docker-compose'
alias dcup='docker-compose up'
alias dcupd='docker-compose up -d'
alias dcup='docker-compose up'
alias k=kubectl
alias kx=kubectx
alias kd='kubectl describe'
alias kg='kubectl get'
alias kdd='kubectl delete'
alias kl='kubectl logs'
#alias klf='kubectl logs -f'
alias r=ranger
alias l='ls -alh'
alias f='fzf'

alias gcurld='grpcurl -d @ -plaintext localhost:10000'
alias gcurl='grpcurl -plaintext localhost:10000'

alias kxd='kx westeurope-dev'
alias kxs='kx westeurope-staging'
alias kxp='kx westeurope-prod'
alias kxdd='kx shellai-westeurope-dev'
alias kxss='kx shellai-westeurope-staging'
alias kxpp='kx shellai-westeurope-prod'

test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish

rvm default

set -x YVM_DIR /usr/local/Cellar/yvm/4.0.1
[ -r $YVM_DIR/yvm.fish ]; and source $YVM_DIR/yvm.fish
