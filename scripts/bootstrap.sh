systemctl enable iwd && systemctl start iwd
# while read pkg; do yay --noconfirm --answerclean no --answerdiff no --needed $pkg; done < scripts/pkgs.txt
#
#
#
#
#
LANG=C yay --noprovides --answerdiff None --answerclean None --mflags "--noconfirm" -S $(cat scripts/pkgs.txt)
