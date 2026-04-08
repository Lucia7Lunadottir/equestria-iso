#!/usr/bin/env bash
# Инициализируем keyring в live-среде чтобы pacman работал без ошибок
pacman-key --init
pacman-key --populate archlinux
pacman-key --populate equestria-os 2>/dev/null || true
