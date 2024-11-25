# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


bindkey -e

source ~/.zsh/alias.zsh
source ~/.zsh/ext.zsh
source ~/.zsh/customFuncs.zsh
source ~/.zsh/scripts.zsh
source ~/.zsh/env.zsh


export EDITOR='nvim'




eval "$(zoxide init --cmd cd zsh)"
