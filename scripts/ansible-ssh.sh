zip -r /tmp/ssh_keys.zip ~/.ssh
ansible-vault encrypt /tmp/ssh_keys.zip --output=~/dotfiles/roles/ssh-keys/files/ssh_keys.zip
rm -f /tmp/ssh_keys.zip
