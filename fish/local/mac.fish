test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish

set -x EDITOR vim

set -x YVM_DIR /usr/local/Cellar/yvm/4.0.1
[ -r $YVM_DIR/yvm.fish ]; and source $YVM_DIR/yvm.fish

# Setting PATH for Python 3.10
# The original version is saved in /Users/ahmy.yulrizka/.config/fish/config.fish.pysave
set -x PATH "/Library/Frameworks/Python.framework/Versions/3.10/bin" "$PATH"

eval "$(/opt/homebrew/bin/brew shellenv)"

# go
set -gx PATH "/Users/Ahmy.Yulrizka/go/bin" "/Users/Ahmy.Yulrizka/sdk/go1.21.0/bin" $PATH;

# pyenv
pyenv init - | source

source $__fish_config_dir/local/iterm2_shell_integration.fish
