wofii() {
    wofi --conf "$CONFIG" --style "$STYLE" "$@"
}

CONFIG="$HOME/.config/wofi/config"
STYLE="$HOME/.config/wofi/themes/mocha.css"

if [[ $(pidof wofi) ]]; then
    pkill wofi
fi

choosen=$(echo -e "wifi\napps\nbrightness\nbluetooth" | wofii -d)
echo "$choosen"

if [[ "$choosen" == "apps" ]]; then
    wofii
fi

if [[ "$choosen" == "wifi" ]]; then
    source "$HOME/.config/wofi/wofi-wifi.sh"
fi
