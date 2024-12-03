
sesh connect "$(
sesh list -t | fzf-tmux -p 60%,50% \
    --no-sort --ansi --border-label ' sesh ' --prompt '  ' \
    --header '  ^a tmux  ^x zoxide  ^d kill  ^f find  ^g configs ' \
    --color border:#7DAEA3\
    --layout=reverse\
    --info=inline\
    --header-first\
    --bind 'tab:down,btab:up' \
    --bind 'alt-a:change-prompt(  )+reload(sesh list -t)' \
    --bind 'alt-g:change-prompt(  )+reload(sesh list -c)' \
    --bind 'alt-x:change-prompt(  )+reload(sesh list -z)' \
    --bind 'alt-f:change-prompt(  )+reload(fd -H -d 2 -t d -E .Trash . ~)' \
    --bind 'alt-d:execute(tmux kill-session -t {})+change-prompt(  )+reload(sesh list -t)'
)"
