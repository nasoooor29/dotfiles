export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

plugins=(git)

source $ZSH/oh-my-zsh.sh
source $HOME/.scripts.zsh
export EDITOR='nvim'

config() {
    ~/.config/wofi/config.sh
}

