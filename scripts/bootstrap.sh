systemctl enable iwd && systemctl start iwd
while read pkg; do yay -S --noconfirm --answerclean no --answerdiff no --needed $pkg; done < scripts/pkgs.txt

