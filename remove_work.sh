#!/bin/bash

if [ ! -t 0 ]; then
    konsole -e bash "$0" "$@"
    exit 0
fi

WORK_DIR=/var/tmp/equestria-work

for m in $(tac /proc/mounts | grep "$WORK_DIR" | awk '{print $2}'); do
    sudo umount -f -l "$m"
done

sudo rm -rf "$WORK_DIR"
