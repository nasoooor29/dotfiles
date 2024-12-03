# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


bindkey -e

source ~/.zsh/alias.zsh
source ~/.zsh/ext.zsh
source ~/.zsh/env.zsh
source ~/.zsh/fzf.zsh


export EDITOR='nvim'

export PATH=$PATH:"~/.zsh/scripts"


export GTK_THEME=Adwaita:dark
export GTK2_RC_FILES=/usr/share/themes/Adwaita-dark/gtk-2.0/gtkrc
export QT_STYLE_OVERRIDE=Adwaita-Dark



eval "$(zoxide init --cmd cd zsh)"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/nasoooor/.miniconda/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/nasoooor/.miniconda/etc/profile.d/conda.sh" ]; then
        . "/home/nasoooor/.miniconda/etc/profile.d/conda.sh"
    else
        export PATH="/home/nasoooor/.miniconda/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

