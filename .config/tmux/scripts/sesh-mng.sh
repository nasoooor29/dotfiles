BASE_DIR="$HOME/repos/playground"
branches=$(git -C "$BASE_DIR" branch --sort=-committerdate --format '%(refname:short)' | grep -v "main" | sed 's/^/[PLAYGROUND] /')
COMMAND=$(
    echo -e "[PLAYGROUND] new\n\
[PLAYGROUND] clear\n\
[PLAYGROUND] unpack\n\
[PLAYGROUND] fetch-all\n\
$branches\n\
[PLAYGROUND] echo-branches"
)

CHOOSEN=$(
    sesh list -t | fzf-tmux -p 60%,40% --border --margin=0 \
        --header '  A-1 tmux  A-2 zoxide  A-3 playgrounds  A-4 my repos  A-d kill ' \
        --no-sort --ansi --border-label ' sesh ' --prompt '  ' --border=rounded \
        --bind "tab:down,btab:up" \
        --bind "alt-1:change-prompt(  )+reload(sesh list -t)" \
        --bind "alt-2:change-prompt(  )+reload(sesh list -z)" \
        --bind "alt-3:change-prompt(  )+reload(echo -e \"$COMMAND\")" \
        --bind 'alt-4:change-prompt(  )+reload(find ~/repos -maxdepth 1 -mindepth 1)' \
        --bind "alt-d:execute(tmux kill-session -t {})+change-prompt(  )+reload(sesh list -t)" \
        --bind "alt-k:up,alt-j:down" \
        --bind alt-\':abort
)

if [ -z "$CHOOSEN" ]; then
    # echo "No session selected."
    exit 0
fi

if [[ "$CHOOSEN" == "[PLAYGROUND]"* ]]; then
    CHOOSEN_NO_PREFIX="${CHOOSEN#\[PLAYGROUND\] }"
    $HOME/dotfiles/.config/tmux/scripts/playground/playground.sh "$CHOOSEN_NO_PREFIX"
else
    sesh connect $CHOOSEN
fi
