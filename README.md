# My dot files


just make sure to have iwd and iwctl installed 

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
install-apps.sh
```
