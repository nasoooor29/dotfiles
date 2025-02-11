sesh connect "$(
    sesh list -t | fzf-tmux -p 60%,40% --border --margin=0 \
        --header '  A-1 tmux  A-2 zoxide  A-3 My Repos  A-4 find  A-d kill ' \
        --no-sort --ansi --border-label ' sesh ' --prompt '  ' --border=rounded \
        --bind "tab:down,btab:up" \
        --bind "alt-1:change-prompt(  )+reload(sesh list -t)" \
        --bind "alt-2:change-prompt(  )+reload(sesh list -z)" \
        --bind 'alt-3:change-prompt(  )+reload(sesh list -c --icons)' \
        --bind "alt-4:change-prompt(  )+reload(find -H -d 2 -t d -E .Trash . ~)" \
        --bind "alt-d:execute(tmux kill-session -t {})+change-prompt(  )+reload(sesh list -t)" \
        --bind "alt-k:up,alt-j:down" \
        --bind alt-\':abort
)"
