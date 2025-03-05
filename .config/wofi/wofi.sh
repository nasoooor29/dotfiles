# if you want more thing from wofi just create a script wofi-[your thing name].sh
# then thats it write your logic
wofii() {
    wofi --conf "$CONFIG" --style "$STYLE" "$@"
}
CONFIG="$HOME/.config/wofi/config"
STYLE="$HOME/.config/wofi/themes/mocha.css"

if [[ $(pidof wofi) ]]; then
    pkill wofi
fi

files=($(ls $HOME/.config/wofi/wofi-*.sh))
declare -A actions
for file in "${files[@]}"; do
    filename=$(basename "$file" .sh)
    key=$(echo "${filename#wofi-}" | tr '[:upper:]' '[:lower:]')
    actions["$key"]="$file"
done

choosen=$(printf "%s\n" "${!actions[@]}" | wofii -d)

echo "$choosen"

if [[ -n "${actions[$choosen]}" ]]; then
    if bash "${actions[$choosen]}"; then
        exit 0
    else
        notify-send "Error" "An error occurred while executing the script."
    fi
fi
