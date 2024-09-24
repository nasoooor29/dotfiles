# My dot files


just make sure to have iwd installed 

## install apps
first things first update pacman
```
sudo pacman -Syu
```
then install yay
```
sudo pacman -S --needed git base-devel && git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si
```
and finally run
```
yay --answerclean n --answerdiff n --noconfirm < installed-packages
```

## Notes
next time add every package you use or activate to new installed-packages.txt file
