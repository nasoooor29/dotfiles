# --bind 'alt-3:change-prompt(  )+reload(sesh list -c)' \

# just so it doesn't apear on my popup term
CURRENT_SESSION=$(tmux display-message -p '#S')
TERM_NAME="_COMMAND_TERM"

if [[ $CURRENT_SESSION == *"$TERM_NAME"* ]]; then
    exit 0
fi

sesh connect "$(
    sesh list -t | grep -v "scratch" | fzf-tmux -p 60%,40% --border --margin=0 --header '  A-1 tmux  A-2 zoxide  A-3 My Repos  A-4 find  A-d kill ' \
        --no-sort --ansi --border-label ' sesh ' --prompt '  ' --border=rounded \
        --bind 'tab:down,btab:up' \
        --bind 'alt-1:change-prompt(  )+reload(sesh list -t | grep -v "scratch")' \
        --bind 'alt-2:change-prompt(  )+reload(sesh list -z)' \
        --bind 'alt-3:change-prompt(  )+reload(find "$HOME/repos/" -maxdepth 1 -type d)' \
        --bind 'alt-4:change-prompt(  )+reload(find -H -d 2 -t d -E .Trash . ~)' \
        --bind 'alt-d:execute(tmux kill-session -t {})+change-prompt(  )+reload(sesh list -t | grep -v "scratch")' \
        --bind 'alt-k:up,alt-j:down' \
        --bind alt-\':abort
)"
