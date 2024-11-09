export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

plugins=(git)

source $ZSH/oh-my-zsh.sh
source $HOME/.scripts.zsh
export EDITOR='nvim'

config() {
    ~/.config/wofi/config.sh
}


export GOPATH=$HOME/go
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin
export PATH=$PATH:$(go env GOPATH)/bin

export RUN_CMD="go run ."
export RUN_CMD="clear; echo -e 'Running...\n$RUN_CMD'; $RUN_CMD"

source $HOME/.cargo/env
export PATH="/home/Nasoooor/.bun/bin:$PATH"
eval "$(zoxide init --cmd cd zsh)"
