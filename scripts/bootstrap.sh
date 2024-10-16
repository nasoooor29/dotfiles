pacman -S --needed git base-devel && git clone https://aur.archlinux.org/yay-bin.git && cd yay-bin && makepkg -si
systemctl enable iwd && systemctl start iwd
while read pkg; do yay -S --needed $pkg; done < scripts/pkgs.txt

