#!/usr/bin/env bash
# Инициализируем keyring в live-среде чтобы pacman работал без ошибок
pacman-key --init
pacman-key --populate archlinux equestria-os
