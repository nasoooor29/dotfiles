
# FZF ZSH

export FZF_DEFAULT_COMMAND="fd --type f --color=never --hidden --exclude .git --search-path=$HOME"
export FZF_DEFAULT_OPTS="
--layout=reverse
--no-height
--height=100%
--multi
--info=inline
--border=rounded
--margin=2,5
--exit-0
--preview-window=:hidden
--preview '([[ -f {} ]] && (bat --style=numbers --color=always {} || cat {})) || ([[ -d {} ]] && (tree -C {} | less)) || echo {} 2> /dev/null | head -200'
--prompt=' ' --pointer='▶' --marker='✓'
--header='FZF'
--header-first
--bind '?:toggle-preview'
--bind 'ctrl-t:execute(echo {+} | xargs -o nvim)'
--bind 'ctrl-y:execute-silent(echo {+} | xclip -selection clipboard)+abort'
--bind 'alt-k:up,alt-j:down'
--bind 'ctrl-k:up,ctrl-j:down'
"
