#!/bin/bash

if [ ! -t 0 ]; then
    konsole -e bash "$0" "$@"
    exit 0
fi

# Рабочая папка mkarchiso — на диске, не в /tmp: /tmp здесь tmpfs (RAM),
# и ~17 ГиБ рабочих файлов уходили в RAM/swap до перезагрузки.
WORK_DIR=/var/tmp/equestria-work

for m in $(tac /proc/mounts | grep "$WORK_DIR" | awk '{print $2}'); do
    sudo umount -f -l "$m"
done

sudo rm -rf "$WORK_DIR"

# Переинициализируем keyring хоста — нужен для live-окружения и Calamares
sudo pacman-key --init
sudo pacman-key --populate archlinux

sudo mkarchiso -v -w "$WORK_DIR" -o ~/equestria-out . || exit 1

# Рабочая папка нужна только во время сборки (следующий запуск всё равно
# начинает с нуля) — после успеха сразу освобождаем ~17 ГиБ диска.
# При ошибке оставляем: можно посмотреть, что пошло не так.
for m in $(tac /proc/mounts | grep "$WORK_DIR" | awk '{print $2}'); do
    sudo umount -f -l "$m"
done
sudo rm -rf "$WORK_DIR"
