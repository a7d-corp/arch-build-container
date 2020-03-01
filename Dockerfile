FROM archlinux:latest

RUN pacman -Syuq --noconfirm --noconfirm git \
        base-devel \
        sudo \
        namcap \
        pkgbuild-introspection && \
    rm -rf /var/cache/pacman/pkg/*

RUN echo "Defaults         lecture = never" > /etc/sudoers.d/privacy && \
    echo "%wheel ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/wheel && \
    useradd -m -G wheel -s /bin/bash -u 2000 notroot

USER notroot
WORKDIR /home/notroot
ENTRYPOINT ["/bin/bash"]
