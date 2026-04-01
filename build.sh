#!/bin/bash

if [ ! -t 0 ]; then
    konsole -e bash "$0" "$@"
    exit 0
fi


for m in $(tac /proc/mounts | grep "equestria-iso/work" | awk '{print $2}'); do
    sudo umount -f -l "$m"
done

sudo rm -rf ~/equestria-iso/work

# Переинициализируем keyring хоста — нужен для live-окружения и Calamares
sudo pacman-key --init
sudo pacman-key --populate archlinux

sudo mkarchiso -v -o ~/equestria-out .
