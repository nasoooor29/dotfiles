# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


# Plugins
source ~/.zsh/p10k/powerlevel9k.zsh-theme
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.zsh/supercharge/supercharge.plugin.zsh
autoload -Uz compinit
compinit

source ~/.zsh/alias.zsh


bindkey -e
source $HOME/.scripts.zsh
export EDITOR='nvim'

config() {
    ~/.config/wofi/config.sh
}

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh


export RUN_CMD="clear; go run ."
export GOPATH=$HOME/go
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin
export PATH=$PATH:$(go env GOPATH)/bin

export PATH="/home/nasoooor/.bun/bin:$PATH"
eval "$(zoxide init --cmd cd zsh)"
