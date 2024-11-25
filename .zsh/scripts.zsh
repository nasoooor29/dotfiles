
cfg() {


base_path="$HOME/.config"
local custom_files=(
    "$HOME/.zshrc"
    "$HOME/dotfiles/scripts"
)

{

    ls $base_path
    for file in "${custom_files[@]}"; do
        echo "$(basename "$file")"
    done

} | wofi --conf "$HOME/.config/wofi/config" --style "$HOME/.config/wofi/themes/mocha.css" -S dmenu | {
    read -r selected_file
    is_custom=0
    for file in "${custom_files[@]}"; do
        if [[ "$(basename "$file")" == "$selected_file" ]]; then
            is_custom=1
            selected_file=$file
            break
        fi
    done

    if [[ is_custom -eq 0 ]]; then
        selected_file="$base_path/$selected_file"
    fi
}

if [[ -d $selected_file ]]; then
    cd $selected_file 
    nvim
else 
    nvim $selected_file
fi

}
