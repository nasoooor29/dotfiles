while read pkg; do yay -S --needed $pkg; done < scripts/pkgs.txt
