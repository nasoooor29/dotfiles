# Use Arch Linux as the base image
FROM archlinux:latest

# Update system and install required packages
RUN pacman -Syu --noconfirm && \
    pacman -S --noconfirm python git openssh sudo

# Create a user named 'nasoooor' with sudo access
RUN useradd -m -G wheel -s /bin/bash nasoooor && \
    echo 'nasoooor:1032' | chpasswd && \
    echo '%wheel ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers


RUN ssh-keygen -A
RUN pacman -S --noconfirm ansible
RUN pacman -S --noconfirm make


# Configure SSH server
RUN mkdir -p /var/run/sshd && \
    sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config && \
    sed -i 's/#PasswordAuthentication yes/PasswordAuthentication yes/' /etc/ssh/sshd_config

# Expose the SSH port
EXPOSE 22







# Start SSH server by default
CMD ["/usr/sbin/sshd", "-D"]
