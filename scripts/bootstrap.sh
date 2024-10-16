systemctl enable iwd && systemctl start iwd
systemctl enable sshd && systemctl start sshd
sed -i 's/^#PermitRootLogin.*/PermitRootLogin yes/' /etc/ssh/sshd_config && sudo systemctl restart sshd

while read pkg; do yay -S --needed $pkg; done < scripts/pkgs.txt

