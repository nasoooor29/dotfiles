CONFIG="$HOME/.config/wofi/config"
STYLE="$HOME/.config/wofi/themes/mocha.css"
LISTPATH="$HOME/.config/wofi/list.txt"
cliphist list > list.txt
if [[ ! $(pidof wofi) ]]; then
    cat ${LISTPATH} | wofi --conf ${CONFIG} --style ${STYLE} -S dmenu | cliphist decode | wl-copy
else
    pkill wofi
fi
