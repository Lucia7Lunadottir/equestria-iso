#!/bin/bash
# Применяем только один раз
if [ -f ~/.config/.eq-configured ]; then exit 0; fi

# Копируем конфиг обоев
cp /etc/skel/.config/plasma-org.kde.plasma.desktop-appletsrc ~/.config/plasma-org.kde.plasma.desktop-appletsrc

# Перезапускаем plasmashell
kquitapp6 plasmashell 2>/dev/null
sleep 2
plasmashell &

touch ~/.config/.eq-configured
