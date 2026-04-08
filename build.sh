#!/bin/bash

if [ ! -t 0 ]; then
    konsole -e bash "$0" "$@"
    exit 0
fi


for m in $(tac /proc/mounts | grep "equestria-work" | awk '{print $2}'); do
    sudo umount -f -l "$m"
done

sudo rm -rf /tmp/equestria-work

# Переинициализируем keyring хоста — нужен для live-окружения и Calamares
sudo pacman-key --init
sudo pacman-key --populate archlinux

sudo mkarchiso -v -w /tmp/equestria-work -o ~/equestria-out .
