systemctl enable iwd && systemctl start iwd
# while read pkg; do yay --noconfirm --answerclean no --answerdiff no --needed $pkg; done < scripts/pkgs.txt
#
#
#
#
#
yay  --answerclean   None --answerdiff    None --answeredit    None --answerupgrade None --noconfirm   --askyesremovemake -S $(cat scripts/pkgs.txt)
