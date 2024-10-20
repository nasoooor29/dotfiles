path=$(
ls ~/repos | wofi --conf "$HOME/.config/wofi/config" --style "$HOME/.config/wofi/themes/mocha.css" -S dmenu 
)
kitty -d $path nvim
