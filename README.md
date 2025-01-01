


# install arch
## this will fail the install but dw
```bash
cfdisk
lsblk
mkfs.fat -F 32 /dev/nvme0n1p1
mkfs.ext4 /dev/nvme0n1p2
mkdir /mnt/boot
mount /dev/nvme0n1p1 /mnt/boot
mount /dev/nvme0n1p2 /mnt
lsblk # check check your work
# copy the config
archinstall # it will fail but don't worry
```

## after it fail
```bash
arch-chroot /mnt
mount /dev/nvme0n1p1 /boot
archinstall --config /mnt/user_configuration.json --creds /mnt/user_credentials.json
```

## connect to the net
```bash
# clone the repo
git clone https://github.com/nasoooor29/dotfiles
# copy paste
cat scripts/catMeRunMe


```

## run the apps installer
```bash

```
```

## zip your keys
```bash
zsh scripts/zip-enc-ansible.sh ~/.ssh playbooks/roles/ssh-keys/files/ssh_keys.zip
```
