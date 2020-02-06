FROM archlinux:latest

RUN pacman -Syuq --noconfirm --noconfirm git base-devel sudo namcap && \
    rm -rf /var/cache/pacman/pkg/*

RUN echo "Defaults         lecture = never" > /etc/sudoers.d/privacy && \
    echo "%wheel ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/wheel && \
    useradd -m -G wheel -s /bin/bash notroot

USER notroot
WORKDIR /home/notroot
