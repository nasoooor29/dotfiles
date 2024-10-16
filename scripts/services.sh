
systemctl enable iwd && systemctl start iwd
systemctl enable sshd && systemctl start sshd
sudo sed -i 's/^#PermitRootLogin.*/PermitRootLogin yes/' /etc/ssh/sshd_config && sudo systemctl restart sshd

