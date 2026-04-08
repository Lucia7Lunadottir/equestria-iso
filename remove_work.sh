#!/bin/bash

if [ ! -t 0 ]; then
    konsole -e bash "$0" "$@"
    exit 0
fi


for m in $(tac /proc/mounts | grep "equestria-iso/work" | awk '{print $2}'); do
    sudo umount -f -l "$m"
done

sudo rm -rf "/home/lucial/Git Projects/equestria-iso/work"
