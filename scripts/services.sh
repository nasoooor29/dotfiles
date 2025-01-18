systemctl enable sshd && systemctl start sshd
sed -i 's/^#PermitRootLogin.*/PermitRootLogin yes/' /etc/ssh/sshd_config && sudo systemctl restart sshd
systemctl enable ly && systemctl start ly
systemctl enable docker && systemctl start docker
